package com.trans;

import android.app.AlertDialog;
import android.content.Context;
import android.hardware.Sensor;
import android.os.Handler;
import android.os.Message;
import android.text.InputFilter;
import android.text.method.PasswordTransformationMethod;
import android.view.KeyEvent;
import android.widget.EditText;

/**
 * GameView — reconstructed from smali decompilation.
 * Extends the custom com.trans.GLSurfaceView and acts as the main OpenGL surface.
 * Receives input/keyboard/sensor events and forwards them to native via GameJni.
 */
public class GameView extends GLSurfaceView {

    private static final boolean DEBUG = false;
    private static final String TAG = "GameView";

    // Handler message IDs
    protected static final int SHOW_KEYBOARD  = 0x101;
    protected static final int HIDE_KEYBOARD  = 0x102;
    protected static final int SHOW_GAME      = 0x103;
    protected static final int HIDE_GAME      = 0x104;

    // Keyboard types
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

    // Renderer / config chooser inner stubs (matching smali inner class names)
    static class Renderer implements GLSurfaceView.Renderer {
        Renderer(Context ctx, GameActivity activity) {}
        @Override public void onSurfaceCreated(javax.microedition.khronos.egl.EGL10 egl,
                javax.microedition.khronos.egl.EGLDisplay d,
                javax.microedition.khronos.egl.EGLConfig cfg) {}
        @Override public void onSurfaceChanged(javax.microedition.khronos.opengles.GL10 gl, int w, int h) {}
        @Override public void onDrawFrame(javax.microedition.khronos.opengles.GL10 gl) {}
    }

    static class ConfigChooser implements GLSurfaceView.EGLConfigChooser {
        ConfigChooser(int r, int g, int b, int a, int depth, int stencil) {}
        @Override public javax.microedition.khronos.egl.EGLConfig chooseConfig(
                javax.microedition.khronos.egl.EGL10 egl,
                javax.microedition.khronos.egl.EGLDisplay display) { return null; }
    }

    static class ContextFactory implements GLSurfaceView.EGLContextFactory {
        ContextFactory() {}
        @Override public javax.microedition.khronos.egl.EGLContext createContext(
                javax.microedition.khronos.egl.EGL10 egl,
                javax.microedition.khronos.egl.EGLDisplay display,
                javax.microedition.khronos.egl.EGLConfig eglConfig) { return null; }
        @Override public void destroyContext(javax.microedition.khronos.egl.EGL10 egl,
                javax.microedition.khronos.egl.EGLDisplay display,
                javax.microedition.khronos.egl.EGLContext context) {}
    }

    // ---- Constructors ----

    public GameView(Context context, GameActivity activity) {
        super(context);
        this.mTextInputWidget = null;
        this.mTextInputDialog = null;
        this.gameActivity = activity;
        this.mHandler = new Handler() {
            @Override
            public void handleMessage(Message msg) {
                // handled by original .so via JNI proxy
            }
        };
        android.content.SharedPreferences prefs = context.getSharedPreferences("data", 0);
        this.shiLiuBiJiu = prefs.getBoolean("shiLiuBiJiu", true);
        this.widthAs  = prefs.getInt("width", 16);
        this.heightAs = prefs.getInt("height", 9);

        init(context, true, 16, 0);
        setFocusable(true);
        setFocusableInTouchMode(true);
    }

    public GameView(Context context, GameActivity activity, boolean rgba8888, int depth, int stencil) {
        super(context);
        this.mTextInputWidget = null;
        this.mTextInputDialog = null;
        this.gameActivity = activity;
        this.mHandler = new Handler() {
            @Override
            public void handleMessage(Message msg) {}
        };
        android.content.SharedPreferences prefs = context.getSharedPreferences("data", 0);
        this.shiLiuBiJiu = prefs.getBoolean("shiLiuBiJiu", true);
        this.widthAs  = prefs.getInt("width", 16);
        this.heightAs = prefs.getInt("height", 9);

        init(context, rgba8888, depth, stencil);
        setFocusable(true);
        setFocusableInTouchMode(true);
    }

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
        Renderer renderer = new Renderer(context, gameActivity);
        setRenderer(renderer);
        this.mTextInputWidget = new EditText(context);
    }

    // ---- Public methods called from GameActivity / JNI ----

    public void hideKeyboard() {
        mHandler.sendMessage(mHandler.obtainMessage(HIDE_KEYBOARD));
    }

    public void _hideKeyboard(boolean cancel) {
        if (mTextInputDialog != null) {
            mTextInputWidget = null;
            mTextInputDialog = null;
            if (cancel) {
                // dialog cancel
            }
        }
    }

    public void _show(boolean show) {
        setVisibility(show ? 0 : 4);
    }

    public void _showKeyboard(int keyboardType, String title, String hint, String content) {
        if (mTextInputDialog != null) {
            if (mTextInputWidget != null) mTextInputWidget.setHint(hint);
            if (mTextInputWidget != null) mTextInputWidget.setText(content);
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
        mTextInputWidget.setHint(hint);
        mTextInputWidget.setText(content);

        AlertDialog.Builder builder = new AlertDialog.Builder(gameActivity)
                .setTitle(title)
                .setView(mTextInputWidget)
                .setPositiveButton("\u786e\u5b9a", (dialog, which) -> textInput(mTextInputWidget.getText().toString()))
                .setNegativeButton("\u8fd4\u56de", (dialog, which) -> textInput(null))
                .setOnCancelListener(dialog -> textInput(null));
        mTextInputDialog = builder.create();
        mTextInputDialog.show();
    }

    public void textInput(String text) {
        GameJni.textInput(text != null ? text : "");
    }

    // ---- Static utility ----

    public static void checkEglError(String op, javax.microedition.khronos.egl.EGL10 egl) {
        int error;
        while ((error = egl.eglGetError()) != javax.microedition.khronos.egl.EGL10.EGL_SUCCESS) {
            android.util.Log.e(TAG, String.format("%s: EGL error: 0x%x", op, error));
        }
    }
}
