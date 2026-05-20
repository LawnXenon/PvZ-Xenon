package com.trans.pvz;

import android.os.Bundle;
import com.trans.GameActivity;
import com.trans.GameVideo;
import com.trans.GameView;

/**
 * Main launcher activity — JNI in libGameLauncher.so resolves several methods on this
 * exact class (not only GameActivity). Keep overrides in sync with AGGet* exports.
 */
public class GameLauncher extends GameActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public int getTouchScreen() {
        return super.getTouchScreen();
    }

    @Override
    public int getKeyboard() {
        return super.getKeyboard();
    }

    @Override
    public int getSdkVersion() {
        return super.getSdkVersion();
    }

    @Override
    public String getLocale() {
        return super.getLocale();
    }

    @Override
    public String getModel() {
        return super.getModel();
    }

    @Override
    public String getDeviceId() {
        return super.getDeviceId();
    }

    @Override
    public String getAndroidId() {
        return super.getAndroidId();
    }

    @Override
    public GameVideo getVideoPlayer() {
        return super.getVideoPlayer();
    }

    @Override
    public boolean hasSensor(int type) {
        return super.hasSensor(type);
    }

    @Override
    public float getSensorMaxRange(int type) {
        return super.getSensorMaxRange(type);
    }

    @Override
    public float getSensorResolution(int type) {
        return super.getSensorResolution(type);
    }

    public void setSwapMode(int mode) {
        GameView view = getView();
        if (view != null) {
            view.setSwapMode(mode);
        }
    }

    public int getSwapMode() {
        GameView view = getView();
        return view != null ? view.getSwapMode() : com.trans.GLSurfaceView.SWAPMODE_AUTOMATIC;
    }
}
