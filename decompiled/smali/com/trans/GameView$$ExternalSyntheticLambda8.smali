.class public final synthetic Lcom/trans/GameView$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/trans/GameView;

.field public final synthetic f$1:Landroid/content/res/Configuration;


# direct methods
.method public synthetic constructor <init>(Lcom/trans/GameView;Landroid/content/res/Configuration;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/GameView$$ExternalSyntheticLambda8;->f$0:Lcom/trans/GameView;

    iput-object p2, p0, Lcom/trans/GameView$$ExternalSyntheticLambda8;->f$1:Landroid/content/res/Configuration;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/trans/GameView$$ExternalSyntheticLambda8;->f$0:Lcom/trans/GameView;

    iget-object v1, p0, Lcom/trans/GameView$$ExternalSyntheticLambda8;->f$1:Landroid/content/res/Configuration;

    invoke-virtual {v0, v1}, Lcom/trans/GameView;->lambda$onConfigurationChanged$11$com-trans-GameView(Landroid/content/res/Configuration;)V

    return-void
.end method
