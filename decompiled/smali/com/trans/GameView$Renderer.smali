.class Lcom/trans/GameView$Renderer;
.super Ljava/lang/Object;
.source "GameView.java"

# interfaces
.implements Lcom/trans/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trans/GameView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Renderer"
.end annotation


# static fields
.field public static final ACTION_HOVER_MOVE:I = 0x7

.field public static final ACTION_SCROLL:I = 0x8

.field public static final SOURCE_ANY:I = -0x100

.field public static final SOURCE_CLASS_BUTTON:I = 0x1

.field public static final SOURCE_CLASS_JOYSTICK:I = 0x10

.field public static final SOURCE_CLASS_MASK:I = 0xff

.field public static final SOURCE_CLASS_POINTER:I = 0x2

.field public static final SOURCE_CLASS_POSITION:I = 0x8

.field public static final SOURCE_CLASS_TRACKBALL:I = 0x4

.field public static final SOURCE_DPAD:I = 0x201

.field public static final SOURCE_GAMEPAD:I = 0x401

.field public static final SOURCE_JOYSTICK:I = 0x1000010

.field public static final SOURCE_KEYBOARD:I = 0x101

.field public static final SOURCE_MOUSE:I = 0x2002

.field public static final SOURCE_STYLUS:I = 0x4002

.field public static final SOURCE_TOUCHPAD:I = 0x100008

.field public static final SOURCE_TOUCHSCREEN:I = 0x1002

.field public static final SOURCE_TRACKBALL:I = 0x10004

.field static final TAG:Ljava/lang/String; = "Render"


# instance fields
.field activity:Lcom/trans/GameActivity;

.field ctx:Landroid/content/Context;

.field delayedShutdown:Z

.field rendering:Z

.field shutdown:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/trans/GameActivity;)V
    .locals 1

    .line 444
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 440
    iput-boolean v0, p0, Lcom/trans/GameView$Renderer;->shutdown:Z

    .line 441
    iput-boolean v0, p0, Lcom/trans/GameView$Renderer;->rendering:Z

    .line 442
    iput-boolean v0, p0, Lcom/trans/GameView$Renderer;->delayedShutdown:Z

    .line 445
    iput-object p1, p0, Lcom/trans/GameView$Renderer;->ctx:Landroid/content/Context;

    .line 446
    iput-object p2, p0, Lcom/trans/GameView$Renderer;->activity:Lcom/trans/GameActivity;

    return-void
.end method

