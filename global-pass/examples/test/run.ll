; ModuleID = 'run.ll'
source_filename = "llvm-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

%struct.DataItem = type { i32, i32 }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@_ctr = dso_local global i32 0, align 4
@PTRTRACKER = dso_local global [100 x i8*] zeroinitializer, align 16
@_buf = dso_local global [37 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"\0A!!!Saved by long jump!!!\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"PTR: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"PTR: NULL\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"\0A___Start_Main___\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"\0A---Done with Testing---\0A\00", align 1
@RANDOM_INIT = dso_local global i32 0, align 4
@hashArray = dso_local global [20 x %struct.DataItem*] zeroinitializer, align 16
@dummyItem = dso_local global %struct.DataItem* null, align 8
@t = dso_local global i64 0, align 8
@timeinfo = dso_local global %struct.tm* null, align 8
@RANDOM_UNIT = dso_local global i32 0, align 4
@item = dso_local global %struct.DataItem* null, align 8
@.str.5 = private unnamed_addr constant [9 x i8] c" (%d,%d)\00", align 1
@.str.1.6 = private unnamed_addr constant [5 x i8] c" ~~ \00", align 1
@.str.2.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3.8 = private unnamed_addr constant [19 x i8] c"%d %d %d %d:%d:%d\0A\00", align 1
@.str.4.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5.12 = private unnamed_addr constant [35 x i8] c"___BEFORE INITIALIZING RANDOMS___\0A\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"Random Unintialized Value: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Random initilized Value: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [67 x i8] c"\0ARANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\0A\00", align 1
@.str.9 = private unnamed_addr constant [35 x i8] c"\0A___AFTER INITIALIZING RANDOMS___\0A\00", align 1
@.str.10 = private unnamed_addr constant [37 x i8] c"-----------------------------------\0A\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"Element found: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [19 x i8] c"Element not found\0A\00", align 1
@_ctr_copy = global i32 0, align 4
@PTRTRACKER_copy = global [100 x i8*] zeroinitializer, align 16
@RANDOM_INIT_copy = global i32 0, align 4
@hashArray_copy = global [20 x %struct.DataItem*] zeroinitializer, align 16
@dummyItem_copy = global %struct.DataItem* null, align 8
@t_copy = global i64 0, align 8
@timeinfo_copy = global %struct.tm* null, align 8
@RANDOM_UNIT_copy = global i32 0, align 4
@item_copy = global %struct.DataItem* null, align 8

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i8* @myMalloc(i64 %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call i8* @malloc(i64 %4) #5
  store i8* %5, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = load i32, i32* @_ctr, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %8
  store i8* %6, i8** %9, align 8
  %10 = load i32, i32* @_ctr, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* @_ctr, align 4
  %12 = load i8*, i8** %3, align 8
  ret i8* %12
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @myFree(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i32, i32* @_ctr, align 4
  %4 = add nsw i32 %3, -1
  store i32 %4, i32* @_ctr, align 4
  %5 = load i32, i32* @_ctr, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %6
  store i8* null, i8** %7, align 8
  %8 = load i8*, i8** %2, align 8
  call void @free(i8* %8)
  ret void
}

declare void @free(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %6, align 4
  br label %10

10:                                               ; preds = %95, %2
  %11 = load i32, i32* %6, align 4
  %12 = icmp slt i32 %11, 100
  br i1 %12, label %13, label %98

13:                                               ; preds = %10
  %14 = call i32 @setjmp(i32* getelementptr inbounds ([37 x i32], [37 x i32]* @_buf, i64 0, i64 0)) #6
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %42

16:                                               ; preds = %13
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0))
  store i32 99, i32* %7, align 4
  br label %18

18:                                               ; preds = %38, %16
  %19 = load i32, i32* %7, align 4
  %20 = icmp sge i32 %19, 0
  br i1 %20, label %21, label %41

21:                                               ; preds = %18
  %22 = load i32, i32* %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %23
  %25 = load i8*, i8** %24, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %37

27:                                               ; preds = %21
  %28 = load i32, i32* %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %29
  %31 = load i8*, i8** %30, align 8
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8* %31)
  %33 = load i32, i32* %7, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %34
  %36 = load i8*, i8** %35, align 8
  call void @myFree(i8* %36)
  br label %37

37:                                               ; preds = %27, %21
  br label %38

38:                                               ; preds = %37
  %39 = load i32, i32* %7, align 4
  %40 = add nsw i32 %39, -1
  store i32 %40, i32* %7, align 4
  br label %18, !llvm.loop !3

