#include "hook_registry.h"
#include "../core/hook.h"
#include "../original/original_symbols.h"
#include "../reconstructed/reconstructed_symbols.h"
#include "../core/logger.h"

namespace Xenon {
    namespace Hooks {

        static void RegisterIfResolved(const char* name, void* target, void* detour, void** trampoline) {
            if (!target) {
                LOGW("Hook skipped (symbol missing): %s", name);
                return;
            }
            RegisterHook(name, target, detour, trampoline);
        }

        bool RegisterAllHooks() {
            LOGI("Xenon Hook Registry: registering hooks...");

            RegisterIfResolved("Coin::IsSun",
                (void*)Original::Coin_IsSun,
                (void*)Reconstructed::Detour_Coin_IsSun,
                (void**)&Reconstructed::Original_Coin_IsSun);

            RegisterIfResolved("Board::DrawHouseDoorBottom",
                (void*)Original::Board_DrawHouseDoorBottom,
                (void*)Reconstructed::Detour_Board_DrawHouseDoorBottom,
                (void**)&Reconstructed::Original_Board_DrawHouseDoorBottom);


            RegisterIfResolved("Sexy::ResourceManager::FontRes::DeleteResource",
                (void*)Original::Sexy_ResourceManager_FontRes_DeleteResource,
                (void*)Reconstructed::Detour_Sexy_ResourceManager_FontRes_DeleteResource,
                (void**)&Reconstructed::Original_Sexy_ResourceManager_FontRes_DeleteResource);

            LOGI("Xenon Hook Registry: registration pass complete.");
            return true;
        }

    } // namespace Hooks
} // namespace Xenon
