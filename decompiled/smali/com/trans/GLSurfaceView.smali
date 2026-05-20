.class public Lcom/trans/GLSurfaceView;
.super Landroid/view/SurfaceView;
.source "GLSurfaceView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trans/GLSurfaceView$BaseConfigChooser;,
        Lcom/trans/GLSurfaceView$ComponentSizeChooser;,
        Lcom/trans/GLSurfaceView$DefaultContextFactory;,
        Lcom/trans/GLSurfaceView$DefaultWindowSurfaceFactory;,
        Lcom/trans/GLSurfaceView$EGLConfigChooser;,
        Lcom/trans/GLSurfaceView$EGLContextFactory;,
        Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;,
        Lcom/trans/GLSurfaceView$EglHelper;,
        Lcom/trans/GLSurfaceView$GLThread;,
        Lcom/trans/GLSurfaceView$GLThreadManager;,
        Lcom/trans/GLSurfaceView$GLWrapper;,
        Lcom/trans/GLSurfaceView$LogWriter;,
        Lcom/trans/GLSurfaceView$Renderer;,
        Lcom/trans/GLSurfaceView$SimpleEGLConfigChooser;
    }
.end annotation


# static fields
.field public static final DEBUG_CHECK_GL_ERROR:I = 0x1

.field public static final DEBUG_LOG_GL_CALLS:I = 0x2

.field private static final DRAW_TWICE_AFTER_SIZE_CHANGED:Z = true

.field private static final LOG_ATTACH_DETACH:Z = false

.field private static final LOG_EGL:Z = false

.field private static final LOG_PAUSE_RESUME:Z = false

.field private static final LOG_RENDERER:Z = false

.field private static final LOG_RENDERER_DRAW_FRAME:Z = false

.field private static final LOG_SURFACE:Z = false

.field private static final LOG_THREADS:Z = false

.field public static final RENDERMODE_CONTINUOUSLY:I = 0x1

.field public static final RENDERMODE_WHEN_DIRTY:I = 0x0

.field public static final SWAPMODE_AUTOMATICALLY:I = 0x0

.field public static final SWAPMODE_MANUALLY:I = 0x1

.field private static final TAG:Ljava/lang/String; = "GLSurfaceView"

.field private static final sGLThreadManager:Lcom/trans/GLSurfaceView$GLThreadManager;


# instance fields
.field private mDebugFlags:I

.field private mDetached:Z

.field private mEGLConfigChooser:Lcom/trans/GLSurfaceView$EGLConfigChooser;

.field private mEGLContextClientVersion:I

.field private mEGLContextFactory:Lcom/trans/GLSurfaceView$EGLContextFactory;

.field private mEGLWindowSurfaceFactory:Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;

.field private mGLThread:Lcom/trans/GLSurfaceView$GLThread;

.field private mGLWrapper:Lcom/trans/GLSurfaceView$GLWrapper;

.field private mRenderer:Lcom/trans/GLSurfaceView$Renderer;

.field private mSizeChanged:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1868
    new-instance v0, Lcom/trans/GLSurfaceView$GLThreadManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trans/GLSurfaceView$GLThreadManager;-><init>(Lcom/trans/GLSurfaceView$1;)V

    sput-object v0, Lcom/trans/GLSurfaceView;->sGLThreadManager:Lcom/trans/GLSurfaceView$GLThreadManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 213
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 1869
    iput-boolean p1, p0, Lcom/trans/GLSurfaceView;->mSizeChanged:Z

    .line 214
    invoke-direct {p0}, Lcom/trans/GLSurfaceView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 222
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 1869
    iput-boolean p1, p0, Lcom/trans/GLSurfaceView;->mSizeChanged:Z

    .line 223
    invoke-direct {p0}, Lcom/trans/GLSurfaceView;->init()V

    return-void
.end method

