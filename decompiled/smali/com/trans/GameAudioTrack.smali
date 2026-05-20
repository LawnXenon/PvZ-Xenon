.class Lcom/trans/GameAudioTrack;
.super Landroid/media/AudioTrack;
.source "GameAudioTrack.java"


# instance fields
.field private final mFrameSize:I


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 9
    invoke-direct/range {p0 .. p6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    const/4 p1, 0x2

    if-ne p4, p1, :cond_0

    .line 11
    invoke-virtual {p0}, Lcom/trans/GameAudioTrack;->getChannelCount()I

    move-result p2

    mul-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/trans/GameAudioTrack;->mFrameSize:I

    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/trans/GameAudioTrack;->getChannelCount()I

    move-result p1

    iput p1, p0, Lcom/trans/GameAudioTrack;->mFrameSize:I

    :goto_0
    return-void
.end method


# virtual methods
.method public initBuffer()V
    .locals 3

    .line 24
    invoke-virtual {p0}, Lcom/trans/GameAudioTrack;->getNativeFrameCount()I

    move-result v0

    iget v1, p0, Lcom/trans/GameAudioTrack;->mFrameSize:I

    mul-int v0, v0, v1

    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 25
    invoke-virtual {p0, v1, v2, v0}, Lcom/trans/GameAudioTrack;->write([BII)I

    return-void
.end method

.method public play()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 19
    invoke-super {p0}, Landroid/media/AudioTrack;->play()V

    .line 20
    invoke-virtual {p0}, Lcom/trans/GameAudioTrack;->initBuffer()V

    return-void
.end method
