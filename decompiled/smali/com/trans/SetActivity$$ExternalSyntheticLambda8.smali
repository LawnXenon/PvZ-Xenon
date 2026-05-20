.class public final synthetic Lcom/trans/SetActivity$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Lcom/trans/SetActivity;

.field public final synthetic f$1:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Lcom/trans/SetActivity;Landroid/content/SharedPreferences;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda8;->f$0:Lcom/trans/SetActivity;

    iput-object p2, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda8;->f$1:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 2

    iget-object v0, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda8;->f$0:Lcom/trans/SetActivity;

    iget-object v1, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda8;->f$1:Landroid/content/SharedPreferences;

    invoke-virtual {v0, v1, p1}, Lcom/trans/SetActivity;->lambda$onCreate$6$com-trans-SetActivity(Landroid/content/SharedPreferences;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
