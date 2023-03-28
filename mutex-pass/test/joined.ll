; ModuleID = 'joined.bc'
source_filename = "llvm-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@_buf = dso_local global [37 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"\0A!!!Saved by long jump!!!\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"\0A___Start_Main___\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"\0A---Done with Testing---\0A\00", align 1
@RANDOM_INIT = dso_local global i32 0, align 4, !dbg !0
@RANDOM_UNIT = dso_local global i32 0, align 4, !dbg !8
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
  %11 = call i32 @setjmp(i32* getelementptr inbounds ([37 x i32], [37 x i32]* @_buf, i64 0, i64 0)) #5
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
  br label %7, !llvm.loop !16

22:                                               ; preds = %7
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: returns_twice
declare i32 @setjmp(i32*) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @start_main(i32 %0, i8** %1) #0 !dbg !18 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !24, metadata !DIExpression()), !dbg !25
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !26, metadata !DIExpression()), !dbg !27
  %6 = call i32 (i8*, ...) bitcast (i32 (...)* @time to i32 (i8*, ...)*)(i8* null), !dbg !28
  call void @srand(i32 %6), !dbg !29
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0)), !dbg !30
  %8 = load i32, i32* @RANDOM_UNIT, align 4, !dbg !31
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1.4, i64 0, i64 0), i32 %8), !dbg !32
  %10 = load i32, i32* @RANDOM_INIT, align 4, !dbg !33
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2.5, i64 0, i64 0), i32 %10), !dbg !34
  %12 = call i32 @rand(), !dbg !35
  %13 = srem i32 %12, 10, !dbg !36
  store i32 %13, i32* @RANDOM_UNIT, align 4, !dbg !37
  %14 = call i32 @rand(), !dbg !38
  %15 = srem i32 %14, 10, !dbg !39
  store i32 %15, i32* @RANDOM_INIT, align 4, !dbg !40
  %16 = load i32, i32* @RANDOM_UNIT, align 4, !dbg !41
  %17 = load i32, i32* @RANDOM_INIT, align 4, !dbg !43
  %18 = sub nsw i32 %16, %17, !dbg !44
  %19 = icmp sgt i32 %18, 0, !dbg !45
  br i1 %19, label %20, label %22, !dbg !46

20:                                               ; preds = %2
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3.6, i64 0, i64 0)), !dbg !47
  call void @exit(i32 0) #6, !dbg !49
  unreachable, !dbg !49

22:                                               ; preds = %2
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0)), !dbg !50
  %24 = load i32, i32* @RANDOM_UNIT, align 4, !dbg !51
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1.4, i64 0, i64 0), i32 %24), !dbg !52
  %26 = load i32, i32* @RANDOM_INIT, align 4, !dbg !53
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2.5, i64 0, i64 0), i32 %26), !dbg !54
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i64 0, i64 0)), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

declare i32 @time(...) #2

declare void @srand(i32) #2

declare i32 @rand() #2

; Function Attrs: noreturn
declare void @exit(i32) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { returns_twice "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { noreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { returns_twice }
attributes #6 = { noreturn }

!llvm.ident = !{!11, !11}
!llvm.module.flags = !{!12, !13, !14, !15}
!llvm.dbg.cu = !{!2}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "RANDOM_INIT", scope: !2, file: !3, line: 5, type: !10, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 12.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!3 = !DIFile(filename: "random_exit.c", directory: "/Users/ianpaterson/Downloads/Grad_Research-main/llvm-pass-renameMain/examples")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "RANDOM_UNIT", scope: !2, file: !3, line: 4, type: !10, isLocal: false, isDefinition: true)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{!"clang version 12.0.0"}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 7, type: !19, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{!10, !10, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocalVariable(name: "argc", arg: 1, scope: !18, file: !3, line: 7, type: !10)
!25 = !DILocation(line: 7, column: 14, scope: !18)
!26 = !DILocalVariable(name: "argv", arg: 2, scope: !18, file: !3, line: 7, type: !21)
!27 = !DILocation(line: 7, column: 26, scope: !18)
!28 = !DILocation(line: 9, column: 11, scope: !18)
!29 = !DILocation(line: 9, column: 5, scope: !18)
!30 = !DILocation(line: 10, column: 5, scope: !18)
!31 = !DILocation(line: 11, column: 47, scope: !18)
!32 = !DILocation(line: 11, column: 5, scope: !18)
!33 = !DILocation(line: 12, column: 45, scope: !18)
!34 = !DILocation(line: 12, column: 5, scope: !18)
!35 = !DILocation(line: 14, column: 19, scope: !18)
!36 = !DILocation(line: 14, column: 26, scope: !18)
!37 = !DILocation(line: 14, column: 17, scope: !18)
!38 = !DILocation(line: 15, column: 19, scope: !18)
!39 = !DILocation(line: 15, column: 26, scope: !18)
!40 = !DILocation(line: 15, column: 17, scope: !18)
!41 = !DILocation(line: 17, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !18, file: !3, line: 17, column: 9)
!43 = !DILocation(line: 17, column: 23, scope: !42)
!44 = !DILocation(line: 17, column: 21, scope: !42)
!45 = !DILocation(line: 17, column: 35, scope: !42)
!46 = !DILocation(line: 17, column: 9, scope: !18)
!47 = !DILocation(line: 19, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !3, line: 18, column: 5)
!49 = !DILocation(line: 20, column: 9, scope: !48)
!50 = !DILocation(line: 22, column: 5, scope: !18)
!51 = !DILocation(line: 23, column: 47, scope: !18)
!52 = !DILocation(line: 23, column: 5, scope: !18)
!53 = !DILocation(line: 24, column: 45, scope: !18)
!54 = !DILocation(line: 24, column: 5, scope: !18)
!55 = !DILocation(line: 25, column: 5, scope: !18)
!56 = !DILocation(line: 28, column: 5, scope: !18)
