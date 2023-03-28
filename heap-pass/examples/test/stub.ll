; ModuleID = 'stub.bc'
source_filename = "stubMain.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@_ctr = dso_local global i32 0, align 4
@PTRTRACKER = dso_local global [100 x i8*] zeroinitializer, align 16
@_buf = dso_local global [37 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"\0A!!!Saved by long jump!!!\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"PTR: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"PTR: NULL\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"\0A___Start_Main___\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"\0A---Done with Testing---\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i8* @myMalloc(i64 %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call i8* @malloc(i64 %4) #4
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

10:                                               ; preds = %86, %2
  %11 = load i32, i32* %6, align 4
  %12 = icmp slt i32 %11, 10000
  br i1 %12, label %13, label %89

13:                                               ; preds = %10
  %14 = call i32 @setjmp(i32* getelementptr inbounds ([37 x i32], [37 x i32]* @_buf, i64 0, i64 0)) #5
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
  br label %85

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
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0))
  %60 = call i32 @start_main(i32 %0, i8** %1)
  store i32 99, i32* %9, align 4
  br label %61

61:                                               ; preds = %81, %58
  %62 = load i32, i32* %9, align 4
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %84

64:                                               ; preds = %61
  %65 = load i32, i32* %9, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %66
  %68 = load i8*, i8** %67, align 8
  %69 = icmp ne i8* %68, null
  br i1 %69, label %70, label %80

70:                                               ; preds = %64
  %71 = load i32, i32* %9, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %72
  %74 = load i8*, i8** %73, align 8
  %75 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8* %74)
  %76 = load i32, i32* %9, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %77
  %79 = load i8*, i8** %78, align 8
  call void @myFree(i8* %79)
  br label %80

80:                                               ; preds = %70, %64
  br label %81

81:                                               ; preds = %80
  %82 = load i32, i32* %9, align 4
  %83 = add nsw i32 %82, -1
  store i32 %83, i32* %9, align 4
  br label %61, !llvm.loop !6

84:                                               ; preds = %61
  br label %85

85:                                               ; preds = %84, %41
  br label %86

86:                                               ; preds = %85
  %87 = load i32, i32* %6, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %6, align 4
  br label %10, !llvm.loop !7

89:                                               ; preds = %10
  %90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i64 0, i64 0))
  ret i32 0
}
declare i32 @start_main(i32, i8**)
; Function Attrs: returns_twice
declare i32 @setjmp(i32*) #3

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { allocsize(0) "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { returns_twice "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { allocsize(0) }
attributes #5 = { returns_twice }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.0"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
!7 = distinct !{!7, !4}
