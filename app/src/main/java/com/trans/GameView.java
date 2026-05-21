package com.trans;

import android.app.AlertDialog;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.text.InputFilter;
import android.text.method.PasswordTransformationMethod;
import android.util.Log;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.widget.EditText;

import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.opengles.GL10;

/**
 * GameView — reconstructed faithfully from smali decompilation.
 * Extends com.trans.GLSurfaceView.
 */
public class GameView extends GLSurfaceView {

    private static final String TAG = "GameView";

    protected static final int SHOW_KEYBOARD = 0x101;
    protected static final int HIDE_KEYBOARD = 0x102;
    protected static final int SHOW_GAME     = 0x103;
    protected static final int HIDE_GAME     = 0x104;

    protected static final int KEYBOARD_NORMAL   = 0;
    protected static final int KEYBOARD_PASSWORD = 1;
    protected static final int KEYBOARD_URL      = 2;
    protected static final int KEYBOARD_EMAIL    = 3;
    protected static final int KEYBOARD_USERNAME = 4;

    private final GameActivity gameActivity;
    private final boolean shiLiuBiJiu;
    private final int widthAs;
    private final int heightAs;

    public Handler mHandler;
    private EditText mTextInputWidget;
    private AlertDialog mTextInputDialog;
    private GameView.Renderer renderer;

    // -----------------------------------------------------------------------
    // Inner class: Renderer  (mirrors GameView$Renderer.smali exactly)
    // -----------------------------------------------------------------------
    static class Renderer implements GLSurfaceView.Renderer {

        private static final String TAG = "Render";

        final Context ctx;
        final GameActivity activity;
        boolean shutdown      = false;
        boolean rendering     = false;
        boolean delayedShutdown = false;

        Renderer(Context ctx, GameActivity activity) {
            this.ctx      = ctx;
            this.activity = activity;
        }

        // -- GLSurfaceView.Renderer callbacks --

        @Override
        public void onSurfaceCreated(GL10 gl, EGLConfig config) {
            Log.d(TAG, "onSurfaceCreated(): GameJni.surfaceCreated()");
            GameJni.surfaceCreated();
        }

        @Override
        public void onSurfaceChanged(GL10 gl, int width, int height) {
            String sourceDir  = ctx.getApplicationInfo().sourceDir;
            String dataDir    = ctx.getApplicationInfo().dataDir;
            String externalDir = ctx.getExternalFilesDir(null).getAbsolutePath();

            Bundle meta = null;
            try {
                ActivityInfo info = activity.getPackageManager().getActivityInfo(
                        activity.getComponentName(), PackageManager.GET_META_DATA);
                meta = info.metaData;
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }

            GameJni.init(sourceDir, dataDir, externalDir,
                    activity.getView(), activity, meta, width, height);
        }

        @Override
        public void onDrawFrame(GL10 gl) {
            if (shutdown) {
                SystemClock.sleep(10);
                return;
            }
            rendering = true;
            boolean ok = GameJni.render();
            rendering = false;
            if (!ok || shutdown) {
                stopGame();
            }
        }

        // -- Lifecycle helpers --

        public void handlePause() {
            Log.d(TAG, "handlePause: GameJni.pause()");
            if (!GameJni.pause()) {
                stopGame();
            }
        }

        public void handleResume() {
            Log.d(TAG, "handleResume: GameJni.resume()");
            GameJni.resume();
        }

