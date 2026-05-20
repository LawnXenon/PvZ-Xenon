.class Lcom/trans/GLSurfaceView$GLThread;
.super Ljava/lang/Thread;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GLThread"
.end annotation


# instance fields
.field askedToReleaseEglContext:Z

.field createEglContext:Z

.field createEglSurface:Z

.field doRenderNotification:Z

.field event:Ljava/lang/Runnable;

.field gl:Ljavax/microedition/khronos/opengles/GL10;

.field h:I

.field private mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mHasSurface:Z

.field private mHaveEglContext:Z

.field private mHaveEglSurface:Z

.field private mHeight:I

.field private mLostEglContext:Z

.field private mPaused:Z

.field private mRenderComplete:Z

.field private mRenderMode:I

.field private mRenderer:Lcom/trans/GLSurfaceView$Renderer;

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mShouldExit:Z

.field private mShouldReleaseEglContext:Z

.field private mSwapMode:I

.field private mWaitingForSurface:Z

.field private mWidth:I

.field sizeChanged:Z

.field final this$0:Lcom/trans/GLSurfaceView;

.field w:I

.field wantRenderNotification:Z


# direct methods
.method constructor <init>(Lcom/trans/GLSurfaceView;Lcom/trans/GLSurfaceView$Renderer;)V
    .locals 1

    .line 1181
    iput-object p1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    .line 1182
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1709
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 1712
    iput-object p1, p0, Lcom/trans/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/4 v0, 0x0

    .line 1713
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1714
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1715
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1716
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1717
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->doRenderNotification:Z

    .line 1718
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->askedToReleaseEglContext:Z

    .line 1719
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThread;->w:I

    .line 1720
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThread;->h:I

    .line 1721
    iput-object p1, p0, Lcom/trans/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    .line 1183
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mWidth:I

    .line 1184
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHeight:I

    const/4 p1, 0x1

    .line 1185
    iput-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1186
    iput p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderMode:I

    .line 1187
    iput-object p2, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderer:Lcom/trans/GLSurfaceView$Renderer;

    .line 1188
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mSwapMode:I

    return-void
.end method

.method static synthetic access$1202(Lcom/trans/GLSurfaceView$GLThread;Z)Z
    .locals 0

    .line 1180
    iput-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mExited:Z

    return p1
.end method

