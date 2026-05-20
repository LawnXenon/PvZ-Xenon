package com.trans;

import android.hardware.Sensor;
import android.os.Bundle;
import android.system.ErrnoException;
import android.system.Os;
import android.util.Log;

import java.io.File;

public class GameJni {
    private static final String TAG = "GameJni";

    private static boolean mLoaded = false;
    /** Set when libGameMain.so was loaded successfully. */
    public static boolean sGameMainLoaded = false;

    public GameJni() {
    }

    // --- Native Methods ---
    public static native boolean filterKeyEvent(int i, long j, int i2, int i3, int i4, int i5, int i6);

    public static native void init(String str, String str2, String str3, GameView view, GameActivity activity, Bundle bundle, int i, int i2);

    public static native boolean isInitialized();

    public static native void nativeDialogClick(int i);

    public static native void onConfigurationChanged(int i1, int i2, String s);

    public static native boolean pause();

    public static native void queueAxisMovedEvent(int i1, int i2, long j, int i3, float f);

    public static native void queueDeviceEvent(int i, boolean b);

    public static native void queueKeyEvent(int i, long j, int i2, int i3, int i4, int i5, int i6);

    public static native void queuePointerEvent(int i1, int i2, long j, int i3, int i4, int i5, float f1, float f2, float f3);

    public static native void queueSensorEvent(Sensor sensor, int i1, int i2, long j, float[] arr);

    public static native void readAudioData();

    public static native boolean render();

    public static native boolean resume();

    public static native void setFullVersion(boolean b);

    public static native void setOfferFullOpenRes(boolean b);

    public static native void setOfferRes(boolean b);

    public static native void shutdown();

    public static native void surfaceCreated();

    public static native void textInput(String s);

    public static native void uninit();

    public static native void videoPlayCompleted();

    public static native void videoPlayError();

    public static native void windowFocusChanged(boolean b);

    public static boolean isLoaded() {
        return mLoaded;
    }

    public static boolean isGameMainLoaded() {
        return sGameMainLoaded;
    }

    public static boolean load() {
        return load(null);
    }

    /**
     * Load order matters: libGameMain.so has NEEDED entries for libGameLauncher.so
     * (original) and libstdc++.so. The Xenon hook is a separate libXenon.so.
     */
    public static boolean load(String[] searchPaths) {
        if (isLoaded()) {
            return true;
        }

        if (searchPaths != null && searchPaths.length > 0 && searchPaths[0] != null) {
            try {
                Os.setenv("XENON_LIB_DIR", searchPaths[0], true);
            } catch (ErrnoException e) {
                Log.w(TAG, "Could not set XENON_LIB_DIR", e);
            }
        }

        loadCppRuntime(searchPaths);

        // Original launcher — required before GameMain (see readelf NEEDED on libGameMain.so)
        if (!loadLibrary(searchPaths, "GameLauncher")) {
            Log.e(TAG, "Failed to load original libGameLauncher.so");
            return false;
        }

        loadLibrary(searchPaths, "Homura");

        sGameMainLoaded = loadLibrary(searchPaths, "GameMain");
        if (!sGameMainLoaded) {
            Log.e(TAG, "Failed to preload libGameMain.so");
        }

        // Xenon replacement / hook layer (separate SONAME from original launcher)
        boolean xenonOk = loadLibrary(searchPaths, "Xenon");
        mLoaded = xenonOk;
        Log.i(TAG, "GameJni.load: GameMain=" + sGameMainLoaded + " Xenon=" + xenonOk);
        return xenonOk && sGameMainLoaded;
    }

    private static void loadCppRuntime(String[] searchPaths) {
        // libGameMain.so NEEDED: libstdc++.so (not only libstdc++-shared)
        String[] names = {"stdc++", "stdc++-shared", "c++_shared"};
        for (String name : names) {
            if (loadLibrary(searchPaths, name)) {
                return;
            }
        }
        Log.w(TAG, "C++ runtime not preloaded; GameMain may fail to link on this device");
    }

    public static boolean loadLibrary(String[] searchPaths, String libName) {
        String mappedName = System.mapLibraryName(libName);
        if (searchPaths != null) {
            for (String path : searchPaths) {
                if (path == null) {
                    continue;
                }
                File file = new File(path, mappedName);
                if (!file.isFile()) {
                    continue;
                }
                try {
                    System.load(file.getAbsolutePath());
                    Log.i(TAG, "Loaded " + file.getAbsolutePath());
                    return true;
                } catch (Throwable th) {
                    Log.e(TAG, "Failed to load " + file.getAbsolutePath(), th);
                }
            }
        }
        try {
            System.loadLibrary(libName);
            Log.i(TAG, "Loaded via loadLibrary: " + libName);
            return true;
        } catch (Throwable th) {
            Log.e(TAG, "Failed loadLibrary: " + libName, th);
            return false;
        }
    }
}
