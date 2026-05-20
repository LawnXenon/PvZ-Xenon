.class Lcom/trans/GameVideo$MySurfaceView;
.super Landroid/view/SurfaceView;
.source "GameVideo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GameVideo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MySurfaceView"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/GameVideo;


# direct methods
.method public constructor <init>(Lcom/trans/GameVideo;Landroid/content/Context;)V
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/trans/GameVideo$MySurfaceView;->this$0:Lcom/trans/GameVideo;

    .line 76
    invoke-direct {p0, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 4

    .line 53
    iget-object v0, p0, Lcom/trans/GameVideo$MySurfaceView;->this$0:Lcom/trans/GameVideo;

    invoke-static {v0}, Lcom/trans/GameVideo;->access$000(Lcom/trans/GameVideo;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 54
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 55
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 56
    iget-object v0, p0, Lcom/trans/GameVideo$MySurfaceView;->this$0:Lcom/trans/GameVideo;

    invoke-static {v0}, Lcom/trans/GameVideo;->access$100(Lcom/trans/GameVideo;)I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/trans/GameVideo$MySurfaceView;->this$0:Lcom/trans/GameVideo;

    invoke-static {v1}, Lcom/trans/GameVideo;->access$200(Lcom/trans/GameVideo;)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    int-to-float v1, p1

    int-to-float v2, p2

    div-float v3, v1, v2

    cmpl-float v3, v3, v0

    if-lez v3, :cond_0

    mul-float v2, v2, v0

    float-to-int p1, v2

    goto :goto_0

    :cond_0
    div-float/2addr v1, v0

    float-to-int p2, v1

    :goto_0
    const/high16 v0, 0x40000000    # 2.0f

    .line 64
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 66
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 69
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onMeasure(II)V

    goto :goto_1

    .line 71
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onMeasure(II)V

    :goto_1
    return-void
.end method
