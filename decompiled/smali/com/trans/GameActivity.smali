.class public Lcom/trans/GameActivity;
.super Landroid/app/Activity;
.source "GameActivity.java"


# static fields
.field protected static final ATTACH_VIDEO_PLAYER:I = 0x101

.field protected static final DETACH_VIDEO_PLAYER:I = 0x102

.field public static TAG:Ljava/lang/String; = "GameActivity"

.field private static mCurActivity:Lcom/trans/GameActivity;


# instance fields
.field private fileObserver:Landroid/os/FileObserver;

.field private isFileObserverLaunched:Z

.field mHandler:Landroid/os/Handler;

.field protected mLayout:Landroid/widget/FrameLayout;

.field protected mVideo:Lcom/trans/GameVideo;

.field protected mView:Lcom/trans/GameView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 39
    iput-object v0, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    .line 40
    iput-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    .line 41
    iput-object v0, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    .line 44
    new-instance v0, Lcom/trans/GameActivity$1;

    invoke-direct {v0, p0}, Lcom/trans/GameActivity$1;-><init>(Lcom/trans/GameActivity;)V

    iput-object v0, p0, Lcom/trans/GameActivity;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 61
    iput-boolean v0, p0, Lcom/trans/GameActivity;->isFileObserverLaunched:Z

    return-void
.end method

