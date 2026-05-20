#ifndef XENON_HOOK_H
#define XENON_HOOK_H

#include <vector>

namespace Xenon {

    // Descriptor holding all details for a function-by-function hook replacement
    struct HookDescriptor {
        const char* name;             // Name of the function/symbol (for logging)
        void* targetAddress;          // Address of the original function in libGameMain.so
        void* detourAddress;          // Address of our clean reconstructed replacement function
        void** originalTrampoline;    // Memory location where the hook engine saves the original trampoline call
        bool isApplied;               // Status flag
    };

    // Registers a hook into the database
    bool RegisterHook(const char* name, void* target, void* detour, void** trampoline);

    // Applies all registered hooks (in this architectural phase, this logs the bindings without patching memory)
    bool ApplyAllHooks();

    // Removes all applied hooks
    bool RemoveAllHooks();

    // Returns the list of registered hook descriptors
    const std::vector<HookDescriptor>& GetRegisteredHooks();

} // namespace Xenon

#endif // XENON_HOOK_H