.method static synthetic access$1000(Lcom/trans/GLSurfaceView;)Z
    .locals 0

    .line 157
    iget-boolean p0, p0, Lcom/trans/GLSurfaceView;->mSizeChanged:Z

    return p0
.end method

.method static synthetic access$1002(Lcom/trans/GLSurfaceView;Z)Z
    .locals 0

    .line 157
    iput-boolean p1, p0, Lcom/trans/GLSurfaceView;->mSizeChanged:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/trans/GLSurfaceView;)Lcom/trans/GLSurfaceView$GLThread;
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    return-object p0
.end method

.method static synthetic access$300(Lcom/trans/GLSurfaceView;)I
    .locals 0

    .line 157
    iget p0, p0, Lcom/trans/GLSurfaceView;->mEGLContextClientVersion:I

    return p0
.end method

.method static synthetic access$400(Lcom/trans/GLSurfaceView;)Lcom/trans/GLSurfaceView$EGLConfigChooser;
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/trans/GLSurfaceView;->mEGLConfigChooser:Lcom/trans/GLSurfaceView$EGLConfigChooser;

    return-object p0
.end method

.method static synthetic access$500(Lcom/trans/GLSurfaceView;)Lcom/trans/GLSurfaceView$EGLContextFactory;
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/trans/GLSurfaceView;->mEGLContextFactory:Lcom/trans/GLSurfaceView$EGLContextFactory;

    return-object p0
.end method

.method static synthetic access$600(Lcom/trans/GLSurfaceView;)Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/trans/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;

    return-object p0
.end method

.method static synthetic access$700(Lcom/trans/GLSurfaceView;)Lcom/trans/GLSurfaceView$GLWrapper;
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/trans/GLSurfaceView;->mGLWrapper:Lcom/trans/GLSurfaceView$GLWrapper;

    return-object p0
.end method

.method static synthetic access$800(Lcom/trans/GLSurfaceView;)I
    .locals 0

    .line 157
    iget p0, p0, Lcom/trans/GLSurfaceView;->mDebugFlags:I

    return p0
.end method

.method static synthetic access$900()Lcom/trans/GLSurfaceView$GLThreadManager;
    .locals 1

    .line 157
    sget-object v0, Lcom/trans/GLSurfaceView;->sGLThreadManager:Lcom/trans/GLSurfaceView$GLThreadManager;

    return-object v0
.end method

.method private checkRenderThreadState()V
    .locals 2

    .line 1763
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    if-nez v0, :cond_0

    return-void

    .line 1764
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setRenderer has already been called for this instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private init()V
    .locals 1

    .line 229
    invoke-virtual {p0}, Lcom/trans/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 230
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    return-void
.end method


# virtual methods
.method public getDebugFlags()I
    .locals 1

    .line 277
    iget v0, p0, Lcom/trans/GLSurfaceView;->mDebugFlags:I

    return v0
.end method

.method public getRenderMode()I
    .locals 1

    .line 464
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->getRenderMode()I

    move-result v0

    return v0
.end method

.method public getSwapMode()I
    .locals 1

    .line 472
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->getSwapMode()I

    move-result v0

    return v0
.end method

