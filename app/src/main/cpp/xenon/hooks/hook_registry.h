#ifndef XENON_HOOK_REGISTRY_H
#define XENON_HOOK_REGISTRY_H

namespace Xenon {
    namespace Hooks {

        // Registers all active function replacements into the Xenon hook engine
        bool RegisterAllHooks();

    } // namespace Hooks
} // namespace Xenon

#endif // XENON_HOOK_REGISTRY_H