        public void stopGame() {
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

        // -- Configuration --

        public void handleConfigurationChanged(Configuration config) {
            String code = config.locale.getLanguage() + "_" + config.locale.getCountry();
            Log.d(TAG, "onConfigurationChanged(): GameJni.onConfigurationChanged() touchscreen="
                    + config.touchscreen + " keyboard=" + config.keyboard + " code=" + code);
            GameJni.onConfigurationChanged(config.touchscreen, config.keyboard, code);
        }

        // -- Key input --
        // Source is always hardcoded to 0x401 (SOURCE_GAMEPAD) as in original smali.

        public void handleKeyDown(int keyCode, KeyEvent event) {
            long time    = event.getEventTime();
            int  devId   = event.getDeviceId();
            int  mapped  = mapGameKeyCode(keyCode);
            int  keyChar = event.getUnicodeChar();
            int  repeat  = event.getRepeatCount();
            Log.d(TAG, "handleKeyDown: GameJni.queueKeyEvent() i=1 time=" + time
                    + " devid=" + devId + " source=1025 keyCode=" + mapped
                    + " keychar=" + keyChar + " repeatCount=" + repeat);
            GameJni.queueKeyEvent(1, time, devId, 0x401, mapped, keyChar, repeat);
        }

        public void handleKeyUp(int keyCode, KeyEvent event) {
            long time    = event.getEventTime();
            int  devId   = event.getDeviceId();
            int  mapped  = mapGameKeyCode(keyCode);
            int  keyChar = event.getUnicodeChar();
            int  repeat  = event.getRepeatCount();
            Log.d(TAG, "handleKeyDown: GameJni.queueKeyEvent() i=0 time=" + time
                    + " devid=" + devId + " source=1025 keyCode=" + mapped
                    + " keychar=" + keyChar + " repeatCount=" + repeat);
            GameJni.queueKeyEvent(0, time, devId, 0x401, mapped, keyChar, repeat);
        }

        // -- Touch (pointer) input --

        public void handleTouch(MotionEvent event) {
            int action = event.getAction() & 0xFF;

            // Filter: only these actions are forwarded (matches smali if-eq chain)
            if (action != MotionEvent.ACTION_DOWN
                    && action != MotionEvent.ACTION_UP
                    && action != MotionEvent.ACTION_MOVE
                    && action != MotionEvent.ACTION_CANCEL
                    && action != MotionEvent.ACTION_POINTER_UP
                    && action != MotionEvent.ACTION_POINTER_DOWN) {
                return;
            }

            int source      = event.getSource();
            int deviceId    = event.getDeviceId();
            int historySize = event.getHistorySize();
            int ptrCount    = event.getPointerCount();

            // Historical samples
            for (int h = 0; h < historySize; h++) {
                long time = event.getHistoricalEventTime(h);
                for (int p = 0; p < ptrCount; p++) {
                    int   id       = event.getPointerId(p);
                    float x        = event.getHistoricalX(p, h);
                    float y        = event.getHistoricalY(p, h);
                    float pressure = event.getHistoricalPressure(p, h);
                    int   more     = (p < ptrCount - 1) ? 1 : 0;
                    Log.d(TAG, "handleTouch:  GameJni.queuePointerEvent() id=" + id
                            + " action=" + action + " time=" + time
                            + " devid=" + deviceId + " source=" + source
                            + " x=" + x + " y=" + y + " pressure=" + pressure);
                    GameJni.queuePointerEvent(id, action, time, more, deviceId, source, x, y, pressure);
                }
            }

            // Current sample — active pointer index from high byte of action
            long curTime       = event.getEventTime();
            int  activePointer = (event.getAction() & MotionEvent.ACTION_POINTER_INDEX_MASK)
                    >> MotionEvent.ACTION_POINTER_INDEX_SHIFT;

            for (int p = 0; p < ptrCount; p++) {
                int   id       = event.getPointerId(p);
                float x        = event.getX(p);
                float y        = event.getY(p);
                float pressure = event.getPressure(p);
                int   more     = (p < ptrCount - 1) ? 1 : 0;
                if (activePointer == p) {
                    more |= 2;
                }
                Log.d(TAG, "handleTouch:  GameJni.queuePointerEvent() id2=" + id
                        + " action=" + action + " time2=" + curTime
                        + " devid=" + deviceId + " source=" + source
                        + " x2=" + x + " y2=" + y + " pressure2=" + pressure);
                GameJni.queuePointerEvent(id, action, curTime, more, deviceId, source, x, y, pressure);
            }
        }

        // -- Mouse hover / scroll (pointer motion event from generic) --

        private void handlePointerMotionEvent(MotionEvent event) {
            int source   = event.getSource();
            int action   = event.getAction() & 0xFF;
            int deviceId = event.getDeviceId();
            int historySize = event.getHistorySize();
            int ptrCount    = event.getPointerCount();

            // Historical samples
            for (int h = 0; h < historySize; h++) {
                long time = event.getHistoricalEventTime(h);
                for (int p = 0; p < ptrCount; p++) {
                    int   id       = event.getPointerId(p);
                    float x        = event.getHistoricalX(p, h);
                    float y        = event.getHistoricalY(p, h);
                    float pressure = event.getHistoricalPressure(p, h);
                    int   more     = (p < ptrCount - 1) ? 1 : 0;
                    GameJni.queuePointerEvent(id, action, time, more, deviceId, source, x, y, pressure);
                }
            }

            // Current sample
            long curTime       = event.getEventTime();
            int  activePointer = (event.getAction() & MotionEvent.ACTION_POINTER_INDEX_MASK)
                    >> MotionEvent.ACTION_POINTER_INDEX_SHIFT;

            for (int p = 0; p < ptrCount; p++) {
                int   id       = event.getPointerId(p);
                float x        = event.getX(p);
                float y        = event.getY(p);
                float pressure = event.getPressure(p);
                int   more     = (p < ptrCount - 1) ? 1 : 0;
                if (activePointer == p) {
                    more |= 2;
                }
                GameJni.queuePointerEvent(id, action, curTime, more, deviceId, source, x, y, pressure);
            }
            // Recycle is handled by the caller (onGenericMotionEvent lambda)
        }

        // -- Joystick axis events --

        public void handleJoyStickMotionEvent(MotionEvent event) {
            int  deviceId    = event.getDeviceId();
            int  historySize = event.getHistorySize();
            InputDevice dev  = event.getDevice();
            if (dev == null) return;

            java.util.List<InputDevice.MotionRange> ranges = dev.getMotionRanges();

            // Historical samples
            for (int h = 0; h < historySize; h++) {
                long time = event.getHistoricalEventTime(h);
                for (InputDevice.MotionRange range : ranges) {
                    if ((range.getSource() & 0x10) == 0) continue; // not joystick class
                    int   axis  = range.getAxis();
                    float value = event.getHistoricalAxisValue(axis, h);
                    // Smali swaps axes 0xB↔0xE
                    int mappedAxis = (axis == 0xE) ? 0xB : (axis == 0xB) ? 0xE : axis;
                    Log.d(TAG, "handleJoyStickMotionEvent:  GameJni.queueAxisMovedEvent() devid="
                            + deviceId + " source=1025 time=" + time
                            + " axis=" + mappedAxis + " value=" + value);
                    GameJni.queueAxisMovedEvent(deviceId, 0x401, time, mappedAxis, value);
                }
            }

            // Current sample
            long curTime = event.getEventTime();
            for (InputDevice.MotionRange range : ranges) {
                if ((range.getSource() & 0x10) == 0) continue;
                int   axis  = range.getAxis();
                float value = event.getAxisValue(axis);
                int mappedAxis = (axis == 0xE) ? 0xB : (axis == 0xB) ? 0xE : axis;
                Log.d(TAG, "handleJoyStickMotionEvent:  GameJni.queueAxisMovedEvent() devid="
                        + deviceId + " source=1025 time2=" + curTime
                        + " axis2=" + mappedAxis + " value2=" + value);
                GameJni.queueAxisMovedEvent(deviceId, 0x401, curTime, mappedAxis, value);
            }
        }

        // -- Generic motion dispatcher (mirrors handleGenericMotionEvent in smali) --

        public void handleGenericMotionEvent(MotionEvent event) {
            int source = event.getSource();
            int action = event.getAction() & 0xFF;

            if ((source & InputDevice.SOURCE_CLASS_JOYSTICK) != 0) {
                // Joystick: only MOVE (action=2)
                if (action == MotionEvent.ACTION_MOVE) {
                    handleJoyStickMotionEvent(event);
                }
            } else if ((source & InputDevice.SOURCE_CLASS_POINTER) != 0) {
                // Pointer (mouse): only HOVER_MOVE (action=7)
                if (action == 7 /* ACTION_HOVER_MOVE */) {
                    handlePointerMotionEvent(event);
                }
            }
            // Recycle is handled by the caller (onGenericMotionEvent lambda)
        }

        // -- Text input --

        public void handleTextInput(String text) {
            Log.d(TAG, "handleTextInput: GameJni.textInput() text=" + text);
            GameJni.textInput(text);
        }
    }

