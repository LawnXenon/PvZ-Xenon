.class public Lcom/trans/ACPManager;
.super Ljava/lang/Object;
.source "ACPManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trans/ACPManager$RawData;
    }
.end annotation


# static fields
.field public static final MAX_BUFFER:I = 0x19000

.field private static final mInst:Lcom/trans/ACPManager;


# instance fields
.field private mAssets:Landroid/content/res/AssetManager;

.field private mBuffer:Lcom/trans/ACPManager$RawData;

.field private final mFileMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mFileMapReady:Z

.field private mFilename:Ljava/lang/String;

.field private mPrefix:Ljava/lang/String;

.field private mStream:Ljava/io/InputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    new-instance v0, Lcom/trans/ACPManager;

    invoke-direct {v0}, Lcom/trans/ACPManager;-><init>()V

    sput-object v0, Lcom/trans/ACPManager;->mInst:Lcom/trans/ACPManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/trans/ACPManager;->mFileMapReady:Z

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/trans/ACPManager;->mBuffer:Lcom/trans/ACPManager$RawData;

    .line 23
    iput-object v0, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    return-void
.end method

.method public static getInstance()Lcom/trans/ACPManager;
    .locals 1

    .line 29
    sget-object v0, Lcom/trans/ACPManager;->mInst:Lcom/trans/ACPManager;

    return-object v0
.end method


