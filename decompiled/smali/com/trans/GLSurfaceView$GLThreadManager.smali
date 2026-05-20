.class Lcom/trans/GLSurfaceView$GLThreadManager;
.super Ljava/lang/Object;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLThreadManager"
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "GLThreadManager"

.field private static final kGLES_20:I = 0x20000

.field private static final kMSM7K_RENDERER_PREFIX:Ljava/lang/String; = "Q3Dimension MSM7500 "


# instance fields
.field private mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

.field private mGLESDriverCheckComplete:Z

.field private mGLESVersion:I

.field private mGLESVersionCheckComplete:Z

.field private mMultipleGLESContextsAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1769
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trans/GLSurfaceView$1;)V
    .locals 0

    .line 1769
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThreadManager;-><init>()V

    return-void
.end method

.method private checkGLESVersion()V
    .locals 1

    .line 1851
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mGLESVersionCheckComplete:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 1852
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mGLESVersion:I

    .line 1853
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    const/4 v0, 0x1

    .line 1854
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mGLESVersionCheckComplete:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    .line 1834
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mGLESDriverCheckComplete:Z

    if-nez v0, :cond_1

    .line 1835
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->checkGLESVersion()V

    .line 1836
    iget v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mGLESVersion:I

    const/high16 v1, 0x20000

    const/4 v2, 0x1

    if-ge v0, v1, :cond_0

    const/16 v0, 0x1f01

    .line 1837
    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Q3Dimension MSM7500 "

    .line 1838
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    xor-int/2addr p1, v2

    iput-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    .line 1844
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1846
    :cond_0
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mGLESDriverCheckComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1848
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    .line 1834
    monitor-exit p0

    throw p1
.end method

.method public releaseEglContextLocked(Lcom/trans/GLSurfaceView$GLThread;)V
    .locals 1

    .line 1815
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

    if-ne v0, p1, :cond_0

    const/4 p1, 0x0

    .line 1816
    iput-object p1, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

    .line 1818
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    return-void
.end method

.method public shouldReleaseEGLContextWhenPausing()Z
    .locals 1

    .line 1825
    monitor-enter p0

    monitor-exit p0

    const/4 v0, 0x1

    return v0
.end method

.method public shouldTerminateEGLWhenPausing()Z
    .locals 1

    .line 1829
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->checkGLESVersion()V

    .line 1830
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mMultipleGLESContextsAllowed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    xor-int/lit8 v0, v0, 0x1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 1829
    monitor-exit p0

    throw v0
.end method

.method public threadExiting(Lcom/trans/GLSurfaceView$GLThread;)V
    .locals 1

    .line 1776
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    invoke-static {p1, v0}, Lcom/trans/GLSurfaceView$GLThread;->access$1202(Lcom/trans/GLSurfaceView$GLThread;Z)Z

    .line 1777
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

    if-ne v0, p1, :cond_0

    const/4 p1, 0x0

    .line 1778
    iput-object p1, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

    .line 1780
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1781
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    .line 1776
    monitor-exit p0

    throw p1
.end method

.method public tryAcquireEglContextLocked(Lcom/trans/GLSurfaceView$GLThread;)Z
    .locals 1

    .line 1791
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

    if-eq v0, p1, :cond_2

    if-nez v0, :cond_0

    goto :goto_0

    .line 1796
    :cond_0
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->checkGLESVersion()V

    .line 1797
    iget-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    if-nez p1, :cond_3

    .line 1804
    iget-object p1, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

    if-eqz p1, :cond_1

    .line 1805
    invoke-virtual {p1}, Lcom/trans/GLSurfaceView$GLThread;->requestReleaseEglContextLocked()V

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    .line 1792
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/trans/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/trans/GLSurfaceView$GLThread;

    .line 1793
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    :cond_3
    const/4 p1, 0x1

    :goto_1
    return p1
.end method
