.class Lcom/trans/GameView$1;
.super Landroid/os/Handler;
.source "GameView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trans/GameView;-><init>(Landroid/content/Context;Lcom/trans/GameActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/GameView;


# direct methods
.method constructor <init>(Lcom/trans/GameView;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/trans/GameView$1;->this$0:Lcom/trans/GameView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 90
    iget-object v0, p0, Lcom/trans/GameView$1;->this$0:Lcom/trans/GameView;

    invoke-static {v0}, Lcom/trans/GameView;->access$000(Lcom/trans/GameView;)Lcom/trans/GameActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trans/GameActivity;->getView()Lcom/trans/GameView;

    move-result-object v0

    .line 91
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x0

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 103
    :pswitch_0
    iget-object v0, p0, Lcom/trans/GameView$1;->this$0:Lcom/trans/GameView;

    invoke-virtual {v0, v2}, Lcom/trans/GameView;->_show(Z)V

    goto :goto_0

    .line 100
    :pswitch_1
    iget-object v0, p0, Lcom/trans/GameView$1;->this$0:Lcom/trans/GameView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/trans/GameView;->_show(Z)V

    goto :goto_0

    .line 97
    :pswitch_2
    invoke-virtual {v0, v2}, Lcom/trans/GameView;->_hideKeyboard(Z)V

    goto :goto_0

    .line 93
    :pswitch_3
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "mode"

    .line 94
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "title"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "hint"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "initial"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/trans/GameView;->_showKeyboard(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x101
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
