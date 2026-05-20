.class public Lcom/trans/GameView;
.super Lcom/trans/GLSurfaceView;
.source "GameView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trans/GameView$Renderer;,
        Lcom/trans/GameView$ConfigChooser;,
        Lcom/trans/GameView$ContextFactory;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field protected static final HIDE_GAME:I = 0x104

.field protected static final HIDE_KEYBOARD:I = 0x102

.field protected static final KEYBOARD_EMAIL:I = 0x3

.field protected static final KEYBOARD_NORMAL:I = 0x0

.field protected static final KEYBOARD_PASSWORD:I = 0x1

.field protected static final KEYBOARD_URL:I = 0x2

.field protected static final KEYBOARD_USERNAME:I = 0x4

.field protected static final SHOW_GAME:I = 0x103

.field protected static final SHOW_KEYBOARD:I = 0x101

.field private static final TAG:Ljava/lang/String; = "GameView"


# instance fields
.field private final gameActivity:Lcom/trans/GameActivity;

.field private final heightAs:I

.field mHandler:Landroid/os/Handler;

.field private mTextInputDialog:Landroid/app/AlertDialog;

.field private mTextInputWidget:Landroid/widget/EditText;

.field private renderer:Lcom/trans/GameView$Renderer;

.field private final shiLiuBiJiu:Z

