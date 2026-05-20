.class Lcom/trans/GameView$ConfigChooser;
.super Ljava/lang/Object;
.source "GameView.java"

# interfaces
.implements Lcom/trans/GLSurfaceView$EGLConfigChooser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GameView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConfigChooser"
.end annotation


# static fields
.field private static final EGL_OPENGL_ES2_BIT:I = 0x4

.field private static final s_configAttribs2:[I


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private final mValue:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x7

    new-array v0, v0, [I

    .line 337
    fill-array-data v0, :array_0

    sput-object v0, Lcom/trans/GameView$ConfigChooser;->s_configAttribs2:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x3024
        0x4
        0x3023
        0x4
        0x3022
        0x4
        0x3038
    .end array-data
.end method

.method public constructor <init>(IIIIII)V
    .locals 1

    .line 346
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 344
    iput-object v0, p0, Lcom/trans/GameView$ConfigChooser;->mValue:[I

    .line 347
    iput p1, p0, Lcom/trans/GameView$ConfigChooser;->mRedSize:I

    .line 348
    iput p2, p0, Lcom/trans/GameView$ConfigChooser;->mGreenSize:I

    .line 349
    iput p3, p0, Lcom/trans/GameView$ConfigChooser;->mBlueSize:I

    .line 350
    iput p4, p0, Lcom/trans/GameView$ConfigChooser;->mAlphaSize:I

    .line 351
    iput p5, p0, Lcom/trans/GameView$ConfigChooser;->mDepthSize:I

    .line 352
    iput p6, p0, Lcom/trans/GameView$ConfigChooser;->mStencilSize:I

    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    .line 386
    iget-object v0, p0, Lcom/trans/GameView$ConfigChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 387
    iget-object p1, p0, Lcom/trans/GameView$ConfigChooser;->mValue:[I

    const/4 p2, 0x0

    aget p1, p1, p2

    return p1

    :cond_0
    return p5
.end method

.method private printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 10

    const/16 v0, 0x21

    new-array v1, v0, [I

    .line 402
    fill-array-data v1, :array_0

    new-array v2, v0, [Ljava/lang/String;

    const-string v3, "EGL_BUFFER_SIZE"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "EGL_ALPHA_SIZE"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-string v3, "EGL_BLUE_SIZE"

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const/4 v3, 0x3

    const-string v7, "EGL_GREEN_SIZE"

    aput-object v7, v2, v3

    const/4 v3, 0x4

    const-string v7, "EGL_RED_SIZE"

    aput-object v7, v2, v3

    const/4 v3, 0x5

    const-string v7, "EGL_DEPTH_SIZE"

    aput-object v7, v2, v3

    const/4 v3, 0x6

    const-string v7, "EGL_STENCIL_SIZE"

    aput-object v7, v2, v3

    const/4 v3, 0x7

    const-string v7, "EGL_CONFIG_CAVEAT"

    aput-object v7, v2, v3

    const/16 v3, 0x8

    const-string v7, "EGL_CONFIG_ID"

    aput-object v7, v2, v3

    const/16 v3, 0x9

    const-string v7, "EGL_LEVEL"

    aput-object v7, v2, v3

    const/16 v3, 0xa

    const-string v7, "EGL_MAX_PBUFFER_HEIGHT"

    aput-object v7, v2, v3

    const/16 v3, 0xb

    const-string v7, "EGL_MAX_PBUFFER_PIXELS"

    aput-object v7, v2, v3

    const/16 v3, 0xc

    const-string v7, "EGL_MAX_PBUFFER_WIDTH"

    aput-object v7, v2, v3

    const/16 v3, 0xd

    const-string v7, "EGL_NATIVE_RENDERABLE"

    aput-object v7, v2, v3

    const/16 v3, 0xe

    const-string v7, "EGL_NATIVE_VISUAL_ID"

    aput-object v7, v2, v3

    const/16 v3, 0xf

    const-string v7, "EGL_NATIVE_VISUAL_TYPE"

    aput-object v7, v2, v3

    const/16 v3, 0x10

    const-string v7, "EGL_PRESERVED_RESOURCES"

    aput-object v7, v2, v3

    const/16 v3, 0x11

    const-string v7, "EGL_SAMPLES"

    aput-object v7, v2, v3

    const/16 v3, 0x12

    const-string v7, "EGL_SAMPLE_BUFFERS"

    aput-object v7, v2, v3

    const/16 v3, 0x13

    const-string v7, "EGL_SURFACE_TYPE"

    aput-object v7, v2, v3

    const/16 v3, 0x14

    const-string v7, "EGL_TRANSPARENT_TYPE"

    aput-object v7, v2, v3

    const/16 v3, 0x15

    const-string v7, "EGL_TRANSPARENT_RED_VALUE"

    aput-object v7, v2, v3

    const/16 v3, 0x16

    const-string v7, "EGL_TRANSPARENT_GREEN_VALUE"

    aput-object v7, v2, v3

    const/16 v3, 0x17

    const-string v7, "EGL_TRANSPARENT_BLUE_VALUE"

    aput-object v7, v2, v3

    const/16 v3, 0x18

    const-string v7, "EGL_BIND_TO_TEXTURE_RGB"

    aput-object v7, v2, v3

    const/16 v3, 0x19

    const-string v7, "EGL_BIND_TO_TEXTURE_RGBA"

    aput-object v7, v2, v3

    const/16 v3, 0x1a

    const-string v7, "EGL_MIN_SWAP_INTERVAL"

    aput-object v7, v2, v3

    const/16 v3, 0x1b

    const-string v7, "EGL_MAX_SWAP_INTERVAL"

    aput-object v7, v2, v3

    const/16 v3, 0x1c

    const-string v7, "EGL_LUMINANCE_SIZE"

    aput-object v7, v2, v3

    const/16 v3, 0x1d

    const-string v7, "EGL_ALPHA_MASK_SIZE"

    aput-object v7, v2, v3

    const/16 v3, 0x1e

    const-string v7, "EGL_COLOR_BUFFER_TYPE"

    aput-object v7, v2, v3

    const/16 v3, 0x1f

    const-string v7, "EGL_RENDERABLE_TYPE"

    aput-object v7, v2, v3

    const/16 v3, 0x20

    const-string v7, "EGL_CONFORMANT"

    aput-object v7, v2, v3

    new-array v3, v5, [I

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v0, :cond_2

    .line 406
    aget v8, v1, v7

    .line 407
    aget-object v9, v2, v7

    .line 408
    invoke-interface {p1, p2, p3, v8, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v8

    if-eqz v8, :cond_0

    new-array v8, v6, [Ljava/lang/Object;

    aput-object v9, v8, v4

    aget v9, v3, v4

    .line 409
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    const-string v9, "  %s: %d\n"

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "GameView"

    invoke-static {v9, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 411
    :cond_0
    :goto_1
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v8

    const/16 v9, 0x3000

    if-eq v8, v9, :cond_1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_2
    return-void

    nop

    :array_0
    .array-data 4
        0x3020
        0x3021
        0x3022
        0x3023
        0x3024
        0x3025
        0x3026
        0x3027
        0x3028
        0x3029
        0x302a
        0x302b
        0x302c
        0x302d
        0x302e
        0x302f
        0x3030
        0x3031
        0x3032
        0x3033
        0x3034
        0x3037
        0x3036
        0x3035
        0x3039
        0x303a
        0x303b
        0x303c
        0x303d
        0x303e
        0x303f
        0x3040
        0x3042
    .end array-data
.end method

.method private printConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 7

    .line 393
    array-length v0, p3

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    .line 394
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "%d configurations"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "GameView"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    new-array v5, v1, [Ljava/lang/Object;

    .line 396
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    const-string v6, "Configuration %d:\n"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    aget-object v5, p3, v2

    invoke-direct {p0, p1, p2, v5}, Lcom/trans/GameView$ConfigChooser;->printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 9

    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 358
    sget-object v7, Lcom/trans/GameView$ConfigChooser;->s_configAttribs2:[I

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, v7

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    const/4 v1, 0x0

    aget v5, v0, v1

    if-lez v5, :cond_0

    .line 363
    new-array v8, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    move-object v1, p1

    move-object v2, p2

    move-object v3, v7

    move-object v4, v8

    move-object v6, v0

    .line 364
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 365
    invoke-virtual {p0, p1, p2, v8}, Lcom/trans/GameView$ConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object p1

    return-object p1

    .line 361
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "No configs match configSpec"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 12

    .line 369
    array-length v0, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v8, p3, v1

    const/16 v6, 0x3025

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, v8

    .line 370
    invoke-direct/range {v2 .. v7}, Lcom/trans/GameView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    const/16 v6, 0x3026

    .line 371
    invoke-direct/range {v2 .. v7}, Lcom/trans/GameView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v2

    .line 372
    iget v3, p0, Lcom/trans/GameView$ConfigChooser;->mDepthSize:I

    if-lt v9, v3, :cond_0

    iget v3, p0, Lcom/trans/GameView$ConfigChooser;->mStencilSize:I

    if-lt v2, v3, :cond_0

    const/16 v6, 0x3024

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, v8

    .line 373
    invoke-direct/range {v2 .. v7}, Lcom/trans/GameView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    const/16 v6, 0x3023

    .line 374
    invoke-direct/range {v2 .. v7}, Lcom/trans/GameView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v10

    const/16 v6, 0x3022

    .line 375
    invoke-direct/range {v2 .. v7}, Lcom/trans/GameView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v11

    const/16 v6, 0x3021

    .line 376
    invoke-direct/range {v2 .. v7}, Lcom/trans/GameView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v2

    .line 377
    iget v3, p0, Lcom/trans/GameView$ConfigChooser;->mRedSize:I

    if-ne v9, v3, :cond_0

    iget v3, p0, Lcom/trans/GameView$ConfigChooser;->mGreenSize:I

    if-ne v10, v3, :cond_0

    iget v3, p0, Lcom/trans/GameView$ConfigChooser;->mBlueSize:I

    if-ne v11, v3, :cond_0

    iget v3, p0, Lcom/trans/GameView$ConfigChooser;->mAlphaSize:I

    if-ne v2, v3, :cond_0

    return-object v8

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
