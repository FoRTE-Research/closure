; ModuleID = './persistent_demo.c'
source_filename = "./persistent_demo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

$main = comdat any

$sancov.module_ctor_trace_pc_guard = comdat any

@main._A = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [26 x i8] c"##SIG_AFL_DEFER_FORKSRV##\00", align 1
@main._B = internal global i8* null, align 8, !dbg !22
@.str.1 = private unnamed_addr constant [23 x i8] c"##SIG_AFL_PERSISTENT##\00", align 1
@__afl_connected = external dso_local local_unnamed_addr global i32, align 4
@.str.2 = private unnamed_addr constant [5 x i8] c"one\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"two\0A\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"three\0A\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"four\0A\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"five\0A\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"six\0A\00", align 1
@llvm.used = appending global [2 x i8*] [i8* bitcast (i8** @main._A to i8*), i8* bitcast (i8** @main._B to i8*)], section "llvm.metadata"
@__sancov_lowest_stack = external thread_local(initialexec) global i64
@__sancov_gen_ = private global [10 x i32] zeroinitializer, section "__sancov_guards", comdat($main), align 4, !associated !38
@__start___sancov_guards = external hidden global i32*
@__stop___sancov_guards = external hidden global i32*
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 2, void ()* @sancov.module_ctor_trace_pc_guard, i8* bitcast (void ()* @sancov.module_ctor_trace_pc_guard to i8*) }]
@llvm.compiler.used = appending global [1 x i8*] [i8* bitcast ([10 x i32]* @__sancov_gen_ to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) local_unnamed_addr #0 comdat !dbg !2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca [100 x i8], align 16
  %8 = alloca i32, align 4
  call void @__sanitizer_cov_trace_pc_guard(i32* getelementptr inbounds ([10 x i32], [10 x i32]* @__sancov_gen_, i32 0, i32 0)), !dbg !43
  call void asm sideeffect "", ""(), !dbg !43
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4, !tbaa !44
  call void @llvm.dbg.declare(metadata i32* %4, metadata !27, metadata !DIExpression()), !dbg !48
  store i8** %1, i8*** %5, align 8, !tbaa !49
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !28, metadata !DIExpression()), !dbg !51
  %9 = bitcast i64* %6 to i8*, !dbg !52
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #7, !dbg !52
  call void @llvm.dbg.declare(metadata i64* %6, metadata !29, metadata !DIExpression()), !dbg !53
  %10 = bitcast [100 x i8]* %7 to i8*, !dbg !54
  call void @llvm.lifetime.start.p0i8(i64 100, i8* %10) #7, !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %7, metadata !34, metadata !DIExpression()), !dbg !55
  br label %11, !dbg !56

11:                                               ; preds = %2
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0), i8** @main._A, align 8, !dbg !57, !tbaa !49
  call void @__afl_manual_init(), !dbg !57
  br label %12, !dbg !57

12:                                               ; preds = %11
  br label %13, !dbg !57

13:                                               ; preds = %12
  br label %14, !dbg !59

14:                                               ; preds = %29, %13
  store i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i8** @main._B, align 8, !dbg !60, !tbaa !49
  %15 = load i32, i32* @__afl_connected, align 4, !dbg !60, !tbaa !44
  %16 = icmp ne i32 %15, 0, !dbg !60
  %17 = zext i1 %16 to i64, !dbg !60
  %18 = select i1 %16, i32 -1, i32 1, !dbg !60
  %19 = call i32 @__afl_persistent_loop(i32 %18), !dbg !60
  store i32 %19, i32* %8, align 4, !dbg !60, !tbaa !44
  %20 = load i32, i32* %8, align 4, !dbg !60, !tbaa !44
  %21 = icmp ne i32 %20, 0, !dbg !59
  br i1 %21, label %22, label %78, !dbg !59

22:                                               ; preds = %14
  %23 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 0, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %23, i8 0, i64 100, i1 false), !dbg !62
  %24 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 0, !dbg !64
  %25 = call i64 @read(i32 0, i8* %24, i64 100), !dbg !65
  store i64 %25, i64* %6, align 8, !dbg !66, !tbaa !67
  %26 = load i64, i64* %6, align 8, !dbg !69, !tbaa !67
  %27 = icmp slt i64 %26, 8, !dbg !71
  br i1 %27, label %28, label %30, !dbg !72