.method public handleEvents()V
    .locals 1

    .line 547
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->handleEvents()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 6

    .line 564
    invoke-super {p0}, Landroid/view/SurfaceView;->onAttachedToWindow()V

    .line 568
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView;->mDetached:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mRenderer:Lcom/trans/GLSurfaceView$Renderer;

    if-eqz v0, :cond_3

    .line 571
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 572
    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->getRenderMode()I

    move-result v0

    .line 573
    iget-object v3, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v3}, Lcom/trans/GLSurfaceView$GLThread;->getSwapMode()I

    move-result v3

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 576
    :goto_0
    new-instance v4, Lcom/trans/GLSurfaceView$GLThread;

    iget-object v5, p0, Lcom/trans/GLSurfaceView;->mRenderer:Lcom/trans/GLSurfaceView$Renderer;

    invoke-direct {v4, p0, v5}, Lcom/trans/GLSurfaceView$GLThread;-><init>(Lcom/trans/GLSurfaceView;Lcom/trans/GLSurfaceView$Renderer;)V

    iput-object v4, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    if-eq v0, v2, :cond_1

    .line 578
    invoke-virtual {v4, v0}, Lcom/trans/GLSurfaceView$GLThread;->setRenderMode(I)V

    :cond_1
    if-eqz v3, :cond_2

    .line 581
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0, v3}, Lcom/trans/GLSurfaceView$GLThread;->setSwapMode(I)V

    .line 583
    :cond_2
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->start()V

    .line 585
    :cond_3
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView;->mDetached:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 598
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    if-eqz v0, :cond_0

    .line 599
    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->requestExitAndWait()V

    :cond_0
    const/4 v0, 0x1

    .line 601
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView;->mDetached:Z

    .line 602
    invoke-super {p0}, Landroid/view/SurfaceView;->onDetachedFromWindow()V

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 518
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 529
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->onResume()V

    return-void
.end method

.method public prepare()V
    .locals 1

    .line 552
    :try_start_0
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-static {v0}, Lcom/trans/GLSurfaceView$GLThread;->access$200(Lcom/trans/GLSurfaceView$GLThread;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 554
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1

    .line 539
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1}, Lcom/trans/GLSurfaceView$GLThread;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public requestRender()V
    .locals 1

    .line 483
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->requestRender()V

    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0

    .line 269
    iput p1, p0, Lcom/trans/GLSurfaceView;->mDebugFlags:I

    return-void
.end method

.method public setEGLConfigChooser(IIIIII)V
    .locals 9

    .line 401
    new-instance v8, Lcom/trans/GLSurfaceView$ComponentSizeChooser;

    move-object v0, v8

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/trans/GLSurfaceView$ComponentSizeChooser;-><init>(Lcom/trans/GLSurfaceView;IIIIII)V

    invoke-virtual {p0, v8}, Lcom/trans/GLSurfaceView;->setEGLConfigChooser(Lcom/trans/GLSurfaceView$EGLConfigChooser;)V

    return-void
.end method

.method public setEGLConfigChooser(Lcom/trans/GLSurfaceView$EGLConfigChooser;)V
    .locals 0

    .line 364
    invoke-direct {p0}, Lcom/trans/GLSurfaceView;->checkRenderThreadState()V

    .line 365
    iput-object p1, p0, Lcom/trans/GLSurfaceView;->mEGLConfigChooser:Lcom/trans/GLSurfaceView$EGLConfigChooser;

    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1

    .line 383
    new-instance v0, Lcom/trans/GLSurfaceView$SimpleEGLConfigChooser;

    invoke-direct {v0, p0, p1}, Lcom/trans/GLSurfaceView$SimpleEGLConfigChooser;-><init>(Lcom/trans/GLSurfaceView;Z)V

    invoke-virtual {p0, v0}, Lcom/trans/GLSurfaceView;->setEGLConfigChooser(Lcom/trans/GLSurfaceView$EGLConfigChooser;)V

    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0

    .line 432
    invoke-direct {p0}, Lcom/trans/GLSurfaceView;->checkRenderThreadState()V

    .line 433
    iput p1, p0, Lcom/trans/GLSurfaceView;->mEGLContextClientVersion:I

    return-void
.end method

.method public setEGLContextFactory(Lcom/trans/GLSurfaceView$EGLContextFactory;)V
    .locals 0

    .line 333
    invoke-direct {p0}, Lcom/trans/GLSurfaceView;->checkRenderThreadState()V

    .line 334
    iput-object p1, p0, Lcom/trans/GLSurfaceView;->mEGLContextFactory:Lcom/trans/GLSurfaceView$EGLContextFactory;

    return-void
.end method