# virtual methods
.method public beginStream(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 210
    iget-object v0, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    if-nez v0, :cond_1

    .line 213
    invoke-virtual {p0, p1}, Lcom/trans/ACPManager;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 214
    iput-object p1, p0, Lcom/trans/ACPManager;->mFilename:Ljava/lang/String;

    .line 216
    :try_start_0
    iget-object v0, p0, Lcom/trans/ACPManager;->mAssets:Landroid/content/res/AssetManager;

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    iput-object p1, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    if-eqz p1, :cond_0

    .line 217
    iget-object p1, p0, Lcom/trans/ACPManager;->mBuffer:Lcom/trans/ACPManager$RawData;

    if-nez p1, :cond_0

    .line 218
    new-instance p1, Lcom/trans/ACPManager$RawData;

    invoke-direct {p1}, Lcom/trans/ACPManager$RawData;-><init>()V

    iput-object p1, p0, Lcom/trans/ACPManager;->mBuffer:Lcom/trans/ACPManager$RawData;

    const v0, 0x19000

    new-array v0, v0, [B

    .line 219
    iput-object v0, p1, Lcom/trans/ACPManager$RawData;->data:[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void

    .line 211
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "beginStream called while another stream is still open"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public canonicalPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 111
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 112
    array-length v1, v0

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    return-object p1

    .line 115
    :cond_0
    array-length p1, v0

    const/4 v1, 0x1

    sub-int/2addr p1, v1

    aget-object p1, v0, p1

    .line 116
    array-length v2, v0

    add-int/lit8 v2, v2, -0x2

    :goto_0
    if-ltz v2, :cond_3

    .line 118
    aget-object v3, v0, v2

    const-string v4, ".."

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    if-le v2, v1, :cond_1

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 120
    :cond_1
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    aget-object v3, v0, v2

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 121
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v4, v0, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_3
    return-object p1
.end method

.method public endStream()V
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 228
    :try_start_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x0

    .line 231
    iput-object v0, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    :cond_0
    return-void
.end method

.method public getFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 130
    invoke-virtual {p0, p1}, Lcom/trans/ACPManager;->canonicalPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trans/ACPManager;->mPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 132
    iget-object v1, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 133
    :try_start_0
    iget-object v2, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 134
    iget-object p1, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_0

    .line 136
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/trans/ACPManager;->mPrefix:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 138
    :goto_0
    monitor-exit v1

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getFileSize(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 167
    :try_start_0
    iget-object v2, p0, Lcom/trans/ACPManager;->mAssets:Landroid/content/res/AssetManager;

    invoke-virtual {p0, p1}, Lcom/trans/ACPManager;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 168
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    if-eqz v1, :cond_0

    .line 183
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 187
    :catch_0
    :cond_0
    throw p1

    :catch_1
    nop

    if-eqz v1, :cond_1

    .line 176
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    :cond_1
    :goto_0
    return v0
.end method

.method public hasFile(Ljava/lang/String;)Z
    .locals 2

    .line 144
    invoke-virtual {p0}, Lcom/trans/ACPManager;->loadFileMap()V

    const/4 v0, 0x0

    .line 147
    :try_start_0
    iget-object v1, p0, Lcom/trans/ACPManager;->mAssets:Landroid/content/res/AssetManager;

    invoke-virtual {p0, p1}, Lcom/trans/ACPManager;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    if-eqz p1, :cond_1

    .line 153
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_1
    return v0
.end method

.method public isFile(Landroid/content/res/AssetManager;Ljava/lang/String;)Z
    .locals 1

    const/4 p1, 0x0

    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/trans/ACPManager;->mAssets:Landroid/content/res/AssetManager;

    invoke-virtual {v0, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p2, :cond_0

    const/4 p1, 0x1

    :cond_0
    if-eqz p2, :cond_1

    .line 42
    :try_start_1
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_1
    return p1
.end method

.method public listdir(Landroid/content/res/AssetManager;Ljava/util/ArrayList;Ljava/lang/String;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/AssetManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const-string v0, "/"

    const/4 v1, 0x0

    .line 54
    :try_start_0
    invoke-virtual {p1, p3}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    return v1

    .line 58
    :cond_0
    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_3

    aget-object v5, v2, v4

    .line 59
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 60
    invoke-virtual {p0, p1, v6}, Lcom/trans/ACPManager;->isFile(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 61
    invoke-virtual {p2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 63
    :cond_1
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_2

    goto :goto_1

    .line 66
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 68
    :goto_1
    invoke-virtual {p0, p1, p2, v5}, Lcom/trans/ACPManager;->listdir(Landroid/content/res/AssetManager;Ljava/util/ArrayList;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, 0x1

    return p1

    :catch_0
    return v1
.end method

.method public loadFileMap()V
    .locals 3

    .line 96
    monitor-enter p0

    .line 97
    :try_start_0
    iget-object v0, p0, Lcom/trans/ACPManager;->mAssets:Landroid/content/res/AssetManager;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/trans/ACPManager;->mPrefix:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-boolean v2, p0, Lcom/trans/ACPManager;->mFileMapReady:Z

    if-nez v2, :cond_0

    .line 98
    invoke-virtual {p0, v0, v1}, Lcom/trans/ACPManager;->setupFileMap(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    .line 100
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 1

    .line 194
    :try_start_0
    iget-object v0, p0, Lcom/trans/ACPManager;->mAssets:Landroid/content/res/AssetManager;

    invoke-virtual {p0, p1}, Lcom/trans/ACPManager;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public readStream()Lcom/trans/ACPManager$RawData;
    .locals 5

    .line 247
    iget-object v0, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 251
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    const v1, 0x19000

    if-le v0, v1, :cond_1

    const v0, 0x19000

    .line 255
    :cond_1
    iget-object v1, p0, Lcom/trans/ACPManager;->mBuffer:Lcom/trans/ACPManager$RawData;

    iget-object v2, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    iget-object v3, v1, Lcom/trans/ACPManager$RawData;->data:[B

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    iput v0, v1, Lcom/trans/ACPManager$RawData;->length:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    :catch_0
    iget-object v0, p0, Lcom/trans/ACPManager;->mBuffer:Lcom/trans/ACPManager$RawData;

    return-object v0
.end method

.method public setAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .locals 0

    .line 104
    iput-object p1, p0, Lcom/trans/ACPManager;->mAssets:Landroid/content/res/AssetManager;

    .line 105
    iput-object p2, p0, Lcom/trans/ACPManager;->mPrefix:Ljava/lang/String;

    const/4 p1, 0x0

    .line 106
    iput-boolean p1, p0, Lcom/trans/ACPManager;->mFileMapReady:Z

    .line 107
    iget-object p1, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public setupFileMap(Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .locals 5

    .line 78
    iget-object v0, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    monitor-enter v0

    .line 79
    :try_start_0
    iget-object v1, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    const/4 v1, 0x1

    .line 80
    iput-boolean v1, p0, Lcom/trans/ACPManager;->mFileMapReady:Z

    .line 82
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    .line 83
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p2, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 85
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 86
    invoke-virtual {p0, p1, v1, p2}, Lcom/trans/ACPManager;->listdir(Landroid/content/res/AssetManager;Ljava/util/ArrayList;Ljava/lang/String;)Z

    .line 87
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v4, p1, :cond_1

    .line 88
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 89
    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    .line 90
    iget-object v2, p0, Lcom/trans/ACPManager;->mFileMap:Ljava/util/HashMap;

    invoke-virtual {v2, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 92
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public skip(I)J
    .locals 5

    .line 236
    iget-object v0, p0, Lcom/trans/ACPManager;->mStream:Ljava/io/InputStream;

    const-wide/16 v1, 0x0

    if-nez v0, :cond_0

    return-wide v1

    :cond_0
    int-to-long v3, p1

    .line 240
    :try_start_0
    invoke-virtual {v0, v3, v4}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    return-wide v1
.end method