    // -----------------------------------------------------------------------
    // Inner class: ContextFactory  (mirrors GameView$ContextFactory.smali)
    // -----------------------------------------------------------------------
    static class ContextFactory implements GLSurfaceView.EGLContextFactory {
        private static final int EGL_CONTEXT_CLIENT_VERSION = 0x3098;

        @Override
        public EGLContext createContext(EGL10 egl, EGLDisplay display, EGLConfig eglConfig) {
            Log.w("GameView", "creating OpenGL ES 1.0 context");
            GameView.checkEglError("Before eglCreateContext", egl);
            int[] attribList = {EGL_CONTEXT_CLIENT_VERSION, 1, EGL10.EGL_NONE};
            EGLContext context = egl.eglCreateContext(display, eglConfig, EGL10.EGL_NO_CONTEXT, attribList);
            GameView.checkEglError("After eglCreateContext", egl);
            return context;
        }

        @Override
        public void destroyContext(EGL10 egl, EGLDisplay display, EGLContext context) {
            egl.eglDestroyContext(display, context);
        }
    }

    // -----------------------------------------------------------------------
    // Inner class: ConfigChooser  (mirrors GameView$ConfigChooser.smali)
    // -----------------------------------------------------------------------
    static class ConfigChooser implements GLSurfaceView.EGLConfigChooser {
        private static final int[] CONFIG_ATTRIBS = {
            EGL10.EGL_RED_SIZE,   4,
            EGL10.EGL_GREEN_SIZE, 4,
            EGL10.EGL_BLUE_SIZE,  4,
            EGL10.EGL_NONE
        };

