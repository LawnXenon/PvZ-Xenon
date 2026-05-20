#include "original_jni.h"
#include "xenon.h"
#include "logger.h"

static bool IsGameReady() {
    return Xenon::GetOriginalMainHandle() != nullptr;
}

// Define a macro to generate the JNI forwarding logic cleanly and efficiently
#define FORWARD_JNI_CALL(func_name, return_type, signature, ...) \
    typedef return_type (*func_t)signature; \
    static func_t orig_func = nullptr; \
    if (!orig_func) { \
        orig_func = (func_t)Xenon::ResolveOriginalLauncherSymbol(#func_name); \
        if (!orig_func) { \
            LOGE("Failed to resolve original JNI symbol: " #func_name); \
            /* Return dummy or safe value if dynamic resolution fails */ \
            return (return_type)0; \
        } \
    } \
    return orig_func(__VA_ARGS__);

#define FORWARD_JNI_VOID_CALL(func_name, signature, ...) \
    typedef void (*func_t)signature; \
    static func_t orig_func = nullptr; \
    if (!orig_func) { \
        orig_func = (func_t)Xenon::ResolveOriginalLauncherSymbol(#func_name); \
        if (!orig_func) { \
            LOGE("Failed to resolve original JNI symbol: " #func_name); \
            return; \
        } \
    } \
    orig_func(__VA_ARGS__);

extern "C" {

    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_filterKeyEvent(JNIEnv* env, jclass clazz, jint i, jlong j, jint i2, jint i3, jint i4, jint i5, jint i6) {
        FORWARD_JNI_CALL(Java_com_trans_GameJni_filterKeyEvent, jboolean, (JNIEnv*, jclass, jint, jlong, jint, jint, jint, jint, jint), env, clazz, i, j, i2, i3, i4, i5, i6);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_init(JNIEnv* env, jclass clazz, jstring s1, jstring s2, jstring s3, jobject view, jobject activity, jobject bundle, jint i1, jint i2) {
        if (!IsGameReady()) {
            LOGE("init: libGameMain.so not loaded");
            return;
        }
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_init, (JNIEnv*, jclass, jstring, jstring, jstring, jobject, jobject, jobject, jint, jint), env, clazz, s1, s2, s3, view, activity, bundle, i1, i2);
    }

    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_isInitialized(JNIEnv* env, jclass clazz) {
        FORWARD_JNI_CALL(Java_com_trans_GameJni_isInitialized, jboolean, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_nativeDialogClick(JNIEnv* env, jclass clazz, jint i) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_nativeDialogClick, (JNIEnv*, jclass, jint), env, clazz, i);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_onConfigurationChanged(JNIEnv* env, jclass clazz, jint i1, jint i2, jstring s) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_onConfigurationChanged, (JNIEnv*, jclass, jint, jint, jstring), env, clazz, i1, i2, s);
    }

    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_pause(JNIEnv* env, jclass clazz) {
        FORWARD_JNI_CALL(Java_com_trans_GameJni_pause, jboolean, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueAxisMovedEvent(JNIEnv* env, jclass clazz, jint i1, jint i2, jlong j, jint i3, jfloat f) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_queueAxisMovedEvent, (JNIEnv*, jclass, jint, jint, jlong, jint, jfloat), env, clazz, i1, i2, j, i3, f);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueDeviceEvent(JNIEnv* env, jclass clazz, jint i, jboolean b) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_queueDeviceEvent, (JNIEnv*, jclass, jint, jboolean), env, clazz, i, b);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueKeyEvent(JNIEnv* env, jclass clazz, jint i, jlong j, jint i2, jint i3, jint i4, jint i5, jint i6) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_queueKeyEvent, (JNIEnv*, jclass, jint, jlong, jint, jint, jint, jint, jint), env, clazz, i, j, i2, i3, i4, i5, i6);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_queuePointerEvent(JNIEnv* env, jclass clazz, jint i1, jint i2, jlong j, jint i3, jint i4, jint i5, jfloat f1, jfloat f2, jfloat f3) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_queuePointerEvent, (JNIEnv*, jclass, jint, jint, jlong, jint, jint, jint, jfloat, jfloat, jfloat), env, clazz, i1, i2, j, i3, i4, i5, f1, f2, f3);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueSensorEvent(JNIEnv* env, jclass clazz, jobject sensor, jint i1, jint i2, jlong j, jfloatArray arr) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_queueSensorEvent, (JNIEnv*, jclass, jobject, jint, jint, jlong, jfloatArray), env, clazz, sensor, i1, i2, j, arr);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_readAudioData(JNIEnv* env, jclass clazz) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_readAudioData, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_render(JNIEnv* env, jclass clazz) {
        if (!IsGameReady()) {
            return JNI_FALSE;
        }
        FORWARD_JNI_CALL(Java_com_trans_GameJni_render, jboolean, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_resume(JNIEnv* env, jclass clazz) {
        if (!IsGameReady()) {
            return JNI_FALSE;
        }
        FORWARD_JNI_CALL(Java_com_trans_GameJni_resume, jboolean, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_setFullVersion(JNIEnv* env, jclass clazz, jboolean b) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_setFullVersion, (JNIEnv*, jclass, jboolean), env, clazz, b);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_setOfferFullOpenRes(JNIEnv* env, jclass clazz, jboolean b) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_setOfferFullOpenRes, (JNIEnv*, jclass, jboolean), env, clazz, b);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_setOfferRes(JNIEnv* env, jclass clazz, jboolean b) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_setOfferRes, (JNIEnv*, jclass, jboolean), env, clazz, b);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_shutdown(JNIEnv* env, jclass clazz) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_shutdown, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_surfaceCreated(JNIEnv* env, jclass clazz) {
        if (!Xenon::GetOriginalMainHandle()) {
            LOGE("surfaceCreated: libGameMain.so not loaded — aborting to avoid SIGSEGV");
            return;
        }
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_surfaceCreated, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_textInput(JNIEnv* env, jclass clazz, jstring s) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_textInput, (JNIEnv*, jclass, jstring), env, clazz, s);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_uninit(JNIEnv* env, jclass clazz) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_uninit, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_videoPlayCompleted(JNIEnv* env, jclass clazz) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_videoPlayCompleted, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_videoPlayError(JNIEnv* env, jclass clazz) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_videoPlayError, (JNIEnv*, jclass), env, clazz);
    }

    JNIEXPORT void JNICALL Java_com_trans_GameJni_windowFocusChanged(JNIEnv* env, jclass clazz, jboolean b) {
        FORWARD_JNI_VOID_CALL(Java_com_trans_GameJni_windowFocusChanged, (JNIEnv*, jclass, jboolean), env, clazz, b);
    }

}