28:                                               ; preds = %22
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 4) to i32*)), !dbg !73
  call void asm sideeffect "", ""(), !dbg !73
  br label %29, !dbg !73

29:                                               ; preds = %28, %77
  br label %14, !dbg !60, !llvm.loop !74

30:                                               ; preds = %22
  %31 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 0, !dbg !76
  %32 = load i8, i8* %31, align 16, !dbg !76, !tbaa !78
  %33 = sext i8 %32 to i32, !dbg !76
  %34 = icmp eq i32 %33, 102, !dbg !79
  br i1 %34, label %36, label %35, !dbg !80

35:                                               ; preds = %30
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 8) to i32*)), !dbg !80
  call void asm sideeffect "", ""(), !dbg !80
  br label %77, !dbg !80

36:                                               ; preds = %30
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  %38 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 1, !dbg !83
  %39 = load i8, i8* %38, align 1, !dbg !83, !tbaa !78
  %40 = sext i8 %39 to i32, !dbg !83
  %41 = icmp eq i32 %40, 111, !dbg !85
  br i1 %41, label %43, label %42, !dbg !86

42:                                               ; preds = %36
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 12) to i32*)), !dbg !86
  call void asm sideeffect "", ""(), !dbg !86
  br label %76, !dbg !86

43:                                               ; preds = %36
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  %45 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 2, !dbg !89
  %46 = load i8, i8* %45, align 2, !dbg !89, !tbaa !78
  %47 = sext i8 %46 to i32, !dbg !89
  %48 = icmp eq i32 %47, 111, !dbg !91
  br i1 %48, label %50, label %49, !dbg !92

49:                                               ; preds = %43
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 16) to i32*)), !dbg !92
  call void asm sideeffect "", ""(), !dbg !92
  br label %75, !dbg !92

50:                                               ; preds = %43
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  %52 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 3, !dbg !95
  %53 = load i8, i8* %52, align 1, !dbg !95, !tbaa !78
  %54 = sext i8 %53 to i32, !dbg !95
  %55 = icmp eq i32 %54, 33, !dbg !97
  br i1 %55, label %57, label %56, !dbg !98

56:                                               ; preds = %50
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 20) to i32*)), !dbg !98
  call void asm sideeffect "", ""(), !dbg !98
  br label %74, !dbg !98

57:                                               ; preds = %50
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0)), !dbg !99
  %59 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 4, !dbg !101
  %60 = load i8, i8* %59, align 4, !dbg !101, !tbaa !78
  %61 = sext i8 %60 to i32, !dbg !101
  %62 = icmp eq i32 %61, 33, !dbg !103
  br i1 %62, label %64, label %63, !dbg !104

63:                                               ; preds = %57
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 24) to i32*)), !dbg !104
  call void asm sideeffect "", ""(), !dbg !104
  br label %73, !dbg !104

64:                                               ; preds = %57
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0)), !dbg !105
  %66 = getelementptr inbounds [100 x i8], [100 x i8]* %7, i64 0, i64 5, !dbg !107
  %67 = load i8, i8* %66, align 1, !dbg !107, !tbaa !78
  %68 = sext i8 %67 to i32, !dbg !107
  %69 = icmp eq i32 %68, 33, !dbg !109
  br i1 %69, label %70, label %72, !dbg !110

70:                                               ; preds = %64
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 28) to i32*)), !dbg !111
  call void asm sideeffect "", ""(), !dbg !111
  %71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0)), !dbg !111
  call void @abort() #8, !dbg !113
  unreachable, !dbg !113

72:                                               ; preds = %64
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 32) to i32*)), !dbg !114
  call void asm sideeffect "", ""(), !dbg !114
  br label %73, !dbg !114

73:                                               ; preds = %63, %72
  br label %74, !dbg !115

74:                                               ; preds = %56, %73
  br label %75, !dbg !116

75:                                               ; preds = %49, %74
  br label %76, !dbg !117

