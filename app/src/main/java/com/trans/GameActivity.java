package com.trans;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.FileObserver;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.FrameLayout;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;

/**
 * GameActivity — reconstructed from smali decompilation.
 * Extends android.app.Activity and provides the base for GameLauncher.
 * All stub methods that are called from native code are preserved here.
 */
public class GameActivity extends Activity {

    public static final int ATTACH_VIDEO_PLAYER = 0x101;
    public static final int DETACH_VIDEO_PLAYER = 0x102;

    public static String TAG = "GameActivity";
    private static GameActivity mCurActivity;

    private FileObserver fileObserver;
    private boolean isFileObserverLaunched = false;

    public Handler mHandler;
    protected FrameLayout mLayout;
    protected GameVideo mVideo;
    protected GameView mView;

    public GameActivity() {
        mLayout = null;
        mView = null;
        mVideo = null;
        mHandler = new Handler() {
            @Override
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case ATTACH_VIDEO_PLAYER:
                        _attachVideoPlayer();
                        break;
                    case DETACH_VIDEO_PLAYER:
                        _detachVideoPlayer();
                        break;
                }
            }
        };
        isFileObserverLaunched = false;
    }

    // --- Static helpers ---

    public static GameActivity get() {
        return mCurActivity;
    }

    public static void copyDir(File src, File dst) throws IOException {
        if (src.isDirectory()) {
            if (!dst.exists()) dst.mkdirs();
            String[] children = src.list();
            if (children == null) return;
            for (String child : children) {
                copyDir(new File(src, child), new File(dst, child));
            }
        } else {
            FileInputStream in = new FileInputStream(src);
            FileOutputStream out = new FileOutputStream(dst);
            byte[] buf = new byte[1024];
            int len;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            in.close();
            out.close();
        }
    }

    public static void deleteRecursive(File file) {
        if (file.isFile()) {
            file.delete();
            return;
        }
        File[] files = file.listFiles();
        if (files != null && files.length > 0) {
            for (File f : files) {
                deleteRecursive(f);
            }
        }
        file.delete();
    }

    // --- Lifecycle ---

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH) {
            setTheme(android.R.style.Theme_Holo_NoActionBar_Fullscreen);
        }

        Window window = getWindow();
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
            window.getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                            | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            window.setNavigationBarContrastEnforced(false);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.setStatusBarColor(0);
            window.setNavigationBarColor(0);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            WindowManager.LayoutParams params = window.getAttributes();
            params.layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
            window.setAttributes(params);
        } else {
            window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                    WindowManager.LayoutParams.FLAG_FULLSCREEN);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false);
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                controller.hide(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout());
                controller.setSystemBarsBehavior(
                        WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
            }
        }
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);

        super.onCreate(savedInstanceState);

        SharedPreferences prefs = getSharedPreferences("data", MODE_PRIVATE);
        isFileObserverLaunched = prefs.getBoolean("autoBackUp", true);
        if (isFileObserverLaunched) {
            checkAndDeleteOldBackups();
            File userdataDir = new File(getExternalFilesDir(null), "userdata");
            fileObserver = new FileObserver(userdataDir.getAbsolutePath(), FileObserver.CLOSE_WRITE) {
                @Override
                public void onEvent(int event, String path) {
                    // backup hook from original APK
                }
            };
            fileObserver.startWatching();
        }

        if (prefs.getBoolean("first", true) || !isGameDataInstalled(this)) {
            startActivity(new Intent(this, UnzipActivity.class));
            finish();
            return;
        }

        // Modern Android: native libs live in nativeLibraryDir (not dataDir/lib or /system/lib/<pkg>).
        String libDir = getApplicationInfo().nativeLibraryDir;
        if (libDir == null || libDir.isEmpty()) {
            libDir = getApplicationInfo().dataDir + "/lib";
        }
        Log.i(TAG, "Loading native libs from: " + libDir);
        boolean loaded = GameJni.load(new String[]{libDir});
        if (!loaded || !GameJni.isGameMainLoaded()) {
            Log.e(TAG, "Native load failed (Xenon=" + loaded + ", GameMain=" + GameJni.isGameMainLoaded() + ")");
            finish();
            return;
        }

        setup();
    }

    public void setup() {
        if (GameJni.isInitialized()) {
            finish();
            return;
        }
        mCurActivity = this;
        startGame();
        mVideo = new GameVideo(this);
    }

    /** Music/images are read from external storage after files.zip is extracted. */
    public static boolean isGameDataInstalled(GameActivity activity) {
        if (activity == null) {
            return false;
        }
        File probe = new File(activity.getExternalFilesDir(null), "music/crazydave.ogg");
        return probe.isFile() && probe.length() > 0;
    }

    public void startGame() {
        ACPManager.getInstance().setAssets(getAssets(), "files/");
        mView = new GameView(getApplication(), this);
        if (mLayout == null) {
            mLayout = new FrameLayout(this);
        }
        mLayout.setBackgroundColor(0xFF000000);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT);
        params.gravity = android.view.Gravity.CENTER;
        mLayout.addView(mView, params);
        setContentView(mLayout);
        new Thread(() -> GameJni.setFullVersion(true)).start();
    }

    public GameView getView() {
        return mView;
    }

    @Override
    protected void onPause() {
        Log.d(TAG, "onPause()");
        if (mView != null) {
            mView.onPause();
        }
        GameAudio.getInstance().pause();
        super.onPause();
    }

    @Override
    protected void onResume() {
        Log.d(TAG, "onResume()");
        super.onResume();
        if (mView != null) {
            mView.onResume();
        }
        GameAudio.getInstance().resume();
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        if (mView != null) {
            mView.onConfigurationChanged(newConfig);
        }
        super.onConfigurationChanged(newConfig);
    }

    @Override
    protected void onDestroy() {
        Log.d(TAG, "onDestroy()");
        if (mView != null) {
            mView.stopGame();
        }
        if (mVideo != null) {
            mVideo.destroy();
        }
        if (mCurActivity == this) {
            mCurActivity = null;
        }
        if (isFileObserverLaunched && fileObserver != null) {
            fileObserver.stopWatching();
        }
        super.onDestroy();
    }

    public void shutdown() {
        if (mView != null) {
            mView.stopGame();
        }
        finish();
    }

    // --- Public API called from native / JNI ---

    public String GetDataValue(String key) {
        return null;
    }

    public void _attachVideoPlayer() {
        if (mVideo == null) return;
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT);
        params.gravity = 0x11;
        if (mLayout != null && mVideo.getView() != null) {
            int idx = (mView != null && mLayout.indexOfChild(mView) != -1)
                    ? mLayout.indexOfChild(mView) + 1 : 0;
            if (mLayout.indexOfChild(mVideo.getView()) == -1) {
                mLayout.addView(mVideo.getView(), idx, params);
            }
        }
    }

    public void _detachVideoPlayer() {
        if (mVideo == null || mLayout == null) return;
        if (mLayout.indexOfChild(mVideo.getView()) != -1) {
            mLayout.removeView(mVideo.getView());
        }
    }

    public void goToMarket() {}
    public void hideAD() {}
    public void postData(String a, String b) {}
    public void postXMLFileData(String a) {}
    public void restoreCursor() {}
    public void show91MoreGame() {}
    public void showAD(int a, int b) {}
    public void showAlipay() {}
    public boolean showCursor(boolean show) { return true; }
    public void showDataFullDialog() {}
    public void showMessageBox(String title, String msg, int a, int b) {}
    public void showMoreGame() {}
    public void showNdpay() {}
    public void showOffer(String a, int b, int c, int d, int e, int f, int g) {}
    public void installPackage(String path) {}

    public void _goToMarket() {}
    public void _hideAD() {}
    public boolean _isDisplayCursor() { return true; }
    public void _postData(String a, String b) {}
    public void _postXMLFileData(String a) {}
    public boolean _setRcDefaultMode() { return false; }
    public boolean _setRcSensorAirMouse() { return false; }
    public void _show91MoreGame() {}
    public void _showAD(int a, int b) {}
    public void _showAlipay() {}
    public void _showAppNotProperlyInstalledDialog() {}
    public boolean _showCursor(boolean show) { return true; }
    public void _showDataFullDialog() {}
    public void _showMessageBox(String title, String msg, int a, int b) {}
    public void _showMoreGame() {}
    public void _showNdpay() {}
    public void _showOffer(String a, int b, int c, int d, int e, int f, int g) {}

    public void appNotProperlyInstalled() {}

    public void attachVideoPlayer() {
        mHandler.sendMessage(mHandler.obtainMessage(ATTACH_VIDEO_PLAYER));
    }

    public void detachVideoPlayer() {
        mHandler.sendMessage(mHandler.obtainMessage(DETACH_VIDEO_PLAYER));
    }

    public void fullscreen() {
        getWindow().setFlags(0x400, 0x400);
    }

    public String getAndroidId() { return "0123"; }
    public String getDeviceId() { return ""; }

    public String getExternalStorageDirectory() {
        File f = Environment.getExternalStorageDirectory();
        return f != null ? f.getAbsolutePath() : "";
    }

    public int getKeyboard() {
        return getResources().getConfiguration().keyboard;
    }

    /** Called from native via GameLauncher instance (AGGetTouchScreen). */
    public int getTouchScreen() {
        return getResources().getConfiguration().touchscreen;
    }

    public GameVideo getVideoPlayer() {
        return mVideo;
    }

    public boolean hasSensor(int type) {
        return false;
    }

    public boolean startSensor(int type) {
        return false;
    }

    public boolean stopSensor(int type) {
        return false;
    }

    public String getLocale() {
        Configuration cfg = getResources().getConfiguration();
        return cfg.locale.getLanguage() + "_" + cfg.locale.getCountry();
    }

    public String getModel() {
        return android.os.Build.MODEL;
    }

    public int getSdkVersion() {
        return android.os.Build.VERSION.SDK_INT;
    }

    public float getSensorMaxRange(int type) { return 0f; }
    public float getSensorResolution(int type) { return 0f; }

    public void checkAndDeleteOldBackups() {
        File dir = getExternalFilesDir(null);
        if (dir == null || !dir.exists() || !dir.isDirectory()) return;
        File[] backups = dir.listFiles((d, name) -> {
            File f = new File(d, name);
            return f.isDirectory() && name.length() > 0 && Character.isDigit(name.charAt(0));
        });
        if (backups == null || backups.length <= 20) return;
        Arrays.sort(backups, Comparator.comparingLong(File::lastModified));
        for (int i = 20; i < backups.length; i++) {
            deleteRecursive(backups[i]);
        }
    }
}
