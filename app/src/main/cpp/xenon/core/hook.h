#ifndef XENON_HOOK_H
#define XENON_HOOK_H

#include <vector>

namespace Xenon {

    // Descriptor holding all details for a function-by-function hook replacement
    struct HookDescriptor {
        const char* name;             // Name of the function/symbol (for logging)
        void* targetAddress;          // Address of the original function in libGameMain.so
        void* detourAddress;          // Address of our clean reconstructed replacement function
        void** originalTrampoline;    // Pointer slot filled with mmap trampoline (calls original prologue)
        bool isApplied;               // Status flag
        bool isThumb;                 // ARM vs Thumb (LSB of target)
        size_t patchSize;             // Bytes overwritten at target (8 ARM / 12 Thumb)
        uint8_t backup[12];           // Saved prologue for uninstall
        void* trampolineMapping;      // mmap base returned by Arm32Hook::Install
    };

    // Registers a hook into the database
    bool RegisterHook(const char* name, void* target, void* detour, void** trampoline);

    // Patches libGameMain.so targets with ARMv7 inline hooks + trampolines
    bool ApplyAllHooks();

    // Removes all applied hooks
    bool RemoveAllHooks();

    // Returns the list of registered hook descriptors
    const std::vector<HookDescriptor>& GetRegisteredHooks();

} // namespace Xenon

#endif // XENON_HOOK_H
