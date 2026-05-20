.class Lcom/trans/GameActivity$1;
.super Landroid/os/Handler;
.source "GameActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GameActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/GameActivity;


# direct methods
.method constructor <init>(Lcom/trans/GameActivity;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/trans/GameActivity$1;->this$0:Lcom/trans/GameActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 47
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x101

    if-eq v0, v1, :cond_1

    const/16 v1, 0x102

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/trans/GameActivity$1;->this$0:Lcom/trans/GameActivity;

    invoke-virtual {v0}, Lcom/trans/GameActivity;->_detachVideoPlayer()V

    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/trans/GameActivity$1;->this$0:Lcom/trans/GameActivity;

    invoke-virtual {v0}, Lcom/trans/GameActivity;->_attachVideoPlayer()V

    .line 55
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method
