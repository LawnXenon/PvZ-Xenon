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
        javax.microedition.khronos.egl.EGL10 egl = (javax.microedition.khronos.egl.EGL10) javax.microedition.khronos.egl.EGLContext.getEGL();
        javax.microedition.khronos.egl.EGLDisplay display = egl.eglGetCurrentDisplay();
        javax.microedition.khronos.egl.EGLSurface surface = egl.eglGetCurrentSurface(javax.microedition.khronos.egl.EGL10.EGL_DRAW);
        if (display != javax.microedition.khronos.egl.EGL10.EGL_NO_DISPLAY && surface != javax.microedition.khronos.egl.EGL10.EGL_NO_SURFACE) {
            egl.eglSwapBuffers(display, surface);
        }
    }

    /** Called from native: AGViewPrepare */
    public void prepare() {
        // PopCap's custom GLThread had a prepare() method to check thread state.
        // With standard android.opengl.GLSurfaceView, this is a no-op.
    }

    private final java.util.ArrayList<Runnable> mEventQueue = new java.util.ArrayList<>();

    @Override
    public void queueEvent(Runnable r) {
        synchronized (this) {
            mEventQueue.add(r);
        }
        // Wake up the GLThread to ensure events are processed if it's sleeping.
        super.queueEvent(this::handleEvents);
    }

    /** Called from native via GameView.update() */
    public void handleEvents() {
        while (true) {
            Runnable r;
            synchronized (this) {
                if (mEventQueue.isEmpty()) return;
                r = mEventQueue.remove(0);
            }
            if (r != null) {
                r.run();
            }
        }
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
