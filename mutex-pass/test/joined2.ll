; ModuleID = 'joined2.bc'
source_filename = "llvm-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@_buf = dso_local global [37 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"\0A!!!Saved by long jump!!!\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"\0A___Start_Main___\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"\0A---Done with Testing---\0A\00", align 1
@RANDOM_INIT = dso_local global i32 0, align 4
@RANDOM_UNIT = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [35 x i8] c"___BEFORE INITIALIZING RANDOMS___\0A\00", align 1
@.str.1.4 = private unnamed_addr constant [31 x i8] c"Random Unintialized Value: %d\0A\00", align 1
@.str.2.5 = private unnamed_addr constant [29 x i8] c"Random initilized Value: %d\0A\00", align 1
@.str.3.6 = private unnamed_addr constant [67 x i8] c"\0ARANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\0A\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"\0A___AFTER INITIALIZING RANDOMS___\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"-----------------------------------\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %6, align 4
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i32, i32* %6, align 4
  %9 = icmp slt i32 %8, 10000
  br i1 %9, label %10, label %22

10:                                               ; preds = %7
  %11 = call i32 @setjmp(i32* getelementptr inbounds ([37 x i32], [37 x i32]* @_buf, i64 0, i64 0)) #4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0))
  br label %18

15:                                               ; preds = %10
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0))
  %17 = call i32 @start_main(i32 %0, i8** %1)
  br label %18

18:                                               ; preds = %15, %13
  br label %19

19:                                               ; preds = %18
  %20 = load i32, i32* %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %6, align 4
  br label %7, !llvm.loop !3

22:                                               ; preds = %7
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: returns_twice
declare i32 @setjmp(i32*) #1

declare i32 @printf(i8*, ...) #2

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
  call void @exit(i32 0) #5
  unreachable

4:                                                ; preds = %0
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @doStuff() #0 {
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
  %6 = call i32 (i8*, ...) bitcast (i32 (...)* @time to i32 (i8*, ...)*)(i8* null)
  call void @srand(i32 %6)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0))
  %8 = load i32, i32* @RANDOM_UNIT, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1.4, i64 0, i64 0), i32 %8)
  %10 = load i32, i32* @RANDOM_INIT, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2.5, i64 0, i64 0), i32 %10)
  %12 = call i32 @rand()
  %13 = srem i32 %12, 10
  store i32 %13, i32* @RANDOM_UNIT, align 4
  %14 = call i32 @rand()
  %15 = srem i32 %14, 10
  store i32 %15, i32* @RANDOM_INIT, align 4
  %16 = load i32, i32* @RANDOM_UNIT, align 4
  %17 = load i32, i32* @RANDOM_INIT, align 4
  %18 = sub nsw i32 %16, %17
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %2
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3.6, i64 0, i64 0))
  call void @exit(i32 0) #5
  unreachable

22:                                               ; preds = %2
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0))
  %24 = load i32, i32* @RANDOM_UNIT, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1.4, i64 0, i64 0), i32 %24)
  %26 = load i32, i32* @RANDOM_INIT, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2.5, i64 0, i64 0), i32 %26)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i64 0, i64 0))
  call void @possibleExit()
  ret i32 0
}

declare i32 @time(...) #2

declare void @srand(i32) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { returns_twice "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { returns_twice }
attributes #5 = { noreturn }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 12.0.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
