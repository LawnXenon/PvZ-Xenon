.class public Lcom/trans/GameVideo;
.super Ljava/lang/Object;
.source "GameVideo.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trans/GameVideo$MySurfaceView;
    }
.end annotation


# static fields
.field private static final HIDE_VIDEO:I = 0x101

.field private static final SHOW_VIDEO:I = 0x100

.field private static final TAG:Ljava/lang/String; = "GameVideo"


# instance fields
.field private final heightAs:I

.field private final mActivity:Lcom/trans/GameActivity;

.field private mAttached:Z

.field mHandler:Landroid/os/Handler;

.field private mHasSurface:Z

.field private final mHolder:Landroid/view/SurfaceHolder;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mPath:Ljava/lang/String;

.field private mPreparePending:Z

.field private mPrepared:Z

.field private mStartPending:Z

.field private final mView:Landroid/view/SurfaceView;

.field private mVisible:Z

.field private final shiLiuBiJiu:Z

.field private final widthAs:I


# direct methods
.method public constructor <init>(Lcom/trans/GameActivity;)V
    .locals 5

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lcom/trans/GameVideo$1;

    invoke-direct {v0, p0}, Lcom/trans/GameVideo$1;-><init>(Lcom/trans/GameVideo;)V

    iput-object v0, p0, Lcom/trans/GameVideo;->mHandler:Landroid/os/Handler;

    .line 82
    iput-object p1, p0, Lcom/trans/GameVideo;->mActivity:Lcom/trans/GameActivity;

    .line 83
    new-instance v0, Lcom/trans/GameVideo$MySurfaceView;

    invoke-direct {v0, p0, p1}, Lcom/trans/GameVideo$MySurfaceView;-><init>(Lcom/trans/GameVideo;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/trans/GameVideo;->mView:Landroid/view/SurfaceView;

    .line 84
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/trans/GameVideo;->mHolder:Landroid/view/SurfaceHolder;

    .line 85
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    const/4 v1, -0x2

    .line 86
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    const/4 v1, 0x3

    .line 87
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    const/4 v0, 0x0

    .line 88
    iput-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    .line 89
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mPrepared:Z

    .line 90
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mAttached:Z

    .line 91
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mPreparePending:Z

    .line 92
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mStartPending:Z

    .line 93
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mHasSurface:Z

    const/4 v1, 0x1

    .line 94
    iput-boolean v1, p0, Lcom/trans/GameVideo;->mVisible:Z

    .line 95
    invoke-direct {p0}, Lcom/trans/GameVideo;->attach()V

    .line 96
    invoke-virtual {p0, v0}, Lcom/trans/GameVideo;->_show(Z)V

    const-string v2, "data"

    .line 97
    invoke-virtual {p1, v2, v0}, Lcom/trans/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "shiLiuBiJiu"

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/trans/GameVideo;->shiLiuBiJiu:Z

    .line 98
    invoke-virtual {p1, v2, v0}, Lcom/trans/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v3, "width"

    const/16 v4, 0x10

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/trans/GameVideo;->widthAs:I

    .line 99
    invoke-virtual {p1, v2, v0}, Lcom/trans/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "height"

    const/16 v1, 0x9

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/trans/GameVideo;->heightAs:I

    return-void
.end method

.method static synthetic access$000(Lcom/trans/GameVideo;)Z
    .locals 0

    .line 16
    iget-boolean p0, p0, Lcom/trans/GameVideo;->shiLiuBiJiu:Z

    return p0
.end method

.method static synthetic access$100(Lcom/trans/GameVideo;)I
    .locals 0

    .line 16
    iget p0, p0, Lcom/trans/GameVideo;->widthAs:I

    return p0
.end method

.method static synthetic access$200(Lcom/trans/GameVideo;)I
    .locals 0

    .line 16
    iget p0, p0, Lcom/trans/GameVideo;->heightAs:I

    return p0
.end method

.method private attach()V
    .locals 1

    .line 107
    iget-boolean v0, p0, Lcom/trans/GameVideo;->mAttached:Z

    if-nez v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/trans/GameVideo;->mActivity:Lcom/trans/GameActivity;

    invoke-virtual {v0}, Lcom/trans/GameActivity;->attachVideoPlayer()V

    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mAttached:Z

    :cond_0
    return-void
.end method

.method private detach()V
    .locals 1

    .line 114
    iget-boolean v0, p0, Lcom/trans/GameVideo;->mAttached:Z

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/trans/GameVideo;->mActivity:Lcom/trans/GameActivity;

    invoke-virtual {v0}, Lcom/trans/GameActivity;->detachVideoPlayer()V

    const/4 v0, 0x0

    .line 116
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mAttached:Z

    :cond_0
    return-void
.end method

.method private init()Z
    .locals 3

    .line 143
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 144
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 145
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 146
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 147
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 148
    iget-boolean v0, p0, Lcom/trans/GameVideo;->mHasSurface:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 150
    :try_start_0
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/trans/GameVideo;->mView:Landroid/view/SurfaceView;

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v0

    .line 153
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 155
    :try_start_1
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v0, 0x0

    .line 158
    iput-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    return v0

    :cond_0
    return v1
.end method


# virtual methods
.method public _show(Z)V
    .locals 2

    .line 121
    iget-boolean v0, p0, Lcom/trans/GameVideo;->mVisible:Z

    if-eq v0, p1, :cond_1

    .line 122
    iget-object v0, p0, Lcom/trans/GameVideo;->mView:Landroid/view/SurfaceView;

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 123
    iput-boolean p1, p0, Lcom/trans/GameVideo;->mVisible:Z

    :cond_1
    return-void
.end method

.method public close()Z
    .locals 2

    const-string v0, "GameVideo"

    const-string v1, "close()"

    .line 290
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 292
    invoke-virtual {p0}, Lcom/trans/GameVideo;->stop()Z

    .line 294
    :try_start_0
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    :catch_0
    :try_start_1
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v0, 0x0

    .line 301
    iput-object v0, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    const/4 v0, 0x0

    .line 302
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mPreparePending:Z

    .line 303
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mStartPending:Z

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public destroy()V
    .locals 1

    .line 309
    invoke-virtual {p0}, Lcom/trans/GameVideo;->close()Z

    .line 310
    iget-object v0, p0, Lcom/trans/GameVideo;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    return-void
.end method

.method public getView()Landroid/view/SurfaceView;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/trans/GameVideo;->mView:Landroid/view/SurfaceView;

    return-object v0
.end method

.method public isPlaying()Z
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    goto :goto_0

    .line 136
    :cond_0
    iget-boolean v1, p0, Lcom/trans/GameVideo;->mStartPending:Z

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    return v0

    .line 139
    :cond_1
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    return v0

    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 1

    .line 326
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "onBufferingUpdate called --->   percent:"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "GameVideo"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    const-string p1, "GameVideo"

    const-string v0, "onCompletion()"

    .line 331
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    invoke-static {}, Lcom/trans/GameJni;->videoPlayCompleted()V

    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 2

    .line 315
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onError--->   what:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "    extra:"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "GameVideo"

    invoke-static {p3, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    .line 317
    invoke-static {}, Lcom/trans/GameJni;->videoPlayError()V

    .line 318
    invoke-virtual {p0}, Lcom/trans/GameVideo;->close()Z

    :cond_0
    return p2
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    const-string v0, "GameVideo"

    const-string v1, "onPrepared()"

    .line 337
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    .line 338
    iput-boolean v0, p0, Lcom/trans/GameVideo;->mPrepared:Z

    .line 339
    iget-boolean v0, p0, Lcom/trans/GameVideo;->mStartPending:Z

    if-eqz v0, :cond_0

    .line 341
    :try_start_0
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    const/4 p1, 0x0

    .line 342
    iput-boolean p1, p0, Lcom/trans/GameVideo;->mStartPending:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 344
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 345
    invoke-static {}, Lcom/trans/GameJni;->videoPlayError()V

    .line 346
    invoke-virtual {p0}, Lcom/trans/GameVideo;->close()Z

    :cond_0
    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public open(Ljava/lang/String;)Z
    .locals 11

    const-string v0, "open(): prepared: "

    .line 167
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "open(): "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GameVideo"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v1, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    return v3

    .line 169
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 170
    invoke-virtual {p0}, Lcom/trans/GameVideo;->close()Z

    .line 172
    :cond_2
    invoke-static {}, Lcom/trans/ACPManager;->getInstance()Lcom/trans/ACPManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/trans/ACPManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    const/4 v4, 0x0

    if-nez v1, :cond_3

    .line 174
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Failed to open "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v4

    .line 177
    :cond_3
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v6

    if-nez v6, :cond_4

    return v4

    .line 182
    :cond_4
    :try_start_0
    invoke-direct {p0}, Lcom/trans/GameVideo;->init()Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_6

    .line 184
    :try_start_1
    iget-object v5, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v7

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v9

    invoke-virtual/range {v5 .. v10}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 185
    iput-boolean v4, p0, Lcom/trans/GameVideo;->mPrepared:Z

    .line 186
    iget-boolean v5, p0, Lcom/trans/GameVideo;->mHasSurface:Z

    if-eqz v5, :cond_5

    .line 187
    iget-object v5, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v5}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 188
    iput-boolean v4, p0, Lcom/trans/GameVideo;->mPreparePending:Z

    goto :goto_1

    .line 190
    :cond_5
    iput-boolean v3, p0, Lcom/trans/GameVideo;->mPreparePending:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 196
    :catch_0
    :try_start_3
    iput-object p1, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    .line 197
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 212
    :try_start_4
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    return v3

    :catch_2
    move-exception p1

    .line 200
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 201
    invoke-virtual {p0}, Lcom/trans/GameVideo;->close()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 203
    :try_start_6
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 212
    :catch_3
    :try_start_7
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    :catch_4
    return v4

    :cond_6
    :try_start_8
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    :catch_5
    return v4

    :catchall_0
    move-exception p1

    :try_start_9
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    .line 215
    :catch_6
    throw p1
.end method

.method public pause()Z
    .locals 2

    .line 250
    iget-object v0, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    goto :goto_0

    .line 254
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    :cond_1
    :goto_0
    return v1
.end method

.method public play()Z
    .locals 3

    const-string v0, "GameVideo"

    const-string v1, "play()"

    .line 223
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    iget-object v0, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    goto :goto_2

    .line 228
    :cond_0
    :try_start_0
    iget-boolean v2, p0, Lcom/trans/GameVideo;->mPrepared:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/trans/GameVideo;->mPreparePending:Z

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/trans/GameVideo;->mHasSurface:Z

    if-eqz v2, :cond_1

    .line 229
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 230
    iput-boolean v1, p0, Lcom/trans/GameVideo;->mPreparePending:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 233
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/trans/GameVideo;->mPrepared:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 234
    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0

    .line 236
    :cond_2
    iput-boolean v2, p0, Lcom/trans/GameVideo;->mStartPending:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    .line 239
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :goto_1
    return v1

    :catch_1
    move-exception v0

    .line 244
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3
    :goto_2
    return v1
.end method

.method public resume()Z
    .locals 2

    .line 262
    iget-object v0, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    goto :goto_0

    .line 266
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    :cond_1
    :goto_0
    return v1
.end method

.method public show(Z)V
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/trans/GameVideo;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    const/16 p1, 0x100

    goto :goto_0

    :cond_0
    const/16 p1, 0x101

    :goto_0
    invoke-virtual {v0, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    .line 129
    iget-object v0, p0, Lcom/trans/GameVideo;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public stop()Z
    .locals 2

    const-string v0, "GameVideo"

    const-string v1, "stop()"

    .line 274
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    iget-object v0, p0, Lcom/trans/GameVideo;->mPath:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    goto :goto_0

    .line 279
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 280
    iput-boolean v1, p0, Lcom/trans/GameVideo;->mPrepared:Z

    .line 281
    iput-boolean v1, p0, Lcom/trans/GameVideo;->mPreparePending:Z

    .line 282
    iput-boolean v1, p0, Lcom/trans/GameVideo;->mStartPending:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    :cond_1
    :goto_0
    return v1
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 378
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, p1, v0

    const/4 p2, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, p1, p2

    const/4 p2, 0x2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, p1, p2

    const-string p2, "surfaceChanged(): %d %d %d"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "GameVideo"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    const-string p1, "GameVideo"

    const-string v0, "surfaceCreated()"

    .line 353
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    .line 354
    iput-boolean p1, p0, Lcom/trans/GameVideo;->mHasSurface:Z

    .line 356
    :try_start_0
    iget-object p1, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_0

    .line 357
    iget-object v0, p0, Lcom/trans/GameVideo;->mView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 360
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 362
    :cond_0
    :goto_0
    iget-boolean p1, p0, Lcom/trans/GameVideo;->mPreparePending:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 363
    iput-boolean p1, p0, Lcom/trans/GameVideo;->mPreparePending:Z

    .line 365
    :try_start_1
    iget-object p1, p0, Lcom/trans/GameVideo;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_1

    .line 366
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 369
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 370
    invoke-static {}, Lcom/trans/GameJni;->videoPlayError()V

    .line 371
    invoke-virtual {p0}, Lcom/trans/GameVideo;->close()Z

    :cond_1
    :goto_1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    const-string p1, "GameVideo"

    const-string v0, "surfaceDestroyed()"

    .line 383
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 384
    iput-boolean p1, p0, Lcom/trans/GameVideo;->mHasSurface:Z

    return-void
.end method
