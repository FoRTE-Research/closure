; ModuleID = 'random_exit.bc'
source_filename = "random_exit.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@RANDOM_INIT = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [35 x i8] c"___BEFORE INITIALIZING RANDOMS___\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"Random Unintialized Value: %d\0A\00", align 1
@RANDOM_UNIT = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [29 x i8] c"Random initilized Value: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [67 x i8] c"\0ARANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\0A\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"\0A___AFTER INITIALIZING RANDOMS___\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"-----------------------------------\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = call i32 (i8*, ...) bitcast (i32 (...)* @time to i32 (i8*, ...)*)(i8* null)
  call void @srand(i32 %6)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0))
  %8 = load i32, i32* @RANDOM_UNIT, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 %8)
  %10 = load i32, i32* @RANDOM_INIT, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i64 0, i64 0), i32 %10)
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
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3, i64 0, i64 0))
  call void @exit(i32 0) #3
  unreachable

22:                                               ; preds = %2
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0))
  %24 = load i32, i32* @RANDOM_UNIT, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 %24)
  %26 = load i32, i32* @RANDOM_INIT, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i64 0, i64 0), i32 %26)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i64 0, i64 0))
  ret i32 0
}

declare void @srand(i32) #1

declare i32 @time(...) #1

declare i32 @printf(i8*, ...) #1

declare i32 @rand() #1

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.0"}
