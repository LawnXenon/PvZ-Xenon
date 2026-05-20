#include "xenon.h"
#include "logger.h"
#include "original/original_symbols.h"
#include "hooks/hook_registry.h"
#include "hook.h"
#include <dlfcn.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>

namespace Xenon {

    // Keep handles in static file scope
    static void* gOriginalLauncherHandle = nullptr;
    static void* gOriginalMainHandle = nullptr;
    static void* gOriginalHomuraHandle = nullptr;

    // Type signature for JNI_OnLoad
    typedef jint (*JNI_OnLoad_t)(JavaVM*, void*);

    static void* DlopenLib(const char* soname) {
        void* handle = dlopen(soname, RTLD_NOW | RTLD_GLOBAL);
        if (handle) {
            return handle;
        }

        const char* libDir = getenv("XENON_LIB_DIR");
        if (libDir && libDir[0]) {
            char path[512];
            snprintf(path, sizeof(path), "%s/%s", libDir, soname);
            handle = dlopen(path, RTLD_NOW | RTLD_GLOBAL);
            if (handle) {
                LOGI("Loaded %s via XENON_LIB_DIR", soname);
                return handle;
            }
        }

        LOGE("dlopen(%s) failed: %s", soname, dlerror());
        return nullptr;
    }

    bool Initialize(JavaVM* vm) {
        LOGI("Initializing Xenon Replacement Engine...");

        // C++ runtime (often required for libGameMain to link)
        DlopenLib("libstdc++-shared.so");

        // 1. Original launcher JNI/EGL layer
        gOriginalLauncherHandle = DlopenLib("libGameLauncher_orig.so");
        if (!gOriginalLauncherHandle) {
            return false;
        }
        LOGI("Successfully loaded libGameLauncher_orig.so at %p", gOriginalLauncherHandle);

        // 2. Homura before GameMain (GameMain may depend on it)
        gOriginalHomuraHandle = DlopenLib("libHomura.so");
        if (gOriginalHomuraHandle) {
            LOGI("Successfully loaded libHomura.so at %p", gOriginalHomuraHandle);
        } else {
            LOGW("libHomura.so not loaded (may be optional)");
        }

        // 3. Game logic (~7.4 MB) — must be loaded before surfaceCreated
        gOriginalMainHandle = DlopenLib("libGameMain.so");
        if (!gOriginalMainHandle) {
            LOGE("libGameMain.so is required; hooks and game init will not work");
        } else {
            LOGI("Successfully loaded libGameMain.so at %p", gOriginalMainHandle);
            Original::ResolveOriginalSymbols();
            Hooks::RegisterAllHooks();
            ApplyAllHooks();
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