        protected final int mRedSize, mGreenSize, mBlueSize, mAlphaSize, mDepthSize, mStencilSize;
        private final int[] mValue = new int[1];

        ConfigChooser(int r, int g, int b, int a, int depth, int stencil) {
            mRedSize     = r;
            mGreenSize   = g;
            mBlueSize    = b;
            mAlphaSize   = a;
            mDepthSize   = depth;
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

        private EGLConfig chooseConfig(EGL10 egl, EGLDisplay display, EGLConfig[] configs) {
            for (EGLConfig config : configs) {
                int d = findConfigAttrib(egl, display, config, EGL10.EGL_DEPTH_SIZE,   0);
                int s = findConfigAttrib(egl, display, config, EGL10.EGL_STENCIL_SIZE, 0);
                if (d < mDepthSize || s < mStencilSize) continue;
                int r = findConfigAttrib(egl, display, config, EGL10.EGL_RED_SIZE,   0);
                int g = findConfigAttrib(egl, display, config, EGL10.EGL_GREEN_SIZE,  0);
                int b = findConfigAttrib(egl, display, config, EGL10.EGL_BLUE_SIZE,   0);
                int a = findConfigAttrib(egl, display, config, EGL10.EGL_ALPHA_SIZE,  0);
                if (r == mRedSize && g == mGreenSize && b == mBlueSize && a == mAlphaSize) {
                    return config;
                }
            }
            return null;
        }

        private int findConfigAttrib(EGL10 egl, EGLDisplay display, EGLConfig config,
                int attribute, int defaultValue) {
            if (egl.eglGetConfigAttrib(display, config, attribute, mValue)) {
                return mValue[0];
            }
            return defaultValue;
        }
    }

    // -----------------------------------------------------------------------
    // Constructors
    // -----------------------------------------------------------------------

    /** Default constructor (original single-arg smali constructor). */
    public GameView(Context context, GameActivity activity) {
        super(context);
        this.mTextInputWidget = null;
        this.mTextInputDialog = null;
        this.mHandler         = buildHandler();
        this.gameActivity     = activity;

        // Original smali: rgba8888=true, depth=16, detect emulator via Build.MODEL
        boolean notEmulator = !android.os.Build.MODEL.equals("google_sdk");
        init(context, true, 16, notEmulator ? 1 : 0);

        setFocusable(true);
        setFocusableInTouchMode(true);

        android.content.SharedPreferences prefs = context.getSharedPreferences("data", 0);
        this.shiLiuBiJiu = prefs.getBoolean("shiLiuBiJiu", true);
        this.widthAs     = prefs.getInt("width",  16);
        this.heightAs    = prefs.getInt("height",  9);
    }