76:                                               ; preds = %42, %75
  br label %77, !dbg !118

77:                                               ; preds = %35, %76
  br label %29, !dbg !59

78:                                               ; preds = %14
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([10 x i32]* @__sancov_gen_ to i64), i64 36) to i32*)), !dbg !119
  call void asm sideeffect "", ""(), !dbg !119
  %79 = bitcast [100 x i8]* %7 to i8*, !dbg !119
  call void @llvm.lifetime.end.p0i8(i64 100, i8* %79) #7, !dbg !119
  %80 = bitcast i64* %6 to i8*, !dbg !119
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %80) #7, !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare dso_local void @__afl_manual_init() local_unnamed_addr #3

declare dso_local i32 @__afl_persistent_loop(i32) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree
declare !dbg !14 dso_local i64 @read(i32, i8* nocapture, i64) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare dso_local void @abort() local_unnamed_addr #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

declare void @__sanitizer_cov_trace_pc_indir(i64)

declare void @__sanitizer_cov_trace_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_const_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_const_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_const_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_const_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_div4(i32 zeroext)

declare void @__sanitizer_cov_trace_div8(i64)

declare void @__sanitizer_cov_trace_gep(i64)

declare void @__sanitizer_cov_trace_switch(i64, i64*)

declare void @__sanitizer_cov_trace_pc()

declare void @__sanitizer_cov_trace_pc_guard(i32*)

declare void @__sanitizer_cov_trace_pc_guard_init(i32*, i32*)

