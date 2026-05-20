#include "reconstructed_symbols.h"
#include "../core/logger.h"

namespace Xenon {
    namespace Reconstructed {

        // Initialize trampoline storage to nullptr
        bool (*Original_Coin_IsSun)(Coin* self) = nullptr;
        void (*Original_Board_DrawHouseDoorBottom)(Board* self, Sexy::Graphics* graphics) = nullptr;
        void (*Original_Sexy_ResourceManager_FontRes_DeleteResource)(Sexy::ResourceManager::FontRes* self) = nullptr;

        // 1. Detour for Coin::IsSun
        bool Detour_Coin_IsSun(Coin* self) {
            LOGD("Detour_Coin_IsSun called! [Self: %p]", self);

            // Here we can write custom decompiled/reconstructed behavior.
            // During the transition, we simply delegate to the original trampoline.
            if (Original_Coin_IsSun) {
                return Original_Coin_IsSun(self);
            }
            return false;
        }

        // 2. Detour for Board::DrawHouseDoorBottom
        void Detour_Board_DrawHouseDoorBottom(Board* self, Sexy::Graphics* graphics) {
            LOGD("Detour_Board_DrawHouseDoorBottom called! [Self: %p, Graphics: %p]", self, graphics);

            // Execute original behavior
            if (Original_Board_DrawHouseDoorBottom) {
                Original_Board_DrawHouseDoorBottom(self, graphics);
            }
        }

        // 3. Detour for Sexy::ResourceManager::FontRes::DeleteResource
        void Detour_Sexy_ResourceManager_FontRes_DeleteResource(Sexy::ResourceManager::FontRes* self) {
            LOGD("Detour_Sexy_ResourceManager_FontRes_DeleteResource called! [Self: %p]", self);

            // Execute original behavior
            if (Original_Sexy_ResourceManager_FontRes_DeleteResource) {
                Original_Sexy_ResourceManager_FontRes_DeleteResource(self);
            }
        }

    } // namespace Reconstructed
} // namespace Xenon