    /** Extended constructor. */
    public GameView(Context context, GameActivity activity, boolean rgba8888, int depth, int stencil) {
        super(context);
        this.mTextInputWidget = null;
        this.mTextInputDialog = null;
        this.mHandler         = buildHandler();
        this.gameActivity     = activity;

        init(context, rgba8888, depth, stencil);

        setFocusable(true);
        setFocusableInTouchMode(true);

        android.content.SharedPreferences prefs = context.getSharedPreferences("data", 0);
        this.shiLiuBiJiu = prefs.getBoolean("shiLiuBiJiu", true);
        this.widthAs     = prefs.getInt("width",  16);
        this.heightAs    = prefs.getInt("height",  9);
    }

    // -----------------------------------------------------------------------
    // Init
    // -----------------------------------------------------------------------

    private void init(Context context, boolean rgba8888, int depth, int stencil) {
        if (rgba8888) {
            getHolder().setFormat(-3); // PixelFormat.RGBA_8888
        } else {
            getHolder().setFormat(4);  // PixelFormat.RGB_565
        }
        setEGLContextFactory(new ContextFactory());
        if (rgba8888) {
            setEGLConfigChooser(new ConfigChooser(8, 8, 8, 8, depth, stencil));
        } else {
            setEGLConfigChooser(new ConfigChooser(5, 6, 5, 0, depth, stencil));
        }
        renderer = new Renderer(context, gameActivity);
        setRenderer(renderer);
        this.mTextInputWidget = new EditText(gameActivity);
    }

    // -----------------------------------------------------------------------
    // Aspect ratio (onMeasure mirrors smali)
    // -----------------------------------------------------------------------

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (shiLiuBiJiu) {
            int w = android.view.View.MeasureSpec.getSize(widthMeasureSpec);
            int h = android.view.View.MeasureSpec.getSize(heightMeasureSpec);
            float targetRatio = (float) widthAs / heightAs;
            float actualRatio = (float) w / h;
            if (actualRatio > targetRatio) {
                w = (int) (h * targetRatio);
            } else {
                h = (int) (w / targetRatio);
            }
            widthMeasureSpec  = android.view.View.MeasureSpec.makeMeasureSpec(w, android.view.View.MeasureSpec.EXACTLY);
            heightMeasureSpec = android.view.View.MeasureSpec.makeMeasureSpec(h, android.view.View.MeasureSpec.EXACTLY);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    // -----------------------------------------------------------------------
    // Lifecycle
    // -----------------------------------------------------------------------

    @Override
    public void onPause() {
        super.onPause();
        Log.d(TAG, "onPause: ");
        queueEvent(() -> renderer.handlePause());
    }

    @Override
    public void onResume() {
        super.onResume();
        Log.d(TAG, "onResume: ");
        queueEvent(() -> renderer.handleResume());
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        Log.d(TAG, "onWindowFocusChanged() GameJni.windowFocusChanged() " + hasWindowFocus);
        // NOTE: Do NOT call super.onWindowFocusChanged() here.
        // The original smali calls invoke-super to com.trans.GLSurfaceView (PopCap's custom
        // class that extends SurfaceView directly with no onWindowFocusChanged override).
        // android.opengl.GLSurfaceView.onWindowFocusChanged() internally pauses/resumes the
        // GLThread, which causes a deadlock: the native engine queues events during a scene
        // transition (e.g. Minigames menu), but the GLThread is paused waiting for focus to
        // return, so those events never execute and the game freezes.
        GameJni.windowFocusChanged(hasWindowFocus);
    }

    public void onConfigurationChanged(Configuration config) {
        // Make a copy and dispatch to GL thread, as in smali
        final Configuration copy = new Configuration(config);
        queueEvent(() -> renderer.handleConfigurationChanged(copy));
    }

    public void stopGame() {
        Log.d(TAG, "stopGame: ");
        queueEvent(() -> renderer.stopGame());
    }

    // -----------------------------------------------------------------------
    // Key input — onKeyDown / onKeyUp (NOT dispatchKeyEvent, as in original)
    // The smali does NOT call filterKeyEvent here; it queues directly.
    // -----------------------------------------------------------------------

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // Block volume keys (smali: if keyCode==24 or 25, return false)
        if (keyCode == KeyEvent.KEYCODE_VOLUME_UP || keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
            return false;
        }
        final KeyEvent copy   = new KeyEvent(event);
        final int      fCode  = keyCode;
        queueEvent(() -> renderer.handleKeyDown(fCode, copy));
        return true;
    }

