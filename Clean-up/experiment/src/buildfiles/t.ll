; ModuleID = 'buildfiles/t.bc'
source_filename = "testfiles/test_file_hash.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.StrMap = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [18 x i8] c"hash_untooled.txt\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@sm = common dso_local global %struct.StrMap* null, align 8
@.str.2 = private unnamed_addr constant [5 x i8] c"test\00", align 1
@buf = common dso_local global [255 x i8] zeroinitializer, align 16
@result = common dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %12 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %12, %struct._IO_FILE** %9, align 8
  %13 = call i64 @clock() #4
  store i64 %13, i64* %6, align 8
  %14 = load i32, i32* %4, align 4
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %16, label %51

16:                                               ; preds = %2
  %17 = load i8**, i8*** %5, align 8
  %18 = getelementptr inbounds i8*, i8** %17, i64 1
  %19 = load i8*, i8** %18, align 8
  %20 = call i32 @atoi(i8* %19) #5
  store i32 %20, i32* %10, align 4
  %21 = load i32, i32* %10, align 4
  %22 = call %struct.StrMap* @sm_new(i32 %21)
  store %struct.StrMap* %22, %struct.StrMap** @sm, align 8
  %23 = load %struct.StrMap*, %struct.StrMap** @sm, align 8
  %24 = icmp eq %struct.StrMap* %23, null
  br i1 %24, label %25, label %26

25:                                               ; preds = %16
  br label %26

26:                                               ; preds = %25, %16
  %27 = load i32, i32* %10, align 4
  store i32 %27, i32* %11, align 4
  br label %28

28:                                               ; preds = %46, %26
  %29 = load i32, i32* %11, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %49

31:                                               ; preds = %28
  %32 = load %struct.StrMap*, %struct.StrMap** @sm, align 8
  %33 = load i32, i32* %11, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %34
  %36 = call i32 @sm_put(%struct.StrMap* %32, i8* %35, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0))
  %37 = load %struct.StrMap*, %struct.StrMap** @sm, align 8
  %38 = load i32, i32* %11, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %39
  %41 = call i32 @sm_get(%struct.StrMap* %37, i8* %40, i8* getelementptr inbounds ([255 x i8], [255 x i8]* @buf, i64 0, i64 0), i32 255)
  store i32 %41, i32* @result, align 4
  %42 = load i32, i32* @result, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %31
  br label %45

45:                                               ; preds = %44, %31
  br label %46

46:                                               ; preds = %45
  %47 = load i32, i32* %11, align 4
  %48 = add nsw i32 %47, -1
  store i32 %48, i32* %11, align 4
  br label %28

49:                                               ; preds = %28
  %50 = load %struct.StrMap*, %struct.StrMap** @sm, align 8
  call void @sm_delete(%struct.StrMap* %50)
  br label %51

51:                                               ; preds = %49, %2
  %52 = call i64 @clock() #4
  store i64 %52, i64* %7, align 8
  %53 = load i64, i64* %7, align 8
  %54 = load i64, i64* %6, align 8
  %55 = sub nsw i64 %53, %54
  %56 = sitofp i64 %55 to double
  %57 = fdiv double %56, 1.000000e+06
  store double %57, double* %8, align 8
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %59 = load double, double* %8, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double %59)
  ret i32 0
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare dso_local i64 @clock() #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

declare dso_local %struct.StrMap* @sm_new(i32) #1

declare dso_local i32 @sm_put(%struct.StrMap*, i8*, i8*) #1

declare dso_local i32 @sm_get(%struct.StrMap*, i8*, i8*, i32) #1

declare dso_local void @sm_delete(%struct.StrMap*) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
