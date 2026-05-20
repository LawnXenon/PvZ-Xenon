#ifndef XENON_LOGGER_H
#define XENON_LOGGER_H

#include <android/log.h>

#define XENON_LOG_TAG "Xenon"

#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG,   XENON_LOG_TAG, " \x1b[36m[DEBUG]\x1b[0m " __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,    XENON_LOG_TAG, " \x1b[32m[INFO]\x1b[0m "  __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,    XENON_LOG_TAG, " \x1b[33m[WARN]\x1b[0m "  __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR,   XENON_LOG_TAG, " \x1b[31m[ERROR]\x1b[0m " __VA_ARGS__)

#endif // XENON_LOGGER_H
