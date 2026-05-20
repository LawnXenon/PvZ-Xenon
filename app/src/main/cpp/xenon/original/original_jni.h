#ifndef XENON_ORIGINAL_JNI_H
#define XENON_ORIGINAL_JNI_H

#include <jni.h>

extern "C" {

    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_filterKeyEvent(JNIEnv* env, jclass clazz, jint i, jlong j, jint i2, jint i3, jint i4, jint i5, jint i6);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_init(JNIEnv* env, jclass clazz, jstring s1, jstring s2, jstring s3, jobject view, jobject activity, jobject bundle, jint i1, jint i2);
    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_isInitialized(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_nativeDialogClick(JNIEnv* env, jclass clazz, jint i);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_onConfigurationChanged(JNIEnv* env, jclass clazz, jint i1, jint i2, jstring s);
    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_pause(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueAxisMovedEvent(JNIEnv* env, jclass clazz, jint i1, jint i2, jlong j, jint i3, jfloat f);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueDeviceEvent(JNIEnv* env, jclass clazz, jint i, jboolean b);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueKeyEvent(JNIEnv* env, jclass clazz, jint i, jlong j, jint i2, jint i3, jint i4, jint i5, jint i6);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_queuePointerEvent(JNIEnv* env, jclass clazz, jint i1, jint i2, jlong j, jint i3, jint i4, jint i5, jfloat f1, jfloat f2, jfloat f3);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_queueSensorEvent(JNIEnv* env, jclass clazz, jobject sensor, jint i1, jint i2, jlong j, jfloatArray arr);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_readAudioData(JNIEnv* env, jclass clazz);
    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_render(JNIEnv* env, jclass clazz);
    JNIEXPORT jboolean JNICALL Java_com_trans_GameJni_resume(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_setFullVersion(JNIEnv* env, jclass clazz, jboolean b);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_setOfferFullOpenRes(JNIEnv* env, jclass clazz, jboolean b);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_setOfferRes(JNIEnv* env, jclass clazz, jboolean b);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_shutdown(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_surfaceCreated(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_textInput(JNIEnv* env, jclass clazz, jstring s);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_uninit(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_videoPlayCompleted(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_videoPlayError(JNIEnv* env, jclass clazz);
    JNIEXPORT void JNICALL Java_com_trans_GameJni_windowFocusChanged(JNIEnv* env, jclass clazz, jboolean b);

}

#endif // XENON_ORIGINAL_JNI_H
