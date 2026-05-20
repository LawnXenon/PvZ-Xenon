.class public Lcom/trans/GameAudio;
.super Ljava/lang/Object;
.source "GameAudio.java"


# static fields
.field private static final mInst:Lcom/trans/GameAudio;


# instance fields
.field mAudioData:[B

.field private mAudioTrack:Lcom/trans/GameAudioTrack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    new-instance v0, Lcom/trans/GameAudio;

    invoke-direct {v0}, Lcom/trans/GameAudio;-><init>()V

    sput-object v0, Lcom/trans/GameAudio;->mInst:Lcom/trans/GameAudio;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x2000

    new-array v0, v0, [B

    .line 9
    iput-object v0, p0, Lcom/trans/GameAudio;->mAudioData:[B

    return-void
.end method

.method public static getInstance()Lcom/trans/GameAudio;
    .locals 1

    .line 13
    sget-object v0, Lcom/trans/GameAudio;->mInst:Lcom/trans/GameAudio;

    return-object v0
.end method


# virtual methods
.method public initAudio(III)Z
    .locals 9

    .line 17
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const v0, 0xac44

    if-ne p1, v0, :cond_1

    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    const/16 p2, 0x10

    if-ne p3, p2, :cond_1

    const/4 p2, 0x3

    .line 18
    invoke-static {p1, p2, v0}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v7

    .line 19
    new-instance p2, Lcom/trans/GameAudioTrack;

    const/4 v3, 0x3

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v8, 0x1

    move-object v2, p2

    move v4, p1

    invoke-direct/range {v2 .. v8}, Lcom/trans/GameAudioTrack;-><init>(IIIIII)V

    iput-object p2, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    .line 20
    invoke-virtual {p2}, Lcom/trans/GameAudioTrack;->getState()I

    move-result p1

    .line 21
    iget-object p2, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    const/4 p3, 0x1

    if-eq p1, p3, :cond_0

    .line 23
    invoke-virtual {p2}, Lcom/trans/GameAudioTrack;->release()V

    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    return v1

    .line 27
    :cond_0
    new-instance p1, Lcom/trans/GameAudio$1;

    invoke-direct {p1, p0}, Lcom/trans/GameAudio$1;-><init>(Lcom/trans/GameAudio;)V

    invoke-virtual {p2, p1}, Lcom/trans/GameAudioTrack;->setPlaybackPositionUpdateListener(Landroid/media/AudioTrack$OnPlaybackPositionUpdateListener;)V

    .line 36
    iget-object p1, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    invoke-virtual {p1}, Lcom/trans/GameAudioTrack;->play()V

    return p3

    :cond_1
    return v1
.end method

.method public pause()V
    .locals 2

    .line 59
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trans/GameAudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 60
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    invoke-virtual {v0}, Lcom/trans/GameAudioTrack;->pause()V

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trans/GameAudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 66
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    invoke-virtual {v0}, Lcom/trans/GameAudioTrack;->play()V

    :cond_0
    return-void
.end method

.method public uninitAudio()V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    if-eqz v0, :cond_0

    .line 44
    invoke-virtual {v0}, Lcom/trans/GameAudioTrack;->stop()V

    .line 45
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    invoke-virtual {v0}, Lcom/trans/GameAudioTrack;->release()V

    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    :cond_0
    return-void
.end method

.method public writeData(Ljava/nio/ByteBuffer;II)V
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    if-eqz v0, :cond_0

    .line 52
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 53
    iget-object p2, p0, Lcom/trans/GameAudio;->mAudioData:[B

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 54
    iget-object p1, p0, Lcom/trans/GameAudio;->mAudioTrack:Lcom/trans/GameAudioTrack;

    iget-object p2, p0, Lcom/trans/GameAudio;->mAudioData:[B

    invoke-virtual {p1, p2, v0, p3}, Lcom/trans/GameAudioTrack;->write([BII)I

    :cond_0
    return-void
.end method