41:                                               ; preds = %18
  br label %94

42:                                               ; preds = %13
  store i32 99, i32* %8, align 4
  br label %43

43:                                               ; preds = %55, %42
  %44 = load i32, i32* %8, align 4
  %45 = icmp sge i32 %44, 0
  br i1 %45, label %46, label %58

46:                                               ; preds = %43
  %47 = load i32, i32* %8, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %48
  %50 = load i8*, i8** %49, align 8
  %51 = icmp eq i8* %50, null
  br i1 %51, label %52, label %54

52:                                               ; preds = %46
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0))
  br label %54

54:                                               ; preds = %52, %46
  br label %55

55:                                               ; preds = %54
  %56 = load i32, i32* %8, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, i32* %8, align 4
  br label %43, !llvm.loop !5

58:                                               ; preds = %43
  %59 = load %struct.DataItem*, %struct.DataItem** @item_copy, align 8
  store %struct.DataItem* %59, %struct.DataItem** @item, align 8
  %60 = load i32, i32* @RANDOM_UNIT_copy, align 4
  store i32 %60, i32* @RANDOM_UNIT, align 4
  %61 = load %struct.tm*, %struct.tm** @timeinfo_copy, align 8
  store %struct.tm* %61, %struct.tm** @timeinfo, align 8
  %62 = load i64, i64* @t_copy, align 8
  store i64 %62, i64* @t, align 8
  %63 = load %struct.DataItem*, %struct.DataItem** @dummyItem_copy, align 8
  store %struct.DataItem* %63, %struct.DataItem** @dummyItem, align 8
  %64 = load [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray_copy, align 8
  store [20 x %struct.DataItem*] %64, [20 x %struct.DataItem*]* @hashArray, align 8
  %65 = load i32, i32* @RANDOM_INIT_copy, align 4
  store i32 %65, i32* @RANDOM_INIT, align 4
  %66 = load [100 x i8*], [100 x i8*]* @PTRTRACKER_copy, align 8
  store [100 x i8*] %66, [100 x i8*]* @PTRTRACKER, align 8
  %67 = load i32, i32* @_ctr_copy, align 4
  store i32 %67, i32* @_ctr, align 4
  %68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0))
  %69 = call i32 @start_main(i32 %0, i8** %1)
  store i32 99, i32* %9, align 4
  br label %70

70:                                               ; preds = %90, %58
  %71 = load i32, i32* %9, align 4
  %72 = icmp sge i32 %71, 0
  br i1 %72, label %73, label %93

73:                                               ; preds = %70
  %74 = load i32, i32* %9, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %75
  %77 = load i8*, i8** %76, align 8
  %78 = icmp ne i8* %77, null
  br i1 %78, label %79, label %89

79:                                               ; preds = %73
  %80 = load i32, i32* %9, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %81
  %83 = load i8*, i8** %82, align 8
  %84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8* %83)
  %85 = load i32, i32* %9, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %86
  %88 = load i8*, i8** %87, align 8
  call void @myFree(i8* %88)
  br label %89

89:                                               ; preds = %79, %73
  br label %90

90:                                               ; preds = %89
  %91 = load i32, i32* %9, align 4
  %92 = add nsw i32 %91, -1
  store i32 %92, i32* %9, align 4
  br label %70, !llvm.loop !6

93:                                               ; preds = %70
  br label %94

94:                                               ; preds = %93, %41
  br label %95

95:                                               ; preds = %94
  %96 = load i32, i32* %6, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %6, align 4
  br label %10, !llvm.loop !7

98:                                               ; preds = %10
  %99 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: returns_twice