.method private checkDataSpace()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method private handlePointerMotionEvent(Landroid/view/MotionEvent;)V
    .locals 28

    move-object/from16 v0, p1

    .line 615
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v12

    .line 616
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v13, v1, 0xff

    .line 617
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v14

    .line 618
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v15

    const/16 v16, 0x0

    const/4 v10, 0x0

    :goto_0
    const-string v9, " devid="

    const-string v8, " action="

    const-string v7, "Render"

    const/16 v17, 0x1

    if-ge v10, v14, :cond_2

    .line 620
    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getHistoricalEventTime(I)J

    move-result-wide v5

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v15, :cond_1

    .line 623
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 624
    invoke-virtual {v0, v3, v10}, Landroid/view/MotionEvent;->getHistoricalX(II)F

    move-result v4

    .line 625
    invoke-virtual {v0, v3, v10}, Landroid/view/MotionEvent;->getHistoricalY(II)F

    move-result v2

    .line 626
    invoke-virtual {v0, v3, v10}, Landroid/view/MotionEvent;->getHistoricalPressure(II)F

    move-result v11

    move/from16 v19, v10

    .line 627
    new-instance v10, Ljava/lang/StringBuilder;

    move/from16 v20, v14

    const-string v14, "handleKeyDown: GameJni.queuePointerEvent() id="

    invoke-direct {v10, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " time="

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " source=1025 x="

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v14, " y="

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v14, " pressure="

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v10, v15, -0x1

    if-ge v3, v10, :cond_0

    const/4 v10, 0x1

    goto :goto_2

    :cond_0
    const/4 v10, 0x0

    :goto_2
    const/16 v14, 0x401

    move/from16 v21, v2

    move v2, v13

    move/from16 v22, v3

    move/from16 v23, v4

    move-wide v3, v5

    move-wide/from16 v24, v5

    move v5, v10

    move v6, v12

    move-object v10, v7

    move v7, v14

    move-object v14, v8

    move/from16 v8, v23

    move-object/from16 v26, v9

    move/from16 v9, v21

    move-object/from16 v27, v10

    move v10, v11

    .line 628
    invoke-static/range {v1 .. v10}, Lcom/trans/GameJni;->queuePointerEvent(IIJIIIFFF)V

    add-int/lit8 v3, v22, 0x1

    move-object v8, v14

    move/from16 v10, v19

    move/from16 v14, v20

    move-wide/from16 v5, v24

    move-object/from16 v9, v26

    move-object/from16 v7, v27

    goto/16 :goto_1

    :cond_1
    move/from16 v19, v10

    move/from16 v20, v14

    add-int/lit8 v10, v19, 0x1

    goto/16 :goto_0

    :cond_2
    move-object/from16 v27, v7

    move-object v14, v8

    move-object/from16 v26, v9

    .line 632
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v10

    .line 633
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const v2, 0xff00

    and-int/2addr v1, v2

    shr-int/lit8 v9, v1, 0x8

    .line 634
    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->getPointerId(I)I

    const/4 v8, 0x0

    :goto_3
    if-ge v8, v15, :cond_5

    .line 637
    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 638
    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    .line 639
    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 640
    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v5

    add-int/lit8 v2, v15, -0x1

    if-ge v8, v2, :cond_3

    const/4 v2, 0x1

    goto :goto_4

    :cond_3
    const/4 v2, 0x0

    :goto_4
    if-ne v9, v8, :cond_4

    or-int/lit8 v2, v2, 0x2

    :cond_4
    move/from16 v19, v2

    .line 645
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "handleKeyDown: GameJni.queuePointerEvent() id2="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " time2="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-object/from16 v3, v26

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " source=1025 x2="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " y2="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " pressure2="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v4, v27

    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v13

    move-object/from16 v20, v3

    move-object/from16 v21, v4

    move-wide v3, v10

    move/from16 v22, v5

    move/from16 v5, v19

    move/from16 v19, v6

    move v6, v12

    move/from16 v23, v7

    const/16 v18, 0x401

    move/from16 v7, v18

    move/from16 v24, v8

    move/from16 v8, v23

    move/from16 v23, v9

    move/from16 v9, v19

    move-wide/from16 v25, v10

    move/from16 v10, v22

    .line 646
    invoke-static/range {v1 .. v10}, Lcom/trans/GameJni;->queuePointerEvent(IIJIIIFFF)V

    add-int/lit8 v8, v24, 0x1

    move-object/from16 v27, v21

    move/from16 v9, v23

    move-wide/from16 v10, v25

    move-object/from16 v26, v20

    goto/16 :goto_3

    :cond_5
    return-void
.end method


# virtual methods
.method public handleConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    .line 775
    iget-object v0, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 776
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 777
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onConfigurationChanged(): GameJni.onConfigurationChanged() touchscreen="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/content/res/Configuration;->touchscreen:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " keyboard="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/content/res/Configuration;->keyboard:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " code="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Render"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 778
    iget v1, p1, Landroid/content/res/Configuration;->touchscreen:I

    iget p1, p1, Landroid/content/res/Configuration;->keyboard:I

    invoke-static {v1, p1, v0}, Lcom/trans/GameJni;->onConfigurationChanged(IILjava/lang/String;)V

    return-void
.end method

.method public handleGenericMotionEvent(Landroid/view/MotionEvent;)V
    .locals 4

    .line 700
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    .line 701
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    and-int/lit8 v2, v0, 0x10

    const/4 v3, 0x2

    if-eqz v2, :cond_0

    if-ne v1, v3, :cond_2

    .line 704
    invoke-virtual {p0, p1}, Lcom/trans/GameView$Renderer;->handleJoyStickMotionEvent(Landroid/view/MotionEvent;)V

    goto :goto_0

    :cond_0
    and-int/2addr v0, v3

    if-eqz v0, :cond_2

    const/4 v0, 0x7

    if-eq v1, v0, :cond_1

    goto :goto_0

    .line 709
    :cond_1
    invoke-direct {p0, p1}, Lcom/trans/GameView$Renderer;->handlePointerMotionEvent(Landroid/view/MotionEvent;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public handleJoyStickMotionEvent(Landroid/view/MotionEvent;)V
    .locals 21

    move-object/from16 v0, p1

    const/16 v7, 0x401

    .line 653
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v8

    .line 654
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v9

    .line 655
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 657
    invoke-virtual {v1}, Landroid/view/InputDevice;->getMotionRanges()Ljava/util/List;

    move-result-object v10

    const/4 v1, 0x0

    const/4 v11, 0x0

    :goto_0
    const-string v12, "handleJoyStickMotionEvent:  GameJni.queueAxisMovedEvent() devid="

    const-string v13, "Render"

    const/16 v14, 0xe

    const/16 v15, 0xb

    if-ge v11, v9, :cond_4

    .line 659
    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getHistoricalEventTime(I)J

    move-result-wide v5

    .line 660
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/InputDevice$MotionRange;

    .line 661
    invoke-virtual {v1}, Landroid/view/InputDevice$MotionRange;->getSource()I

    move-result v2

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_2

    .line 662
    invoke-virtual {v1}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v1

    .line 663
    invoke-virtual {v0, v1, v11}, Landroid/view/MotionEvent;->getHistoricalAxisValue(II)F

    move-result v3

    if-eq v1, v15, :cond_1

    if-eq v1, v14, :cond_0

    move v4, v1

    goto :goto_2

    :cond_0
    const/16 v4, 0xb

    goto :goto_2

    :cond_1
    const/16 v4, 0xe

    .line 672
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " source=1025 time="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " axis="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v13, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v8

    move v2, v7

    move/from16 v17, v3

    move/from16 v18, v4

    move-wide v3, v5

    move-wide/from16 v19, v5

    move/from16 v5, v18

    move/from16 v6, v17

    .line 673
    invoke-static/range {v1 .. v6}, Lcom/trans/GameJni;->queueAxisMovedEvent(IIJIF)V

    goto :goto_3

    :cond_2
    move-wide/from16 v19, v5

    :goto_3
    move-wide/from16 v5, v19

    goto :goto_1

    :cond_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 677
    :cond_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v6

    .line 678
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const v2, 0xff00

    and-int/2addr v1, v2

    shr-int/lit8 v1, v1, 0x8

    .line 679
    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 680
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/InputDevice$MotionRange;

    .line 681
    invoke-virtual {v1}, Landroid/view/InputDevice$MotionRange;->getSource()I

    move-result v2

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_7

    .line 682
    invoke-virtual {v1}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v1

    .line 683
    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v10

    if-eq v1, v15, :cond_6

    if-eq v1, v14, :cond_5

    move v5, v1

    goto :goto_5

    :cond_5
    const/16 v5, 0xb

    goto :goto_5

    :cond_6
    const/16 v5, 0xe

    .line 692
    :goto_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " source=1025 time2="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " axis2="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " value2="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v13, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v2, 0x401

    move v1, v8

    move-wide v3, v6

    move-wide/from16 v16, v6

    move v6, v10

    .line 693
    invoke-static/range {v1 .. v6}, Lcom/trans/GameJni;->queueAxisMovedEvent(IIJIF)V

    goto :goto_6

    :cond_7
    move-wide/from16 v16, v6

    :goto_6
    move-wide/from16 v6, v16

    goto :goto_4

    :cond_8
    return-void
.end method

.method public handleKeyDown(ILandroid/view/KeyEvent;)V
    .locals 8

    .line 514
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v1

    const/16 v4, 0x401

    .line 516
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v3

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    move v5, p1

    goto :goto_0

    :pswitch_1
    const/16 p1, 0xc6

    const/16 v5, 0xc6

    goto :goto_0

    :pswitch_2
    const/16 p1, 0xc3

    const/16 v5, 0xc3

    goto :goto_0

    :pswitch_3
    const/16 p1, 0xc2

    const/16 v5, 0xc2

    goto :goto_0

    :pswitch_4
    const/16 p1, 0xc0

    const/16 v5, 0xc0

    goto :goto_0

    :pswitch_5
    const/16 p1, 0xbf

    const/16 v5, 0xbf

    goto :goto_0

    :pswitch_6
    const/16 p1, 0xbe

    const/16 v5, 0xbe

    goto :goto_0

    :pswitch_7
    const/16 p1, 0xbd

    const/16 v5, 0xbd

    goto :goto_0

    :pswitch_8
    const/16 p1, 0xbc

    const/16 v5, 0xbc

    .line 555
    :goto_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v6

    .line 556
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v7

    .line 557
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "handleKeyDown: GameJni.queueKeyEvent() i=1 time="

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, " devid="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " source=1025 keyCode="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " keychar="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " repeatCount="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Render"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    .line 558
    invoke-static/range {v0 .. v7}, Lcom/trans/GameJni;->queueKeyEvent(IJIIIII)V

    return-void

    :pswitch_data_0
    .packed-switch 0x60
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public handleKeyUp(ILandroid/view/KeyEvent;)V
    .locals 8

    .line 562
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v1

    const/16 v4, 0x401

    .line 564
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v3

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    move v5, p1

    goto :goto_0

    :pswitch_1
    const/16 p1, 0xc6

    const/16 v5, 0xc6

    goto :goto_0

    :pswitch_2
    const/16 p1, 0xc3

    const/16 v5, 0xc3

    goto :goto_0

    :pswitch_3
    const/16 p1, 0xc2

    const/16 v5, 0xc2

    goto :goto_0

    :pswitch_4
    const/16 p1, 0xc0

    const/16 v5, 0xc0

    goto :goto_0

    :pswitch_5
    const/16 p1, 0xbf

    const/16 v5, 0xbf

    goto :goto_0

    :pswitch_6
    const/16 p1, 0xbe

    const/16 v5, 0xbe

    goto :goto_0

    :pswitch_7
    const/16 p1, 0xbd

    const/16 v5, 0xbd

    goto :goto_0

    :pswitch_8
    const/16 p1, 0xbc

    const/16 v5, 0xbc

    .line 607
    :goto_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v6

    .line 608
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v7

    .line 609
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "handleKeyDown: GameJni.queueKeyEvent() i=0 time="

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, " devid="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " source=1025 keyCode="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " keychar="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " repeatCount="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Render"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 610
    invoke-static/range {v0 .. v7}, Lcom/trans/GameJni;->queueKeyEvent(IJIIIII)V

    return-void

    :pswitch_data_0
    .packed-switch 0x60
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public handlePause()V
    .locals 2

    const-string v0, "Render"

    const-string v1, "handlePause: GameJni.pause()"

    .line 763
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    invoke-static {}, Lcom/trans/GameJni;->pause()Z

    move-result v0

    if-nez v0, :cond_0

    .line 765
    invoke-virtual {p0}, Lcom/trans/GameView$Renderer;->stopGame()V

    :cond_0
    return-void
.end method

.method public handleResume()V
    .locals 2

    const-string v0, "Render"

    const-string v1, "handleResume: GameJni.resume()"

    .line 770
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    invoke-static {}, Lcom/trans/GameJni;->resume()Z

    return-void
.end method

.method public handleSensorChanged(Landroid/hardware/Sensor;IIJ[F)V
    .locals 0

    return-void
.end method

.method public handleTextInput(Ljava/lang/String;)V
    .locals 2

    .line 758
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "handleTextInput: GameJni.textInput() text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Render"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 759
    invoke-static {p1}, Lcom/trans/GameJni;->textInput(Ljava/lang/String;)V

    return-void
.end method

.method public handleTouch(Landroid/view/MotionEvent;)V
    .locals 26

    move-object/from16 v0, p1

    .line 718
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    .line 719
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v12

    .line 720
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v13

    const/4 v14, 0x1

    if-eqz v1, :cond_0

    if-eq v1, v14, :cond_0

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    const/4 v2, 0x6

    if-eq v1, v2, :cond_0

    const/4 v2, 0x5

    if-ne v1, v2, :cond_6

    .line 722
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v15

    .line 723
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v11

    const/16 v16, 0x0

    const/4 v10, 0x0

    :goto_0
    const-string v9, " source="

    const-string v8, " devid="

    const-string v7, " action="

    const-string v6, "Render"

    if-ge v10, v12, :cond_3

    .line 725
    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getHistoricalEventTime(I)J

    move-result-wide v4

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v13, :cond_2

    .line 728
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 729
    invoke-virtual {v0, v3, v10}, Landroid/view/MotionEvent;->getHistoricalX(II)F

    move-result v14

    move/from16 v17, v12

    .line 730
    invoke-virtual {v0, v3, v10}, Landroid/view/MotionEvent;->getHistoricalY(II)F

    move-result v12

    move/from16 v18, v13

    .line 731
    invoke-virtual {v0, v3, v10}, Landroid/view/MotionEvent;->getHistoricalPressure(II)F

    move-result v13

    move/from16 v19, v10

    .line 732
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v0, "handleTouch:  GameJni.queuePointerEvent() id="

    invoke-direct {v10, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " time="

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " x="

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " y="

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " pressure="

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v18, -0x1

    if-ge v3, v0, :cond_1

    const/4 v0, 0x1

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    :goto_2
    move/from16 v20, v3

    move v3, v1

    move-wide/from16 v21, v4

    move-object v10, v6

    move v6, v0

    move-object v0, v7

    move v7, v11

    move-object/from16 v23, v8

    move v8, v15

    move/from16 v24, v15

    move-object v15, v9

    move v9, v14

    move-object/from16 v25, v10

    move/from16 v14, v19

    move v10, v12

    move v12, v11

    move v11, v13

    .line 733
    invoke-static/range {v2 .. v11}, Lcom/trans/GameJni;->queuePointerEvent(IIJIIIFFF)V

    add-int/lit8 v3, v20, 0x1

    move-object v7, v0

    move v11, v12

    move v10, v14

    move-object v9, v15

    move/from16 v12, v17

    move/from16 v13, v18

    move-object/from16 v8, v23

    move/from16 v15, v24

    move-object/from16 v6, v25

    const/4 v14, 0x1

    move-object/from16 v0, p1

    goto/16 :goto_1

    :cond_2
    move v14, v10

    move/from16 v17, v12

    move/from16 v18, v13

    move/from16 v24, v15

    move v12, v11

    add-int/lit8 v10, v14, 0x1

    move-object/from16 v0, p1

    move/from16 v12, v17

    const/4 v14, 0x1

    goto/16 :goto_0

    :cond_3
    move-object/from16 v25, v6

    move-object v0, v7

    move-object/from16 v23, v8

    move v12, v11

    move/from16 v18, v13

    move/from16 v24, v15

    move-object v15, v9

    .line 737
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v13

    .line 738
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const v3, 0xff00

    and-int/2addr v2, v3

    shr-int/lit8 v11, v2, 0x8

    move-object/from16 v10, p1

    .line 739
    invoke-virtual {v10, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move/from16 v9, v18

    const/4 v8, 0x0

    :goto_3
    if-ge v8, v9, :cond_6

    .line 742
    invoke-virtual {v10, v8}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 743
    invoke-virtual {v10, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    .line 744
    invoke-virtual {v10, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 745
    invoke-virtual {v10, v8}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v4

    add-int/lit8 v3, v9, -0x1

    if-ge v8, v3, :cond_4

    const/4 v3, 0x1

    goto :goto_4

    :cond_4
    const/4 v3, 0x0

    :goto_4
    if-ne v11, v8, :cond_5

    or-int/lit8 v3, v3, 0x2

    :cond_5
    move/from16 v17, v3

    .line 750
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "handleTouch:  GameJni.queuePointerEvent() id2="

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " time2="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-object/from16 v5, v23

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v18, v0

    move/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " x2="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v5, " y2="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v5, " pressure2="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v5, v25

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v1

    move/from16 v19, v4

    move-object/from16 v21, v5

    move-object/from16 v20, v23

    move-wide v4, v13

    move/from16 v22, v6

    move/from16 v6, v17

    move/from16 v17, v7

    move v7, v12

    move/from16 v23, v8

    move v8, v0

    move/from16 v24, v9

    move/from16 v9, v17

    move/from16 v10, v22

    move/from16 v17, v11

    move/from16 v11, v19

    .line 751
    invoke-static/range {v2 .. v11}, Lcom/trans/GameJni;->queuePointerEvent(IIJIIIFFF)V

    add-int/lit8 v8, v23, 0x1

    move-object/from16 v10, p1

    move/from16 v11, v17

    move-object/from16 v23, v20

    move-object/from16 v25, v21

    move/from16 v9, v24

    move/from16 v24, v0

    move-object/from16 v0, v18

    goto/16 :goto_3

    :cond_6
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2

    .line 451
    iget-boolean p1, p0, Lcom/trans/GameView$Renderer;->shutdown:Z

    if-eqz p1, :cond_0

    const-wide/16 v0, 0xa

    .line 452
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    return-void

    :cond_0
    const/4 p1, 0x1

    .line 455
    iput-boolean p1, p0, Lcom/trans/GameView$Renderer;->rendering:Z

    .line 456
    invoke-static {}, Lcom/trans/GameJni;->render()Z

    move-result p1

    const/4 v0, 0x0

    .line 457
    iput-boolean v0, p0, Lcom/trans/GameView$Renderer;->rendering:Z

    if-eqz p1, :cond_1

    .line 458
    iget-boolean p1, p0, Lcom/trans/GameView$Renderer;->shutdown:Z

    if-eqz p1, :cond_2

    .line 459
    :cond_1
    invoke-virtual {p0}, Lcom/trans/GameView$Renderer;->stopGame()V

    :cond_2
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 10

    .line 489
    iget-object p1, p0, Lcom/trans/GameView$Renderer;->ctx:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    .line 490
    iget-object v0, p0, Lcom/trans/GameView$Renderer;->ctx:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 491
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 494
    :try_start_0
    iget-object v0, p0, Lcom/trans/GameView$Renderer;->activity:Lcom/trans/GameActivity;

    invoke-virtual {v0}, Lcom/trans/GameActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 495
    iget-object v2, p0, Lcom/trans/GameView$Renderer;->activity:Lcom/trans/GameActivity;

    invoke-virtual {v2}, Lcom/trans/GameActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    .line 496
    iget-object v1, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 498
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    :goto_0
    move-object v7, v1

    .line 500
    iget-object v2, p1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    iget-object v3, p1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    iget-object p1, p0, Lcom/trans/GameView$Renderer;->activity:Lcom/trans/GameActivity;

    invoke-virtual {p1}, Lcom/trans/GameActivity;->getView()Lcom/trans/GameView;

    move-result-object v5

    iget-object v6, p0, Lcom/trans/GameView$Renderer;->activity:Lcom/trans/GameActivity;

    move v8, p2

    move v9, p3

    invoke-static/range {v2 .. v9}, Lcom/trans/GameJni;->init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/trans/GameView;Lcom/trans/GameActivity;Landroid/os/Bundle;II)V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    const-string p1, "Render"

    const-string p2, "onSurfaceCreated(): GameJni.surfaceCreated()"

    .line 505
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    invoke-static {}, Lcom/trans/GameJni;->surfaceCreated()V

    return-void
.end method

.method public stopGame()V
    .locals 4

    .line 464
    iget-boolean v0, p0, Lcom/trans/GameView$Renderer;->delayedShutdown:Z

    const-string v1, "stopGame: GameJni.uninit()"

    const-string v2, "Render"

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/trans/GameView$Renderer;->rendering:Z

    if-nez v0, :cond_0

    .line 465
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    invoke-static {}, Lcom/trans/GameJni;->uninit()V

    const/4 v0, 0x0

    .line 467
    iput-boolean v0, p0, Lcom/trans/GameView$Renderer;->delayedShutdown:Z

    .line 469
    :cond_0
    iget-boolean v0, p0, Lcom/trans/GameView$Renderer;->shutdown:Z

    if-nez v0, :cond_2

    const-string v0, "stopGame: GameJni.shutdown()"

    .line 470
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-static {}, Lcom/trans/GameJni;->shutdown()V

    .line 472
    iget-boolean v0, p0, Lcom/trans/GameView$Renderer;->rendering:Z

    const/4 v3, 0x1

    if-nez v0, :cond_1

    .line 473
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    invoke-static {}, Lcom/trans/GameJni;->uninit()V

    goto :goto_0

    .line 476
    :cond_1
    iput-boolean v3, p0, Lcom/trans/GameView$Renderer;->delayedShutdown:Z

    .line 478
    :goto_0
    iget-object v0, p0, Lcom/trans/GameView$Renderer;->activity:Lcom/trans/GameActivity;

    invoke-virtual {v0}, Lcom/trans/GameActivity;->finish()V

    .line 479
    iput-boolean v3, p0, Lcom/trans/GameView$Renderer;->shutdown:Z

    :cond_2
    return-void
.end method
