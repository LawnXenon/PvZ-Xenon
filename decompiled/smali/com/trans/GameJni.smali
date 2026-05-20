.class public Lcom/trans/GameJni;
.super Ljava/lang/Object;
.source "GameJni.java"


# static fields
.field private static mLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native filterKeyEvent(IJIIIII)Z
.end method

.method public static native init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/trans/GameView;Lcom/trans/GameActivity;Landroid/os/Bundle;II)V
.end method

.method public static native isInitialized()Z
.end method

.method public static isLoaded()Z
    .locals 1

    .line 101
    sget-boolean v0, Lcom/trans/GameJni;->mLoaded:Z

    return v0
.end method

.method public static load()Z
    .locals 1

    const/4 v0, 0x0

    .line 88
    invoke-static {v0}, Lcom/trans/GameJni;->load([Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static load([Ljava/lang/String;)Z
    .locals 1

    .line 92
    invoke-static {}, Lcom/trans/GameJni;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const-string v0, "stdc++-shared"

    .line 95
    invoke-static {p0, v0}, Lcom/trans/GameJni;->loadLibrary([Ljava/lang/String;Ljava/lang/String;)Z

    const-string v0, "GameLauncher"

    .line 96
    invoke-static {p0, v0}, Lcom/trans/GameJni;->loadLibrary([Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    sput-boolean p0, Lcom/trans/GameJni;->mLoaded:Z

    return p0
.end method

.method public static loadLibrary([Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    .line 62
    array-length v2, p0

    if-lez v2, :cond_0

    .line 63
    invoke-static {p1}, Ljava/lang/System;->mapLibraryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 65
    array-length v3, p0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-object v5, p0, v4

    .line 66
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    :try_start_0
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/System;->load(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x1

    goto :goto_1

    :catchall_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    return v0

    .line 80
    :cond_1
    :try_start_1
    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move v0, v1

    :goto_2
    return v0
.end method

.method public static native nativeDialogClick(I)V
.end method

.method public static native onConfigurationChanged(IILjava/lang/String;)V
.end method

.method public static native pause()Z
.end method

.method public static native queueAxisMovedEvent(IIJIF)V
.end method

.method public static native queueDeviceEvent(IZ)V
.end method

.method public static native queueKeyEvent(IJIIIII)V
.end method

.method public static native queuePointerEvent(IIJIIIFFF)V
.end method

.method public static native queueSensorEvent(Landroid/hardware/Sensor;IIJ[F)V
.end method

.method public static native readAudioData()V
.end method

.method public static native render()Z
.end method

.method public static native resume()Z
.end method

.method public static native setFullVersion(Z)V
.end method

.method public static native setOfferFullOpenRes(Z)V
.end method

.method public static native setOfferRes(Z)V
.end method

.method public static native shutdown()V
.end method

.method public static native surfaceCreated()V
.end method

.method public static native textInput(Ljava/lang/String;)V
.end method

.method public static native uninit()V
.end method

.method public static native videoPlayCompleted()V
.end method

.method public static native videoPlayError()V
.end method

.method public static native windowFocusChanged(Z)V
.end method
