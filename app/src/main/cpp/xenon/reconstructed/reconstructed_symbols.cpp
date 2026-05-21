#include "reconstructed_symbols.h"
#include "../core/logger.h"

namespace Xenon {
    namespace Reconstructed {

        bool (*Original_Coin_IsSun)(Coin* self) = nullptr;
        void (*Original_Board_DrawHouseDoorBottom)(Board* self, Sexy::Graphics* graphics) = nullptr;
        void (*Original_Board_Update)(Board* self) = nullptr;
        void (*Original_Board_AddSun)(Board* self, int amount) = nullptr;
        void (*Original_LawnApp_UpdateApp)(LawnApp* self) = nullptr;
        void (*Original_Zombie_Update)(Zombie* self) = nullptr;
        void (*Original_Plant_Update)(Plant* self) = nullptr;
        void (*Original_Sexy_ResourceManager_FontRes_DeleteResource)(Sexy::ResourceManager::FontRes* self) = nullptr;

        bool Detour_Coin_IsSun(Coin* self) {
            if (Original_Coin_IsSun) {
                return Original_Coin_IsSun(self);
            }
            return false;
        }

        void Detour_Board_DrawHouseDoorBottom(Board* self, Sexy::Graphics* graphics) {
            if (Original_Board_DrawHouseDoorBottom) {
                Original_Board_DrawHouseDoorBottom(self, graphics);
            }
        }

        void Detour_Board_Update(Board* self) {
            if (Original_Board_Update) {
                Original_Board_Update(self);
            }
        }

        void Detour_Board_AddSun(Board* self, int amount) {
            LOGD("Detour_Board_AddSun amount=%d board=%p", amount, self);
            if (Original_Board_AddSun) {
                Original_Board_AddSun(self, amount);
            }
        }

        void Detour_LawnApp_UpdateApp(LawnApp* self) {
            if (Original_LawnApp_UpdateApp) {
                Original_LawnApp_UpdateApp(self);
            }
        }

        void Detour_Zombie_Update(Zombie* self) {
            if (Original_Zombie_Update) {
                Original_Zombie_Update(self);
            }
        }

        void Detour_Plant_Update(Plant* self) {
            if (Original_Plant_Update) {
                Original_Plant_Update(self);
            }
        }

        void Detour_Sexy_ResourceManager_FontRes_DeleteResource(Sexy::ResourceManager::FontRes* self) {
            if (Original_Sexy_ResourceManager_FontRes_DeleteResource) {
                Original_Sexy_ResourceManager_FontRes_DeleteResource(self);
            }
        }

    } // namespace Reconstructed
} // namespace Xenon