.method private CheckLenovoLicense()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static copyDir(Ljava/io/File;Ljava/io/File;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 67
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 71
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 73
    :cond_1
    array-length v2, v0

    :goto_0
    if-ge v1, v2, :cond_4

    aget-object v3, v0, v1

    .line 74
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 75
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 76
    invoke-static {v4, v5}, Lcom/trans/GameActivity;->copyDir(Ljava/io/File;Ljava/io/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 79
    :cond_2
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 80
    new-instance p0, Ljava/io/FileOutputStream;

    invoke-direct {p0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 p1, 0x400

    new-array p1, p1, [B

    .line 84
    :goto_1
    invoke-virtual {v0, p1}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_3

    .line 85
    invoke-virtual {p0, p1, v1, v2}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_1

    .line 88
    :cond_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 89
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    :cond_4
    return-void
.end method

.method public static deleteRecursive(Ljava/io/File;)V
    .locals 4

    .line 94
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 95
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 98
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 99
    array-length v1, v0

    if-lez v1, :cond_1

    .line 100
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 101
    invoke-static {v3}, Lcom/trans/GameActivity;->deleteRecursive(Ljava/io/File;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 104
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :goto_1
    return-void
.end method

.method public static get()Lcom/trans/GameActivity;
    .locals 1

    .line 352
    sget-object v0, Lcom/trans/GameActivity;->mCurActivity:Lcom/trans/GameActivity;

    return-object v0
.end method

.method static synthetic lambda$checkAndDeleteOldBackups$0(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1

    .line 114
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method static synthetic lambda$checkAndDeleteOldBackups$1(Ljava/io/File;Ljava/io/File;)I
    .locals 3

    .line 118
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide p0

    cmp-long v2, v0, p0

    return v2
.end method

.method static synthetic lambda$startGame$2()V
    .locals 1

    const/4 v0, 0x1

    .line 236
    invoke-static {v0}, Lcom/trans/GameJni;->setFullVersion(Z)V

    return-void
.end method


# virtual methods
.method public GetDataValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public _attachVideoPlayer()V
    .locals 5

    .line 319
    iget-object v0, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    if-eqz v0, :cond_1

    .line 320
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    .line 321
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 323
    iget-object v2, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    if-eqz v2, :cond_0

    iget-object v3, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 324
    iget-object v2, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 326
    :goto_0
    iget-object v3, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    iget-object v4, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    invoke-virtual {v4}, Lcom/trans/GameVideo;->getView()Landroid/view/SurfaceView;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-ne v3, v1, :cond_1

    .line 327
    iget-object v1, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    invoke-virtual {v3}, Lcom/trans/GameVideo;->getView()Landroid/view/SurfaceView;

    move-result-object v3

    invoke-virtual {v1, v3, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    return-void
.end method

.method public _detachVideoPlayer()V
    .locals 2

    .line 333
    iget-object v0, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Lcom/trans/GameVideo;->getView()Landroid/view/SurfaceView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 334
    iget-object v0, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    invoke-virtual {v1}, Lcom/trans/GameVideo;->getView()Landroid/view/SurfaceView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public _goToMarket()V
    .locals 0

    return-void
.end method

.method public _hideAD()V
    .locals 0

    return-void
.end method

.method public _isDisplayCursor()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public _postData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public _postXMLFileData(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public _setRcDefaultMode()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public _setRcSensorAirMouse()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public _show91MoreGame()V
    .locals 0

    return-void
.end method

.method public _showAD(II)V
    .locals 0

    return-void
.end method

.method public _showAlipay()V
    .locals 0

    return-void
.end method

.method public _showAppNotProperlyInstalledDialog()V
    .locals 0

    return-void
.end method

.method public _showCursor(Z)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public _showDataFullDialog()V
    .locals 0

    return-void
.end method

.method public _showMessageBox(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public _showMoreGame()V
    .locals 0

    return-void
.end method

.method public _showNdpay()V
    .locals 0

    return-void
.end method

.method public _showOffer(Ljava/lang/String;IIIII)V
    .locals 0

    return-void
.end method

.method public appNotProperlyInstalled()V
    .locals 0

    return-void
.end method

.method public attachVideoPlayer()V
    .locals 2

    .line 339
    iget-object v0, p0, Lcom/trans/GameActivity;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x101

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public checkAndDeleteOldBackups()V
    .locals 3

    const/4 v0, 0x0

    .line 109
    invoke-virtual {p0, v0}, Lcom/trans/GameActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    new-instance v1, Lcom/trans/GameActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/trans/GameActivity$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 116
    array-length v1, v0

    if-lez v1, :cond_0

    .line 118
    new-instance v1, Lcom/trans/GameActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/trans/GameActivity$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 120
    array-length v1, v0

    const/16 v2, 0x14

    if-le v1, v2, :cond_0

    .line 122
    :goto_0
    array-length v1, v0

    if-ge v2, v1, :cond_0

    .line 123
    aget-object v1, v0, v2

    .line 125
    invoke-static {v1}, Lcom/trans/GameActivity;->deleteRecursive(Ljava/io/File;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public detachVideoPlayer()V
    .locals 2

    .line 343
    iget-object v0, p0, Lcom/trans/GameActivity;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x102

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public fullscreen()V
    .locals 2

    .line 373
    invoke-virtual {p0}, Lcom/trans/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    return-void
.end method

.method public getAndroidId()Ljava/lang/String;
    .locals 1

    const-string v0, "0123"

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method public getExternalStorageDirectory()Ljava/lang/String;
    .locals 1

    .line 521
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    .line 522
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getKeyboard()I
    .locals 1

    .line 510
    invoke-virtual {p0}, Lcom/trans/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 511
    iget v0, v0, Landroid/content/res/Configuration;->keyboard:I

    return v0
.end method

.method public getLocale()Ljava/lang/String;
    .locals 3

    .line 515
    invoke-virtual {p0}, Lcom/trans/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 516
    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 517
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .line 530
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public getSdkVersion()I
    .locals 1

    .line 526
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method public getSensorMaxRange(I)F
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getSensorResolution(I)F
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getTouchScreen()I
    .locals 1

    .line 505
    invoke-virtual {p0}, Lcom/trans/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 506
    iget v0, v0, Landroid/content/res/Configuration;->touchscreen:I

    return v0
.end method

.method public getVideoPlayer()Lcom/trans/GameVideo;
    .locals 1

    .line 538
    iget-object v0, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    return-object v0
.end method

.method public getView()Lcom/trans/GameView;
    .locals 1

    .line 347
    iget-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    return-object v0
.end method

.method public goToMarket()V
    .locals 0

    return-void
.end method

.method public hasSensor(I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public hideAD()V
    .locals 0

    return-void
.end method

.method public installPackage(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 310
    iget-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    if-eqz v0, :cond_0

    .line 311
    invoke-virtual {v0, p1}, Lcom/trans/GameView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 313
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    const/4 v0, 0x1

    .line 138
    invoke-virtual {p0, v0}, Lcom/trans/GameActivity;->requestWindowFeature(I)Z

    .line 139
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_0

    const v1, 0x103012a

    .line 140
    invoke-virtual {p0, v1}, Lcom/trans/GameActivity;->setTheme(I)V

    .line 142
    :cond_0
    invoke-virtual {p0}, Lcom/trans/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x10

    .line 143
    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 144
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v2, :cond_1

    .line 145
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x404

    invoke-virtual {v2, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 146
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    const/4 v4, 0x0

    if-lt v2, v3, :cond_2

    .line 147
    invoke-virtual {v1, v4}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 148
    :cond_2
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_3

    .line 149
    invoke-virtual {v1, v4}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 150
    invoke-virtual {v1, v4}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 152
    :cond_3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_4

    .line 153
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    goto :goto_0

    :cond_4
    const/16 v2, 0x400

    .line 155
    invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 157
    :goto_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    const/4 v5, 0x2

    if-lt v2, v3, :cond_5

    .line 158
    invoke-virtual {v1, v4}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V

    .line 159
    invoke-virtual {v1}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 161
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    move-result v3

    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    move-result v6

    or-int/2addr v3, v6

    invoke-interface {v2, v3}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 162
    invoke-interface {v2, v5}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    :cond_5
    const/16 v2, 0x80

    .line 165
    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 167
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "data"

    .line 168
    invoke-virtual {p0, p1, v4}, Lcom/trans/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v1, "autoBackUp"

    .line 174
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/trans/GameActivity;->isFileObserverLaunched:Z

    if-eqz v1, :cond_6

    .line 176
    invoke-virtual {p0}, Lcom/trans/GameActivity;->checkAndDeleteOldBackups()V

    .line 177
    new-instance v1, Ljava/io/File;

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/trans/GameActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    const-string v3, "userdata"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 178
    new-instance v2, Lcom/trans/GameActivity$2;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x8

    invoke-direct {v2, p0, v3, v6, v1}, Lcom/trans/GameActivity$2;-><init>(Lcom/trans/GameActivity;Ljava/lang/String;ILjava/io/File;)V

    iput-object v2, p0, Lcom/trans/GameActivity;->fileObserver:Landroid/os/FileObserver;

    .line 190
    invoke-virtual {v2}, Landroid/os/FileObserver;->startWatching()V

    :cond_6
    const-string v1, "first"

    .line 194
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 195
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/trans/UnzipActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/trans/GameActivity;->startActivity(Landroid/content/Intent;)V

    .line 196
    invoke-virtual {p0}, Lcom/trans/GameActivity;->finish()V

    return-void

    .line 201
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/trans/GameActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/lib"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 202
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/system/lib/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/trans/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/String;

    aput-object p1, v2, v4

    aput-object v1, v2, v0

    .line 204
    invoke-static {v2}, Lcom/trans/GameJni;->load([Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 205
    invoke-virtual {p0}, Lcom/trans/GameActivity;->finish()V

    return-void

    .line 208
    :cond_8
    invoke-virtual {p0}, Lcom/trans/GameActivity;->setup()V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 277
    sget-object v0, Lcom/trans/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    iget-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    if-eqz v0, :cond_0

    .line 279
    invoke-virtual {v0}, Lcom/trans/GameView;->stopGame()V

    .line 281
    :cond_0
    iget-object v0, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    if-eqz v0, :cond_1

    .line 282
    invoke-virtual {v0}, Lcom/trans/GameVideo;->destroy()V

    .line 284
    :cond_1
    sget-object v0, Lcom/trans/GameActivity;->mCurActivity:Lcom/trans/GameActivity;

    if-ne v0, p0, :cond_2

    const/4 v0, 0x0

    .line 285
    sput-object v0, Lcom/trans/GameActivity;->mCurActivity:Lcom/trans/GameActivity;

    .line 287
    :cond_2
    iget-boolean v0, p0, Lcom/trans/GameActivity;->isFileObserverLaunched:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/trans/GameActivity;->fileObserver:Landroid/os/FileObserver;

    invoke-virtual {v0}, Landroid/os/FileObserver;->stopWatching()V

    .line 288
    :cond_3
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 255
    sget-object v0, Lcom/trans/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "onPause()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    iget-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    if-eqz v0, :cond_0

    .line 258
    invoke-virtual {v0}, Lcom/trans/GameView;->onPause()V

    .line 260
    :cond_0
    invoke-static {}, Lcom/trans/GameAudio;->getInstance()Lcom/trans/GameAudio;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trans/GameAudio;->pause()V

    .line 261
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 266
    sget-object v0, Lcom/trans/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "onResume()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 269
    iget-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    if-eqz v0, :cond_0

    .line 270
    invoke-virtual {v0}, Lcom/trans/GameView;->onResume()V

    .line 272
    :cond_0
    invoke-static {}, Lcom/trans/GameAudio;->getInstance()Lcom/trans/GameAudio;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trans/GameAudio;->resume()V

    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 241
    sget-object v0, Lcom/trans/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "onStart()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 248
    sget-object v0, Lcom/trans/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "onStop()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method public postData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public postXMLFileData(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method protected registerLenovoBroadcastReceiver()V
    .locals 0

    return-void
.end method

.method public restoreCursor()V
    .locals 0

    return-void
.end method

.method public setOfferFullOpenRes(Z)V
    .locals 0

    .line 424
    invoke-static {p1}, Lcom/trans/GameJni;->setOfferFullOpenRes(Z)V

    return-void
.end method

.method public setOfferRes(Z)V
    .locals 0

    .line 420
    invoke-static {p1}, Lcom/trans/GameJni;->setOfferRes(Z)V

    return-void
.end method

.method public setup()V
    .locals 1

    .line 213
    invoke-static {}, Lcom/trans/GameJni;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    invoke-virtual {p0}, Lcom/trans/GameActivity;->finish()V

    return-void

    .line 217
    :cond_0
    sput-object p0, Lcom/trans/GameActivity;->mCurActivity:Lcom/trans/GameActivity;

    .line 218
    invoke-virtual {p0}, Lcom/trans/GameActivity;->startGame()V

    .line 219
    new-instance v0, Lcom/trans/GameVideo;

    invoke-direct {v0, p0}, Lcom/trans/GameVideo;-><init>(Lcom/trans/GameActivity;)V

    iput-object v0, p0, Lcom/trans/GameActivity;->mVideo:Lcom/trans/GameVideo;

    return-void
.end method

.method public setupView()V
    .locals 0

    .line 369
    invoke-virtual {p0}, Lcom/trans/GameActivity;->startGame()V

    return-void
.end method

.method public show91MoreGame()V
    .locals 0

    return-void
.end method

.method public showAD(II)V
    .locals 0

    return-void
.end method

.method public showAlipay()V
    .locals 0

    return-void
.end method

.method public showCursor(Z)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public showDataFullDialog()V
    .locals 0

    return-void
.end method

.method public showMessageBox(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public showMoreGame()V
    .locals 0

    return-void
.end method

.method public showNdpay()V
    .locals 0

    return-void
.end method

.method public showOffer(Ljava/lang/String;IIIII)V
    .locals 0

    return-void
.end method

.method public shutdown()V
    .locals 1

    .line 478
    iget-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    if-eqz v0, :cond_0

    .line 479
    invoke-virtual {v0}, Lcom/trans/GameView;->stopGame()V

    .line 481
    :cond_0
    invoke-virtual {p0}, Lcom/trans/GameActivity;->finish()V

    return-void
.end method

.method public shutdown(Z)V
    .locals 0

    .line 471
    iget-object p1, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    if-eqz p1, :cond_0

    .line 472
    invoke-virtual {p1}, Lcom/trans/GameView;->stopGame()V

    .line 474
    :cond_0
    invoke-virtual {p0}, Lcom/trans/GameActivity;->finish()V

    return-void
.end method

.method public startGame()V
    .locals 3

    .line 224
    invoke-static {}, Lcom/trans/ACPManager;->getInstance()Lcom/trans/ACPManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/trans/GameActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "files/"

    invoke-virtual {v0, v1, v2}, Lcom/trans/ACPManager;->setAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    .line 225
    new-instance v0, Lcom/trans/GameView;

    invoke-virtual {p0}, Lcom/trans/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/trans/GameView;-><init>(Landroid/content/Context;Lcom/trans/GameActivity;)V

    iput-object v0, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    .line 226
    iget-object v0, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    .line 227
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    .line 229
    :cond_0
    iget-object v0, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 230
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x11

    .line 231
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 232
    iget-object v1, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/trans/GameActivity;->mView:Lcom/trans/GameView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 235
    iget-object v0, p0, Lcom/trans/GameActivity;->mLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lcom/trans/GameActivity;->setContentView(Landroid/view/View;)V

    .line 236
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/trans/GameActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/trans/GameActivity$$ExternalSyntheticLambda2;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public startSensor(I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public stopSensor(I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected unregisterLenovoBroadcastReceiver()V
    .locals 0

    return-void
.end method