declare i32 @setjmp(i32*) #3

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @hashCode(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = srem i32 %3, 20
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local %struct.DataItem* @search(i32 %0) #0 {
  %2 = alloca %struct.DataItem*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %5 = load i32, i32* %3, align 4
  %6 = call i32 @hashCode(i32 %5)
  store i32 %6, i32* %4, align 4
  br label %7

7:                                                ; preds = %27, %1
  %8 = load i32, i32* %4, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %9
  %11 = load %struct.DataItem*, %struct.DataItem** %10, align 8
  %12 = icmp ne %struct.DataItem* %11, null
  br i1 %12, label %13, label %32

13:                                               ; preds = %7
  %14 = load i32, i32* %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %15
  %17 = load %struct.DataItem*, %struct.DataItem** %16, align 8
  %18 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = load i32, i32* %3, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %22, label %27

22:                                               ; preds = %13
  %23 = load i32, i32* %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %24
  %26 = load %struct.DataItem*, %struct.DataItem** %25, align 8
  store %struct.DataItem* %26, %struct.DataItem** %2, align 8
  br label %33

27:                                               ; preds = %13
  %28 = load i32, i32* %4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %4, align 4
  %30 = load i32, i32* %4, align 4
  %31 = srem i32 %30, 20
  store i32 %31, i32* %4, align 4
  br label %7, !llvm.loop !8

32:                                               ; preds = %7
  store %struct.DataItem* null, %struct.DataItem** %2, align 8
  br label %33

33:                                               ; preds = %32, %22
  %34 = load %struct.DataItem*, %struct.DataItem** %2, align 8
  ret %struct.DataItem* %34
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @insert(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.DataItem*, align 8
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %7 = call i8* @myMalloc(i64 8) #5
  %8 = bitcast i8* %7 to %struct.DataItem*
  store %struct.DataItem* %8, %struct.DataItem** %5, align 8
  %9 = load i32, i32* %4, align 4
  %10 = load %struct.DataItem*, %struct.DataItem** %5, align 8
  %11 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %10, i32 0, i32 0
  store i32 %9, i32* %11, align 4
  %12 = load i32, i32* %3, align 4
  %13 = load %struct.DataItem*, %struct.DataItem** %5, align 8
  %14 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %13, i32 0, i32 1
  store i32 %12, i32* %14, align 4
  %15 = load i32, i32* %3, align 4
  %16 = call i32 @hashCode(i32 %15)
  store i32 %16, i32* %6, align 4
  br label %17

17:                                               ; preds = %33, %2
  %18 = load i32, i32* %6, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %19
  %21 = load %struct.DataItem*, %struct.DataItem** %20, align 8
  %22 = icmp ne %struct.DataItem* %21, null
  br i1 %22, label %23, label %31

23:                                               ; preds = %17
  %24 = load i32, i32* %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %25
  %27 = load %struct.DataItem*, %struct.DataItem** %26, align 8
  %28 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %27, i32 0, i32 1
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, -1
  br label %31

31:                                               ; preds = %23, %17
  %32 = phi i1 [ false, %17 ], [ %30, %23 ]
  br i1 %32, label %33, label %38

33:                                               ; preds = %31
  %34 = load i32, i32* %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %6, align 4
  %36 = load i32, i32* %6, align 4
  %37 = srem i32 %36, 20
  store i32 %37, i32* %6, align 4
  br label %17, !llvm.loop !9

38:                                               ; preds = %31
  %39 = load %struct.DataItem*, %struct.DataItem** %5, align 8
  %40 = load i32, i32* %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %41
  store %struct.DataItem* %39, %struct.DataItem** %42, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local %struct.DataItem* @delete(%struct.DataItem* %0) #0 {
  %2 = alloca %struct.DataItem*, align 8
  %3 = alloca %struct.DataItem*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.DataItem*, align 8
  store %struct.DataItem* %0, %struct.DataItem** %3, align 8
  %7 = load %struct.DataItem*, %struct.DataItem** %3, align 8
  %8 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %7, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %4, align 4
  %10 = load i32, i32* %4, align 4
  %11 = call i32 @hashCode(i32 %10)
  store i32 %11, i32* %5, align 4
  br label %12

12:                                               ; preds = %37, %1
  %13 = load i32, i32* %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %14
  %16 = load %struct.DataItem*, %struct.DataItem** %15, align 8
  %17 = icmp ne %struct.DataItem* %16, null
  br i1 %17, label %18, label %42

18:                                               ; preds = %12
  %19 = load i32, i32* %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %20
  %22 = load %struct.DataItem*, %struct.DataItem** %21, align 8
  %23 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %4, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %37

27:                                               ; preds = %18
  %28 = load i32, i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %29
  %31 = load %struct.DataItem*, %struct.DataItem** %30, align 8
  store %struct.DataItem* %31, %struct.DataItem** %6, align 8
  %32 = load %struct.DataItem*, %struct.DataItem** @dummyItem, align 8
  %33 = load i32, i32* %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %34
  store %struct.DataItem* %32, %struct.DataItem** %35, align 8
  %36 = load %struct.DataItem*, %struct.DataItem** %6, align 8
  store %struct.DataItem* %36, %struct.DataItem** %2, align 8
  br label %43

37:                                               ; preds = %18
  %38 = load i32, i32* %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %5, align 4
  %40 = load i32, i32* %5, align 4
  %41 = srem i32 %40, 20
  store i32 %41, i32* %5, align 4
  br label %12, !llvm.loop !10

42:                                               ; preds = %12
  store %struct.DataItem* null, %struct.DataItem** %2, align 8
  br label %43

43:                                               ; preds = %42, %27
  %44 = load %struct.DataItem*, %struct.DataItem** %2, align 8
  ret %struct.DataItem* %44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @display() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %1, align 4
  br label %2

2:                                                ; preds = %28, %0
  %3 = load i32, i32* %1, align 4
  %4 = icmp slt i32 %3, 20
  br i1 %4, label %5, label %31

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %7
  %9 = load %struct.DataItem*, %struct.DataItem** %8, align 8
  %10 = icmp ne %struct.DataItem* %9, null
  br i1 %10, label %11, label %25

11:                                               ; preds = %5
  %12 = load i32, i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %13
  %15 = load %struct.DataItem*, %struct.DataItem** %14, align 8
  %16 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %15, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %19
  %21 = load %struct.DataItem*, %struct.DataItem** %20, align 8
  %22 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %21, i32 0, i32 0
  %23 = load i32, i32* %22, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), i32 %17, i32 %23)
  br label %27

