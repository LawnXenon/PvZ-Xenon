package com.trans;

import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

/**
 * GameVideo — video playback manager stub.
 * Reconstructed from smali. Wraps MediaPlayer for in-game video.
 */
public class GameVideo implements
        MediaPlayer.OnPreparedListener,
        MediaPlayer.OnErrorListener,
        MediaPlayer.OnBufferingUpdateListener,
        MediaPlayer.OnCompletionListener,
        SurfaceHolder.Callback {

    private static final int SHOW_VIDEO = 0x100;
    private static final int HIDE_VIDEO = 0x101;
    private static final String TAG = "GameVideo";

    private final GameActivity mActivity;
    private final SurfaceView mView;
    private final SurfaceHolder mHolder;
    private MediaPlayer mMediaPlayer;
    private String mPath;
    private boolean mPrepared = false;
    private boolean mAttached = false;
    private boolean mPreparePending = false;
    private boolean mStartPending = false;
    private boolean mHasSurface = false;
    private boolean mVisible = true;
    private final boolean shiLiuBiJiu;
    private final int widthAs;
    private final int heightAs;

    public android.os.Handler mHandler;

    public GameVideo(GameActivity activity) {
        mActivity = activity;
        mHandler = new android.os.Handler();

        mView = new SurfaceView(activity);
        mHolder = mView.getHolder();
        mHolder.addCallback(this);
        mHolder.setFormat(-2);
        mHolder.setType(3);

        mMediaPlayer = null;
        mPrepared = false;
        mAttached = false;
        mPreparePending = false;
        mStartPending = false;
        mHasSurface = false;
        mVisible = true;

        attach();
        _show(true);

        android.content.SharedPreferences prefs = activity.getSharedPreferences("data", 0);
        shiLiuBiJiu = prefs.getBoolean("shiLiuBiJiu", true);
        widthAs  = prefs.getInt("width", 16);
        heightAs = prefs.getInt("height", 9);
    }

    public SurfaceView getView() {
        return mView;
    }

    private void attach() {
        if (!mAttached) {
            mActivity.attachVideoPlayer();
            mAttached = true;
        }
    }

    private void detach() {
        if (mAttached) {
            mActivity.detachVideoPlayer();
            mAttached = false;
        }
    }

    public void _show(boolean show) {
        if (mVisible != show) {
            mView.setVisibility(show ? 0 : 4);
            mVisible = show;
        }
    }

    public boolean open(String path) {
        if (path == null) return false;
        if (mPath != null && mPath.equals(path)) return true;
        if (mPath != null) close();
        // ACPManager asset open stub — actual logic is in native
        AssetFileDescriptor afd = ACPManager.getInstance().openFd(path);
        if (afd == null) return false;
        mPath = path;
        return true;
    }

    public boolean stop() {
        if (mMediaPlayer != null) {
            try { mMediaPlayer.stop(); } catch (Exception ignored) {}
        }
        return true;
    }

    public boolean close() {
        if (mMediaPlayer != null) {
            stop();
            try { mMediaPlayer.reset(); } catch (Exception ignored) {}
            try { mMediaPlayer.release(); } catch (Exception ignored) {}
            mMediaPlayer = null;
        }
        mPath = null;
        mPreparePending = false;
        mStartPending = false;
        return true;
    }

    public void destroy() {
        close();
        mHolder.removeCallback(this);
    }

    public boolean isPlaying() {
        if (mPath == null || mMediaPlayer == null) return false;
        if (mStartPending) return true;
        return mMediaPlayer.isPlaying();
    }

    public void onPause() {}
    public void onResume() {}

    // --- MediaPlayer callbacks ---
    @Override
    public void onPrepared(MediaPlayer mp) {
        android.util.Log.d(TAG, "onPrepared()");
        mPrepared = true;
        if (mStartPending) {
            try {
                mp.start();
                mStartPending = false;
            } catch (Exception e) {
                e.printStackTrace();
                GameJni.videoPlayError();
                close();
            }
        }
    }

    @Override
    public boolean onError(MediaPlayer mp, int what, int extra) {
        android.util.Log.e(TAG, "onError-->   what:" + what + "    extra:" + extra);
        if (mp != null) {
            GameJni.videoPlayError();
            close();
        }
        return true;
    }

    @Override
    public void onBufferingUpdate(MediaPlayer mp, int percent) {
        android.util.Log.d(TAG, "onBufferingUpdate called --->   percent:" + percent);
    }

    @Override
    public void onCompletion(MediaPlayer mp) {
        android.util.Log.d(TAG, "onCompletion()");
        GameJni.videoPlayCompleted();
    }

    // --- SurfaceHolder.Callback ---
    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        mHasSurface = true;
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {}

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        mHasSurface = false;
    }
}
