#ifndef XENON_RECONSTRUCTED_SYMBOLS_H
#define XENON_RECONSTRUCTED_SYMBOLS_H

#include "../sexy/sexy_types.h"
#include "../original/original_symbols.h"

namespace Xenon {
    namespace Reconstructed {

        // 1. Trampoline pointers (allow reconstructed functions to invoke the original ones)
        extern bool (*Original_Coin_IsSun)(Coin* self);
        extern void (*Original_Board_DrawHouseDoorBottom)(Board* self, Sexy::Graphics* graphics);
        extern void (*Original_Sexy_ResourceManager_FontRes_DeleteResource)(Sexy::ResourceManager::FontRes* self);

        // 2. Clean, rewritten/decompiled function implementations (detours)
        bool Detour_Coin_IsSun(Coin* self);
        void Detour_Board_DrawHouseDoorBottom(Board* self, Sexy::Graphics* graphics);
        void Detour_Sexy_ResourceManager_FontRes_DeleteResource(Sexy::ResourceManager::FontRes* self);

    } // namespace Reconstructed
} // namespace Xenon

#endif // XENON_RECONSTRUCTED_SYMBOLS_H
