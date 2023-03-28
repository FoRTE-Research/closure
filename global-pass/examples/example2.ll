; ModuleID = 'example2.bc'
source_filename = "example2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@a = dso_local global i32 0, align 4, !dbg !0
@b = dso_local global i32 10, align 4, !dbg !9
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !16 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %6, metadata !26, metadata !DIExpression()), !dbg !27
  %8 = call i8* @malloc(i64 64) #5, !dbg !28
  %9 = bitcast i8* %8 to i32*, !dbg !29
  store i32* %9, i32** %6, align 8, !dbg !27
  %10 = load i32*, i32** %6, align 8, !dbg !30
  store i32 5, i32* %10, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %7, metadata !32, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %7, align 4, !dbg !34
  br label %11, !dbg !35

11:                                               ; preds = %20, %2
  %12 = load i32, i32* %7, align 4, !dbg !36
  %13 = icmp slt i32 %12, 10, !dbg !38
  br i1 %13, label %14, label %23, !dbg !39

14:                                               ; preds = %11
  %15 = load i32, i32* %7, align 4, !dbg !40
  %16 = load i32*, i32** %6, align 8, !dbg !42
  %17 = load i32, i32* %7, align 4, !dbg !43
  %18 = sext i32 %17 to i64, !dbg !42
  %19 = getelementptr inbounds i32, i32* %16, i64 %18, !dbg !42
  store i32 %15, i32* %19, align 4, !dbg !44
  br label %20, !dbg !45

20:                                               ; preds = %14
  %21 = load i32, i32* %7, align 4, !dbg !46
  %22 = add nsw i32 %21, 1, !dbg !46
  store i32 %22, i32* %7, align 4, !dbg !46
  br label %11, !dbg !47, !llvm.loop !48

23:                                               ; preds = %11
  %24 = load i32*, i32** %6, align 8, !dbg !51
  %25 = bitcast i32* %24 to i8*, !dbg !51
  call void @free(i8* %25), !dbg !52
  %26 = load i32, i32* @a, align 4, !dbg !53
  %27 = load i32, i32* @b, align 4, !dbg !55
  %28 = icmp slt i32 %26, %27, !dbg !56
  br i1 %28, label %29, label %32, !dbg !57

29:                                               ; preds = %23
  %30 = load i32, i32* @a, align 4, !dbg !58
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %30), !dbg !60
  call void @exit(i32 0) #6, !dbg !61
  unreachable, !dbg !61

32:                                               ; preds = %23
  ret i32 0, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #2

declare void @free(i8*) #3

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn
declare void @exit(i32) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 17, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 12.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!3 = !DIFile(filename: "example2.c", directory: "/Users/ianpaterson/Downloads/Grad_Research-main/llvm-pass-renameMain")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 18, type: !7, isLocal: false, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 12.0.0"}
!16 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 20, type: !17, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!7, !7, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocalVariable(name: "argc", arg: 1, scope: !16, file: !3, line: 20, type: !7)
!23 = !DILocation(line: 20, column: 14, scope: !16)
!24 = !DILocalVariable(name: "argv", arg: 2, scope: !16, file: !3, line: 20, type: !19)
!25 = !DILocation(line: 20, column: 26, scope: !16)
!26 = !DILocalVariable(name: "ptr", scope: !16, file: !3, line: 24, type: !6)
!27 = !DILocation(line: 24, column: 10, scope: !16)
!28 = !DILocation(line: 24, column: 23, scope: !16)
!29 = !DILocation(line: 24, column: 16, scope: !16)
!30 = !DILocation(line: 25, column: 6, scope: !16)
!31 = !DILocation(line: 25, column: 10, scope: !16)
!32 = !DILocalVariable(name: "i", scope: !33, file: !3, line: 26, type: !7)
!33 = distinct !DILexicalBlock(scope: !16, file: !3, line: 26, column: 5)
!34 = !DILocation(line: 26, column: 14, scope: !33)
!35 = !DILocation(line: 26, column: 10, scope: !33)
!36 = !DILocation(line: 26, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 26, column: 5)
!38 = !DILocation(line: 26, column: 23, scope: !37)
!39 = !DILocation(line: 26, column: 5, scope: !33)
!40 = !DILocation(line: 27, column: 18, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !3, line: 26, column: 33)
!42 = !DILocation(line: 27, column: 9, scope: !41)
!43 = !DILocation(line: 27, column: 13, scope: !41)
!44 = !DILocation(line: 27, column: 16, scope: !41)
!45 = !DILocation(line: 28, column: 5, scope: !41)
!46 = !DILocation(line: 26, column: 30, scope: !37)
!47 = !DILocation(line: 26, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 28, column: 5, scope: !33)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 29, column: 10, scope: !16)
!52 = !DILocation(line: 29, column: 5, scope: !16)
!53 = !DILocation(line: 30, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !16, file: !3, line: 30, column: 9)
!55 = !DILocation(line: 30, column: 13, scope: !54)
!56 = !DILocation(line: 30, column: 11, scope: !54)
!57 = !DILocation(line: 30, column: 9, scope: !16)
!58 = !DILocation(line: 32, column: 22, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !3, line: 31, column: 5)
!60 = !DILocation(line: 32, column: 9, scope: !59)
!61 = !DILocation(line: 33, column: 9, scope: !59)
!62 = !DILocation(line: 35, column: 2, scope: !16)
