#ifndef XENON_RECONSTRUCTED_SYMBOLS_H
#define XENON_RECONSTRUCTED_SYMBOLS_H

#include "../sexy/sexy_types.h"
#include "../original/original_symbols.h"

namespace Xenon {
    namespace Reconstructed {

        extern bool (*Original_Coin_IsSun)(Coin* self);
        extern void (*Original_Board_DrawHouseDoorBottom)(Board* self, Sexy::Graphics* graphics);
        extern void (*Original_Board_Update)(Board* self);
        extern void (*Original_Board_AddSun)(Board* self, int amount);
        extern void (*Original_LawnApp_UpdateApp)(LawnApp* self);
        extern void (*Original_Zombie_Update)(Zombie* self);
        extern void (*Original_Plant_Update)(Plant* self);
        extern void (*Original_Sexy_ResourceManager_FontRes_DeleteResource)(Sexy::ResourceManager::FontRes* self);

        bool Detour_Coin_IsSun(Coin* self);
        void Detour_Board_DrawHouseDoorBottom(Board* self, Sexy::Graphics* graphics);
        void Detour_Board_Update(Board* self);
        void Detour_Board_AddSun(Board* self, int amount);
        void Detour_LawnApp_UpdateApp(LawnApp* self);
        void Detour_Zombie_Update(Zombie* self);
        void Detour_Plant_Update(Plant* self);
        void Detour_Sexy_ResourceManager_FontRes_DeleteResource(Sexy::ResourceManager::FontRes* self);

    } // namespace Reconstructed
} // namespace Xenon

#endif
