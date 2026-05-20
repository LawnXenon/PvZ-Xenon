.class Lcom/trans/GameAudio$1;
.super Ljava/lang/Object;
.source "GameAudio.java"

# interfaces
.implements Landroid/media/AudioTrack$OnPlaybackPositionUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trans/GameAudio;->initAudio(III)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/GameAudio;


# direct methods
.method constructor <init>(Lcom/trans/GameAudio;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/trans/GameAudio$1;->this$0:Lcom/trans/GameAudio;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMarkerReached(Landroid/media/AudioTrack;)V
    .locals 0

    return-void
.end method

.method public onPeriodicNotification(Landroid/media/AudioTrack;)V
    .locals 0

    return-void
.end method
