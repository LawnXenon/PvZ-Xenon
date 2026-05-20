package com.trans;

import android.content.Context;
import android.util.AttributeSet;

/**
 * Compatibility layer for the original {@code com.trans.GLSurfaceView}.
 * Built on the platform {@link android.opengl.GLSurfaceView}; adds JNI-required APIs.
 */
public class GLSurfaceView extends android.opengl.GLSurfaceView {

    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;

    /** 0 = manual swap, 1 = automatic (matches original GLThread). */
    public static final int SWAPMODE_MANUAL = 0;
    public static final int SWAPMODE_AUTOMATIC = 1;

    private int swapMode = SWAPMODE_AUTOMATIC;
    private int debugFlags;

    public GLSurfaceView(Context context) {
        super(context);
    }

    public GLSurfaceView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    /** Called from native: AGViewSetSwapMode / viewSetSwapMode */
    public void setSwapMode(int mode) {
        if (mode < SWAPMODE_MANUAL || mode > SWAPMODE_AUTOMATIC) {
            throw new IllegalArgumentException("Invalid swap mode");
        }
        swapMode = mode;
        setRenderMode(mode == SWAPMODE_AUTOMATIC
                ? RENDERMODE_CONTINUOUSLY
                : RENDERMODE_WHEN_DIRTY);
    }

    public int getSwapMode() {
        return swapMode;
    }

    /** Called from native: AGViewSwapBuffers */
    public void swapBuffers() {
        requestRender();
    }

    /** Called from native: AGViewPrepare */
    public void prepare() {
        onResume();
    }

    /** Called from native via GameView.update() */
    public void handleEvents() {
        // Original GLThread event pump — no-op on platform GLSurfaceView
    }

    public void update() {
        handleEvents();
        requestRender();
    }

    public void setDebugFlags(int flags) {
        debugFlags = flags;
    }

    public int getDebugFlags() {
        return debugFlags;
    }

    @Override
    public void setRenderMode(int mode) {
        super.setRenderMode(mode);
    }

    @Override
    public int getRenderMode() {
        return super.getRenderMode();
    }
}
