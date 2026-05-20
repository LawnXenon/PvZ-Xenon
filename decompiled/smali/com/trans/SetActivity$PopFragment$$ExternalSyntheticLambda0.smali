.class public final synthetic Lcom/trans/SetActivity$PopFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/trans/SetActivity$PopFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/trans/SetActivity$PopFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/SetActivity$PopFragment$$ExternalSyntheticLambda0;->f$0:Lcom/trans/SetActivity$PopFragment;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/trans/SetActivity$PopFragment$$ExternalSyntheticLambda0;->f$0:Lcom/trans/SetActivity$PopFragment;

    invoke-virtual {v0}, Landroid/app/DialogFragment;->dismiss()V

    return-void
.end method
