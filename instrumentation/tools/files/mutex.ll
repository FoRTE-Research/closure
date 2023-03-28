; ModuleID = 'mutex'
source_filename = "mutex.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.pthread_mutexattr_t = type { i32 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@tid = dso_local global [2 x i64] zeroinitializer, align 16
@counter = dso_local global i32 0, align 4
@lock = dso_local global %union.pthread_mutex_t zeroinitializer, align 8
@.str = private unnamed_addr constant [22 x i8] c"\0A Job %d has started\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"\0A Job %d has finished\0A\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"\0A mutex init has failed\0A\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"\0AThread can't be created :[%s]\00", align 1

; Function Attrs: noinline optnone uwtable
define dso_local i8* @_Z7trythisPv(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i8* %0, i8** %2, align 8
  %4 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @lock) #4
  store i64 0, i64* %3, align 8
  %5 = load i32, i32* @counter, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* @counter, align 4
  %7 = load i32, i32* @counter, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 %7)
  store i64 0, i64* %3, align 8
  br label %9

9:                                                ; preds = %13, %1
  %10 = load i64, i64* %3, align 8
  %11 = icmp ult i64 %10, 4294967295
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  br label %13

13:                                               ; preds = %12
  %14 = load i64, i64* %3, align 8
  %15 = add i64 %14, 1
  store i64 %15, i64* %3, align 8
  br label %9

16:                                               ; preds = %9
  %17 = load i32, i32* @counter, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i32 %17)
  %19 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @lock) #4
  ret i8* null
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #3 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  %4 = call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* @lock) #4
  %5 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* @lock, %union.pthread_mutexattr_t* null) #4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %0
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i64 0, i64 0))
  store i32 1, i32* %1, align 4
  br label %34

9:                                                ; preds = %0
  br label %10

10:                                               ; preds = %24, %9
  %11 = load i32, i32* %2, align 4
  %12 = icmp slt i32 %11, 2
  br i1 %12, label %13, label %27

13:                                               ; preds = %10
  %14 = load i32, i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [2 x i64], [2 x i64]* @tid, i64 0, i64 %15
  %17 = call i32 @pthread_create(i64* %16, %union.pthread_attr_t* null, i8* (i8*)* @_Z7trythisPv, i8* null) #4
  store i32 %17, i32* %3, align 4
  %18 = load i32, i32* %3, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %13
  %21 = load i32, i32* %3, align 4
  %22 = call i8* @strerror(i32 %21) #4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i64 0, i64 0), i8* %22)
  br label %24

24:                                               ; preds = %20, %13
  %25 = load i32, i32* %2, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %2, align 4
  br label %10

27:                                               ; preds = %10
  %28 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @tid, i64 0, i64 0), align 16
  %29 = call i32 @pthread_join(i64 %28, i8** null)
  %30 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @tid, i64 0, i64 1), align 8
  %31 = call i32 @pthread_join(i64 %30, i8** null)
  %32 = call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* @lock) #4
  %33 = call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* @lock) #4
  store i32 0, i32* %1, align 4
  br label %34

34:                                               ; preds = %27, %7
  %35 = load i32, i32* %1, align 4
  ret i32 %35
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_destroy(%union.pthread_mutex_t*) #1

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #1

; Function Attrs: nounwind
declare !callback !2 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #1

; Function Attrs: nounwind
declare dso_local i8* @strerror(i32) #1

declare dso_local i32 @pthread_join(i64, i8**) #2

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3}
!3 = !{i64 2, i64 3, i1 false}