define internal void @sancov.module_ctor_trace_pc_guard() comdat {
  call void @__sanitizer_cov_trace_pc_guard_init(i32* bitcast (i32** @__start___sancov_guards to i32*), i32* bitcast (i32** @__stop___sancov_guards to i32*))
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!10}
!llvm.module.flags = !{!39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_A", scope: !2, file: !3, line: 50, type: !24, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 39, type: !4, scopeLine: 39, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !10, retainedNodes: !26)
!3 = !DIFile(filename: "./persistent_demo.c", directory: "/home/jack/projects/closure/tests/afl-test")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = distinct !DICompileUnit(language: DW_LANG_C99, file: !11, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !12, retainedTypes: !13, globals: !21, splitDebugInlining: false, nameTableKind: None)
!11 = !DIFile(filename: "persistent_demo.c", directory: "/home/jack/projects/closure/tests/afl-test")
!12 = !{}
!13 = !{!8, !14}
!14 = !DISubprogram(name: "read", scope: !15, file: !15, line: 360, type: !16, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !12)
!15 = !DIFile(filename: "/usr/include/unistd.h", directory: "")
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !6, !19, !20}
!18 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!21 = !{!0, !22}
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "_B", scope: !2, file: !3, line: 51, type: !24, isLocal: true, isDefinition: true)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !9)
!26 = !{!27, !28, !29, !34}
!27 = !DILocalVariable(name: "argc", arg: 1, scope: !2, file: !3, line: 39, type: !6)
!28 = !DILocalVariable(name: "argv", arg: 2, scope: !2, file: !3, line: 39, type: !7)
!29 = !DILocalVariable(name: "len", scope: !2, file: !3, line: 41, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !31, line: 77, baseType: !32)
!31 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !33, line: 193, baseType: !18)
!33 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!34 = !DILocalVariable(name: "buf", scope: !2, file: !3, line: 42, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !{i32 (i32, i8**)* @main}
!39 = !{i32 7, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{!"clang version 10.0.0-4ubuntu1 "}
!43 = !DILocation(line: 39, scope: !2)
!44 = !{!45, !45, i64 0}
!45 = !{!"int", !46, i64 0}
!46 = !{!"omnipotent char", !47, i64 0}
!47 = !{!"Simple C/C++ TBAA"}
!48 = !DILocation(line: 39, column: 14, scope: !2)
!49 = !{!50, !50, i64 0}
!50 = !{!"any pointer", !46, i64 0}
!51 = !DILocation(line: 39, column: 27, scope: !2)
!52 = !DILocation(line: 41, column: 3, scope: !2)
!53 = !DILocation(line: 41, column: 11, scope: !2)
!54 = !DILocation(line: 42, column: 3, scope: !2)
!55 = !DILocation(line: 42, column: 8, scope: !2)
!56 = !DILocation(line: 50, column: 3, scope: !2)
!57 = !DILocation(line: 50, column: 3, scope: !58)
!58 = distinct !DILexicalBlock(scope: !2, file: !3, line: 50, column: 3)
!59 = !DILocation(line: 51, column: 3, scope: !2)
!60 = !DILocation(line: 51, column: 10, scope: !61)
!61 = distinct !DILexicalBlock(scope: !2, file: !3, line: 51, column: 10)
!62 = !DILocation(line: 58, column: 5, scope: !63)
!63 = distinct !DILexicalBlock(scope: !2, file: !3, line: 51, column: 32)
!64 = !DILocation(line: 67, column: 19, scope: !63)
!65 = !DILocation(line: 67, column: 11, scope: !63)
!66 = !DILocation(line: 67, column: 9, scope: !63)
!67 = !{!68, !68, i64 0}
!68 = !{!"long", !46, i64 0}
!69 = !DILocation(line: 73, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !63, file: !3, line: 73, column: 9)
!71 = !DILocation(line: 73, column: 13, scope: !70)
!72 = !DILocation(line: 73, column: 9, scope: !63)
!73 = !DILocation(line: 73, column: 18, scope: !70)
!74 = distinct !{!74, !59, !75}
!75 = !DILocation(line: 109, column: 3, scope: !2)
!76 = !DILocation(line: 75, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !63, file: !3, line: 75, column: 9)
!78 = !{!46, !46, i64 0}
!79 = !DILocation(line: 75, column: 16, scope: !77)
!80 = !DILocation(line: 75, column: 9, scope: !63)
!81 = !DILocation(line: 77, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !3, line: 75, column: 24)
!83 = !DILocation(line: 78, column: 11, scope: !84)
!84 = distinct !DILexicalBlock(scope: !82, file: !3, line: 78, column: 11)
!85 = !DILocation(line: 78, column: 18, scope: !84)
!86 = !DILocation(line: 78, column: 11, scope: !82)
!87 = !DILocation(line: 80, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !3, line: 78, column: 26)
!89 = !DILocation(line: 81, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !88, file: !3, line: 81, column: 13)
!91 = !DILocation(line: 81, column: 20, scope: !90)
!92 = !DILocation(line: 81, column: 13, scope: !88)
!93 = !DILocation(line: 83, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 81, column: 28)
!95 = !DILocation(line: 84, column: 15, scope: !96)
!96 = distinct !DILexicalBlock(scope: !94, file: !3, line: 84, column: 15)
!97 = !DILocation(line: 84, column: 22, scope: !96)
!98 = !DILocation(line: 84, column: 15, scope: !94)
!99 = !DILocation(line: 86, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !3, line: 84, column: 30)
!101 = !DILocation(line: 87, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !100, file: !3, line: 87, column: 17)
!103 = !DILocation(line: 87, column: 24, scope: !102)
!104 = !DILocation(line: 87, column: 17, scope: !100)
!105 = !DILocation(line: 89, column: 15, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 87, column: 32)
!107 = !DILocation(line: 90, column: 19, scope: !108)
!108 = distinct !DILexicalBlock(scope: !106, file: !3, line: 90, column: 19)
!109 = !DILocation(line: 90, column: 26, scope: !108)
!110 = !DILocation(line: 90, column: 19, scope: !106)
!111 = !DILocation(line: 92, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !3, line: 90, column: 34)
!113 = !DILocation(line: 93, column: 17, scope: !112)
!114 = !DILocation(line: 97, column: 13, scope: !106)
!115 = !DILocation(line: 99, column: 11, scope: !100)
!116 = !DILocation(line: 101, column: 9, scope: !94)
!117 = !DILocation(line: 103, column: 7, scope: !88)
!118 = !DILocation(line: 105, column: 5, scope: !82)
!119 = !DILocation(line: 117, column: 1, scope: !2)
!120 = !DILocation(line: 115, column: 3, scope: !2)