25:                                               ; preds = %5
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.6, i64 0, i64 0))
  br label %27

27:                                               ; preds = %25, %11
  br label %28

28:                                               ; preds = %27
  %29 = load i32, i32* %1, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %1, align 4
  br label %2, !llvm.loop !11

31:                                               ; preds = %2
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2.7, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @possibleValue() #0 {
  %1 = call i32 @rand()
  %2 = srem i32 %1, 10
  ret i32 %2
}

declare i32 @rand() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @possibleExit() #0 {
  %1 = call i32 @possibleValue()
  %2 = icmp sgt i32 %1, 4
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  call void @longjmp([37 x i32]* @_buf, i32 1)
  call void @exit(i32 0) #7
  unreachable

4:                                                ; preds = %0
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @doStuff() #0 {
  %1 = call i64 @time(i64* @t)
  %2 = call %struct.tm* @localtime(i64* @t)
  store %struct.tm* %2, %struct.tm** @timeinfo, align 8
  %3 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %4 = getelementptr inbounds %struct.tm, %struct.tm* %3, i32 0, i32 3
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %7 = getelementptr inbounds %struct.tm, %struct.tm* %6, i32 0, i32 4
  %8 = load i32, i32* %7, align 8
  %9 = add nsw i32 %8, 1
  %10 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %11 = getelementptr inbounds %struct.tm, %struct.tm* %10, i32 0, i32 5
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %12, 1900
  %14 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %15 = getelementptr inbounds %struct.tm, %struct.tm* %14, i32 0, i32 2
  %16 = load i32, i32* %15, align 8
  %17 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %18 = getelementptr inbounds %struct.tm, %struct.tm* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %21 = getelementptr inbounds %struct.tm, %struct.tm* %20, i32 0, i32 0
  %22 = load i32, i32* %21, align 8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3.8, i64 0, i64 0), i32 %5, i32 %9, i32 %13, i32 %16, i32 %19, i32 %22)
  %24 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %25 = getelementptr inbounds %struct.tm, %struct.tm* %24, i32 0, i32 0
  %26 = load i32, i32* %25, align 8
  %27 = srem i32 %26, 3
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %29, label %30

29:                                               ; preds = %0
  call void @longjmp([37 x i32]* @_buf, i32 1)
  call void @exit(i32 0) #7
  unreachable

30:                                               ; preds = %0
  call void @possibleExit()
  br label %31

31:                                               ; preds = %30
  %32 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %33 = getelementptr inbounds %struct.tm, %struct.tm* %32, i32 0, i32 0
  %34 = load i32, i32* %33, align 8
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4.9, i64 0, i64 0), i32 %34)
  ret void
}

declare i64 @time(i64*) #2

