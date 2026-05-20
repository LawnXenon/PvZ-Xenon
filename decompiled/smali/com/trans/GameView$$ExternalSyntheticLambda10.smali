.class public final synthetic Lcom/trans/GameView$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/trans/GameView;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/view/KeyEvent;


# direct methods
.method public synthetic constructor <init>(Lcom/trans/GameView;ILandroid/view/KeyEvent;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/GameView$$ExternalSyntheticLambda10;->f$0:Lcom/trans/GameView;

    iput p2, p0, Lcom/trans/GameView$$ExternalSyntheticLambda10;->f$1:I

    iput-object p3, p0, Lcom/trans/GameView$$ExternalSyntheticLambda10;->f$2:Landroid/view/KeyEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/trans/GameView$$ExternalSyntheticLambda10;->f$0:Lcom/trans/GameView;

    iget v1, p0, Lcom/trans/GameView$$ExternalSyntheticLambda10;->f$1:I

    iget-object v2, p0, Lcom/trans/GameView$$ExternalSyntheticLambda10;->f$2:Landroid/view/KeyEvent;

    invoke-virtual {v0, v1, v2}, Lcom/trans/GameView;->lambda$onKeyDown$7$com-trans-GameView(ILandroid/view/KeyEvent;)V

    return-void
.end method