    @Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        final KeyEvent copy  = new KeyEvent(event);
        final int      fCode = keyCode;
        queueEvent(() -> renderer.handleKeyUp(fCode, copy));
        return true;
    }

    // -----------------------------------------------------------------------
    // Touch input (mirrors onTouchEvent smali: obtain then queue handleTouch)
    // -----------------------------------------------------------------------

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        MotionEvent copy = MotionEvent.obtain(event);
        queueEvent(() -> renderer.handleTouch(copy));
        return true;
    }

    // -----------------------------------------------------------------------
    // Generic motion (mirrors onGenericMotionEvent smali: obtain then queue)
    // -----------------------------------------------------------------------

    @Override
    public boolean onGenericMotionEvent(MotionEvent event) {
        final MotionEvent copy = MotionEvent.obtain(event);
        queueEvent(() -> {
            renderer.handleGenericMotionEvent(copy);
            copy.recycle();
        });
        return true;
    }

    // -----------------------------------------------------------------------
    // Text input (queued to GL thread as in smali lambda$textInput)
    // -----------------------------------------------------------------------

    public void textInput(String text) {
        final String t = text;
        queueEvent(() -> renderer.handleTextInput(t));
    }

    // -----------------------------------------------------------------------
    // Keyboard UI
    // -----------------------------------------------------------------------

    public void hideKeyboard() {
        mHandler.sendMessage(mHandler.obtainMessage(HIDE_KEYBOARD));
    }

    public void _hideKeyboard(boolean cancel) {
        if (mTextInputDialog != null) {
            AlertDialog dlg = mTextInputDialog;
            mTextInputDialog  = null;
            mTextInputWidget  = null;
            if (cancel) {
                dlg.cancel();
            } else {
                dlg.dismiss();
            }
        }
    }

    public void _show(boolean show) {
        Log.w(TAG, "_show(" + show + ") called! This changes GameView visibility.");
        setVisibility(show ? VISIBLE : INVISIBLE);
    }

    public void show(boolean show) {
        mHandler.sendMessage(mHandler.obtainMessage(show ? SHOW_GAME : HIDE_GAME));
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
            case KEYBOARD_PASSWORD: inputType = 0x81; break;
            case KEYBOARD_URL:      inputType = 0x11; break;
            case KEYBOARD_EMAIL:    inputType = 0x21; break;
            case KEYBOARD_USERNAME: inputType = 0x91; break;
            default:                inputType = 0x1;  break;
        }
        mTextInputWidget.setInputType(inputType);

        if (keyboardType == KEYBOARD_PASSWORD) {
            mTextInputWidget.setTransformationMethod(PasswordTransformationMethod.getInstance());
        }

        // For USERNAME and PASSWORD: apply ASCII-only filter (mirrors lambda$_showKeyboard$2)
        if (keyboardType == KEYBOARD_USERNAME || keyboardType == KEYBOARD_PASSWORD) {
            mTextInputWidget.setFilters(new InputFilter[]{
                (source, start, end, dest, dstart, dend) -> {
                    for (int i = start; i < end; i++) {
                        char c = source.charAt(i);
                        if (!Character.isLetterOrDigit(c) || c > 0x7F) {
                            return "";
                        }
                    }
                    return null;
                }
            });
        }

        mTextInputWidget.setHint(hint);
        mTextInputWidget.setText(content);

