.class public final synthetic Lcom/trans/GameView$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/trans/GameView;


# direct methods
.method public synthetic constructor <init>(Lcom/trans/GameView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/GameView$$ExternalSyntheticLambda11;->f$0:Lcom/trans/GameView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/trans/GameView$$ExternalSyntheticLambda11;->f$0:Lcom/trans/GameView;

    invoke-virtual {v0}, Lcom/trans/GameView;->lambda$onPause$0$com-trans-GameView()V

    return-void
.end method
