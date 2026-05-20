.class public Lcom/trans/SetActivity;
.super Landroid/app/Activity;
.source "SetActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trans/SetActivity$PopFragment;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static addFolderToZip(Ljava/io/File;Ljava/util/zip/ZipOutputStream;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 445
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    .line 447
    :cond_0
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    aget-object v3, p0, v2

    .line 448
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 449
    invoke-static {v3, p1}, Lcom/trans/SetActivity;->addFolderToZip(Ljava/io/File;Ljava/util/zip/ZipOutputStream;)V

    goto :goto_2

    :cond_1
    const/16 v4, 0x400

    new-array v4, v4, [B

    .line 452
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 453
    new-instance v6, Ljava/util/zip/ZipEntry;

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v6}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 455
    :goto_1
    invoke-virtual {v5, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_2

    .line 456
    invoke-virtual {p1, v4, v1, v3}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_1

    .line 458
    :cond_2
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public static copyDir(Ljava/io/File;Ljava/io/File;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 308
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 309
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 312
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 314
    :cond_1
    array-length v2, v0

    :goto_0
    if-ge v1, v2, :cond_4

    aget-object v3, v0, v1

    .line 315
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 316
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 317
    invoke-static {v4, v5}, Lcom/trans/SetActivity;->copyDir(Ljava/io/File;Ljava/io/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 320
    :cond_2
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 321
    new-instance p0, Ljava/io/FileOutputStream;

    invoke-direct {p0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 p1, 0x400

    new-array p1, p1, [B

    .line 325
    :goto_1
    invoke-virtual {v0, p1}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_3

    .line 326
    invoke-virtual {p0, p1, v1, v2}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_1

    .line 329
    :cond_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 330
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    :cond_4
    return-void
.end method

.method public static deleteRecursive(Ljava/io/File;)V
    .locals 4

    .line 335
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 336
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 339
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 340
    array-length v1, v0

    if-lez v1, :cond_1

    .line 341
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 342
    invoke-static {v3}, Lcom/trans/SetActivity;->deleteRecursive(Ljava/io/File;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 345
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :goto_1
    return-void
.end method

.method public static findNumDirs(Ljava/io/File;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    .line 350
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 351
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 352
    new-instance v1, Lcom/trans/SetActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/trans/SetActivity$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {p0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 356
    array-length v1, p0

    if-lez v1, :cond_1

    .line 358
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 359
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 360
    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    .line 361
    new-instance v3, Landroid/util/Pair;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 362
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 365
    :cond_0
    new-instance p0, Lcom/trans/SetActivity$$ExternalSyntheticLambda1;

    invoke-direct {p0}, Lcom/trans/SetActivity$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_1
    return-object v0
.end method

.method static synthetic lambda$findNumDirs$8(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1

    .line 354
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method static synthetic lambda$findNumDirs$9(Landroid/util/Pair;Landroid/util/Pair;)I
    .locals 0

    .line 365
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Long;

    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p1, p0}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$onCreate$0(Landroid/widget/LinearLayout;Landroid/widget/CompoundButton;Z)V
    .locals 0

    if-eqz p2, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 109
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method static synthetic lambda$onCreate$4(Landroid/content/SharedPreferences;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 137
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "autoBackUp"

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$1$com-trans-SetActivity(Landroid/content/SharedPreferences;Landroid/widget/NumberPicker;Landroid/widget/NumberPicker;Landroid/widget/CheckBox;Landroid/view/View;)V
    .locals 0

    .line 113
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p5, "width"

    invoke-virtual {p2}, Landroid/widget/NumberPicker;->getValue()I

    move-result p2

    invoke-interface {p1, p5, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "height"

    invoke-virtual {p3}, Landroid/widget/NumberPicker;->getValue()I

    move-result p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {p4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    const-string p3, "shiLiuBiJiu"

    invoke-interface {p1, p3, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string p1, "\u4fee\u6539\u6210\u529f"

    const/4 p2, 0x0

    .line 114
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$2$com-trans-SetActivity(Landroid/view/View;)V
    .locals 1

    const-string p1, "\u8bf7\u9009\u62e9zip\u683c\u5f0f\u7684\u5b58\u6863\u6587\u4ef6"

    const/4 v0, 0x0

    .line 120
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 122
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.category.OPENABLE"

    .line 124
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "application/zip"

    .line 125
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0x63

    .line 126
    invoke-virtual {p0, p1, v0}, Lcom/trans/SetActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$onCreate$3$com-trans-SetActivity(Landroid/view/View;)V
    .locals 2

    .line 131
    new-instance p1, Lcom/trans/SetActivity$PopFragment;

    invoke-direct {p1}, Lcom/trans/SetActivity$PopFragment;-><init>()V

    .line 132
    invoke-virtual {p0}, Lcom/trans/SetActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "pop"

    invoke-virtual {p1, v0, v1}, Lcom/trans/SetActivity$PopFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$5$com-trans-SetActivity(Landroid/view/View;)V
    .locals 1

    const-string p1, "\u73b0\u6709\u5b58\u6863\u5c06\u88ab\u8986\u76d6\u3002\n\u957f\u6309\u786e\u8ba4\u5bfc\u5165"

    const/4 v0, 0x0

    .line 143
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$6$com-trans-SetActivity(Landroid/content/SharedPreferences;Landroid/view/View;)Z
    .locals 8

    const-string p2, "isLoaded"

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 146
    :try_start_0
    invoke-virtual {p0}, Lcom/trans/SetActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "userdata.zip"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 148
    new-instance v3, Ljava/io/File;

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/trans/SetActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    const-string v5, "userdata"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 150
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->mkdir()Z

    .line 151
    :cond_0
    new-instance v4, Ljava/util/zip/ZipInputStream;

    invoke-direct {v4, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 153
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    const/16 v6, 0x400

    new-array v6, v6, [B

    :goto_0
    if-eqz v5, :cond_3

    .line 158
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_2

    .line 160
    new-instance v7, Ljava/io/File;

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v7, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    .line 161
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 163
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 165
    :goto_1
    invoke-virtual {v4, v6}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v7

    if-lez v7, :cond_1

    .line 166
    invoke-virtual {v5, v6, v1, v7}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_1

    .line 168
    :cond_1
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 171
    :cond_2
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 172
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    goto :goto_0

    .line 175
    :cond_3
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V

    .line 176
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_4
    const-string v2, "\u6210\u529f\u5bfc\u5165\u5168\u901a\u5173\u5b58\u6863\uff01"

    .line 178
    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 179
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    const-string v3, "\u5bfc\u5165\u5168\u901a\u5173\u5b58\u6863\u5931\u8d25"

    .line 181
    invoke-static {p0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 182
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 183
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    :goto_2
    return v0
.end method

.method synthetic lambda$onCreate$7$com-trans-SetActivity(Landroid/view/View;)V
    .locals 2

    .line 190
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.category.OPENABLE"

    .line 191
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "application/zip"

    .line 193
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "android.intent.extra.TITLE"

    const-string v1, "TV\u7248\u5b58\u6863\u5907\u4efd.zip"

    .line 195
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0x42

    .line 196
    invoke-virtual {p0, p1, v0}, Lcom/trans/SetActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 7

    .line 374
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x42

    const-string v1, "userdata"

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-ne p1, v0, :cond_1

    if-ne p2, v3, :cond_1

    .line 377
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 380
    :try_start_0
    invoke-virtual {p0}, Lcom/trans/SetActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 382
    new-instance v5, Ljava/io/File;

    invoke-virtual {p0, v2}, Lcom/trans/SetActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 383
    new-instance v6, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v6, v0}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 384
    invoke-static {v5, v6}, Lcom/trans/SetActivity;->addFolderToZip(Ljava/io/File;Ljava/util/zip/ZipOutputStream;)V

    .line 385
    invoke-virtual {v6}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 386
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    :cond_0
    const-string v0, "\u6210\u529f\u5bfc\u51fa\u5f53\u524d\u5b58\u6863\uff01"

    .line 388
    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v5, "\u5bfc\u51fa\u5f53\u524d\u5b58\u6863\u5931\u8d25"

    .line 390
    invoke-static {p0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 391
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    :goto_0
    const/16 v0, 0x63

    if-ne p1, v0, :cond_7

    if-ne p2, v3, :cond_7

    .line 398
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 401
    :try_start_1
    invoke-virtual {p0}, Lcom/trans/SetActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 403
    new-instance p2, Ljava/io/File;

    invoke-virtual {p0, v2}, Lcom/trans/SetActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p3

    invoke-direct {p2, p3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 404
    invoke-static {p2}, Lcom/trans/SetActivity;->deleteRecursive(Ljava/io/File;)V

    .line 405
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p3

    if-nez p3, :cond_2

    invoke-virtual {p2}, Ljava/io/File;->mkdir()Z

    .line 406
    :cond_2
    new-instance p3, Ljava/util/zip/ZipInputStream;

    invoke-direct {p3, p1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 408
    invoke-virtual {p3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v0

    const/16 v1, 0x400

    new-array v1, v1, [B

    :goto_1
    if-eqz v0, :cond_5

    .line 413
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_4

    .line 415
    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 416
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 418
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 420
    :goto_2
    invoke-virtual {p3, v1}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_3

    .line 421
    invoke-virtual {v0, v1, v4, v2}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_2

    .line 423
    :cond_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 426
    :cond_4
    invoke-virtual {p3}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 427
    invoke-virtual {p3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v0

    goto :goto_1

    .line 430
    :cond_5
    invoke-virtual {p3}, Ljava/util/zip/ZipInputStream;->close()V

    .line 431
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_6
    const-string p1, "\u6210\u529f\u5bfc\u5165\u5b58\u6863\uff01"

    .line 433
    invoke-static {p0, p1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception p1

    const-string p2, "\u5bfc\u5165\u5b58\u6863\u5931\u8d25"

    .line 435
    invoke-static {p0, p2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 436
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_7
    :goto_3
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 466
    invoke-virtual {p0}, Lcom/trans/SetActivity;->finish()V

    .line 467
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 16

    move-object/from16 v6, p0

    .line 56
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 60
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    const v0, 0x1030128

    .line 61
    invoke-virtual {v6, v0}, Lcom/trans/SetActivity;->setTheme(I)V

    .line 62
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/trans/SetActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 63
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    const/4 v3, 0x0

    if-lt v1, v2, :cond_1

    .line 64
    invoke-virtual {v0, v3}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 65
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_2

    .line 66
    invoke-virtual {v0, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 67
    invoke-virtual {v0, v3}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 69
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/trans/SetActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 71
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_3
    const-string v0, "PvZ TV\u7248\u9644\u52a0\u8bbe\u7f6e"

    .line 75
    invoke-virtual {v6, v0}, Lcom/trans/SetActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 76
    new-instance v7, Landroid/widget/ScrollView;

    invoke-direct {v7, v6}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 77
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x1

    .line 78
    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const-string v0, "data"

    .line 79
    invoke-virtual {v6, v0, v3}, Lcom/trans/SetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 80
    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 v12, 0x11

    .line 81
    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setGravity(I)V

    const-string v0, "\n\u672c\u754c\u9762\u4e5f\u53ef\u4ee5\u5728\u684c\u9762\u957f\u6309\u6e38\u620f\u56fe\u6807\u6765\u542f\u52a8\uff0c\u56e0\u6b64\u60a8\u53ef\u4ee5\u9009\u62e9\u5728\u53f3\u4e0a\u89d2\u70b9\u51fb\"\u9690\u85cf\u684c\u9762\u56fe\u6807\"\u6765\u9690\u85cf\u9644\u52a0\u8bbe\u7f6e\u7684\u684c\u9762\u56fe\u6807\u3002\n\n\u8bf7\u5728\u4e0b\u65b9\u9009\u62e9\u60a8\u60f3\u8981\u7684\u6e38\u620f\u753b\u9762\u6bd4\u4f8b\uff08\u9ed8\u8ba4\u6bd4\u4f8b\u4e3a16:9\uff09\uff0c\u5982\u679c\u60a8\u60f3\u8981\u6e38\u620f\u5168\u5c4f\u663e\u793a\uff0c\u76f4\u63a5\u52fe\u9009\"\u5168\u5c4f\u663e\u793a\u6e38\u620f\u753b\u9762\"\u5373\u53ef\u3002\n"

    .line 82
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v0, 0x41900000    # 18.0f

    .line 83
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 85
    new-instance v13, Landroid/widget/CheckBox;

    invoke-direct {v13, v6}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v1, "\u5168\u5c4f\u663e\u793a\u6e38\u620f\u753b\u9762"

    .line 86
    invoke-virtual {v13, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 87
    invoke-virtual {v13, v0}, Landroid/widget/CheckBox;->setTextSize(F)V

    const-string v0, "shiLiuBiJiu"

    .line 88
    invoke-interface {v10, v0, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/2addr v0, v9

    invoke-virtual {v13, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 89
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    invoke-direct {v0, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 90
    iput v12, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 91
    invoke-virtual {v13, v0}, Landroid/widget/CheckBox;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x3f800000    # 1.0f

    .line 93
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 94
    new-instance v15, Landroid/widget/LinearLayout;

    invoke-direct {v15, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 95
    invoke-virtual {v15, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 96
    new-instance v4, Landroid/widget/NumberPicker;

    invoke-direct {v4, v6}, Landroid/widget/NumberPicker;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x14

    .line 97
    invoke-virtual {v4, v1}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 98
    invoke-virtual {v4, v9}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 99
    invoke-virtual {v4, v0}, Landroid/widget/NumberPicker;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const-string v2, "width"

    const/16 v5, 0x10

    .line 100
    invoke-interface {v10, v2, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 101
    new-instance v5, Landroid/widget/NumberPicker;

    invoke-direct {v5, v6}, Landroid/widget/NumberPicker;-><init>(Landroid/content/Context;)V

    .line 102
    invoke-virtual {v5, v1}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 103
    invoke-virtual {v5, v9}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 104
    invoke-virtual {v5, v0}, Landroid/widget/NumberPicker;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "height"

    const/16 v1, 0x9

    .line 105
    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v5, v0}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 106
    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 107
    invoke-virtual {v15, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 108
    invoke-virtual {v13}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v3, 0x4

    :cond_4
    invoke-virtual {v15, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 109
    new-instance v0, Lcom/trans/SetActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, v15}, Lcom/trans/SetActivity$$ExternalSyntheticLambda2;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v13, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 110
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, v6}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "\u4fdd\u5b58\u753b\u9762\u6bd4\u4f8b"

    .line 111
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 112
    new-instance v2, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;

    move-object v0, v2

    move-object/from16 v1, p0

    move-object v12, v2

    move-object v2, v10

    move-object v14, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v13

    invoke-direct/range {v0 .. v5}, Lcom/trans/SetActivity$$ExternalSyntheticLambda3;-><init>(Lcom/trans/SetActivity;Landroid/content/SharedPreferences;Landroid/widget/NumberPicker;Landroid/widget/NumberPicker;Landroid/widget/CheckBox;)V

    invoke-virtual {v14, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, v6}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "\u4ece\u5916\u90e8\u5bfc\u5165\u5b58\u6863"

    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 119
    new-instance v1, Lcom/trans/SetActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, v6}, Lcom/trans/SetActivity$$ExternalSyntheticLambda4;-><init>(Lcom/trans/SetActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, v6}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "\u4ece\u5907\u4efd\u5bfc\u5165\u5b58\u6863"

    .line 129
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 130
    new-instance v2, Lcom/trans/SetActivity$$ExternalSyntheticLambda5;

    invoke-direct {v2, v6}, Lcom/trans/SetActivity$$ExternalSyntheticLambda5;-><init>(Lcom/trans/SetActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, v6}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v3, "\u81ea\u52a8\u5907\u4efd\u5b58\u6863(\u63a8\u8350\u5f00\u542f\uff0c\u4f1a\u4fdd\u7559\u6700\u8fd120\u6b21\u6e38\u620f\u7684\u5b58\u6863)"

    .line 135
    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const-string v3, "autoBackUp"

    .line 136
    invoke-interface {v10, v3, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 137
    new-instance v3, Lcom/trans/SetActivity$$ExternalSyntheticLambda6;

    invoke-direct {v3, v10}, Lcom/trans/SetActivity$$ExternalSyntheticLambda6;-><init>(Landroid/content/SharedPreferences;)V

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 138
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x11

    .line 139
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 140
    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, v6}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v4, "\u957f\u6309\u6b64\u5904\u5bfc\u5165\u5168\u901a\u5173\u5b58\u6863"

    .line 142
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 143
    new-instance v4, Lcom/trans/SetActivity$$ExternalSyntheticLambda7;

    invoke-direct {v4, v6}, Lcom/trans/SetActivity$$ExternalSyntheticLambda7;-><init>(Lcom/trans/SetActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    new-instance v4, Lcom/trans/SetActivity$$ExternalSyntheticLambda8;

    invoke-direct {v4, v6, v10}, Lcom/trans/SetActivity$$ExternalSyntheticLambda8;-><init>(Lcom/trans/SetActivity;Landroid/content/SharedPreferences;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 187
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, v6}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v5, "\u5bfc\u51fa\u5f53\u524d\u5b58\u6863"

    .line 188
    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 189
    new-instance v5, Lcom/trans/SetActivity$$ExternalSyntheticLambda9;

    invoke-direct {v5, v6}, Lcom/trans/SetActivity$$ExternalSyntheticLambda9;-><init>(Lcom/trans/SetActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    invoke-virtual {v8, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 200
    invoke-virtual {v8, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 201
    invoke-virtual {v8, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 202
    invoke-virtual {v8, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 203
    invoke-virtual {v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 205
    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 206
    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 207
    invoke-virtual {v8, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 208
    invoke-virtual {v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 209
    invoke-virtual {v7, v8}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 210
    invoke-virtual {v6, v7}, Lcom/trans/SetActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    const-string v0, "\u9690\u85cf\u684c\u9762\u56fe\u6807"

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 473
    invoke-interface {p1, v1, v2, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 474
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 475
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 6

    .line 486
    invoke-virtual {p0}, Lcom/trans/SetActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 487
    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/trans/SetActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/trans/SetActivityEntrance;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v1, v3, :cond_0

    .line 488
    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/trans/SetActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-class v4, Lcom/trans/SetActivityEntrance;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    goto :goto_0

    .line 490
    :cond_0
    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/trans/SetActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/trans/SetActivityEntrance;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 491
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 6

    const/4 v0, 0x1

    .line 480
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {p0}, Lcom/trans/SetActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    new-instance v3, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/trans/SetActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/trans/SetActivityEntrance;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 481
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method
