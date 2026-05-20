.class Lcom/trans/SetActivity$PopFragment$1;
.super Landroid/widget/BaseAdapter;
.source "SetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trans/SetActivity$PopFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/SetActivity$PopFragment;

.field final synthetic val$backupsList:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/trans/SetActivity$PopFragment;Ljava/util/List;)V
    .locals 0

    .line 257
    iput-object p1, p0, Lcom/trans/SetActivity$PopFragment$1;->this$0:Lcom/trans/SetActivity$PopFragment;

    iput-object p2, p0, Lcom/trans/SetActivity$PopFragment$1;->val$backupsList:Ljava/util/List;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/trans/SetActivity$PopFragment$1;->val$backupsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/trans/SetActivity$PopFragment$1;->val$backupsList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 275
    new-instance p2, Landroid/widget/TextView;

    iget-object p3, p0, Lcom/trans/SetActivity$PopFragment$1;->this$0:Lcom/trans/SetActivity$PopFragment;

    invoke-virtual {p3}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 276
    move-object p3, p2

    check-cast p3, Landroid/widget/TextView;

    iget-object p3, p0, Lcom/trans/SetActivity$PopFragment$1;->val$backupsList:Ljava/util/List;

    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/util/Pair;

    iget-object p3, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p3, Ljava/lang/CharSequence;

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p3, 0x11

    .line 277
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setGravity(I)V

    .line 278
    iget-object p3, p0, Lcom/trans/SetActivity$PopFragment$1;->this$0:Lcom/trans/SetActivity$PopFragment;

    invoke-virtual {p3}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    const/4 v0, 0x1

    const/high16 v1, 0x42200000    # 40.0f

    invoke-static {v0, v1, p3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p3

    float-to-int p3, p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setHeight(I)V

    const/high16 p3, 0x41800000    # 16.0f

    .line 279
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p3, -0x1

    .line 280
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 281
    new-instance p3, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda0;

    invoke-direct {p3, p0}, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda0;-><init>(Lcom/trans/SetActivity$PopFragment$1;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    iget-object p3, p0, Lcom/trans/SetActivity$PopFragment$1;->val$backupsList:Ljava/util/List;

    new-instance v0, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p3, p1}, Lcom/trans/SetActivity$PopFragment$1$$ExternalSyntheticLambda1;-><init>(Lcom/trans/SetActivity$PopFragment$1;Ljava/util/List;I)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-object p2
.end method

.method synthetic lambda$getView$0$com-trans-SetActivity$PopFragment$1(Landroid/view/View;)V
    .locals 2

    .line 281
    iget-object p1, p0, Lcom/trans/SetActivity$PopFragment$1;->this$0:Lcom/trans/SetActivity$PopFragment;

    invoke-virtual {p1}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v0, "\u957f\u6309\u5373\u53ef\u6062\u590d\u8fd9\u4e2a\u5b58\u6863"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$getView$1$com-trans-SetActivity$PopFragment$1(Ljava/util/List;ILandroid/view/View;)Z
    .locals 1

    .line 283
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/util/Pair;

    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    .line 284
    new-instance p2, Ljava/io/File;

    iget-object p3, p0, Lcom/trans/SetActivity$PopFragment$1;->this$0:Lcom/trans/SetActivity$PopFragment;

    invoke-virtual {p3}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 285
    new-instance p1, Ljava/io/File;

    iget-object p3, p0, Lcom/trans/SetActivity$PopFragment$1;->this$0:Lcom/trans/SetActivity$PopFragment;

    invoke-virtual {p3}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3, v0}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p3

    const-string v0, "userdata"

    invoke-direct {p1, p3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 286
    invoke-static {p1}, Lcom/trans/SetActivity;->deleteRecursive(Ljava/io/File;)V

    .line 288
    :try_start_0
    invoke-static {p2, p1}, Lcom/trans/SetActivity;->copyDir(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 290
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 292
    :goto_0
    iget-object p1, p0, Lcom/trans/SetActivity$PopFragment$1;->this$0:Lcom/trans/SetActivity$PopFragment;

    invoke-virtual {p1}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string p2, "\u6062\u590d\u5b58\u6863\u6210\u529f"

    const/4 p3, 0x0

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    const/4 p1, 0x1

    return p1
.end method
