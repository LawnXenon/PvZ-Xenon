.class public Lcom/trans/SetActivity$PopFragment;
.super Landroid/app/DialogFragment;
.source "SetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/SetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PopFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 213
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreateView$0$com-trans-SetActivity$PopFragment(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 300
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->dismiss()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    .line 219
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 220
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 221
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 233
    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 234
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    const/16 v0, 0xc

    .line 235
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    :cond_0
    const/4 v0, 0x1

    .line 236
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 237
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6

    .line 243
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/trans/SetActivity;->findNumDirs(Ljava/io/File;)Ljava/util/List;

    move-result-object p1

    .line 244
    new-instance p3, Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p3, v0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 245
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 246
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string p2, "\u60a8\u8fd8\u6ca1\u6709\u4efb\u4f55\u5907\u4efd\u7684\u5b58\u6863\u54e6"

    invoke-static {p1, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 247
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance p2, Lcom/trans/SetActivity$PopFragment$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/trans/SetActivity$PopFragment$$ExternalSyntheticLambda0;-><init>(Lcom/trans/SetActivity$PopFragment;)V

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-object p3

    .line 250
    :cond_0
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 251
    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v3, Landroid/graphics/drawable/shapes/RoundRectShape;

    const/16 v4, 0x8

    new-array v4, v4, [F

    const/high16 v5, 0x41a00000    # 20.0f

    mul-float v0, v0, v5

    aput v0, v4, v1

    const/4 v1, 0x1

    aput v0, v4, v1

    const/4 v1, 0x2

    aput v0, v4, v1

    const/4 v1, 0x3

    aput v0, v4, v1

    const/4 v1, 0x4

    aput v0, v4, v1

    const/4 v1, 0x5

    aput v0, v4, v1

    const/4 v1, 0x6

    aput v0, v4, v1

    const/4 v1, 0x7

    aput v0, v4, v1

    invoke-direct {v3, v4, p2, p2}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 252
    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p2

    const v0, -0xbdb3b0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 253
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x10

    if-lt p2, v0, :cond_1

    .line 254
    invoke-virtual {p3, v2}, Landroid/widget/ListView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 257
    :cond_1
    new-instance p2, Lcom/trans/SetActivity$PopFragment$1;

    invoke-direct {p2, p0, p1}, Lcom/trans/SetActivity$PopFragment$1;-><init>(Lcom/trans/SetActivity$PopFragment;Ljava/util/List;)V

    invoke-virtual {p3, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 298
    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    invoke-virtual {p3, p1}, Landroid/widget/ListView;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 299
    new-instance p1, Lcom/trans/SetActivity$PopFragment$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/trans/SetActivity$PopFragment$$ExternalSyntheticLambda1;-><init>(Lcom/trans/SetActivity$PopFragment;)V

    invoke-virtual {p3, p1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-object p3
.end method

.method public onStart()V
    .locals 3

    .line 226
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 227
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/trans/SetActivity$PopFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    add-int/lit16 v1, v1, -0x96

    :goto_0
    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    .line 228
    invoke-super {p0}, Landroid/app/DialogFragment;->onStart()V

    return-void
.end method
