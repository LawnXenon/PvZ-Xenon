package com.trans;

import android.app.AlertDialog;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.method.PasswordTransformationMethod;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.widget.EditText;

import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.opengles.GL10;

/**
 * GameView — OpenGL surface for PvZ TV. Forwards render and input events to GameJni.
 */
public class GameView extends GLSurfaceView {

    private static final String TAG = "GameView";

    protected static final int SHOW_KEYBOARD = 0x101;
    protected static final int HIDE_KEYBOARD = 0x102;
    protected static final int SHOW_GAME = 0x103;
    protected static final int HIDE_GAME = 0x104;

    protected static final int KEYBOARD_NORMAL = 0;
    protected static final int KEYBOARD_PASSWORD = 1;
    protected static final int KEYBOARD_URL = 2;
    protected static final int KEYBOARD_EMAIL = 3;
    protected static final int KEYBOARD_USERNAME = 4;

    private final GameActivity gameActivity;
    private final boolean shiLiuBiJiu;
    private final int widthAs;
    private final int heightAs;

    public Handler mHandler;
    private EditText mTextInputWidget;
    private AlertDialog mTextInputDialog;
    private final Renderer renderer;

    static class Renderer implements android.opengl.GLSurfaceView.Renderer {
        private static final String TAG = "Render";

        final Context ctx;
        final GameActivity activity;
        boolean shutdown;
        boolean rendering;
        boolean delayedShutdown;

        Renderer(Context ctx, GameActivity activity) {
            this.ctx = ctx;
            this.activity = activity;
        }

        @Override
        public void onDrawFrame(GL10 gl) {
            if (!GameJni.isGameMainLoaded()) {
                return;
            }
            if (shutdown) {
                try {
                    Thread.sleep(10);
                } catch (InterruptedException ignored) {
                }
                return;
            }
            rendering = true;
            boolean ok = GameJni.render();
            rendering = false;
            if (!ok || shutdown) {
                stopGame();
            }
        }

        @Override
        public void onSurfaceChanged(GL10 gl, int width, int height) {
            if (!GameJni.isGameMainLoaded()) {
                return;
            }
            String sourceDir = ctx.getApplicationInfo().sourceDir;
            String dataDir = ctx.getApplicationInfo().dataDir;
            String externalDir = ctx.getExternalFilesDir(null).getAbsolutePath();

            Bundle meta = null;
            try {
                ActivityInfo info = activity.getPackageManager().getActivityInfo(
                        activity.getComponentName(), PackageManager.GET_META_DATA);
                meta = info.metaData;
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }

            GameJni.init(sourceDir, dataDir, externalDir, activity.getView(), activity, meta, width, height);
        }

        @Override
        public void onSurfaceCreated(GL10 gl, EGLConfig config) {
            if (!GameJni.isGameMainLoaded()) {
                Log.e(TAG, "onSurfaceCreated: GameMain not loaded");
                return;
            }
            Log.d(TAG, "onSurfaceCreated(): GameJni.surfaceCreated()");
            GameJni.surfaceCreated();
        }

        void handlePause() {
            Log.d(TAG, "handlePause: GameJni.pause()");
            if (!GameJni.pause()) {
                stopGame();
            }
        }

        void handleResume() {
            Log.d(TAG, "handleResume: GameJni.resume()");
            GameJni.resume();
        }

        void stopGame() {
            if (delayedShutdown && !rendering) {
                Log.d(TAG, "stopGame: GameJni.uninit()");
                GameJni.uninit();
                delayedShutdown = false;
            }
            if (!shutdown) {
                Log.d(TAG, "stopGame: GameJni.shutdown()");
                GameJni.shutdown();
                if (!rendering) {
                    Log.d(TAG, "stopGame: GameJni.uninit()");
                    GameJni.uninit();
                } else {
                    delayedShutdown = true;
                }
                activity.finish();
                shutdown = true;
            }
        }

        void handleKeyDown(int keyCode, KeyEvent event) {
            queueKeyEvent(1, keyCode, event);
        }

        void handleKeyUp(int keyCode, KeyEvent event) {
            queueKeyEvent(0, keyCode, event);
        }

        private void queueKeyEvent(int action, int keyCode, KeyEvent event) {
            long time = event.getEventTime();
            int deviceId = event.getDeviceId();
            int source = 0x401;
            int mapped = mapGameKeyCode(keyCode);
            int keyChar = event.getUnicodeChar();
            int repeat = event.getRepeatCount();
            GameJni.queueKeyEvent(action, time, deviceId, source, mapped, keyChar, repeat);
        }
    }

