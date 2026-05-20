.class Lcom/trans/GLSurfaceView$SimpleEGLConfigChooser;
.super Lcom/trans/GLSurfaceView$ComponentSizeChooser;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SimpleEGLConfigChooser"
.end annotation


# instance fields
.field final this$0:Lcom/trans/GLSurfaceView;


# direct methods
.method public constructor <init>(Lcom/trans/GLSurfaceView;Z)V
    .locals 8

    .line 956
    iput-object p1, p0, Lcom/trans/GLSurfaceView$SimpleEGLConfigChooser;->this$0:Lcom/trans/GLSurfaceView;

    if-eqz p2, :cond_0

    const/16 p2, 0x10

    const/16 v6, 0x10

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    const/4 v6, 0x0

    :goto_0
    const/4 v2, 0x5

    const/4 v3, 0x6

    const/4 v4, 0x5

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 957
    invoke-direct/range {v0 .. v7}, Lcom/trans/GLSurfaceView$ComponentSizeChooser;-><init>(Lcom/trans/GLSurfaceView;IIIIII)V

    return-void
.end method
