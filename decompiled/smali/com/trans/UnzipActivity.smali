.class public Lcom/trans/UnzipActivity;
.super Landroid/app/Activity;
.source "UnzipActivity.java"


# instance fields
.field private handler:Landroid/os/Handler;

.field private progressTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/trans/UnzipActivity;II)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/trans/UnzipActivity;->updateProgress(II)V

    return-void
.end method

.method static synthetic access$100(Lcom/trans/UnzipActivity;)Landroid/os/Handler;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/trans/UnzipActivity;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method private updateProgress(II)V
    .locals 2

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u89e3\u538b\u8fdb\u5ea6: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 31
    iget-object p2, p0, Lcom/trans/UnzipActivity;->progressTextView:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 36
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    new-instance p1, Landroid/widget/TextView;

    invoke-direct {p1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/trans/UnzipActivity;->progressTextView:Landroid/widget/TextView;

    const/high16 v0, 0x41800000    # 16.0f

    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 39
    iget-object p1, p0, Lcom/trans/UnzipActivity;->progressTextView:Landroid/widget/TextView;

    const-string v0, "\u51c6\u5907\u89e3\u538b\u6570\u636e\u5305..."

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    iget-object p1, p0, Lcom/trans/UnzipActivity;->progressTextView:Landroid/widget/TextView;

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 41
    iget-object p1, p0, Lcom/trans/UnzipActivity;->progressTextView:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/trans/UnzipActivity;->setContentView(Landroid/view/View;)V

    const-string p1, "\u89e3\u538b\u6570\u636e\u5305\u5f00\u59cb!"

    const/4 v0, 0x0

    .line 42
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 43
    new-instance p1, Lcom/trans/UnzipActivity$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/trans/UnzipActivity$1;-><init>(Lcom/trans/UnzipActivity;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/trans/UnzipActivity;->handler:Landroid/os/Handler;

    .line 51
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/trans/UnzipActivity$2;

    invoke-direct {v0, p0}, Lcom/trans/UnzipActivity$2;-><init>(Lcom/trans/UnzipActivity;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 101
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method
