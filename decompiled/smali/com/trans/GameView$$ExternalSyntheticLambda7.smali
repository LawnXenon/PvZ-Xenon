.class public final synthetic Lcom/trans/GameView$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic f$0:Lcom/trans/GameView;


# direct methods
.method public synthetic constructor <init>(Lcom/trans/GameView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/GameView$$ExternalSyntheticLambda7;->f$0:Lcom/trans/GameView;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    iget-object v0, p0, Lcom/trans/GameView$$ExternalSyntheticLambda7;->f$0:Lcom/trans/GameView;

    invoke-virtual {v0, p1}, Lcom/trans/GameView;->lambda$_showKeyboard$5$com-trans-GameView(Landroid/content/DialogInterface;)V

    return-void
.end method
