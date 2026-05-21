#include "original_symbols.h"
#include "xenon.h"
#include "logger.h"

namespace Xenon {
    namespace Original {

        bool (*Coin_IsSun)(Coin* self) = nullptr;
        void (*Board_DrawHouseDoorBottom)(Board* self, Sexy::Graphics* graphics) = nullptr;
        void (*Board_Update)(Board* self) = nullptr;
        void (*Board_AddSun)(Board* self, int amount) = nullptr;
        void (*LawnApp_UpdateApp)(LawnApp* self) = nullptr;
        void (*Zombie_Update)(Zombie* self) = nullptr;
        void (*Plant_Update)(Plant* self) = nullptr;
        void (*Sexy_ResourceManager_FontRes_DeleteResource)(Sexy::ResourceManager::FontRes* self) = nullptr;

        Sexy::SexyAppBase** gSexyAppBasePtr = nullptr;

        static void* ResolveMain(const char* mangled, const char* label) {
            void* sym = Xenon::ResolveOriginalMainSymbol(mangled);
            if (sym) {
                LOGI("  %s -> %p (%s)", label, sym, mangled);
            } else {
                LOGW("  %s NOT FOUND (%s)", label, mangled);
            }
            return sym;
        }

        bool ResolveOriginalSymbols() {
            LOGI("Resolving original game symbols from libGameMain.so...");

            Coin_IsSun = (bool(*)(Coin*))ResolveMain("_ZN4Coin5IsSunEv", "Coin::IsSun");
            Board_DrawHouseDoorBottom = (void(*)(Board*, Sexy::Graphics*))ResolveMain(
                "_ZN5Board19DrawHouseDoorBottomEPN4Sexy8GraphicsE", "Board::DrawHouseDoorBottom");
            Board_Update = (void(*)(Board*))ResolveMain("_ZN5Board6UpdateEv", "Board::Update");
            Board_AddSun = (void(*)(Board*, int))ResolveMain("_ZN5Board6AddSunEi", "Board::AddSun");
            LawnApp_UpdateApp = (void(*)(LawnApp*))ResolveMain("_ZN7LawnApp9UpdateAppEv", "LawnApp::UpdateApp");
            Zombie_Update = (void(*)(Zombie*))ResolveMain("_ZN6Zombie6UpdateEv", "Zombie::Update");
            Plant_Update = (void(*)(Plant*))ResolveMain("_ZN4Plant6UpdateEv", "Plant::Update");
            Sexy_ResourceManager_FontRes_DeleteResource = (void(*)(Sexy::ResourceManager::FontRes*))ResolveMain(
                "_ZN4Sexy15ResourceManager7FontRes14DeleteResourceEv",
                "Sexy::ResourceManager::FontRes::DeleteResource");

            gSexyAppBasePtr = (Sexy::SexyAppBase**)ResolveMain("_ZN4Sexy12gSexyAppBaseE", "Sexy::gSexyAppBase");

            LOGI("Original symbols resolution complete.");
            return true;
        }

    } // namespace Original
} // namespace Xenon
