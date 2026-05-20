#include "hook_registry.h"
#include "../core/hook.h"
#include "../original/original_symbols.h"
#include "../reconstructed/reconstructed_symbols.h"
#include "../core/logger.h"

namespace Xenon {
    namespace Hooks {

        bool RegisterAllHooks() {
            LOGI("Xenon Hook Registry: Registering active function-by-function hooks...");

            // 1. Hook Coin::IsSun
            RegisterHook(
                "Coin::IsSun", 
                (void*)Original::Coin_IsSun, 
                (void*)Reconstructed::Detour_Coin_IsSun, 
                (void**)&Reconstructed::Original_Coin_IsSun
            );

            // 2. Hook Board::DrawHouseDoorBottom
            RegisterHook(
                "Board::DrawHouseDoorBottom", 
                (void*)Original::Board_DrawHouseDoorBottom, 
                (void*)Reconstructed::Detour_Board_DrawHouseDoorBottom, 
                (void**)&Reconstructed::Original_Board_DrawHouseDoorBottom
            );

            // 3. Hook Sexy::ResourceManager::FontRes::DeleteResource
            RegisterHook(
                "Sexy::ResourceManager::FontRes::DeleteResource", 
                (void*)Original::Sexy_ResourceManager_FontRes_DeleteResource, 
                (void*)Reconstructed::Detour_Sexy_ResourceManager_FontRes_DeleteResource, 
                (void**)&Reconstructed::Original_Sexy_ResourceManager_FontRes_DeleteResource
            );

            LOGI("Xenon Hook Registry: All active hooks registered successfully.");
            return true;
        }

    } // namespace Hooks
} // namespace Xenon