.method static synthetic access$200(Lcom/trans/GLSurfaceView$GLThread;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1180
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->prepare()Z

    move-result p0

    return p0
.end method

.method private guardedRun()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1431
    new-instance v0, Lcom/trans/GLSurfaceView$EglHelper;

    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    invoke-direct {v0, v1}, Lcom/trans/GLSurfaceView$EglHelper;-><init>(Lcom/trans/GLSurfaceView;)V

    iput-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    const/4 v0, 0x0

    .line 1432
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1433
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1434
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mLostEglContext:Z

    const/4 v1, 0x0

    .line 1436
    :try_start_0
    iput-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    .line 1437
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1438
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1439
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1440
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1441
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->doRenderNotification:Z

    .line 1442
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->askedToReleaseEglContext:Z

    .line 1443
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThread;->w:I

    .line 1444
    iput v0, p0, Lcom/trans/GLSurfaceView$GLThread;->h:I

    .line 1447
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mShouldExit:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    .line 1469
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1470
    :try_start_1
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1471
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1472
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 1450
    :cond_1
    :try_start_2
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->prepare()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1456
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderer:Lcom/trans/GLSurfaceView$Renderer;

    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v0, v1}, Lcom/trans/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1457
    iget v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mSwapMode:I

    if-nez v0, :cond_2

    .line 1458
    invoke-virtual {p0}, Lcom/trans/GLSurfaceView$GLThread;->swapBuffers()V

    .line 1460
    :cond_2
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->wantRenderNotification:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 1461
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->doRenderNotification:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    .line 1469
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1470
    :try_start_3
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1471
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1472
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method private prepare()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1233
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1235
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mShouldExit:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1236
    monitor-exit v0

    goto/16 :goto_4

    .line 1239
    :cond_0
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_1

    .line 1240
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    goto/16 :goto_3

    .line 1245
    :cond_1
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mPaused:Z

    iget-boolean v4, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestPaused:Z

    if-eq v1, v4, :cond_2

    .line 1246
    iput-boolean v4, p0, Lcom/trans/GLSurfaceView$GLThread;->mPaused:Z

    .line 1247
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1254
    :cond_2
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mShouldReleaseEglContext:Z

    if-eqz v1, :cond_3

    .line 1258
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1259
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1260
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->mShouldReleaseEglContext:Z

    .line 1261
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->askedToReleaseEglContext:Z

    .line 1265
    :cond_3
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mLostEglContext:Z

    if-eqz v1, :cond_4

    .line 1266
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1267
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1268
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->mLostEglContext:Z

    .line 1272
    :cond_4
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v1, :cond_6

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v1, :cond_6

    .line 1276
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1277
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trans/GLSurfaceView$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1278
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1283
    :cond_5
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trans/GLSurfaceView$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1284
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    invoke-virtual {v1}, Lcom/trans/GLSurfaceView$EglHelper;->finish()V

    .line 1292
    :cond_6
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHasSurface:Z

    if-nez v1, :cond_8

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_8

    .line 1296
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v1, :cond_7

    .line 1297
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1299
    :cond_7
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1300
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1304
    :cond_8
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHasSurface:Z

    if-eqz v1, :cond_9

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_9

    .line 1308
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1309
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1312
    :cond_9
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->doRenderNotification:Z

    if-eqz v1, :cond_a

    .line 1316
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1317
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->doRenderNotification:Z

    .line 1318
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1319
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1323
    :cond_a
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->readyToDraw()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1326
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-nez v1, :cond_c

    .line 1327
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->askedToReleaseEglContext:Z

    if-eqz v1, :cond_b

    .line 1328
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->askedToReleaseEglContext:Z

    goto :goto_1

    .line 1329
    :cond_b
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->tryAcquireEglContextLocked(Lcom/trans/GLSurfaceView$GLThread;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_c

    .line 1331
    :try_start_1
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    invoke-virtual {v1}, Lcom/trans/GLSurfaceView$EglHelper;->start()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1336
    :try_start_2
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1337
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1339
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    goto :goto_1

    :catch_0
    move-exception v1

    .line 1333
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->releaseEglContextLocked(Lcom/trans/GLSurfaceView$GLThread;)V

    .line 1334
    throw v1

    .line 1343
    :cond_c
    :goto_1
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v1, :cond_d

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-nez v1, :cond_d

    .line 1344
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1345
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1346
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1349
    :cond_d
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v1, :cond_14

    .line 1350
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    invoke-static {v1}, Lcom/trans/GLSurfaceView;->access$1000(Lcom/trans/GLSurfaceView;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 1351
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1352
    iget v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mWidth:I

    iput v1, p0, Lcom/trans/GLSurfaceView$GLThread;->w:I

    .line 1353
    iget v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHeight:I

    iput v1, p0, Lcom/trans/GLSurfaceView$GLThread;->h:I

    .line 1354
    iput-boolean v3, p0, Lcom/trans/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1366
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    invoke-static {v1, v2}, Lcom/trans/GLSurfaceView;->access$1002(Lcom/trans/GLSurfaceView;Z)Z

    goto :goto_2

    .line 1368
    :cond_e
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1370
    :goto_2
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    const/4 v1, 0x0

    .line 1390
    :goto_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_f

    .line 1393
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_4

    .line 1398
    :cond_f
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglSurface:Z

    if-eqz v0, :cond_11

    .line 1402
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    invoke-virtual {v1}, Lcom/trans/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trans/GLSurfaceView$EglHelper;->createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    iput-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    if-nez v0, :cond_10

    goto :goto_4

    .line 1407
    :cond_10
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-virtual {v0, v1}, Lcom/trans/GLSurfaceView$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1408
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1411
    :cond_11
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglContext:Z

    if-eqz v0, :cond_12

    .line 1415
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderer:Lcom/trans/GLSurfaceView$Renderer;

    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    iget-object v4, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    iget-object v4, v4, Lcom/trans/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v0, v1, v4}, Lcom/trans/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 1416
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1419
    :cond_12
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->sizeChanged:Z

    if-eqz v0, :cond_13

    .line 1423
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderer:Lcom/trans/GLSurfaceView$Renderer;

    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    iget v4, p0, Lcom/trans/GLSurfaceView$GLThread;->w:I

    iget v5, p0, Lcom/trans/GLSurfaceView$GLThread;->h:I

    invoke-interface {v0, v1, v4, v5}, Lcom/trans/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 1424
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->sizeChanged:Z

    :cond_13
    const/4 v2, 0x1

    :goto_4
    return v2

    .line 1388
    :cond_14
    :try_start_3
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    goto/16 :goto_0

    :catchall_0
    move-exception v1

    .line 1390
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_6

    :goto_5
    throw v1

    :goto_6
    goto :goto_5
.end method

.method private readyToDraw()Z
    .locals 2

    .line 1481
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mPaused:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHasSurface:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mWidth:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHeight:I

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestRender:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    iget v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderMode:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method private stopEglContextLocked()V
    .locals 1

    .line 1223
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    .line 1224
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$EglHelper;->finish()V

    const/4 v0, 0x0

    .line 1225
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1226
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->releaseEglContextLocked(Lcom/trans/GLSurfaceView$GLThread;)V

    :cond_0
    return-void
.end method

.method private stopEglSurfaceLocked()V
    .locals 1

    .line 1212
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 1213
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1214
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$EglHelper;->destroySurface()V

    :cond_0
    return-void
.end method


# virtual methods
.method public ableToDraw()Z
    .locals 1

    .line 1477
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->readyToDraw()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getRenderMode()I
    .locals 2

    .line 1497
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1498
    :try_start_0
    iget v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderMode:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 1499
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSwapMode()I
    .locals 2

    .line 1513
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1514
    :try_start_0
    iget v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mSwapMode:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 1515
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public handleEvents()V
    .locals 3

    .line 1679
    :cond_0
    :goto_0
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1680
    :try_start_0
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 1681
    monitor-exit v0

    return-void

    .line 1683
    :cond_1
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 1684
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 1687
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 1684
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public onPause()V
    .locals 2

    .line 1560
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x1

    .line 1564
    :try_start_0
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestPaused:Z

    .line 1565
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1566
    :goto_0
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1571
    :try_start_1
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1573
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1576
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public onResume()V
    .locals 3

    .line 1580
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x0

    .line 1584
    :try_start_0
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestPaused:Z

    const/4 v2, 0x1

    .line 1585
    iput-boolean v2, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1586
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1587
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1588
    :goto_0
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1593
    :try_start_1
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1595
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1598
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public onWindowResize(II)V
    .locals 1

    .line 1602
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1603
    :try_start_0
    iput p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mWidth:I

    .line 1604
    iput p2, p0, Lcom/trans/GLSurfaceView$GLThread;->mHeight:I

    .line 1605
    iget-object p1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/trans/GLSurfaceView;->access$1002(Lcom/trans/GLSurfaceView;Z)Z

    .line 1606
    iput-boolean p2, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestRender:Z

    const/4 p1, 0x0

    .line 1607
    iput-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1608
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 1612
    :goto_0
    iget-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mExited:Z

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mPaused:Z

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderComplete:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    invoke-static {p1}, Lcom/trans/GLSurfaceView;->access$1100(Lcom/trans/GLSurfaceView;)Lcom/trans/GLSurfaceView$GLThread;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/trans/GLSurfaceView$GLThread;->this$0:Lcom/trans/GLSurfaceView;

    invoke-static {p1}, Lcom/trans/GLSurfaceView;->access$1100(Lcom/trans/GLSurfaceView;)Lcom/trans/GLSurfaceView$GLThread;

    move-result-object p1

    invoke-virtual {p1}, Lcom/trans/GLSurfaceView$GLThread;->ableToDraw()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    .line 1617
    :try_start_1
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1619
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1622
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 1654
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1655
    :try_start_0
    iget-object v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1656
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 1657
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 1652
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "r must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public requestExitAndWait()V
    .locals 2

    .line 1628
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x1

    .line 1629
    :try_start_0
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mShouldExit:Z

    .line 1630
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1631
    :goto_0
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1633
    :try_start_1
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1635
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1638
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public requestReleaseEglContextLocked()V
    .locals 1

    const/4 v0, 0x1

    .line 1642
    iput-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mShouldReleaseEglContext:Z

    .line 1643
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    return-void
.end method

.method public requestRender()V
    .locals 2

    .line 1519
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x1

    .line 1520
    :try_start_0
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1521
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1522
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 3

    .line 1193
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GLThread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/trans/GLSurfaceView$GLThread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trans/GLSurfaceView$GLThread;->setName(Ljava/lang/String;)V

    .line 1199
    :try_start_0
    invoke-direct {p0}, Lcom/trans/GLSurfaceView$GLThread;->guardedRun()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1203
    :catch_0
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->threadExiting(Lcom/trans/GLSurfaceView$GLThread;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/trans/GLSurfaceView$GLThreadManager;->threadExiting(Lcom/trans/GLSurfaceView$GLThread;)V

    throw v0

    :goto_0
    return-void
.end method

.method public setRenderMode(I)V
    .locals 1

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    .line 1490
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1491
    :try_start_0
    iput p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mRenderMode:I

    .line 1492
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 1493
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 1488
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "renderMode"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSwapMode(I)V
    .locals 1

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    .line 1506
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1507
    :try_start_0
    iput p1, p0, Lcom/trans/GLSurfaceView$GLThread;->mSwapMode:I

    .line 1508
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 1509
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 1504
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "swapMode"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public surfaceCreated()V
    .locals 2

    .line 1526
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x1

    .line 1530
    :try_start_0
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 1531
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1532
    :goto_0
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1534
    :try_start_1
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1536
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1539
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public surfaceDestroyed()V
    .locals 2

    .line 1543
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x0

    .line 1547
    :try_start_0
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 1548
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1549
    :goto_0
    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1551
    :try_start_1
    invoke-static {}, Lcom/trans/GLSurfaceView;->access$900()Lcom/trans/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1553
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1556
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public swapBuffers()V
    .locals 2

    .line 1661
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 1664
    :cond_0
    iget-object v0, p0, Lcom/trans/GLSurfaceView$GLThread;->mEglHelper:Lcom/trans/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/trans/GLSurfaceView$EglHelper;->swap()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 1668
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->mLostEglContext:Z

    .line 1671
    :cond_1
    iget-boolean v0, p0, Lcom/trans/GLSurfaceView$GLThread;->wantRenderNotification:Z

    if-eqz v0, :cond_2

    .line 1672
    iput-boolean v1, p0, Lcom/trans/GLSurfaceView$GLThread;->doRenderNotification:Z

    :cond_2
    :goto_0
    return-void
.end method
