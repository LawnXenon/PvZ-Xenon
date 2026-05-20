.class Lcom/trans/GameVideo$1;
.super Landroid/os/Handler;
.source "GameVideo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GameVideo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/GameVideo;


# direct methods
.method constructor <init>(Lcom/trans/GameVideo;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/trans/GameVideo$1;->this$0:Lcom/trans/GameVideo;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 25
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x100

    if-eq v0, v1, :cond_1

    const/16 v1, 0x101

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/trans/GameVideo$1;->this$0:Lcom/trans/GameVideo;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trans/GameVideo;->_show(Z)V

    goto :goto_0

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/trans/GameVideo$1;->this$0:Lcom/trans/GameVideo;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/trans/GameVideo;->_show(Z)V

    .line 33
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method
