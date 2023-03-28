; ModuleID = 'random_exit_renamed.bc'
source_filename = "random_exit.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@RANDOM_INIT = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [35 x i8] c"___BEFORE INITIALIZING RANDOMS___\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"Random Unintialized Value: %d\0A\00", align 1
@RANDOM_UNIT = dso_local global i32 0, align 4, !dbg !8
@.str.2 = private unnamed_addr constant [29 x i8] c"Random initilized Value: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [67 x i8] c"\0ARANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\0A\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"\0A___AFTER INITIALIZING RANDOMS___\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"-----------------------------------\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @start_main(i32 %0, i8** %1) #0 !dbg !16 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !24, metadata !DIExpression()), !dbg !25
  %6 = call i32 (i8*, ...) bitcast (i32 (...)* @time to i32 (i8*, ...)*)(i8* null), !dbg !26
  call void @srand(i32 %6), !dbg !27
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0)), !dbg !28
  %8 = load i32, i32* @RANDOM_UNIT, align 4, !dbg !29
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 %8), !dbg !30
  %10 = load i32, i32* @RANDOM_INIT, align 4, !dbg !31
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i64 0, i64 0), i32 %10), !dbg !32
  %12 = call i32 @rand(), !dbg !33
  %13 = srem i32 %12, 10, !dbg !34
  store i32 %13, i32* @RANDOM_UNIT, align 4, !dbg !35
  %14 = call i32 @rand(), !dbg !36
  %15 = srem i32 %14, 10, !dbg !37
  store i32 %15, i32* @RANDOM_INIT, align 4, !dbg !38
  %16 = load i32, i32* @RANDOM_UNIT, align 4, !dbg !39
  %17 = load i32, i32* @RANDOM_INIT, align 4, !dbg !41
  %18 = sub nsw i32 %16, %17, !dbg !42
  %19 = icmp sgt i32 %18, 0, !dbg !43
  br i1 %19, label %20, label %22, !dbg !44

20:                                               ; preds = %2
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3, i64 0, i64 0)), !dbg !45
  call void @exit(i32 0) #4, !dbg !47
  unreachable, !dbg !47

22:                                               ; preds = %2
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0)), !dbg !48
  %24 = load i32, i32* @RANDOM_UNIT, align 4, !dbg !49
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 %24), !dbg !50
  %26 = load i32, i32* @RANDOM_INIT, align 4, !dbg !51
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i64 0, i64 0), i32 %26), !dbg !52
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32) #2

declare i32 @time(...) #2

declare i32 @printf(i8*, ...) #2

declare i32 @rand() #2

; Function Attrs: noreturn
declare void @exit(i32) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14}
!llvm.ident = !{!15}

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
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 12.0.0"}
!16 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 7, type: !17, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!10, !10, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocalVariable(name: "argc", arg: 1, scope: !16, file: !3, line: 7, type: !10)
!23 = !DILocation(line: 7, column: 14, scope: !16)
!24 = !DILocalVariable(name: "argv", arg: 2, scope: !16, file: !3, line: 7, type: !19)
!25 = !DILocation(line: 7, column: 26, scope: !16)
!26 = !DILocation(line: 9, column: 11, scope: !16)
!27 = !DILocation(line: 9, column: 5, scope: !16)
!28 = !DILocation(line: 10, column: 5, scope: !16)
!29 = !DILocation(line: 11, column: 47, scope: !16)
!30 = !DILocation(line: 11, column: 5, scope: !16)
!31 = !DILocation(line: 12, column: 45, scope: !16)
!32 = !DILocation(line: 12, column: 5, scope: !16)
!33 = !DILocation(line: 14, column: 19, scope: !16)
!34 = !DILocation(line: 14, column: 26, scope: !16)
!35 = !DILocation(line: 14, column: 17, scope: !16)
!36 = !DILocation(line: 15, column: 19, scope: !16)
!37 = !DILocation(line: 15, column: 26, scope: !16)
!38 = !DILocation(line: 15, column: 17, scope: !16)
!39 = !DILocation(line: 17, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !16, file: !3, line: 17, column: 9)
!41 = !DILocation(line: 17, column: 23, scope: !40)
!42 = !DILocation(line: 17, column: 21, scope: !40)
!43 = !DILocation(line: 17, column: 35, scope: !40)
!44 = !DILocation(line: 17, column: 9, scope: !16)
!45 = !DILocation(line: 19, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !3, line: 18, column: 5)
!47 = !DILocation(line: 20, column: 9, scope: !46)
!48 = !DILocation(line: 22, column: 5, scope: !16)
!49 = !DILocation(line: 23, column: 47, scope: !16)
!50 = !DILocation(line: 23, column: 5, scope: !16)
!51 = !DILocation(line: 24, column: 45, scope: !16)
!52 = !DILocation(line: 24, column: 5, scope: !16)
!53 = !DILocation(line: 25, column: 5, scope: !16)
!54 = !DILocation(line: 28, column: 5, scope: !16)
