; ModuleID = 'test2.bc'
source_filename = "stubMain.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@_ctr = dso_local global i32 0, align 4
@PTRTRACKER = dso_local global [100 x i8*] zeroinitializer, align 16
@_buf = dso_local global [37 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"\0A!!!Saved by long jump!!!\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"\0A___Start_Main___\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"\0A---Done with Testing---\0A\00", align 1

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
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %4
  store i8* null, i8** %5, align 8
  %6 = load i32, i32* @_ctr, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, i32* @_ctr, align 4
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
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %34, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 10000
  br i1 %10, label %11, label %37

11:                                               ; preds = %8
  %12 = call i32 @setjmp(i32* getelementptr inbounds ([37 x i32], [37 x i32]* @_buf, i64 0, i64 0)) #5
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %30

14:                                               ; preds = %11
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0))
  %16 = load i32, i32* @_ctr, align 4
  %17 = sub nsw i32 %16, 1
  store i32 %17, i32* %7, align 4
  br label %18

18:                                               ; preds = %26, %14
  %19 = load i32, i32* %7, align 4
  %20 = icmp sge i32 %19, 0
  br i1 %20, label %21, label %29

21:                                               ; preds = %18
  %22 = load i32, i32* %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x i8*], [100 x i8*]* @PTRTRACKER, i64 0, i64 %23
  %25 = load i8*, i8** %24, align 8
  call void @myFree(i8* %25)
  br label %26

26:                                               ; preds = %21
  %27 = load i32, i32* %7, align 4
  %28 = add nsw i32 %27, -1
  store i32 %28, i32* %7, align 4
  br label %18, !llvm.loop !3

29:                                               ; preds = %18
  br label %33

30:                                               ; preds = %11
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0))
  %32 = call i32 @start_main(i32 %0, i8** %1)
  br label %33

33:                                               ; preds = %30, %29
  br label %34

34:                                               ; preds = %33
  %35 = load i32, i32* %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %6, align 4
  br label %8, !llvm.loop !5

37:                                               ; preds = %8
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0))
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
