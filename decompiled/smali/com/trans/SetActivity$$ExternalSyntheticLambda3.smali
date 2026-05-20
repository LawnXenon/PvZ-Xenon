.class public final synthetic Lcom/trans/SetActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/trans/SetActivity;

.field public final synthetic f$1:Landroid/content/SharedPreferences;

.field public final synthetic f$2:Landroid/widget/NumberPicker;

.field public final synthetic f$3:Landroid/widget/NumberPicker;

.field public final synthetic f$4:Landroid/widget/CheckBox;


# direct methods
.method public synthetic constructor <init>(Lcom/trans/SetActivity;Landroid/content/SharedPreferences;Landroid/widget/NumberPicker;Landroid/widget/NumberPicker;Landroid/widget/CheckBox;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$0:Lcom/trans/SetActivity;

    iput-object p2, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$1:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$2:Landroid/widget/NumberPicker;

    iput-object p4, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$3:Landroid/widget/NumberPicker;

    iput-object p5, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$4:Landroid/widget/CheckBox;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$0:Lcom/trans/SetActivity;

    iget-object v1, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$1:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$2:Landroid/widget/NumberPicker;

    iget-object v3, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$3:Landroid/widget/NumberPicker;

    iget-object v4, p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;->f$4:Landroid/widget/CheckBox;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trans/SetActivity;->lambda$onCreate$1$com-trans-SetActivity(Landroid/content/SharedPreferences;Landroid/widget/NumberPicker;Landroid/widget/NumberPicker;Landroid/widget/CheckBox;Landroid/view/View;)V

    return-void
.end method