        final EditText widget = mTextInputWidget;
        mTextInputDialog = new AlertDialog.Builder(gameActivity)
                .setTitle(title)
                .setView(widget)
                .setPositiveButton("\u786e\u5b9a", (d, w) -> textInput(widget.getText().toString()))
                .setNegativeButton("\u8fd4\u56de", (d, w) -> { textInput(null); _hideKeyboard(false); })
                .setOnCancelListener(d -> { textInput(null); _hideKeyboard(true); })
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

    // -----------------------------------------------------------------------
    // JNI-called methods (mirrors GLSurfaceView super calls)
    // -----------------------------------------------------------------------

    /** JNI: AGViewSwapBuffers */
    public void swapBuffers() {
        super.swapBuffers();
    }

    /** JNI: AGViewUpdate — calls GLSurfaceView.handleEvents() */
    public void update() {
        super.handleEvents();
    }

    // -----------------------------------------------------------------------
    // EGL helpers
    // -----------------------------------------------------------------------

    public static void checkEglError(String op, EGL10 egl) {
        int error;
        while ((error = egl.eglGetError()) != EGL10.EGL_SUCCESS) {
            Log.e(TAG, String.format("%s: EGL error: 0x%x", op, error));
        }
    }

    // -----------------------------------------------------------------------
    // Handler
    // -----------------------------------------------------------------------

    private Handler buildHandler() {
        return new Handler() {
            @Override
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case SHOW_KEYBOARD: {
                        Bundle data = msg.getData();
                        if (data != null) {
                            _showKeyboard(
                                    data.getInt("mode", KEYBOARD_NORMAL),
                                    data.getString("title", ""),
                                    data.getString("hint", ""),
                                    data.getString("initial", ""));
                        }
                        break;
                    }
                    case HIDE_KEYBOARD:
                        _hideKeyboard(true);
                        break;
                    case SHOW_GAME:
                        _show(true);
                        break;
                    case HIDE_GAME:
                        _show(false);
                        break;
                }
            }
        };
    }

    // -----------------------------------------------------------------------
    // Key code mapping — exact packed-switch from smali (base 0x60)
    //
    // packed-switch 0x60 (KEYCODE_BUTTON_A):
    //  0x60 BUTTON_A      → 0xBC (188)
    //  0x61 BUTTON_B      → 0xBD (189)
    //  0x62 BUTTON_C      → 0xBE (190)
    //  0x63 BUTTON_X      → 0xBF (191)
    //  0x64 BUTTON_Y      → 0xC0 (192)
    //  0x65 BUTTON_Z      → pass-through (pswitch_0)
    //  0x66 BUTTON_L1     → 0xC2 (194)
    //  0x67 BUTTON_R1     → 0xC3 (195)
    //  0x68 BUTTON_THUMBL → 0xC6 (198)
    //  0x69 BUTTON_THUMBR → 0xC6 (198)
    //  0x6A BUTTON_START  → 0xC6 (198)
    //  0x6B BUTTON_SELECT → 0xBE (190)   (pswitch_6)
    //  0x6C BUTTON_MODE   → 0xBE (190)   (pswitch_6)
    // -----------------------------------------------------------------------

    private static int mapGameKeyCode(int keyCode) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_BUTTON_A:      return 0xBC; // 188
            case KeyEvent.KEYCODE_BUTTON_B:      return 0xBD; // 189
            case KeyEvent.KEYCODE_BUTTON_C:      return 0xBE; // 190
            case KeyEvent.KEYCODE_BUTTON_X:      return 0xBF; // 191
            case KeyEvent.KEYCODE_BUTTON_Y:      return 0xC0; // 192
            // BUTTON_Z (0x65) → pass-through
            case KeyEvent.KEYCODE_BUTTON_L1:     return 0xC2; // 194
            case KeyEvent.KEYCODE_BUTTON_R1:     return 0xC3; // 195
            case KeyEvent.KEYCODE_BUTTON_THUMBL: return 0xC6; // 198
            case KeyEvent.KEYCODE_BUTTON_THUMBR: return 0xC6; // 198
            case KeyEvent.KEYCODE_BUTTON_START:  return 0xC6; // 198
            case KeyEvent.KEYCODE_BUTTON_SELECT: return 0xBE; // 190
            case KeyEvent.KEYCODE_BUTTON_MODE:   return 0xBE; // 190
            default:                              return keyCode;
        }
    }
}
