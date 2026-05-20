.class Lcom/trans/UnzipActivity$1;
.super Landroid/os/Handler;
.source "UnzipActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trans/UnzipActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/UnzipActivity;


# direct methods
.method constructor <init>(Lcom/trans/UnzipActivity;Landroid/os/Looper;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/trans/UnzipActivity$1;->this$0:Lcom/trans/UnzipActivity;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 46
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 47
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 48
    iget-object v1, p0, Lcom/trans/UnzipActivity$1;->this$0:Lcom/trans/UnzipActivity;

    invoke-static {v1, v0, p1}, Lcom/trans/UnzipActivity;->access$000(Lcom/trans/UnzipActivity;II)V

    return-void
.end method
