.class public final synthetic Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Lcom/trans/SetActivity$PopFragment$1;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcom/trans/SetActivity$PopFragment$1;Ljava/util/List;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;->f$0:Lcom/trans/SetActivity$PopFragment$1;

    iput-object p2, p0, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;->f$1:Ljava/util/List;

    iput p3, p0, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 3

    iget-object v0, p0, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;->f$0:Lcom/trans/SetActivity$PopFragment$1;

    iget-object v1, p0, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;->f$1:Ljava/util/List;

    iget v2, p0, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;->f$2:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/trans/SetActivity$PopFragment$1;->lambda$getView$1$com-trans-SetActivity$PopFragment$1(Ljava/util/List;ILandroid/view/View;)Z

    move-result p1

    return p1
.end method
