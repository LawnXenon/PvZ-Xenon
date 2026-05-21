#include "arm32_hook.h"
#include "logger.h"

#include <cstring>
#include <sys/mman.h>
#include <unistd.h>

namespace Xenon {
namespace Arm32Hook {

namespace {

constexpr size_t kArmPatchBytes = 8;
constexpr size_t kThumbPatchBytes = 12;
constexpr size_t kTrampolineAllocSize = 4096;

static bool IsThumb(void* addr) {
    return (((uintptr_t)addr) & 1u) != 0;
}

static void* ClearThumbBit(void* addr) {
    return (void*)((uintptr_t)addr & ~1u);
}

static void* SetThumbBit(void* addr) {
    return (void*)((uintptr_t)addr | 1u);
}

static size_t PageSize() {
    static size_t page = 0;
    if (page == 0) {
        page = (size_t)sysconf(_SC_PAGESIZE);
    }
    return page;
}

static bool MakeRangeWritable(void* addr, size_t len) {
    const size_t page = PageSize();
    uintptr_t start = (uintptr_t)addr & ~(page - 1);
    uintptr_t end = ((uintptr_t)addr + len + page - 1) & ~(page - 1);
    return mprotect((void*)start, end - start, PROT_READ | PROT_WRITE | PROT_EXEC) == 0;
}

static void FlushInstructionCache(void* addr, size_t len) {
#if defined(__GNUC__)
    __builtin___clear_cache((char*)addr, (char*)addr + len);
#else
    (void)addr;
    (void)len;
#endif
}

// ARM mode: LDR PC, [PC, #-4] + absolute address (8 bytes).
static void WriteArmJump(void* at, void* destination) {
    auto* p = reinterpret_cast<uint32_t*>(at);
    p[0] = 0xE51FF004u;
    p[1] = (uint32_t)(uintptr_t)destination;
    FlushInstructionCache(at, kArmPatchBytes);
}

// Thumb-2: LDR.W R12, [PC] ; BX.W R12 ; .word detour|1 (12 bytes).
static void WriteThumbJump(void* at, void* destination) {
    auto* p = reinterpret_cast<uint16_t*>(at);
    p[0] = 0xF8DFu;
    p[1] = 0xF000u;
    p[2] = 0xF002u;
    p[3] = 0xE12Fu;
    *reinterpret_cast<uint32_t*>(p + 4) = (uint32_t)(uintptr_t)destination;
    FlushInstructionCache(at, kThumbPatchBytes);
}

static void AppendArmTrampolineTail(uint8_t* write, uintptr_t resumeAddr) {
    auto* p = reinterpret_cast<uint32_t*>(write);
    p[0] = 0xE51FF004u;
    p[1] = (uint32_t)resumeAddr;
}

static void AppendThumbTrampolineTail(uint8_t* write, uintptr_t resumeAddrThumb) {
    auto* p = reinterpret_cast<uint16_t*>(write);
    p[0] = 0xF8DFu;
    p[1] = 0xF000u;
    p[2] = 0xF002u;
    p[3] = 0xE12Fu;
    *reinterpret_cast<uint32_t*>(p + 4) = (uint32_t)resumeAddrThumb;
}

} // namespace

bool Install(void* target, void* detour, void** out_trampoline,
             uint8_t* out_backup, size_t* out_patch_size, bool* out_is_thumb) {
    if (!target || !detour || !out_trampoline || !out_backup || !out_patch_size || !out_is_thumb) {
        return false;
    }

    const bool thumb = IsThumb(target);
    void* const targetCode = ClearThumbBit(target);
    void* const detourCall = thumb ? SetThumbBit(detour) : detour;

    const size_t patchSize = thumb ? kThumbPatchBytes : kArmPatchBytes;
    const uintptr_t resumeAddr = (uintptr_t)targetCode + patchSize;
    const uintptr_t resumeAddrThumb = resumeAddr | 1u;

    std::memcpy(out_backup, targetCode, patchSize);
    *out_patch_size = patchSize;
    *out_is_thumb = thumb;

    void* trampBase = mmap(nullptr, kTrampolineAllocSize, PROT_READ | PROT_WRITE | PROT_EXEC,
                           MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (trampBase == MAP_FAILED) {
        LOGE("Arm32Hook: mmap trampoline failed");
        return false;
    }

    uint8_t* trampWrite = static_cast<uint8_t*>(trampBase);
    std::memcpy(trampWrite, out_backup, patchSize);
    trampWrite += patchSize;

    if (thumb) {
        AppendThumbTrampolineTail(trampWrite, resumeAddrThumb);
        FlushInstructionCache(trampBase, patchSize + kThumbPatchBytes);
        *out_trampoline = SetThumbBit(trampBase);
    } else {
        AppendArmTrampolineTail(trampWrite, resumeAddr);
        FlushInstructionCache(trampBase, patchSize + kArmPatchBytes);
        *out_trampoline = trampBase;
    }

    if (!MakeRangeWritable(targetCode, patchSize)) {
        LOGE("Arm32Hook: mprotect target %p failed", targetCode);
        munmap(trampBase, kTrampolineAllocSize);
        return false;
    }

    if (thumb) {
        WriteThumbJump(targetCode, detourCall);
    } else {
        WriteArmJump(targetCode, detourCall);
    }

    LOGI("Arm32Hook: installed %s hook target=%p detour=%p trampoline=%p resume=%p",
         thumb ? "Thumb" : "ARM", targetCode, detourCall, *out_trampoline,
         thumb ? (void*)resumeAddrThumb : (void*)resumeAddr);
    return true;
}

bool Remove(void* target, void* trampoline, const uint8_t* backup, size_t patchSize, bool isThumb) {
    if (!target || !backup || patchSize == 0) {
        return false;
    }

    void* const targetCode = ClearThumbBit(target);

    if (!MakeRangeWritable(targetCode, patchSize)) {
        LOGE("Arm32Hook: mprotect restore failed for %p", targetCode);
        return false;
    }

    std::memcpy(targetCode, backup, patchSize);
    FlushInstructionCache(targetCode, patchSize);

    if (trampoline) {
        void* base = ClearThumbBit(trampoline);
        munmap(base, kTrampolineAllocSize);
    }

    LOGI("Arm32Hook: removed hook at %p", targetCode);
    return true;
}

} // namespace Arm32Hook
} // namespace Xenon
