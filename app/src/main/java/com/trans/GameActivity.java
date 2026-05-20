package com.trans;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Environment;
import android.os.FileObserver;
import android.os.Handler;
import android.os.Message;
import android.view.Window;
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
        super.onCreate(savedInstanceState);
        mCurActivity = this;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mCurActivity = null;
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