    /** Maps Android key codes to the engine key codes (original GameView smali). */
    private static int mapGameKeyCode(int keyCode) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_BUTTON_A:       // 0x60
                return 0xbc;
            case KeyEvent.KEYCODE_BUTTON_B:
                return 0xbd;
            case KeyEvent.KEYCODE_BUTTON_C:
                return 0xbe;
            case KeyEvent.KEYCODE_BUTTON_X:
                return 0xbf;
            case KeyEvent.KEYCODE_BUTTON_Y:
                return 0xc0;
            case KeyEvent.KEYCODE_BUTTON_L1:
                return 0xc2;
            case KeyEvent.KEYCODE_BUTTON_R1:
                return 0xc3;
            case KeyEvent.KEYCODE_BUTTON_L2:
            case KeyEvent.KEYCODE_BUTTON_R2:
            case KeyEvent.KEYCODE_BUTTON_THUMBL:
                return 0xc6;
            case KeyEvent.KEYCODE_BUTTON_THUMBR:
            case KeyEvent.KEYCODE_BUTTON_Z:
                return 0xbe;
            default:
                return keyCode;
        }
    }

    static class ConfigChooser implements android.opengl.GLSurfaceView.EGLConfigChooser {
        private static final int EGL_OPENGL_ES2_BIT = 0x4;
        private static final int[] CONFIG_ATTRIBS = {
                EGL10.EGL_RED_SIZE, 4,
                EGL10.EGL_GREEN_SIZE, 4,
                EGL10.EGL_BLUE_SIZE, 4,
                EGL10.EGL_NONE
        };

        protected final int mRedSize;
        protected final int mGreenSize;
        protected final int mBlueSize;
        protected final int mAlphaSize;
        protected final int mDepthSize;
        protected final int mStencilSize;
        private final int[] mValue = new int[1];

        ConfigChooser(int r, int g, int b, int a, int depth, int stencil) {
            mRedSize = r;
            mGreenSize = g;
            mBlueSize = b;
            mAlphaSize = a;
            mDepthSize = depth;
            mStencilSize = stencil;
        }

        @Override
        public EGLConfig chooseConfig(EGL10 egl, EGLDisplay display) {
            int[] numConfig = new int[1];
            egl.eglChooseConfig(display, CONFIG_ATTRIBS, null, 0, numConfig);
            int count = numConfig[0];
            if (count <= 0) {
                throw new IllegalArgumentException("No configs match configSpec");
            }
            EGLConfig[] configs = new EGLConfig[count];
            egl.eglChooseConfig(display, CONFIG_ATTRIBS, configs, count, numConfig);
            return chooseConfig(egl, display, configs);
        }

        EGLConfig chooseConfig(EGL10 egl, EGLDisplay display, EGLConfig[] configs) {
            for (EGLConfig config : configs) {
                int d = findConfigAttrib(egl, display, config, EGL10.EGL_DEPTH_SIZE, 0);
                int s = findConfigAttrib(egl, display, config, EGL10.EGL_STENCIL_SIZE, 0);
                if (d < mDepthSize || s < mStencilSize) {
                    continue;
                }
                int r = findConfigAttrib(egl, display, config, EGL10.EGL_RED_SIZE, 0);
                int g = findConfigAttrib(egl, display, config, EGL10.EGL_GREEN_SIZE, 0);
                int b = findConfigAttrib(egl, display, config, EGL10.EGL_BLUE_SIZE, 0);
                int a = findConfigAttrib(egl, display, config, EGL10.EGL_ALPHA_SIZE, 0);
                if (r == mRedSize && g == mGreenSize && b == mBlueSize && a == mAlphaSize) {
                    return config;
                }
            }
            return null;
        }

        private int findConfigAttrib(EGL10 egl, EGLDisplay display, EGLConfig config, int attribute, int defaultValue) {
            if (egl.eglGetConfigAttrib(display, config, attribute, mValue)) {
                return mValue[0];
            }
            return defaultValue;
        }
    }

    static class ContextFactory implements android.opengl.GLSurfaceView.EGLContextFactory {
        private static final int EGL_CONTEXT_CLIENT_VERSION = 0x3098;

        @Override
        public EGLContext createContext(EGL10 egl, EGLDisplay display, EGLConfig eglConfig) {
            Log.w(TAG, "creating OpenGL ES 1.0 context");
            checkEglError("Before eglCreateContext", egl);
            int[] attribList = {EGL_CONTEXT_CLIENT_VERSION, 1, EGL10.EGL_NONE};
            EGLContext context = egl.eglCreateContext(display, eglConfig, EGL10.EGL_NO_CONTEXT, attribList);
            checkEglError("After eglCreateContext", egl);
            return context;
        }

        @Override
        public void destroyContext(EGL10 egl, EGLDisplay display, EGLContext context) {
            egl.eglDestroyContext(display, context);
        }
    }

    public GameView(Context context, GameActivity activity) {
        this(context, activity, true, 16, 0);
    }

    public GameView(Context context, GameActivity activity, boolean rgba8888, int depth, int stencil) {
        super(context);
        this.gameActivity = activity;
        this.mTextInputWidget = null;
        this.mTextInputDialog = null;
        this.renderer = new Renderer(context, activity);
        this.mHandler = new Handler(msg -> {
            switch (msg.what) {
                case SHOW_KEYBOARD:
                    Bundle data = msg.getData();
                    if (data != null) {
                        _showKeyboard(
                                data.getInt("mode", KEYBOARD_NORMAL),
                                data.getString("title", ""),
                                data.getString("hint", ""),
                                data.getString("initial", ""));
                    }
                    return true;
                case HIDE_KEYBOARD:
                    _hideKeyboard(true);
                    return true;
                case SHOW_GAME:
                    _show(true);
                    return true;
                case HIDE_GAME:
                    _show(false);
                    return true;
                default:
                    return false;
            }
        });

        android.content.SharedPreferences prefs = context.getSharedPreferences("data", 0);
        this.shiLiuBiJiu = prefs.getBoolean("shiLiuBiJiu", true);
        this.widthAs = prefs.getInt("width", 16);
        this.heightAs = prefs.getInt("height", 9);

        init(rgba8888, depth, stencil);
        setFocusable(true);
        setFocusableInTouchMode(true);
    }

    private void init(boolean rgba8888, int depth, int stencil) {
        if (rgba8888) {
            getHolder().setFormat(android.graphics.PixelFormat.RGBA_8888);
        } else {
            getHolder().setFormat(android.graphics.PixelFormat.RGB_565);
        }
        setEGLContextFactory(new ContextFactory());
        if (rgba8888) {
            setEGLConfigChooser(new ConfigChooser(8, 8, 8, 8, depth, stencil));
        } else {
            setEGLConfigChooser(new ConfigChooser(5, 6, 5, 0, depth, stencil));
        }
        setRenderer(renderer);
        this.mTextInputWidget = new EditText(getContext());
    }

    @Override
    public void onPause() {
        super.onPause();
        Log.d(TAG, "onPause: ");
        queueEvent(renderer::handlePause);
    }

    @Override
    public void onResume() {
        super.onResume();
        Log.d(TAG, "onResume: ");
        queueEvent(renderer::handleResume);
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        Log.d(TAG, "onWindowFocusChanged() GameJni.windowFocusChanged() " + hasWindowFocus);
        super.onWindowFocusChanged(hasWindowFocus);
        GameJni.windowFocusChanged(hasWindowFocus);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        MotionEvent copy = MotionEvent.obtain(event);
        queueEvent(() -> handleTouch(copy));
        return true;
    }

    public void onConfigurationChanged(Configuration config) {
        String code = config.locale.getLanguage() + "_" + config.locale.getCountry();
        GameJni.onConfigurationChanged(config.touchscreen, config.keyboard, code);
    }

    public void stopGame() {
        Log.d(TAG, "stopGame: ");
        queueEvent(renderer::stopGame);
    }

    public void hideKeyboard() {
        mHandler.sendMessage(mHandler.obtainMessage(HIDE_KEYBOARD));
    }

    public void _hideKeyboard(boolean cancel) {
        if (mTextInputDialog != null) {
            mTextInputWidget = null;
            mTextInputDialog.dismiss();
            mTextInputDialog = null;
        }
    }

    public void _show(boolean show) {
        setVisibility(show ? VISIBLE : INVISIBLE);
    }

    public void _showKeyboard(int keyboardType, String title, String hint, String content) {
        if (mTextInputDialog != null) {
            if (mTextInputWidget != null) {
                mTextInputWidget.setHint(hint);
                mTextInputWidget.setText(content);
            }
            mTextInputDialog.show();
            return;
        }
        mTextInputWidget = new EditText(gameActivity);
        int inputType;
        switch (keyboardType) {
            case KEYBOARD_PASSWORD:
                inputType = 0x81;
                break;
            case KEYBOARD_URL:
                inputType = 0x11;
                break;
            case KEYBOARD_EMAIL:
                inputType = 0x21;
                break;
            case KEYBOARD_USERNAME:
                inputType = 0x91;
                break;
            default:
                inputType = 0x1;
                break;
        }
        mTextInputWidget.setInputType(inputType);
        if (keyboardType == KEYBOARD_PASSWORD) {
            mTextInputWidget.setTransformationMethod(PasswordTransformationMethod.getInstance());
        }
        mTextInputWidget.setHint(hint);
        mTextInputWidget.setText(content);

        mTextInputDialog = new AlertDialog.Builder(gameActivity)
                .setTitle(title)
                .setView(mTextInputWidget)
                .setPositiveButton("\u786e\u5b9a", (d, w) -> textInput(mTextInputWidget.getText().toString()))
                .setNegativeButton("\u8fd4\u56de", (d, w) -> textInput(null))
                .setOnCancelListener(d -> textInput(null))
                .create();
        mTextInputDialog.show();
    }

    public void showKeyboard(int keyboardType, String title, String hint, String content) {
        Bundle bundle = new Bundle();
        bundle.putInt("mode", keyboardType);
        bundle.putString("title", title);
        bundle.putString("hint", hint);
        bundle.putString("initial", content);
        Message msg = mHandler.obtainMessage(SHOW_KEYBOARD);
        msg.setData(bundle);
        mHandler.sendMessage(msg);
    }

    public void textInput(String text) {
        GameJni.textInput(text != null ? text : "");
    }

    public static void checkEglError(String op, EGL10 egl) {
        int error;
        while ((error = egl.eglGetError()) != EGL10.EGL_SUCCESS) {
            Log.e(TAG, String.format("%s: EGL error: 0x%x", op, error));
        }
    }

    void handleTouch(MotionEvent event) {
        try {
            int action = event.getAction() & MotionEvent.ACTION_MASK;
            if (action != MotionEvent.ACTION_DOWN && action != MotionEvent.ACTION_UP
                    && action != MotionEvent.ACTION_MOVE && action != MotionEvent.ACTION_CANCEL
                    && action != MotionEvent.ACTION_POINTER_DOWN && action != MotionEvent.ACTION_POINTER_UP) {
                return;
            }
            int historySize = event.getHistorySize();
            int pointerCount = event.getPointerCount();
            int source = event.getSource();
            int deviceId = event.getDeviceId();

            for (int h = 0; h < historySize; h++) {
                long time = event.getHistoricalEventTime(h);
                for (int p = 0; p < pointerCount; p++) {
                    int id = event.getPointerId(p);
                    float x = event.getHistoricalX(p, h);
                    float y = event.getHistoricalY(p, h);
                    float pressure = event.getHistoricalPressure(p, h);
                    int more = (p < pointerCount - 1) ? 1 : 0;
                    GameJni.queuePointerEvent(id, action, time, more, deviceId, source, x, y, pressure);
                }
            }

            long time = event.getEventTime();
            int activePointer = (event.getAction() & MotionEvent.ACTION_POINTER_INDEX_MASK)
                    >> MotionEvent.ACTION_POINTER_INDEX_SHIFT;
            for (int p = 0; p < pointerCount; p++) {
                int id = event.getPointerId(p);
                float x = event.getX(p);
                float y = event.getY(p);
                float pressure = event.getPressure(p);
                int more = (p < pointerCount - 1) ? 1 : 0;
                if (activePointer == p) {
                    more |= 2;
                }
                GameJni.queuePointerEvent(id, action, time, more, deviceId, source, x, y, pressure);
            }
        } finally {
            event.recycle();
        }
    }

    /** JNI: AGViewSwapBuffers */
    public void swapBuffers() {
        super.swapBuffers();
    }

    /** JNI: AGViewUpdate */
    public void update() {
        super.update();
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_VOLUME_UP || keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
            return false;
        }
        KeyEvent copy = new KeyEvent(event);
        queueEvent(() -> renderer.handleKeyDown(keyCode, copy));
        return true;
    }

    @Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        KeyEvent copy = new KeyEvent(event);
        queueEvent(() -> renderer.handleKeyUp(keyCode, copy));
        return true;
    }
}
