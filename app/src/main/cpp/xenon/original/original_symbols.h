#ifndef XENON_ORIGINAL_SYMBOLS_H
#define XENON_ORIGINAL_SYMBOLS_H

#include "../sexy/sexy_types.h"

// Forward declaration of game classes to keep compile structures clean
class Coin;
class Board;
class LawnApp;
class Zombie;
class Plant;

namespace Sexy {
    class ResourceManager {
    public:
        class FontRes {
        public:
            void DeleteResource();
        };
    };
}

namespace Xenon {
    namespace Original {

        // 1. Function pointers to original PvZ functions inside libGameMain.so
        extern bool (*Coin_IsSun)(Coin* self);
        extern void (*Board_DrawHouseDoorBottom)(Board* self, Sexy::Graphics* graphics);
        extern void (*Board_Update)(Board* self);
        extern void (*Board_AddSun)(Board* self, int amount);
        extern void (*LawnApp_UpdateApp)(LawnApp* self);
        extern void (*Zombie_Update)(Zombie* self);
        extern void (*Plant_Update)(Plant* self);
        extern void (*Sexy_ResourceManager_FontRes_DeleteResource)(Sexy::ResourceManager::FontRes* self);

        // 2. Global variable references from libGameMain.so
        extern Sexy::SexyAppBase** gSexyAppBasePtr;

        // Bootstraps and resolves all registered original symbols from libGameMain.so using dlsym
        bool ResolveOriginalSymbols();

    } // namespace Original
} // namespace Xenon

#endif // XENON_ORIGINAL_SYMBOLS_H