declare %struct.tm* @localtime(i64*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @bigAllocation() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = call i8* @myMalloc(i64 500000000) #5
  store i8* %3, i8** %1, align 8
  store i32 0, i32* %2, align 4
  br label %4

4:                                                ; preds = %14, %0
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %5, 500000000
  br i1 %6, label %7, label %17

7:                                                ; preds = %4
  %8 = load i32, i32* %2, align 4
  %9 = trunc i32 %8 to i8
  %10 = load i8*, i8** %1, align 8
  %11 = load i32, i32* %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, i8* %10, i64 %12
  store i8 %9, i8* %13, align 1
  br label %14

14:                                               ; preds = %7
  %15 = load i32, i32* %2, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %2, align 4
  br label %4, !llvm.loop !12

17:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @start_main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  call void @bigAllocation()
  %6 = call i64 @time(i64* null)
  %7 = trunc i64 %6 to i32
  call void @srand(i32 %7)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5.12, i64 0, i64 0))
  %9 = load i32, i32* @RANDOM_UNIT, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.6, i64 0, i64 0), i32 %9)
  %11 = load i32, i32* @RANDOM_INIT, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i64 0, i64 0), i32 %11)
  %13 = call i32 @rand()
  %14 = srem i32 %13, 10
  store i32 %14, i32* @RANDOM_UNIT, align 4
  %15 = call i32 @rand()
  %16 = srem i32 %15, 10
  store i32 %16, i32* @RANDOM_INIT, align 4
  call void @doStuff()
  %17 = load i32, i32* @RANDOM_UNIT, align 4
  %18 = load i32, i32* @RANDOM_INIT, align 4
  %19 = sub nsw i32 %17, %18
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %2
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.8, i64 0, i64 0))
  call void @longjmp([37 x i32]* @_buf, i32 1)
  call void @exit(i32 0) #7
  unreachable

23:                                               ; preds = %2
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.9, i64 0, i64 0))
  %25 = load i32, i32* @RANDOM_UNIT, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.6, i64 0, i64 0), i32 %25)
  %27 = load i32, i32* @RANDOM_INIT, align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i64 0, i64 0), i32 %27)
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.10, i64 0, i64 0))
  call void @possibleExit()
  %30 = call i8* @myMalloc(i64 8) #5
  %31 = bitcast i8* %30 to %struct.DataItem*
  store %struct.DataItem* %31, %struct.DataItem** @dummyItem, align 8
  %32 = load %struct.DataItem*, %struct.DataItem** @dummyItem, align 8
  %33 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %32, i32 0, i32 0
  store i32 -1, i32* %33, align 4
  %34 = load %struct.DataItem*, %struct.DataItem** @dummyItem, align 8
  %35 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %34, i32 0, i32 1
  store i32 -1, i32* %35, align 4
  call void @insert(i32 1, i32 20)
  call void @insert(i32 2, i32 70)
  call void @insert(i32 42, i32 80)
  call void @insert(i32 4, i32 25)
  call void @insert(i32 12, i32 44)
  call void @insert(i32 14, i32 32)
  call void @insert(i32 17, i32 11)
  call void @insert(i32 13, i32 78)
  call void @insert(i32 37, i32 97)
  call void @display()
  %36 = call %struct.DataItem* @search(i32 37)
  store %struct.DataItem* %36, %struct.DataItem** @item, align 8
  %37 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %38 = icmp ne %struct.DataItem* %37, null
  br i1 %38, label %39, label %44

39:                                               ; preds = %23
  %40 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %41 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %40, i32 0, i32 0
  %42 = load i32, i32* %41, align 4
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.11, i64 0, i64 0), i32 %42)
  br label %46

44:                                               ; preds = %23
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.12, i64 0, i64 0))
  br label %46

46:                                               ; preds = %44, %39
  %47 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %48 = call %struct.DataItem* @delete(%struct.DataItem* %47)
  %49 = call %struct.DataItem* @search(i32 37)
  store %struct.DataItem* %49, %struct.DataItem** @item, align 8
  %50 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %51 = icmp ne %struct.DataItem* %50, null
  br i1 %51, label %52, label %57

52:                                               ; preds = %46
  %53 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %54 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %53, i32 0, i32 0
  %55 = load i32, i32* %54, align 4
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.11, i64 0, i64 0), i32 %55)
  br label %59

57:                                               ; preds = %46
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.12, i64 0, i64 0))
  br label %59

59:                                               ; preds = %57, %52
  ret i32 0
}

declare void @srand(i32) #2

declare void @longjmp([37 x i32]*, i32)

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { allocsize(0) "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { returns_twice "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { allocsize(0) }
attributes #6 = { returns_twice }
attributes #7 = { noreturn }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 12.0.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
!7 = distinct !{!7, !4}
!8 = distinct !{!8, !4}
!9 = distinct !{!9, !4}
!10 = distinct !{!10, !4}
!11 = distinct !{!11, !4}
!12 = distinct !{!12, !4}
