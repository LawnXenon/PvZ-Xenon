package com.trans;

import android.content.Context;
import android.view.SurfaceView;

/**
 * GLSurfaceView — custom copy bundled in the original APK (com.trans package).
 * Reconstructed as a minimal stub from smali. The real implementation is in the
 * original libGameLauncher_orig.so; this class exists only to satisfy the Java
 * compiler for GameView which extends it.
 *
 * Interfaces defined as nested types to match the smali class references.
 */
public class GLSurfaceView extends SurfaceView {

    // ---- Nested interfaces used by GameView ----

    public interface Renderer {
        void onSurfaceCreated(javax.microedition.khronos.egl.EGL10 egl,
                              javax.microedition.khronos.egl.EGLDisplay display,
                              javax.microedition.khronos.egl.EGLConfig config);
        void onSurfaceChanged(javax.microedition.khronos.opengles.GL10 gl, int width, int height);
        void onDrawFrame(javax.microedition.khronos.opengles.GL10 gl);
    }

    public interface EGLConfigChooser {
        javax.microedition.khronos.egl.EGLConfig chooseConfig(
                javax.microedition.khronos.egl.EGL10 egl,
                javax.microedition.khronos.egl.EGLDisplay display);
    }

    public interface EGLContextFactory {
        javax.microedition.khronos.egl.EGLContext createContext(
                javax.microedition.khronos.egl.EGL10 egl,
                javax.microedition.khronos.egl.EGLDisplay display,
                javax.microedition.khronos.egl.EGLConfig eglConfig);
        void destroyContext(javax.microedition.khronos.egl.EGL10 egl,
                           javax.microedition.khronos.egl.EGLDisplay display,
                           javax.microedition.khronos.egl.EGLContext context);
    }

    public interface EGLWindowSurfaceFactory {
        javax.microedition.khronos.egl.EGLSurface createWindowSurface(
                javax.microedition.khronos.egl.EGL10 egl,
                javax.microedition.khronos.egl.EGLDisplay display,
                javax.microedition.khronos.egl.EGLConfig config,
                Object nativeWindow);
        void destroySurface(javax.microedition.khronos.egl.EGL10 egl,
                            javax.microedition.khronos.egl.EGLDisplay display,
                            javax.microedition.khronos.egl.EGLSurface surface);
    }

    public interface GLWrapper {
        javax.microedition.khronos.opengles.GL wrap(javax.microedition.khronos.opengles.GL gl);
    }

    // ---- Constructors ----

    public GLSurfaceView(Context context) {
        super(context);
    }

    // ---- Stub methods called by GameView ----

    public android.view.SurfaceHolder getHolder() {
        return super.getHolder();
    }

    public void setEGLContextFactory(EGLContextFactory factory) {}
    public void setEGLConfigChooser(EGLConfigChooser chooser) {}
    public void setRenderer(Renderer renderer) {}
    public void setFocusable(boolean focusable) { super.setFocusable(focusable); }
    public void setFocusableInTouchMode(boolean focusableInTouchMode) {
        super.setFocusableInTouchMode(focusableInTouchMode);
    }
    public void setVisibility(int visibility) { super.setVisibility(visibility); }
}
