.class Lcom/trans/UnzipActivity$2;
.super Ljava/lang/Object;
.source "UnzipActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trans/UnzipActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trans/UnzipActivity;


# direct methods
.method constructor <init>(Lcom/trans/UnzipActivity;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    const-string v0, "files.zip"

    .line 54
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 55
    iget-object v1, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    const-string v2, "data"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/trans/UnzipActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 57
    :try_start_0
    iget-object v2, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-virtual {v2}, Lcom/trans/UnzipActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 58
    new-instance v4, Ljava/util/zip/ZipInputStream;

    invoke-direct {v4, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v2, 0x0

    .line 62
    :goto_0
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    if-eqz v5, :cond_0

    int-to-long v6, v2

    .line 63
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v8

    add-long/2addr v6, v8

    long-to-int v2, v6

    goto :goto_0

    .line 67
    :cond_0
    iget-object v4, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-virtual {v4}, Lcom/trans/UnzipActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 68
    new-instance v4, Ljava/util/zip/ZipInputStream;

    invoke-direct {v4, v0}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 v0, 0x400

    new-array v0, v0, [B

    const/4 v5, 0x0

    .line 74
    :goto_1
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 75
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    .line 76
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v6

    const/4 v8, 0x0

    if-eqz v6, :cond_1

    .line 77
    new-instance v6, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-virtual {v10, v8}, Lcom/trans/UnzipActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    goto :goto_1

    .line 80
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-virtual {v9, v8}, Lcom/trans/UnzipActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 81
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 82
    :goto_2
    invoke-virtual {v4, v0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v6

    const/4 v8, -0x1

    if-eq v6, v8, :cond_2

    .line 83
    invoke-virtual {v7, v0, v3, v6}, Ljava/io/FileOutputStream;->write([BII)V

    add-int/2addr v5, v6

    goto :goto_2

    .line 86
    :cond_2
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 87
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 88
    iget-object v6, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-static {v6}, Lcom/trans/UnzipActivity;->access$100(Lcom/trans/UnzipActivity;)Landroid/os/Handler;

    move-result-object v6

    iget-object v7, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-static {v7}, Lcom/trans/UnzipActivity;->access$100(Lcom/trans/UnzipActivity;)Landroid/os/Handler;

    move-result-object v7

    invoke-virtual {v7, v3, v5, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 91
    :cond_3
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V

    .line 92
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "first"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 93
    iget-object v0, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    const-class v4, Lcom/trans/pvz/GameLauncher;

    invoke-direct {v1, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/trans/UnzipActivity;->startActivity(Landroid/content/Intent;)V

    .line 94
    iget-object v0, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    const-string v1, "\u89e3\u538b\u6570\u636e\u5305\u5b8c\u6210!"

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 96
    iget-object v1, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    const-string v2, "\u89e3\u538b\u6570\u636e\u5305\u5931\u8d25!"

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 97
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 99
    :goto_3
    iget-object v0, p0, Lcom/trans/UnzipActivity$2;->this$0:Lcom/trans/UnzipActivity;

    invoke-virtual {v0}, Lcom/trans/UnzipActivity;->finish()V

    return-void
.end method