.field private final widthAs:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/trans/GameActivity;)V
    .locals 5

    .line 84
    invoke-direct {p0, p1}, Lcom/trans/GLSurfaceView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 85
    iput-object v0, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    .line 86
    iput-object v0, p0, Lcom/trans/GameView;->mTextInputDialog:Landroid/app/AlertDialog;

    .line 87
    new-instance v0, Lcom/trans/GameView$1;

    invoke-direct {v0, p0}, Lcom/trans/GameView$1;-><init>(Lcom/trans/GameView;)V

    iput-object v0, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    .line 109
    iput-object p2, p0, Lcom/trans/GameView;->gameActivity:Lcom/trans/GameActivity;

    .line 110
    sget-object p2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v0, "google_sdk"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x1

    xor-int/2addr p2, v0

    const/16 v1, 0x10

    .line 111
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/trans/GameView;->init(Landroid/content/Context;ZII)V

    .line 112
    invoke-virtual {p0, v0}, Lcom/trans/GameView;->setFocusable(Z)V

    .line 113
    invoke-virtual {p0, v0}, Lcom/trans/GameView;->setFocusableInTouchMode(Z)V

    const-string p2, "data"

    const/4 v2, 0x0

    .line 114
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "shiLiuBiJiu"

    invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trans/GameView;->shiLiuBiJiu:Z

    .line 115
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, "width"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/trans/GameView;->widthAs:I

    .line 116
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string p2, "height"

    const/16 v0, 0x9

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/trans/GameView;->heightAs:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/trans/GameActivity;ZII)V
    .locals 1

    .line 120
    invoke-direct {p0, p1}, Lcom/trans/GLSurfaceView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 121
    iput-object v0, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    .line 122
    iput-object v0, p0, Lcom/trans/GameView;->mTextInputDialog:Landroid/app/AlertDialog;

    .line 123
    new-instance v0, Lcom/trans/GameView$2;

    invoke-direct {v0, p0}, Lcom/trans/GameView$2;-><init>(Lcom/trans/GameView;)V

    iput-object v0, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    .line 145
    iput-object p2, p0, Lcom/trans/GameView;->gameActivity:Lcom/trans/GameActivity;

    .line 146
    invoke-direct {p0, p1, p3, p4, p5}, Lcom/trans/GameView;->init(Landroid/content/Context;ZII)V

    const/4 p2, 0x1

    .line 147
    invoke-virtual {p0, p2}, Lcom/trans/GameView;->setFocusable(Z)V

    .line 148
    invoke-virtual {p0, p2}, Lcom/trans/GameView;->setFocusableInTouchMode(Z)V

    const-string p3, "data"

    const/4 p4, 0x0

    .line 149
    invoke-virtual {p1, p3, p4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p5

    const-string v0, "shiLiuBiJiu"

    invoke-interface {p5, v0, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/trans/GameView;->shiLiuBiJiu:Z

    .line 150
    invoke-virtual {p1, p3, p4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string p5, "width"

    const/16 v0, 0x10

    invoke-interface {p2, p5, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    iput p2, p0, Lcom/trans/GameView;->widthAs:I

    .line 151
    invoke-virtual {p1, p3, p4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string p2, "height"

    const/16 p3, 0x9

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/trans/GameView;->heightAs:I

    return-void
.end method

.method static synthetic access$000(Lcom/trans/GameView;)Lcom/trans/GameActivity;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/trans/GameView;->gameActivity:Lcom/trans/GameActivity;

    return-object p0
.end method

.method public static checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    .locals 3

    .line 325
    :goto_0
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    .line 327
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    const-string v0, "%s: EGL error: 0x%x"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "GameView"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    return-void
.end method

.method private filterKeyEvent(ZLandroid/view/KeyEvent;)Z
    .locals 8

    .line 783
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v1

    const/16 v4, 0x401

    .line 785
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v3

    .line 786
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v5

    .line 787
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v6

    .line 788
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v7

    .line 789
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "filterKeyEvent: GameJni.filterKeyEvent() i="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " time="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " devid="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " source=1025 keycode="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " keychar="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "GameView"

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v0, p1

    .line 790
    invoke-static/range {v0 .. v7}, Lcom/trans/GameJni;->filterKeyEvent(IJIIIII)Z

    move-result p1

    return p1
.end method

.method private init(Landroid/content/Context;ZII)V
    .locals 15

    move-object v0, p0

    if-eqz p2, :cond_0

    .line 156
    invoke-virtual {p0}, Lcom/trans/GameView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    const/4 v2, -0x3

    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->setFormat(I)V

    goto :goto_0

    .line 158
    :cond_0
    invoke-virtual {p0}, Lcom/trans/GameView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 160
    :goto_0
    new-instance v1, Lcom/trans/GameView$ContextFactory;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/trans/GameView$ContextFactory;-><init>(Lcom/trans/GameView$1;)V

    invoke-virtual {p0, v1}, Lcom/trans/GameView;->setEGLContextFactory(Lcom/trans/GLSurfaceView$EGLContextFactory;)V

    .line 161
    new-instance v1, Lcom/trans/GameView$ConfigChooser;

    if-eqz p2, :cond_1

    const/16 v4, 0x8

    const/16 v5, 0x8

    const/16 v6, 0x8

    const/16 v7, 0x8

    move-object v3, v1

    move/from16 v8, p3

    move/from16 v9, p4

    invoke-direct/range {v3 .. v9}, Lcom/trans/GameView$ConfigChooser;-><init>(IIIIII)V

    goto :goto_1

    :cond_1
    const/4 v9, 0x5

    const/4 v10, 0x6

    const/4 v11, 0x5

    const/4 v12, 0x0

    move-object v8, v1

    move/from16 v13, p3

    move/from16 v14, p4

    invoke-direct/range {v8 .. v14}, Lcom/trans/GameView$ConfigChooser;-><init>(IIIIII)V

    :goto_1
    invoke-virtual {p0, v1}, Lcom/trans/GameView;->setEGLConfigChooser(Lcom/trans/GLSurfaceView$EGLConfigChooser;)V

    .line 162
    new-instance v1, Lcom/trans/GameView$Renderer;

    iget-object v2, v0, Lcom/trans/GameView;->gameActivity:Lcom/trans/GameActivity;

    move-object/from16 v3, p1

    invoke-direct {v1, v3, v2}, Lcom/trans/GameView$Renderer;-><init>(Landroid/content/Context;Lcom/trans/GameActivity;)V

    iput-object v1, v0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    .line 163
    invoke-virtual {p0, v1}, Lcom/trans/GameView;->setRenderer(Lcom/trans/GLSurfaceView$Renderer;)V

    .line 164
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, v0, Lcom/trans/GameView;->gameActivity:Lcom/trans/GameActivity;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    return-void
.end method

.method static synthetic lambda$_showKeyboard$2(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    :goto_0
    if-ge p1, p2, :cond_2

    .line 235
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p3

    invoke-static {p3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p3

    const/16 p4, 0x7f

    if-le p3, p4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    const-string p0, ""

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public _hideKeyboard(Z)V
    .locals 2

    .line 273
    iget-object v0, p0, Lcom/trans/GameView;->mTextInputDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 275
    iput-object v1, p0, Lcom/trans/GameView;->mTextInputDialog:Landroid/app/AlertDialog;

    .line 276
    iput-object v1, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    if-eqz p1, :cond_0

    .line 278
    invoke-interface {v0}, Landroid/content/DialogInterface;->cancel()V

    goto :goto_0

    .line 280
    :cond_0
    invoke-interface {v0}, Landroid/content/DialogInterface;->dismiss()V

    :cond_1
    :goto_0
    return-void
.end method

.method public _show(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    .line 286
    :goto_0
    invoke-virtual {p0, p1}, Lcom/trans/GameView;->setVisibility(I)V

    return-void
.end method

.method public _showKeyboard(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 202
    iget-object v0, p0, Lcom/trans/GameView;->mTextInputDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 203
    iget-object p1, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    invoke-virtual {p1, p3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 204
    iget-object p1, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    invoke-virtual {p1, p4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 205
    iget-object p1, p0, Lcom/trans/GameView;->mTextInputDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void

    .line 208
    :cond_0
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/trans/GameView;->gameActivity:Lcom/trans/GameActivity;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-eq p1, v2, :cond_4

    const/4 v3, 0x2

    if-eq p1, v3, :cond_3

    const/4 v3, 0x3

    if-eq p1, v3, :cond_2

    if-eq p1, v1, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/16 v3, 0x91

    goto :goto_0

    :cond_2
    const/16 v3, 0x21

    goto :goto_0

    :cond_3
    const/16 v3, 0x11

    goto :goto_0

    :cond_4
    const/16 v3, 0x81

    .line 226
    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setInputType(I)V

    if-ne p1, v2, :cond_5

    .line 228
    iget-object v0, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_5
    if-eq p1, v1, :cond_6

    if-ne p1, v2, :cond_7

    .line 233
    :cond_6
    new-instance p1, Lcom/trans/GameView$$ExternalSyntheticLambda4;

    invoke-direct {p1}, Lcom/trans/GameView$$ExternalSyntheticLambda4;-><init>()V

    .line 241
    iget-object v0, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    new-array v1, v2, [Landroid/text/InputFilter;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 243
    :cond_7
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/trans/GameView;->gameActivity:Lcom/trans/GameActivity;

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 244
    iget-object v0, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 245
    iget-object p3, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    invoke-virtual {p3, p4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 246
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 247
    iget-object p2, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 250
    new-instance p2, Lcom/trans/GameView$$ExternalSyntheticLambda5;

    invoke-direct {p2, p0}, Lcom/trans/GameView$$ExternalSyntheticLambda5;-><init>(Lcom/trans/GameView;)V

    const-string p3, "\u786e\u5b9a"

    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 253
    new-instance p2, Lcom/trans/GameView$$ExternalSyntheticLambda6;

    invoke-direct {p2, p0}, Lcom/trans/GameView$$ExternalSyntheticLambda6;-><init>(Lcom/trans/GameView;)V

    const-string p3, "\u8fd4\u56de"

    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 259
    new-instance p2, Lcom/trans/GameView$$ExternalSyntheticLambda7;

    invoke-direct {p2, p0}, Lcom/trans/GameView$$ExternalSyntheticLambda7;-><init>(Lcom/trans/GameView;)V

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 263
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/trans/GameView;->mTextInputDialog:Landroid/app/AlertDialog;

    .line 264
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method public hideKeyboard()V
    .locals 2

    .line 268
    iget-object v0, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x102

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 269
    iget-object v1, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method synthetic lambda$_showKeyboard$3$com-trans-GameView(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 250
    iget-object p1, p0, Lcom/trans/GameView;->mTextInputWidget:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/trans/GameView;->textInput(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$_showKeyboard$4$com-trans-GameView(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 254
    invoke-virtual {p0, p1}, Lcom/trans/GameView;->textInput(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 255
    invoke-virtual {p0, p1}, Lcom/trans/GameView;->_hideKeyboard(Z)V

    return-void
.end method

.method synthetic lambda$_showKeyboard$5$com-trans-GameView(Landroid/content/DialogInterface;)V
    .locals 0

    const/4 p1, 0x0

    .line 260
    invoke-virtual {p0, p1}, Lcom/trans/GameView;->textInput(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 261
    invoke-virtual {p0, p1}, Lcom/trans/GameView;->_hideKeyboard(Z)V

    return-void
.end method

.method synthetic lambda$onConfigurationChanged$11$com-trans-GameView(Landroid/content/res/Configuration;)V
    .locals 1

    .line 839
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0, p1}, Lcom/trans/GameView$Renderer;->handleConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method synthetic lambda$onGenericMotionEvent$10$com-trans-GameView(Landroid/view/MotionEvent;)V
    .locals 1

    .line 828
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0, p1}, Lcom/trans/GameView$Renderer;->handleGenericMotionEvent(Landroid/view/MotionEvent;)V

    return-void
.end method

.method synthetic lambda$onKeyDown$7$com-trans-GameView(ILandroid/view/KeyEvent;)V
    .locals 1

    .line 803
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0, p1, p2}, Lcom/trans/GameView$Renderer;->handleKeyDown(ILandroid/view/KeyEvent;)V

    return-void
.end method

.method synthetic lambda$onKeyUp$8$com-trans-GameView(ILandroid/view/KeyEvent;)V
    .locals 1

    .line 813
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0, p1, p2}, Lcom/trans/GameView$Renderer;->handleKeyUp(ILandroid/view/KeyEvent;)V

    return-void
.end method

.method synthetic lambda$onPause$0$com-trans-GameView()V
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0}, Lcom/trans/GameView$Renderer;->handlePause()V

    return-void
.end method

.method synthetic lambda$onResume$1$com-trans-GameView()V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0}, Lcom/trans/GameView$Renderer;->handleResume()V

    return-void
.end method

.method synthetic lambda$onTouchEvent$9$com-trans-GameView(Landroid/view/MotionEvent;)V
    .locals 1

    .line 821
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0, p1}, Lcom/trans/GameView$Renderer;->handleTouch(Landroid/view/MotionEvent;)V

    return-void
.end method

.method synthetic lambda$stopGame$6$com-trans-GameView()V
    .locals 1

    .line 296
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0}, Lcom/trans/GameView$Renderer;->stopGame()V

    return-void
.end method

.method synthetic lambda$textInput$12$com-trans-GameView(Ljava/lang/String;)V
    .locals 1

    .line 844
    iget-object v0, p0, Lcom/trans/GameView;->renderer:Lcom/trans/GameView$Renderer;

    invoke-virtual {v0, p1}, Lcom/trans/GameView$Renderer;->handleTextInput(Ljava/lang/String;)V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 837
    new-instance v0, Landroid/content/res/Configuration;

    invoke-direct {v0, p1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 839
    new-instance p1, Lcom/trans/GameView$$ExternalSyntheticLambda8;

    invoke-direct {p1, p0, v0}, Lcom/trans/GameView$$ExternalSyntheticLambda8;-><init>(Lcom/trans/GameView;Landroid/content/res/Configuration;)V

    invoke-virtual {p0, p1}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 827
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    .line 828
    new-instance v0, Lcom/trans/GameView$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p1}, Lcom/trans/GameView$$ExternalSyntheticLambda3;-><init>(Lcom/trans/GameView;Landroid/view/MotionEvent;)V

    invoke-virtual {p0, v0}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/16 v0, 0x18

    if-eq p1, v0, :cond_1

    const/16 v0, 0x19

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 802
    :cond_0
    new-instance v0, Landroid/view/KeyEvent;

    invoke-direct {v0, p2}, Landroid/view/KeyEvent;-><init>(Landroid/view/KeyEvent;)V

    .line 803
    new-instance p2, Lcom/trans/GameView$$ExternalSyntheticLambda10;

    invoke-direct {p2, p0, p1, v0}, Lcom/trans/GameView$$ExternalSyntheticLambda10;-><init>(Lcom/trans/GameView;ILandroid/view/KeyEvent;)V

    invoke-virtual {p0, p2}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 812
    new-instance v0, Landroid/view/KeyEvent;

    invoke-direct {v0, p2}, Landroid/view/KeyEvent;-><init>(Landroid/view/KeyEvent;)V

    .line 813
    new-instance p2, Lcom/trans/GameView$$ExternalSyntheticLambda12;

    invoke-direct {p2, p0, p1, v0}, Lcom/trans/GameView$$ExternalSyntheticLambda12;-><init>(Lcom/trans/GameView;ILandroid/view/KeyEvent;)V

    invoke-virtual {p0, p2}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 61
    iget-boolean v0, p0, Lcom/trans/GameView;->shiLiuBiJiu:Z

    if-eqz v0, :cond_1

    .line 62
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 63
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 64
    iget v0, p0, Lcom/trans/GameView;->widthAs:I

    int-to-float v0, v0

    iget v1, p0, Lcom/trans/GameView;->heightAs:I

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

    .line 72
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 74
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 77
    invoke-super {p0, p1, p2}, Lcom/trans/GLSurfaceView;->onMeasure(II)V

    goto :goto_1

    .line 79
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/trans/GLSurfaceView;->onMeasure(II)V

    :goto_1
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 169
    invoke-super {p0}, Lcom/trans/GLSurfaceView;->onPause()V

    const-string v0, "GameView"

    const-string v1, "onPause: "

    .line 170
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    new-instance v0, Lcom/trans/GameView$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0}, Lcom/trans/GameView$$ExternalSyntheticLambda11;-><init>(Lcom/trans/GameView;)V

    invoke-virtual {p0, v0}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 176
    invoke-super {p0}, Lcom/trans/GLSurfaceView;->onResume()V

    const-string v0, "GameView"

    const-string v1, "onResume: "

    .line 177
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    new-instance v0, Lcom/trans/GameView$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/trans/GameView$$ExternalSyntheticLambda1;-><init>(Lcom/trans/GameView;)V

    invoke-virtual {p0, v0}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 0

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 820
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    .line 821
    new-instance v0, Lcom/trans/GameView$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Lcom/trans/GameView$$ExternalSyntheticLambda2;-><init>(Lcom/trans/GameView;Landroid/view/MotionEvent;)V

    invoke-virtual {p0, v0}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 849
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onWindowFocusChanged() GameJni.windowFocusChanged() "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GameView"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 850
    invoke-super {p0, p1}, Lcom/trans/GLSurfaceView;->onWindowFocusChanged(Z)V

    .line 851
    invoke-static {p1}, Lcom/trans/GameJni;->windowFocusChanged(Z)V

    return-void
.end method

.method public show(Z)V
    .locals 1

    .line 290
    iget-object v0, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    const/16 p1, 0x103

    goto :goto_0

    :cond_0
    const/16 p1, 0x104

    :goto_0
    invoke-virtual {v0, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    .line 291
    iget-object v0, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public showKeyboard(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 191
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "mode"

    .line 192
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "title"

    .line 193
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "hint"

    .line 194
    invoke-virtual {v0, p1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "initial"

    .line 195
    invoke-virtual {v0, p1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    iget-object p1, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    const/16 p2, 0x101

    invoke-virtual {p1, p2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    .line 197
    invoke-virtual {p1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 198
    iget-object p2, p0, Lcom/trans/GameView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public stopGame()V
    .locals 2

    const-string v0, "GameView"

    const-string v1, "stopGame: "

    .line 295
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    new-instance v0, Lcom/trans/GameView$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0}, Lcom/trans/GameView$$ExternalSyntheticLambda9;-><init>(Lcom/trans/GameView;)V

    invoke-virtual {p0, v0}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public swapBuffers()V
    .locals 0

    .line 183
    invoke-super {p0}, Lcom/trans/GLSurfaceView;->swapBuffers()V

    return-void
.end method

.method public textInput(Ljava/lang/String;)V
    .locals 1

    .line 844
    new-instance v0, Lcom/trans/GameView$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/trans/GameView$$ExternalSyntheticLambda0;-><init>(Lcom/trans/GameView;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/trans/GameView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public update()V
    .locals 0

    .line 187
    invoke-super {p0}, Lcom/trans/GLSurfaceView;->handleEvents()V

    return-void
.end method
