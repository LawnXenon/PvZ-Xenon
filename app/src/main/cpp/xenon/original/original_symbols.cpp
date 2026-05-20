#include "original_symbols.h"
#include "xenon.h"
#include "logger.h"

namespace Xenon {
    namespace Original {

        // Define pointer storage
        bool (*Coin_IsSun)(Coin* self) = nullptr;
        void (*Board_DrawHouseDoorBottom)(Board* self, Sexy::Graphics* graphics) = nullptr;
        void (*Sexy_ResourceManager_FontRes_DeleteResource)(Sexy::ResourceManager::FontRes* self) = nullptr;

        Sexy::SexyAppBase** gSexyAppBasePtr = nullptr;

        bool ResolveOriginalSymbols() {
            LOGI("Resolving original game symbols from libGameMain.so...");

            // 1. Resolve Coin::IsSun() -> _ZN4Coin5IsSunEv
            Coin_IsSun = (bool(*)(Coin*))Xenon::ResolveOriginalMainSymbol("_ZN4Coin5IsSunEv");
            if (Coin_IsSun) {
                LOGI("  Successfully resolved Coin::IsSun at %p", Coin_IsSun);
            } else {
                LOGW("  Failed to resolve Coin::IsSun");
            }

            // 2. Resolve Board::DrawHouseDoorBottom(Sexy::Graphics*) -> _ZN5Board19DrawHouseDoorBottomEPN4Sexy8GraphicsE
            Board_DrawHouseDoorBottom = (void(*)(Board*, Sexy::Graphics*))Xenon::ResolveOriginalMainSymbol("_ZN5Board19DrawHouseDoorBottomEPN4Sexy8GraphicsE");
            if (Board_DrawHouseDoorBottom) {
                LOGI("  Successfully resolved Board::DrawHouseDoorBottom at %p", Board_DrawHouseDoorBottom);
            } else {
                LOGW("  Failed to resolve Board::DrawHouseDoorBottom");
            }

            // 3. Resolve Sexy::ResourceManager::FontRes::DeleteResource() -> _ZN4Sexy15ResourceManager7FontRes14DeleteResourceEv
            Sexy_ResourceManager_FontRes_DeleteResource = (void(*)(Sexy::ResourceManager::FontRes*))Xenon::ResolveOriginalMainSymbol("_ZN4Sexy15ResourceManager7FontRes14DeleteResourceEv");
            if (Sexy_ResourceManager_FontRes_DeleteResource) {
                LOGI("  Successfully resolved Sexy::ResourceManager::FontRes::DeleteResource at %p", Sexy_ResourceManager_FontRes_DeleteResource);
            } else {
                LOGW("  Failed to resolve Sexy::ResourceManager::FontRes::DeleteResource");
            }

            // 4. Resolve Sexy::gSexyAppBase -> _ZN4Sexy12gSexyAppBaseE
            gSexyAppBasePtr = (Sexy::SexyAppBase**)Xenon::ResolveOriginalMainSymbol("_ZN4Sexy12gSexyAppBaseE");
            if (gSexyAppBasePtr) {
                LOGI("  Successfully resolved Sexy::gSexyAppBase pointer at %p (points to %p)", gSexyAppBasePtr, *gSexyAppBasePtr);
            } else {
                LOGW("  Failed to resolve Sexy::gSexyAppBase");
            }

            LOGI("Original symbols resolution complete.");
            return true;
        }

    } // namespace Original
} // namespace Xenon
