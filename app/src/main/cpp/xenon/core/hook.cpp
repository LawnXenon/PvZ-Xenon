#include "hook.h"
#include "arm32_hook.h"
#include "logger.h"

#include <cstring>
#include <cstdlib>

// Returns true only when the caller explicitly opts-in to inline ARM patching.
// By default (env var absent or not '1') we use pointer-only mode which is
// safe on BlueStacks x86 + libhoudini where inline patching causes SIGSEGV.
static bool InlineHooksEnabled() {
    const char* env = getenv("XENON_INLINE_HOOKS");
    return env && env[0] == '1';
}

namespace Xenon {

    static std::vector<HookDescriptor> gRegisteredHooks;

    bool RegisterHook(const char* name, void* target, void* detour, void** trampoline) {
        if (!target) {
            LOGW("Could not register hook '%s': Target address is NULL.", name);
            return false;
        }
        if (!detour) {
            LOGW("Could not register hook '%s': Detour address is NULL.", name);
            return false;
        }

        HookDescriptor descriptor{};
        descriptor.name = name;
        descriptor.targetAddress = target;
        descriptor.detourAddress = detour;
        descriptor.originalTrampoline = trampoline;
        descriptor.isApplied = false;
        descriptor.isThumb = (((uintptr_t)target) & 1u) != 0;
        descriptor.patchSize = 0;
        descriptor.trampolineMapping = nullptr;
        std::memset(descriptor.backup, 0, sizeof(descriptor.backup));

        gRegisteredHooks.push_back(descriptor);
        LOGI("Registered hook: '%s' [Target: %p -> Detour: %p]", name, target, detour);
        return true;
    }

    bool ApplyAllHooks() {
        LOGI("Xenon Hook Engine: Applying %zu hooks (ARMv7 inline + trampoline)...", gRegisteredHooks.size());

        size_t successCount = 0;
        for (auto& hook : gRegisteredHooks) {
            if (hook.isApplied) {
                continue;
            }

            void* trampoline = nullptr;
            size_t patchSize = 0;
            bool thumb = false;

            // Pointer-only mode: skip inline patching entirely and just bind the
            // trampoline pointer to the original address so callers still work.
            if (!InlineHooksEnabled()) {
                if (hook.originalTrampoline) {
                    *hook.originalTrampoline = hook.targetAddress;
                }
                hook.isApplied = true;
                successCount++;
                LOGI("  [POINTER ONLY] Hook '%s' — inline hooks disabled (XENON_INLINE_HOOKS!=1)", hook.name);
                continue;
            }

            if (!Arm32Hook::Install(hook.targetAddress, hook.detourAddress, &trampoline,
                                    hook.backup, &patchSize, &thumb)) {
                LOGE("Hook '%s': inline install failed — binding trampoline to target (no patch)", hook.name);
                if (hook.originalTrampoline) {
                    *hook.originalTrampoline = hook.targetAddress;
                }
                hook.isApplied = true;
                successCount++;
                continue;
            }

            hook.patchSize = patchSize;
            hook.isThumb = thumb;
            hook.trampolineMapping = trampoline;

            if (hook.originalTrampoline) {
                *hook.originalTrampoline = trampoline;
            }

            hook.isApplied = true;
            successCount++;
            LOGI("  [APPLIED] Hook '%s': trampoline=%p", hook.name, trampoline);
        }

        LOGI("Xenon Hook Engine: %zu/%zu hooks applied.", successCount, gRegisteredHooks.size());
        return successCount > 0;
    }

    bool RemoveAllHooks() {
        LOGI("Xenon Hook Engine: Removing applied hooks...");
        for (auto& hook : gRegisteredHooks) {
            if (!hook.isApplied) {
                continue;
            }

            if (hook.patchSize > 0) {
                Arm32Hook::Remove(hook.targetAddress, hook.trampolineMapping,
                                  hook.backup, hook.patchSize, hook.isThumb);
            }

            if (hook.originalTrampoline) {
                *hook.originalTrampoline = nullptr;
            }

            hook.trampolineMapping = nullptr;
            hook.patchSize = 0;
            hook.isApplied = false;
            LOGI("  [REMOVED] Hook '%s'", hook.name);
        }
        return true;
    }

    const std::vector<HookDescriptor>& GetRegisteredHooks() {
        return gRegisteredHooks;
    }

} // namespace Xenon
