package com.trans;

import android.hardware.Sensor;
import android.os.Bundle;
import java.io.File;

public class GameJni {
    private static boolean mLoaded = false;

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

    // --- Loading Logic ---
    public static boolean isLoaded() {
        return mLoaded;
    }

    public static boolean load() {
        return load(null);
    }

    public static boolean load(String[] searchPaths) {
        if (isLoaded()) {
            return true;
        }
        // Load target libraries
        loadLibrary(searchPaths, "stdc++-shared");
        boolean result = loadLibrary(searchPaths, "GameLauncher");
        mLoaded = result;
        return result;
    }

    public static boolean loadLibrary(String[] searchPaths, String libName) {
        boolean success = false;
        if (searchPaths != null && searchPaths.length > 0) {
            String mappedName = System.mapLibraryName(libName);
            for (String path : searchPaths) {
                File file = new File(path, mappedName);
                try {
                    System.load(file.getAbsolutePath());
                    success = true;
                    break;
                } catch (Throwable th) {
                    // Try next path
                }
            }
        }
        if (success) {
            return true;
        }
        try {
            System.loadLibrary(libName);
            return true;
        } catch (Throwable th) {
            return false;
        }
    }
}
