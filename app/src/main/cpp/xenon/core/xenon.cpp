#include "xenon.h"
#include "logger.h"
#include "original/original_symbols.h"
#include "hooks/hook_registry.h"
#include "hook.h"
#include <dlfcn.h>
#include <cstdlib>

namespace Xenon {

    // Keep handles in static file scope
    static void* gOriginalLauncherHandle = nullptr;
    static void* gOriginalMainHandle = nullptr;
    static void* gOriginalHomuraHandle = nullptr;

    // Type signature for JNI_OnLoad
    typedef jint (*JNI_OnLoad_t)(JavaVM*, void*);

    bool Initialize(JavaVM* vm) {
        LOGI("Initializing Xenon Replacement Engine...");

        // 1. Load original GameLauncher (renamed to libGameLauncher_orig.so)
        gOriginalLauncherHandle = dlopen("libGameLauncher_orig.so", RTLD_NOW | RTLD_GLOBAL);
        if (!gOriginalLauncherHandle) {
            LOGE("Failed to load libGameLauncher_orig.so: %s", dlerror());
            return false;
        }
        LOGI("Successfully loaded libGameLauncher_orig.so at %p", gOriginalLauncherHandle);

        // 2. Load original GameMain (contains the 7.4 MB PopCap game logic)
        gOriginalMainHandle = dlopen("libGameMain.so", RTLD_NOW | RTLD_GLOBAL);
        if (!gOriginalMainHandle) {
            LOGE("Failed to load libGameMain.so: %s", dlerror());
            // We don't fail immediately in case they want a dry-run or launcher-only mode
        } else {
            LOGI("Successfully loaded libGameMain.so at %p", gOriginalMainHandle);
            
            // Resolve original dynamic symbols from libGameMain.so
            Original::ResolveOriginalSymbols();
            
            // Register and apply function hooks
            Hooks::RegisterAllHooks();
            ApplyAllHooks();
        }

        // 3. Load original Homura (support library)
        gOriginalHomuraHandle = dlopen("libHomura.so", RTLD_NOW | RTLD_GLOBAL);
        if (!gOriginalHomuraHandle) {
            LOGW("libHomura.so not found or failed to load: %s (non-critical)", dlerror());
        } else {
            LOGI("Successfully loaded libHomura.so at %p", gOriginalHomuraHandle);
        }

        // 4. Resolve and invoke original JNI_OnLoad to let the original game register its native JNI endpoints
        JNI_OnLoad_t orig_JNI_OnLoad = (JNI_OnLoad_t)dlsym(gOriginalLauncherHandle, "JNI_OnLoad");
        if (orig_JNI_OnLoad) {
            LOGI("Invoking original JNI_OnLoad from libGameLauncher_orig.so...");
            jint orig_result = orig_JNI_OnLoad(vm, nullptr);
            LOGI("Original JNI_OnLoad returned: 0x%08X", orig_result);
        } else {
            LOGW("Could not find standard JNI_OnLoad in libGameLauncher_orig.so. JNI calls will be proxied manually.");
        }

        LOGI("Xenon replacement architecture successfully bootstrapped!");
        return true;
    }

    void* GetOriginalLauncherHandle() {
        return gOriginalLauncherHandle;
    }

    void* GetOriginalMainHandle() {
        return gOriginalMainHandle;
    }

    void* GetOriginalHomuraHandle() {
        return gOriginalHomuraHandle;
    }

    void* ResolveOriginalMainSymbol(const char* symbolName) {
        if (!gOriginalMainHandle) return nullptr;
        return dlsym(gOriginalMainHandle, symbolName);
    }

    void* ResolveOriginalLauncherSymbol(const char* symbolName) {
        if (!gOriginalLauncherHandle) return nullptr;
        return dlsym(gOriginalLauncherHandle, symbolName);
    }

} // namespace Xenon

// Global JNI_OnLoad loaded by the Android OS runtime
jint JNI_OnLoad(JavaVM* vm, void* reserved) {
    // Bootstrap Xenon Engine
    if (!Xenon::Initialize(vm)) {
        LOGE("Xenon Initialization failed. Aborting dynamic loading.");
        return JNI_ERR;
    }
    return JNI_VERSION_1_6;
}