.method public setEGLWindowSurfaceFactory(Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;)V
    .locals 0

    .line 347
    invoke-direct {p0}, Lcom/trans/GLSurfaceView;->checkRenderThreadState()V

    .line 348
    iput-object p1, p0, Lcom/trans/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;

    return-void
.end method

.method public setGLWrapper(Lcom/trans/GLSurfaceView$GLWrapper;)V
    .locals 0

    .line 256
    iput-object p1, p0, Lcom/trans/GLSurfaceView;->mGLWrapper:Lcom/trans/GLSurfaceView$GLWrapper;

    return-void
.end method

.method public setRenderMode(I)V
    .locals 1

    .line 453
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1}, Lcom/trans/GLSurfaceView$GLThread;->setRenderMode(I)V

    return-void
.end method

.method public setRenderer(Lcom/trans/GLSurfaceView$Renderer;)V
    .locals 2

    .line 307
    invoke-direct {p0}, Lcom/trans/GLSurfaceView;->checkRenderThreadState()V

    .line 308
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mEGLConfigChooser:Lcom/trans/GLSurfaceView$EGLConfigChooser;

    if-nez v0, :cond_0

    .line 309
    new-instance v0, Lcom/trans/GLSurfaceView$SimpleEGLConfigChooser;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/trans/GLSurfaceView$SimpleEGLConfigChooser;-><init>(Lcom/trans/GLSurfaceView;Z)V

    iput-object v0, p0, Lcom/trans/GLSurfaceView;->mEGLConfigChooser:Lcom/trans/GLSurfaceView$EGLConfigChooser;

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mEGLContextFactory:Lcom/trans/GLSurfaceView$EGLContextFactory;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 312
    new-instance v0, Lcom/trans/GLSurfaceView$DefaultContextFactory;

    invoke-direct {v0, p0, v1}, Lcom/trans/GLSurfaceView$DefaultContextFactory;-><init>(Lcom/trans/GLSurfaceView;Lcom/trans/GLSurfaceView$1;)V

    iput-object v0, p0, Lcom/trans/GLSurfaceView;->mEGLContextFactory:Lcom/trans/GLSurfaceView$EGLContextFactory;

    .line 314
    :cond_1
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;

    if-nez v0, :cond_2

    .line 315
    new-instance v0, Lcom/trans/GLSurfaceView$DefaultWindowSurfaceFactory;

    invoke-direct {v0, v1}, Lcom/trans/GLSurfaceView$DefaultWindowSurfaceFactory;-><init>(Lcom/trans/GLSurfaceView$1;)V

    iput-object v0, p0, Lcom/trans/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/trans/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 317
    :cond_2
    iput-object p1, p0, Lcom/trans/GLSurfaceView;->mRenderer:Lcom/trans/GLSurfaceView$Renderer;

    .line 318
    new-instance v0, Lcom/trans/GLSurfaceView$GLThread;

    invoke-direct {v0, p0, p1}, Lcom/trans/GLSurfaceView$GLThread;-><init>(Lcom/trans/GLSurfaceView;Lcom/trans/GLSurfaceView$Renderer;)V

    iput-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    .line 319
    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->start()V

    return-void
.end method

.method public setSwapMode(I)V
    .locals 1

    .line 468
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1}, Lcom/trans/GLSurfaceView$GLThread;->setSwapMode(I)V

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 508
    iget-object p1, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {p1, p3, p4}, Lcom/trans/GLSurfaceView$GLThread;->onWindowResize(II)V

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 491
    iget-object p1, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {p1}, Lcom/trans/GLSurfaceView$GLThread;->surfaceCreated()V

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 500
    iget-object p1, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {p1}, Lcom/trans/GLSurfaceView$GLThread;->surfaceDestroyed()V

    return-void
.end method

.method public swapBuffers()V
    .locals 1

    .line 543
    iget-object v0, p0, Lcom/trans/GLSurfaceView;->mGLThread:Lcom/trans/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$GLThread;->swapBuffers()V

    return-void
.end method
