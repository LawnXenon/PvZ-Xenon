#include "hook.h"
#include "logger.h"

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

        HookDescriptor descriptor;
        descriptor.name = name;
        descriptor.targetAddress = target;
        descriptor.detourAddress = detour;
        descriptor.originalTrampoline = trampoline;
        descriptor.isApplied = false;

        gRegisteredHooks.push_back(descriptor);
        LOGI("Registered hook: '%s' [Target: %p -> Detour: %p]", name, target, detour);
        return true;
    }

    bool ApplyAllHooks() {
        LOGI("Xenon Hook Engine: Preparing to process %zu registered hooks...", gRegisteredHooks.size());
        
        size_t successCount = 0;
        for (auto& hook : gRegisteredHooks) {
            if (hook.isApplied) continue;

            // In this initial architectural transition phase, we do not implement actual dynamic byte-patching or trampoline writing.
            // However, we simulate the original trampoline binding by mapping the trampoline pointer directly to the target address.
            // This ensures that if any detour calls the original trampoline, it falls back to the original function safely!
            if (hook.originalTrampoline) {
                *hook.originalTrampoline = hook.targetAddress;
            }

            hook.isApplied = true;
            successCount++;
            LOGI("  [MOCK APPLY] Hook '%s': Bound trampoline pointer to %p", hook.name, hook.targetAddress);
        }

        LOGI("Xenon Hook Engine: Successfully processed %zu/%zu hooks (Mock-Applied).", successCount, gRegisteredHooks.size());
        return true;
    }

    bool RemoveAllHooks() {
        LOGI("Xenon Hook Engine: Removing all applied hooks...");
        for (auto& hook : gRegisteredHooks) {
            if (!hook.isApplied) continue;

            if (hook.originalTrampoline) {
                *hook.originalTrampoline = nullptr;
            }
            hook.isApplied = false;
            LOGI("  [MOCK REMOVE] Hook '%s' disabled.", hook.name);
        }
        return true;
    }

    const std::vector<HookDescriptor>& GetRegisteredHooks() {
        return gRegisteredHooks;
    }

} // namespace Xenon
