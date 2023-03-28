; ModuleID = 'yara.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct._args_option = type { i32, i8, i8*, i8*, i32, i8*, i8*, i32 }
%struct._MODULE_DATA = type { i8*, %struct._YR_MAPPED_FILE, %struct._MODULE_DATA* }
%struct._YR_MAPPED_FILE = type { i32, i64, i8* }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.anon.0 = type { i8* }
%union.sem_t = type { i64, [24 x i8] }
%struct._YR_COMPILER = type { %struct.YR_ARENA*, i32, i32, i32, i32, i32, %struct.YR_RULES*, i32, i32, i32, i32, [1 x %struct.__jmp_buf_tag], %struct.YR_AC_AUTOMATON*, %struct._YR_HASH_TABLE*, %struct._YR_HASH_TABLE*, %struct._YR_HASH_TABLE*, %struct._YR_HASH_TABLE*, %struct._YR_FIXUP*, i32, [4 x %struct._YR_LOOP_CONTEXT], i32, i32, [16 x i8*], i32, [256 x i8], [8192 x i8], i8*, i16, [1024 x i8], i8*, i8*, i8*, void (i32, i8*, i32, %struct.YR_RULE*, i8*, i8*)*, i8* (i8*, i8*, i8*, i8*)*, void (i8*, i8*)*, void (%struct.YR_RULE*, i8*, %struct.RE_AST*, i8*)*, %struct.YR_ATOMS_CONFIG }
%struct.YR_ARENA = type { i32, i32, [16 x %struct.YR_ARENA_BUFFER], i64, %struct.YR_RELOC*, %struct.YR_RELOC* }
%struct.YR_ARENA_BUFFER = type { i8*, i64, i64 }
%struct.YR_RELOC = type { i32, i32, %struct.YR_RELOC* }
%struct.YR_RULES = type { %struct.YR_ARENA*, %union.anon, %union.anon.7, %union.anon.12, i32*, %struct.YR_AC_MATCH*, i32*, i8*, i32, i32, i32 }
%union.anon = type { %struct.YR_RULE* }
%struct.YR_RULE = type { i32, i32, %union.anon.0, %union.anon.0, %union.anon.2, %union.anon.7, %union.anon.9 }
%union.anon.2 = type { %struct.YR_META* }
%struct.YR_META = type { %union.anon.0, %union.anon.0, i64, i32, i32 }
%union.anon.9 = type { %struct.YR_NAMESPACE* }
%struct.YR_NAMESPACE = type { %union.anon.0, i32 }
%union.anon.7 = type { %struct.YR_STRING* }
%struct.YR_STRING = type { i32, i32, i64, i32, i32, %union.anon.0, %union.anon.7, i32, i32, %union.anon.0 }
%union.anon.12 = type { %struct.YR_EXTERNAL_VARIABLE* }
%struct.YR_EXTERNAL_VARIABLE = type { i32, %union.anon.13, %union.anon.0 }
%union.anon.13 = type { i64 }
%struct.YR_AC_MATCH = type { %union.anon.7, %union.anon.0, %union.anon.0, %union.anon.18, i16 }
%union.anon.18 = type { %struct.YR_AC_MATCH* }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct.YR_AC_AUTOMATON = type { %struct.YR_ARENA*, i32, i32, i64*, %struct.YR_AC_STATE* }
%struct.YR_AC_STATE = type { %struct.YR_AC_STATE*, %struct.YR_AC_STATE*, %struct.YR_AC_STATE*, %struct.YR_ARENA_REF, i8, i8, i32 }
%struct.YR_ARENA_REF = type { i32, i32 }
%struct._YR_HASH_TABLE = type { i32, [1 x %struct._YR_HASH_TABLE_ENTRY*] }
%struct._YR_HASH_TABLE_ENTRY = type { i8*, i64, i8*, i8*, %struct._YR_HASH_TABLE_ENTRY* }
%struct._YR_FIXUP = type { %struct.YR_ARENA_REF, %struct._YR_FIXUP* }
%struct._YR_LOOP_CONTEXT = type { %struct.YR_ARENA_REF, i32, [2 x %struct._YR_EXPRESSION], i32 }
%struct._YR_EXPRESSION = type { i32, %union.anon.13, %struct.anon }
%struct.anon = type { i8*, %struct.YR_ARENA_REF }
%struct.RE_AST = type { i32, %struct.RE_NODE* }
%struct.RE_NODE = type { i32, %union.anon.21, %union.anon.21, i32, %struct.RE_CLASS*, %struct.RE_NODE*, %struct.RE_NODE*, %struct.RE_NODE*, %struct.RE_NODE*, %struct.YR_ARENA_REF, %struct.YR_ARENA_REF }
%union.anon.21 = type { i32 }
%struct.RE_CLASS = type { i8, [32 x i8] }
%struct.YR_ATOMS_CONFIG = type { i32 (%struct.YR_ATOMS_CONFIG*, %struct.YR_ATOM*)*, %struct.YR_ATOM_QUALITY_TABLE_ENTRY*, i32, i32, i8 }
%struct.YR_ATOM = type { i8, [4 x i8], [4 x i8] }
%struct.YR_ATOM_QUALITY_TABLE_ENTRY = type { [4 x i8], i8 }
%struct.timespec = type { i64, i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.YR_RULES_STATS = type { i32, i32, i32, i32, float, [100 x i32], [101 x i32], i32 }
%struct.YR_SCAN_CONTEXT = type { i64, i64, i32, i32, i64, i8*, i32 (%struct.YR_SCAN_CONTEXT*, i32, i8*, i8*)*, %struct.YR_RULES*, %struct.YR_STRING*, %struct.YR_MEMORY_BLOCK_ITERATOR*, %struct._YR_HASH_TABLE*, %struct.YR_NOTEBOOK*, %struct._YR_STOPWATCH, %struct.RE_FIBER_POOL, %struct.RE_FAST_EXEC_POSITION_POOL, i64*, i64*, i64*, %struct.YR_MATCHES*, %struct.YR_MATCHES*, %struct.YR_PROFILING_INFO* }
%struct.YR_MEMORY_BLOCK_ITERATOR = type { i8*, %struct.YR_MEMORY_BLOCK* (%struct.YR_MEMORY_BLOCK_ITERATOR*)*, %struct.YR_MEMORY_BLOCK* (%struct.YR_MEMORY_BLOCK_ITERATOR*)*, i64 (%struct.YR_MEMORY_BLOCK_ITERATOR*)*, i32 }
%struct.YR_MEMORY_BLOCK = type { i64, i64, i8*, i8* (%struct.YR_MEMORY_BLOCK*)* }
%struct.YR_NOTEBOOK = type opaque
%struct._YR_STOPWATCH = type { %union.anon.23 }
%union.anon.23 = type { %struct.timespec }
%struct.RE_FIBER_POOL = type { i32, %struct.RE_FIBER_LIST }
%struct.RE_FIBER_LIST = type { %struct.RE_FIBER*, %struct.RE_FIBER* }
%struct.RE_FIBER = type { i8*, i32, i32, %struct.RE_FIBER*, %struct.RE_FIBER*, [1024 x i16] }
%struct.RE_FAST_EXEC_POSITION_POOL = type { %struct.RE_FAST_EXEC_POSITION* }
%struct.RE_FAST_EXEC_POSITION = type { i32, i8*, %struct.RE_FAST_EXEC_POSITION*, %struct.RE_FAST_EXEC_POSITION* }
%struct.YR_MATCHES = type { %struct.YR_MATCH*, %struct.YR_MATCH*, i32 }
%struct.YR_MATCH = type { i64, i64, i32, i32, i8*, %struct.YR_MATCH*, %struct.YR_MATCH*, i32, i8 }
%struct.YR_PROFILING_INFO = type { i32, i64, i64 }
%struct.SCAN_OPTIONS = type { i8, i8, i64 }
%struct._YR_STREAM = type { i8*, i64 (i8*, i64, i64, i8*)*, i64 (i8*, i64, i64, i8*)* }
%struct._THREAD_ARGS = type { %struct.YR_SCAN_CONTEXT*, %struct._CALLBACK_ARGS, i64, i32 }
%struct._CALLBACK_ARGS = type { i8*, i32 }
%struct.YR_OBJECT = type { i32, i8, i8*, %struct.YR_OBJECT*, i8*, %union.anon.13 }
%struct.__dirstream = type opaque
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"cli/args.c\00", align 1
@__PRETTY_FUNCTION__.args_parse_option = private unnamed_addr constant [74 x i8] c"args_error_type_t args_parse_option(args_option_t *, const char *, int *)\00", align 1
@switch.table.args_print_error = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i64 0, i64 0)], align 8
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [21 x i8] c"unknown option `%s`\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"too many `%s` options\0A\00", align 1
@.str.4 = private unnamed_addr constant [42 x i8] c"option `%s` requires an integer argument\0A\00", align 1
@.str.5 = private unnamed_addr constant [40 x i8] c"option `%s` requires a string argument\0A\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"option `%s` doesn't expect an argument\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"-%c\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"     \00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"--%s\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"%-*s%s\0A\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@stdin = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1.11 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2.12 = private unnamed_addr constant [32 x i8] c"error: could not open file: %s\0A\00", align 1
@.str.4.13 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.5.14 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.3.15 = private unnamed_addr constant [38 x i8] c"error: wrong syntax for `-d` option.\0A\00", align 1
@options = dso_local global [31 x %struct._args_option] [%struct._args_option { i32 4, i8 0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i32 0, i32 0), i8* bitcast (i8** @atom_quality_table to i8*), i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1.17, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.18, i32 0, i32 0), i32 0 }, %struct._args_option { i32 2, i8 67, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3.19, i32 0, i32 0), i8* @rules_are_compiled, i32 1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4.20, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 99, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5.21, i32 0, i32 0), i8* @print_count_only, i32 1, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6.22, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 4, i8 100, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7.23, i32 0, i32 0), i8* bitcast ([33 x i8*]* @ext_vars to i8*), i32 32, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8.24, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9.25, i32 0, i32 0), i32 0 }, %struct._args_option { i32 2, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.10.26, i32 0, i32 0), i8* @fail_on_warnings, i32 1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11.27, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 102, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12.28, i32 0, i32 0), i8* @fast_scan, i32 1, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13.29, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 104, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14.30, i32 0, i32 0), i8* @show_help, i32 1, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.15.31, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 4, i8 105, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.16.32, i32 0, i32 0), i8* bitcast ([33 x i8*]* @identifiers to i8*), i32 32, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.18, i32 0, i32 0), i32 0 }, %struct._args_option { i32 3, i8 0, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.19, i32 0, i32 0), i8* bitcast (i32* @max_process_memory_chunk to i8*), i32 1, i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0), i32 0 }, %struct._args_option { i32 3, i8 108, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.22, i32 0, i32 0), i8* bitcast (i32* @limit to i8*), i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0), i32 0 }, %struct._args_option { i32 3, i8 0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.24, i32 0, i32 0), i8* bitcast (i32* @max_strings_per_rule to i8*), i32 1, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0), i32 0 }, %struct._args_option { i32 4, i8 120, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.26, i32 0, i32 0), i8* bitcast ([33 x i8*]* @modules_data to i8*), i32 32, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0), i32 0 }, %struct._args_option { i32 2, i8 110, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0), i8* @negate, i32 1, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.30, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 78, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.31, i32 0, i32 0), i8* @follow_symlinks, i32 1, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.32, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 119, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.33, i32 0, i32 0), i8* @ignore_warnings, i32 1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.34, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 109, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.35, i32 0, i32 0), i8* @show_meta, i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.36, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 68, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.37, i32 0, i32 0), i8* @show_module_data, i32 1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.38, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 101, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.39, i32 0, i32 0), i8* @show_namespace, i32 1, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.40, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 83, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.41, i32 0, i32 0), i8* @show_stats, i32 1, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.42, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 115, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.43, i32 0, i32 0), i8* @show_strings, i32 1, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.44, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 76, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.45, i32 0, i32 0), i8* @show_string_length, i32 1, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.46, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 103, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0), i8* @show_tags, i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.48, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 114, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.49, i32 0, i32 0), i8* @recursive_search, i32 1, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.50, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 2, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.51, i32 0, i32 0), i8* @scan_list_search, i32 1, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.52, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option { i32 3, i8 122, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.53, i32 0, i32 0), i8* bitcast (i32* @skip_larger to i8*), i32 1, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0), i32 0 }, %struct._args_option { i32 3, i8 107, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.55, i32 0, i32 0), i8* bitcast (i32* @stack_size to i8*), i32 1, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.57, i32 0, i32 0), i32 0 }, %struct._args_option { i32 4, i8 116, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.58, i32 0, i32 0), i8* bitcast ([33 x i8*]* @tags to i8*), i32 32, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.60, i32 0, i32 0), i32 0 }, %struct._args_option { i32 3, i8 112, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.61, i32 0, i32 0), i8* bitcast (i32* @threads to i8*), i32 1, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0), i32 0 }, %struct._args_option { i32 3, i8 97, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.63, i32 0, i32 0), i8* bitcast (i32* @timeout to i8*), i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.65, i32 0, i32 0), i32 0 }, %struct._args_option { i32 2, i8 118, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.66, i32 0, i32 0), i8* @show_version, i32 1, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.67, i32 0, i32 0), i8* null, i32 0 }, %struct._args_option zeroinitializer], align 16
@.str.16 = private unnamed_addr constant [19 x i8] c"atom-quality-table\00", align 1
@atom_quality_table = internal global i8* null, align 8
@.str.1.17 = private unnamed_addr constant [43 x i8] c"path to a file with the atom quality table\00", align 1
@.str.2.18 = private unnamed_addr constant [5 x i8] c"FILE\00", align 1
@.str.3.19 = private unnamed_addr constant [15 x i8] c"compiled-rules\00", align 1
@rules_are_compiled = internal global i8 0, align 1
@.str.4.20 = private unnamed_addr constant [20 x i8] c"load compiled rules\00", align 1
@.str.5.21 = private unnamed_addr constant [6 x i8] c"count\00", align 1
@print_count_only = internal global i8 0, align 1
@.str.6.22 = private unnamed_addr constant [29 x i8] c"print only number of matches\00", align 1
@.str.7.23 = private unnamed_addr constant [7 x i8] c"define\00", align 1
@ext_vars = internal global [33 x i8*] zeroinitializer, align 16
@.str.8.24 = private unnamed_addr constant [25 x i8] c"define external variable\00", align 1
@.str.9.25 = private unnamed_addr constant [10 x i8] c"VAR=VALUE\00", align 1
@.str.10.26 = private unnamed_addr constant [17 x i8] c"fail-on-warnings\00", align 1
@fail_on_warnings = internal global i8 0, align 1
@.str.11.27 = private unnamed_addr constant [17 x i8] c"fail on warnings\00", align 1
@.str.12.28 = private unnamed_addr constant [10 x i8] c"fast-scan\00", align 1
@fast_scan = internal global i8 0, align 1
@.str.13.29 = private unnamed_addr constant [19 x i8] c"fast matching mode\00", align 1
@.str.14.30 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@show_help = internal global i8 0, align 1
@.str.15.31 = private unnamed_addr constant [24 x i8] c"show this help and exit\00", align 1
@.str.16.32 = private unnamed_addr constant [11 x i8] c"identifier\00", align 1
@identifiers = internal global [33 x i8*] zeroinitializer, align 16
@.str.17 = private unnamed_addr constant [34 x i8] c"print only rules named IDENTIFIER\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"IDENTIFIER\00", align 1
@.str.19 = private unnamed_addr constant [25 x i8] c"max-process-memory-chunk\00", align 1
@max_process_memory_chunk = internal global i32 1073741824, align 4
@.str.20 = private unnamed_addr constant [73 x i8] c"set maximum chunk size while reading process memory (default=1073741824)\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"NUMBER\00", align 1
@.str.22 = private unnamed_addr constant [10 x i8] c"max-rules\00", align 1
@limit = internal global i32 0, align 4
@.str.23 = private unnamed_addr constant [48 x i8] c"abort scanning after matching a NUMBER of rules\00", align 1
@.str.24 = private unnamed_addr constant [21 x i8] c"max-strings-per-rule\00", align 1
@max_strings_per_rule = internal global i32 10000, align 4
@.str.25 = private unnamed_addr constant [55 x i8] c"set maximum number of strings per rule (default=10000)\00", align 1
@.str.26 = private unnamed_addr constant [12 x i8] c"module-data\00", align 1
@modules_data = internal global [33 x i8*] zeroinitializer, align 16
@.str.27 = private unnamed_addr constant [44 x i8] c"pass FILE's content as extra data to MODULE\00", align 1
@.str.28 = private unnamed_addr constant [12 x i8] c"MODULE=FILE\00", align 1
@.str.29 = private unnamed_addr constant [7 x i8] c"negate\00", align 1
@negate = internal global i8 0, align 1
@.str.30 = private unnamed_addr constant [40 x i8] c"print only not satisfied rules (negate)\00", align 1
@.str.31 = private unnamed_addr constant [19 x i8] c"no-follow-symlinks\00", align 1
@follow_symlinks = internal global i8 1, align 1
@.str.32 = private unnamed_addr constant [37 x i8] c"do not follow symlinks when scanning\00", align 1
@.str.33 = private unnamed_addr constant [12 x i8] c"no-warnings\00", align 1
@ignore_warnings = internal global i8 0, align 1
@.str.34 = private unnamed_addr constant [17 x i8] c"disable warnings\00", align 1
@.str.35 = private unnamed_addr constant [11 x i8] c"print-meta\00", align 1
@show_meta = internal global i8 0, align 1
@.str.36 = private unnamed_addr constant [15 x i8] c"print metadata\00", align 1
@.str.37 = private unnamed_addr constant [18 x i8] c"print-module-data\00", align 1
@show_module_data = internal global i8 0, align 1
@.str.38 = private unnamed_addr constant [18 x i8] c"print module data\00", align 1
@.str.39 = private unnamed_addr constant [16 x i8] c"print-namespace\00", align 1
@show_namespace = internal global i8 0, align 1
@.str.40 = private unnamed_addr constant [23 x i8] c"print rules' namespace\00", align 1
@.str.41 = private unnamed_addr constant [12 x i8] c"print-stats\00", align 1
@show_stats = internal global i8 0, align 1
@.str.42 = private unnamed_addr constant [24 x i8] c"print rules' statistics\00", align 1
@.str.43 = private unnamed_addr constant [14 x i8] c"print-strings\00", align 1
@show_strings = internal global i8 0, align 1
@.str.44 = private unnamed_addr constant [23 x i8] c"print matching strings\00", align 1
@.str.45 = private unnamed_addr constant [20 x i8] c"print-string-length\00", align 1
@show_string_length = internal global i8 0, align 1
@.str.46 = private unnamed_addr constant [32 x i8] c"print length of matched strings\00", align 1
@.str.47 = private unnamed_addr constant [11 x i8] c"print-tags\00", align 1
@show_tags = internal global i8 0, align 1
@.str.48 = private unnamed_addr constant [11 x i8] c"print tags\00", align 1
@.str.49 = private unnamed_addr constant [10 x i8] c"recursive\00", align 1
@recursive_search = internal global i8 0, align 1
@.str.50 = private unnamed_addr constant [31 x i8] c"recursively search directories\00", align 1
@.str.51 = private unnamed_addr constant [10 x i8] c"scan-list\00", align 1
@scan_list_search = internal global i8 0, align 1
@.str.52 = private unnamed_addr constant [40 x i8] c"scan files listed in FILE, one per line\00", align 1
@.str.53 = private unnamed_addr constant [12 x i8] c"skip-larger\00", align 1
@skip_larger = internal global i32 0, align 4
@.str.54 = private unnamed_addr constant [64 x i8] c"skip files larger than the given size when scanning a directory\00", align 1
@.str.55 = private unnamed_addr constant [11 x i8] c"stack-size\00", align 1
@stack_size = internal global i32 16384, align 4
@.str.56 = private unnamed_addr constant [39 x i8] c"set maximum stack size (default=16384)\00", align 1
@.str.57 = private unnamed_addr constant [6 x i8] c"SLOTS\00", align 1
@.str.58 = private unnamed_addr constant [4 x i8] c"tag\00", align 1
@tags = internal global [33 x i8*] zeroinitializer, align 16
@.str.59 = private unnamed_addr constant [31 x i8] c"print only rules tagged as TAG\00", align 1
@.str.60 = private unnamed_addr constant [4 x i8] c"TAG\00", align 1
@.str.61 = private unnamed_addr constant [8 x i8] c"threads\00", align 1
@threads = internal global i32 32, align 4
@.str.62 = private unnamed_addr constant [56 x i8] c"use the specified NUMBER of threads to scan a directory\00", align 1
@.str.63 = private unnamed_addr constant [8 x i8] c"timeout\00", align 1
@timeout = internal global i32 1000000, align 4
@.str.64 = private unnamed_addr constant [49 x i8] c"abort scanning after the given number of SECONDS\00", align 1
@.str.65 = private unnamed_addr constant [8 x i8] c"SECONDS\00", align 1
@.str.66 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@show_version = internal global i8 0, align 1
@.str.67 = private unnamed_addr constant [25 x i8] c"show version information\00", align 1
@modules_data_list = dso_local local_unnamed_addr global %struct._MODULE_DATA* null, align 8
@output_mutex = common dso_local global %union.pthread_mutex_t zeroinitializer, align 8
@file_queue = common dso_local local_unnamed_addr global [65 x %union.anon.0] zeroinitializer, align 16
@queue_head = common dso_local local_unnamed_addr global i32 0, align 4
@queue_tail = common dso_local local_unnamed_addr global i32 0, align 4
@used_slots = common dso_local global %union.sem_t* null, align 8
@unused_slots = common dso_local global %union.sem_t* null, align 8
@queue_mutex = common dso_local global %union.pthread_mutex_t zeroinitializer, align 8
@.str.69 = private unnamed_addr constant [6 x i8] c"4.2.0\00", align 1
@.str.70 = private unnamed_addr constant [127 x i8] c"YARA %s, the pattern matching swiss army knife.\0A%s\0A\0AMandatory arguments to long options are mandatory for short options too.\0A\0A\00", align 1
@.str.71 = private unnamed_addr constant [67 x i8] c"Usage: yara [OPTION]... [NAMESPACE:]RULES_FILE... FILE | DIR | PID\00", align 1
@str = private unnamed_addr constant [64 x i8] c"\0ASend bug reports and suggestions to: vmalvarez@virustotal.com.\00", align 1
@.str.73 = private unnamed_addr constant [33 x i8] c"maximum number of threads is %d\0A\00", align 1
@.str.74 = private unnamed_addr constant [33 x i8] c"yara: wrong number of arguments\0A\00", align 1
@.str.75 = private unnamed_addr constant [5 x i8] c"%s\0A\0A\00", align 1
@.str.76 = private unnamed_addr constant [31 x i8] c"Try `--help` for more options\0A\00", align 1
@.str.85 = private unnamed_addr constant [38 x i8] c"error: wrong syntax for `-x` option.\0A\00", align 1
@.str.86 = private unnamed_addr constant [34 x i8] c"error: could not open file \22%s\22.\0A\00", align 1
@.str.77 = private unnamed_addr constant [34 x i8] c"error: initialization error (%d)\0A\00", align 1
@.str.78 = private unnamed_addr constant [78 x i8] c"error: can't accept multiple rules files if one of them is in compiled form.\0A\00", align 1
@.str.79 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.80 = private unnamed_addr constant [35 x i8] c"error loading atom quality table: \00", align 1
@.str.101 = private unnamed_addr constant [41 x i8] c"size of AC transition table        : %d\0A\00", align 1
@.str.102 = private unnamed_addr constant [41 x i8] c"average length of AC matches lists : %f\0A\00", align 1
@.str.103 = private unnamed_addr constant [41 x i8] c"number of rules                    : %d\0A\00", align 1
@.str.104 = private unnamed_addr constant [41 x i8] c"number of strings                  : %d\0A\00", align 1
@.str.105 = private unnamed_addr constant [41 x i8] c"number of AC matches               : %d\0A\00", align 1
@.str.106 = private unnamed_addr constant [41 x i8] c"number of AC matches in root node  : %d\0A\00", align 1
@.str.107 = private unnamed_addr constant [46 x i8] c"number of AC matches in top %d longest lists\0A\00", align 1
@str.144 = private unnamed_addr constant [30 x i8] c"match list length percentiles\00", align 1
@.str.108 = private unnamed_addr constant [10 x i8] c" %3d: %d\0A\00", align 1
@.str.81 = private unnamed_addr constant [45 x i8] c"error: cannot use a directory as scan list.\0A\00", align 1
@.str.82 = private unnamed_addr constant [11 x i8] c"error: %d\0A\00", align 1
@.str.141 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.83 = private unnamed_addr constant [20 x i8] c"error scanning %s: \00", align 1
@.str.142 = private unnamed_addr constant [33 x i8] c"string \22%s\22 in rule \22%s\22 caused \00", align 1
@.str.143 = private unnamed_addr constant [18 x i8] c"rule \22%s\22 caused \00", align 1
@.str.84 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.137 = private unnamed_addr constant [6 x i8] c"%s/%s\00", align 1
@.str.138 = private unnamed_addr constant [60 x i8] c"skipping %s (%ld bytes) because it's larger than %d bytes.\0A\00", align 1
@.str.139 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.140 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.136 = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1
@.str.112 = private unnamed_addr constant [4 x i8] c"%s:\00", align 1
@.str.113 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.116 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.117 = private unnamed_addr constant [3 x i8] c"] \00", align 1
@.str.118 = private unnamed_addr constant [8 x i8] c"%s =%ld\00", align 1
@.str.121 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.120 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.119 = private unnamed_addr constant [6 x i8] c"%s=%s\00", align 1
@.str.122 = private unnamed_addr constant [5 x i8] c"%s=\22\00", align 1
@.str.127 = private unnamed_addr constant [4 x i8] c"\\%c\00", align 1
@.str.128 = private unnamed_addr constant [6 x i8] c"\\%03o\00", align 1
@cescapes = internal unnamed_addr constant <{ [14 x i8], [18 x i8] }> <{ [14 x i8] c"\00\00\00\00\00\00\00abtnvfr", [18 x i8] zeroinitializer }>, align 16
@.str.124 = private unnamed_addr constant [12 x i8] c"0x%lx:%d:%s\00", align 1
@.str.125 = private unnamed_addr constant [9 x i8] c"0x%lx:%s\00", align 1
@.str.126 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.132 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.133 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.131 = private unnamed_addr constant [7 x i8] c"%s%02X\00", align 1
@.str.134 = private unnamed_addr constant [5 x i8] c" ...\00", align 1
@.str.135 = private unnamed_addr constant [7 x i8] c"\\x%02X\00", align 1
@total_count = internal unnamed_addr global i32 0, align 4
@.str.111 = private unnamed_addr constant [85 x i8] c"warning: rule \22%s\22: too many matches for %s, results for this rule may be incorrect\0A\00", align 1
@.str.98 = private unnamed_addr constant [8 x i8] c"warning\00", align 1
@.str.97 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@.str.99 = private unnamed_addr constant [29 x i8] c"%s: rule \22%s\22 in %s(%d): %s\0A\00", align 1
@.str.100 = private unnamed_addr constant [16 x i8] c"%s(%d): %s: %s\0A\00", align 1
@.str.87 = private unnamed_addr constant [49 x i8] c"can not attach to process (try running as root)\0A\00", align 1
@.str.88 = private unnamed_addr constant [19 x i8] c"not enough memory\0A\00", align 1
@.str.89 = private unnamed_addr constant [20 x i8] c"scanning timed out\0A\00", align 1
@.str.90 = private unnamed_addr constant [21 x i8] c"could not open file\0A\00", align 1
@.str.91 = private unnamed_addr constant [54 x i8] c"rules were compiled with a different version of YARA\0A\00", align 1
@.str.92 = private unnamed_addr constant [30 x i8] c"invalid compiled rules file.\0A\00", align 1
@.str.93 = private unnamed_addr constant [30 x i8] c"corrupt compiled rules file.\0A\00", align 1
@.str.94 = private unnamed_addr constant [72 x i8] c"stack overflow while evaluating condition (see --stack-size argument) \0A\00", align 1
@.str.95 = private unnamed_addr constant [36 x i8] c"invalid type for external variable\0A\00", align 1
@.str.96 = private unnamed_addr constant [18 x i8] c"too many matches\0A\00", align 1

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local %struct._args_option* @args_get_short_option(%struct._args_option* readonly %0, i8 signext %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 0
  %4 = load i32, i32* %3, align 8, !tbaa !2
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %16, label %6

6:                                                ; preds = %2, %11
  %7 = phi %struct._args_option* [ %12, %11 ], [ %0, %2 ]
  %8 = getelementptr inbounds %struct._args_option, %struct._args_option* %7, i64 0, i32 1
  %9 = load i8, i8* %8, align 4, !tbaa !8
  %10 = icmp eq i8 %9, %1
  br i1 %10, label %16, label %11

11:                                               ; preds = %6
  %12 = getelementptr inbounds %struct._args_option, %struct._args_option* %7, i64 1
  %13 = getelementptr inbounds %struct._args_option, %struct._args_option* %12, i64 0, i32 0
  %14 = load i32, i32* %13, align 8, !tbaa !2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %6

16:                                               ; preds = %6, %11, %2
  %17 = phi %struct._args_option* [ null, %2 ], [ null, %11 ], [ %7, %6 ]
  ret %struct._args_option* %17
}

; Function Attrs: nounwind readonly uwtable
define dso_local %struct._args_option* @args_get_long_option(%struct._args_option* readonly %0, i8* nocapture readonly %1) local_unnamed_addr #1 {
  %3 = getelementptr inbounds i8, i8* %1, i64 2
  %4 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 0
  %5 = load i32, i32* %4, align 8, !tbaa !2
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %25, label %7

7:                                                ; preds = %2, %20
  %8 = phi %struct._args_option* [ %21, %20 ], [ %0, %2 ]
  %9 = getelementptr inbounds %struct._args_option, %struct._args_option* %8, i64 0, i32 2
  %10 = load i8*, i8** %9, align 8, !tbaa !9
  %11 = icmp eq i8* %10, null
  br i1 %11, label %20, label %12

12:                                               ; preds = %7
  %13 = tail call i64 @strlen(i8* nonnull %10) #15
  %14 = getelementptr inbounds i8, i8* %3, i64 %13
  %15 = load i8, i8* %14, align 1, !tbaa !10
  switch i8 %15, label %20 [
    i8 0, label %16
    i8 61, label %16
  ]

16:                                               ; preds = %12, %12
  %17 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %10)
  %18 = tail call i32 @strncmp(i8* nonnull %3, i8* nonnull %10, i64 %17)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %25, label %20

20:                                               ; preds = %12, %16, %7
  %21 = getelementptr inbounds %struct._args_option, %struct._args_option* %8, i64 1
  %22 = getelementptr inbounds %struct._args_option, %struct._args_option* %21, i64 0, i32 0
  %23 = load i32, i32* %22, align 8, !tbaa !2
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %7

25:                                               ; preds = %20, %16, %2
  %26 = phi %struct._args_option* [ null, %2 ], [ %8, %16 ], [ null, %20 ]
  ret %struct._args_option* %26
}

; Function Attrs: argmemonly nofree nounwind readonly
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nofree nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i32 @args_parse_option(%struct._args_option* nocapture %0, i8* %1, i32* %2) local_unnamed_addr #4 {
  %4 = alloca i8*, align 8
  %5 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #16
  store i8* null, i8** %4, align 8, !tbaa !11
  %6 = icmp ne i32* %2, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %3
  store i32 0, i32* %2, align 4, !tbaa !12
  br label %8

8:                                                ; preds = %7, %3
  %9 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 7
  %10 = load i32, i32* %9, align 8, !tbaa !13
  %11 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 4
  %12 = load i32, i32* %11, align 8, !tbaa !14
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %49, label %14

14:                                               ; preds = %8
  %15 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 0
  %16 = load i32, i32* %15, align 8, !tbaa !2
  switch i32 %16, label %45 [
    i32 2, label %17
    i32 3, label %22
    i32 4, label %34
  ]

17:                                               ; preds = %14
  %18 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 3
  %19 = load i8*, i8** %18, align 8, !tbaa !15
  %20 = load i8, i8* %19, align 1, !tbaa !16, !range !18
  %21 = xor i8 %20, 1
  store i8 %21, i8* %19, align 1, !tbaa !16
  br label %46

22:                                               ; preds = %14
  %23 = icmp eq i8* %1, null
  br i1 %23, label %49, label %24

24:                                               ; preds = %22
  %25 = call i64 @strtol(i8* nonnull %1, i8** nonnull %4, i32 0) #16
  %26 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 3
  %27 = bitcast i8** %26 to i64**
  %28 = load i64*, i64** %27, align 8, !tbaa !15
  store i64 %25, i64* %28, align 8, !tbaa !19
  %29 = load i8*, i8** %4, align 8, !tbaa !11
  %30 = load i8, i8* %29, align 1, !tbaa !10
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %32, label %49

32:                                               ; preds = %24
  br i1 %6, label %33, label %46

33:                                               ; preds = %32
  store i32 1, i32* %2, align 4, !tbaa !12
  br label %46

34:                                               ; preds = %14
  %35 = icmp eq i8* %1, null
  br i1 %35, label %49, label %36

36:                                               ; preds = %34
  %37 = icmp sgt i32 %12, 1
  %38 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 3
  %39 = bitcast i8** %38 to i8***
  %40 = load i8**, i8*** %39, align 8, !tbaa !15
  %41 = sext i32 %10 to i64
  %42 = getelementptr inbounds i8*, i8** %40, i64 %41
  %43 = select i1 %37, i8** %42, i8** %40
  store i8* %1, i8** %43, align 8, !tbaa !11
  br i1 %6, label %44, label %46

44:                                               ; preds = %36
  store i32 1, i32* %2, align 4, !tbaa !12
  br label %46

45:                                               ; preds = %14
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 137, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__.args_parse_option, i64 0, i64 0)) #17
  unreachable

46:                                               ; preds = %36, %44, %32, %33, %17
  %47 = load i32, i32* %9, align 8, !tbaa !13
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %9, align 8, !tbaa !13
  br label %49

49:                                               ; preds = %34, %24, %22, %8, %46
  %50 = phi i32 [ 0, %46 ], [ 2, %8 ], [ 3, %22 ], [ 3, %24 ], [ 4, %34 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #16
  ret i32 %50
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: nofree nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #6

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: nofree nounwind uwtable
define dso_local void @args_print_error(i32 %0, i8* %1) local_unnamed_addr #8 {
  %3 = add i32 %0, -1
  %4 = icmp ult i32 %3, 5
  br i1 %4, label %5, label %11

5:                                                ; preds = %2
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds [5 x i8*], [5 x i8*]* @switch.table.args_print_error, i64 0, i64 %6
  %8 = load i8*, i8** %7, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* %8, i8* %1) #18
  br label %11

11:                                               ; preds = %2, %5
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local i32 @args_parse(%struct._args_option* %0, i32 %1, i8** nocapture %2) local_unnamed_addr #4 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = icmp sgt i32 %1, 1
  br i1 %6, label %7, label %12

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 0
  %9 = bitcast i8** %5 to i8*
  %10 = bitcast i8** %4 to i8*
  %11 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 1
  br label %17

12:                                               ; preds = %209, %3
  %13 = phi i32 [ 0, %3 ], [ %211, %209 ]
  %14 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 0
  %15 = load i32, i32* %14, align 8, !tbaa !2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %221, label %214

17:                                               ; preds = %7, %209
  %18 = phi i32 [ 1, %7 ], [ %212, %209 ]
  %19 = phi i32 [ 0, %7 ], [ %211, %209 ]
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds i8*, i8** %2, i64 %20
  %22 = load i8*, i8** %21, align 8, !tbaa !11
  %23 = load i8, i8* %22, align 1, !tbaa !10
  %24 = icmp eq i8 %23, 45
  br i1 %24, label %25, label %194

25:                                               ; preds = %17
  %26 = getelementptr inbounds i8, i8* %22, i64 1
  %27 = load i8, i8* %26, align 1, !tbaa !10
  switch i8 %27, label %104 [
    i8 45, label %28
    i8 0, label %194
  ]

28:                                               ; preds = %25
  %29 = getelementptr inbounds i8, i8* %22, i64 2
  %30 = load i8, i8* %29, align 1, !tbaa !10
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %194, label %32

32:                                               ; preds = %28
  %33 = load i32, i32* %8, align 8, !tbaa !2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %205, label %35

35:                                               ; preds = %32, %49
  %36 = phi i32 [ %52, %49 ], [ %33, %32 ]
  %37 = phi %struct._args_option* [ %50, %49 ], [ %0, %32 ]
  %38 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 2
  %39 = load i8*, i8** %38, align 8, !tbaa !9
  %40 = icmp eq i8* %39, null
  br i1 %40, label %49, label %41

41:                                               ; preds = %35
  %42 = tail call i64 @strlen(i8* nonnull %39) #15
  %43 = getelementptr inbounds i8, i8* %29, i64 %42
  %44 = load i8, i8* %43, align 1, !tbaa !10
  switch i8 %44, label %49 [
    i8 0, label %45
    i8 61, label %45
  ]

45:                                               ; preds = %41, %41
  %46 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %39) #16
  %47 = tail call i32 @strncmp(i8* nonnull %29, i8* nonnull %39, i64 %46) #16
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %54, label %49

49:                                               ; preds = %45, %41, %35
  %50 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 1
  %51 = getelementptr inbounds %struct._args_option, %struct._args_option* %50, i64 0, i32 0
  %52 = load i32, i32* %51, align 8, !tbaa !2
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %207, label %35

54:                                               ; preds = %45
  %55 = tail call i8* @strchr(i8* nonnull %22, i32 61) #15
  %56 = icmp eq i8* %55, null
  br i1 %56, label %90, label %57

57:                                               ; preds = %54
  %58 = getelementptr inbounds i8, i8* %55, i64 1
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #16
  store i8* null, i8** %5, align 8, !tbaa !11
  %59 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 7
  %60 = load i32, i32* %59, align 8, !tbaa !13
  %61 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 4
  %62 = load i32, i32* %61, align 8, !tbaa !14
  %63 = icmp eq i32 %60, %62
  br i1 %63, label %198, label %64

64:                                               ; preds = %57
  switch i32 %36, label %89 [
    i32 2, label %65
    i32 3, label %70
    i32 4, label %80
  ]

65:                                               ; preds = %64
  %66 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 3
  %67 = load i8*, i8** %66, align 8, !tbaa !15
  %68 = load i8, i8* %67, align 1, !tbaa !16, !range !18
  %69 = xor i8 %68, 1
  store i8 %69, i8* %67, align 1, !tbaa !16
  br label %200

70:                                               ; preds = %64
  %71 = call i64 @strtol(i8* nonnull %58, i8** nonnull %5, i32 0) #16
  %72 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 3
  %73 = bitcast i8** %72 to i64**
  %74 = load i64*, i64** %73, align 8, !tbaa !15
  store i64 %71, i64* %74, align 8, !tbaa !19
  %75 = load i8*, i8** %5, align 8, !tbaa !11
  %76 = load i8, i8* %75, align 1, !tbaa !10
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %78, label %198

78:                                               ; preds = %70
  %79 = load i32, i32* %59, align 8, !tbaa !13
  br label %200

80:                                               ; preds = %64
  %81 = icmp sgt i32 %62, 1
  %82 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 3
  %83 = bitcast i8** %82 to i8***
  %84 = load i8**, i8*** %83, align 8, !tbaa !15
  br i1 %81, label %85, label %88

85:                                               ; preds = %80
  %86 = sext i32 %60 to i64
  %87 = getelementptr inbounds i8*, i8** %84, i64 %86
  store i8* %58, i8** %87, align 8, !tbaa !11
  br label %200

88:                                               ; preds = %80
  store i8* %58, i8** %84, align 8, !tbaa !11
  br label %200

89:                                               ; preds = %64
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 137, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__.args_parse_option, i64 0, i64 0)) #17
  unreachable

90:                                               ; preds = %54
  %91 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 7
  %92 = load i32, i32* %91, align 8, !tbaa !13
  %93 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 4
  %94 = load i32, i32* %93, align 8, !tbaa !14
  %95 = icmp eq i32 %92, %94
  br i1 %95, label %205, label %96

96:                                               ; preds = %90
  switch i32 %36, label %103 [
    i32 2, label %97
    i32 3, label %205
    i32 4, label %207
  ]

97:                                               ; preds = %96
  %98 = getelementptr inbounds %struct._args_option, %struct._args_option* %37, i64 0, i32 3
  %99 = load i8*, i8** %98, align 8, !tbaa !15
  %100 = load i8, i8* %99, align 1, !tbaa !16, !range !18
  %101 = xor i8 %100, 1
  store i8 %101, i8* %99, align 1, !tbaa !16
  %102 = add nsw i32 %92, 1
  store i32 %102, i32* %91, align 8, !tbaa !13
  br label %209

103:                                              ; preds = %96
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 137, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__.args_parse_option, i64 0, i64 0)) #17
  unreachable

104:                                              ; preds = %25, %190
  %105 = phi i64 [ %126, %190 ], [ 1, %25 ]
  %106 = phi i8 [ %192, %190 ], [ %27, %25 ]
  %107 = phi i32 [ %191, %190 ], [ %18, %25 ]
  %108 = load i32, i32* %8, align 8, !tbaa !2
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %203, label %110

110:                                              ; preds = %104
  %111 = load i8, i8* %11, align 4, !tbaa !8
  %112 = icmp eq i8 %111, %106
  br i1 %112, label %123, label %117

113:                                              ; preds = %117
  %114 = getelementptr inbounds %struct._args_option, %struct._args_option* %118, i64 1, i32 1
  %115 = load i8, i8* %114, align 4, !tbaa !8
  %116 = icmp eq i8 %115, %106
  br i1 %116, label %123, label %117

117:                                              ; preds = %110, %113
  %118 = phi %struct._args_option* [ %119, %113 ], [ %0, %110 ]
  %119 = getelementptr inbounds %struct._args_option, %struct._args_option* %118, i64 1
  %120 = getelementptr inbounds %struct._args_option, %struct._args_option* %119, i64 0, i32 0
  %121 = load i32, i32* %120, align 8, !tbaa !2
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %207, label %113

123:                                              ; preds = %113, %110
  %124 = phi i32 [ %108, %110 ], [ %121, %113 ]
  %125 = phi %struct._args_option* [ %0, %110 ], [ %119, %113 ]
  %126 = add nuw i64 %105, 1
  %127 = getelementptr inbounds i8, i8* %22, i64 %126
  %128 = load i8, i8* %127, align 1, !tbaa !10
  %129 = icmp eq i8 %128, 0
  br i1 %129, label %130, label %176

130:                                              ; preds = %123
  %131 = add nsw i32 %107, 1
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i8*, i8** %2, i64 %132
  %134 = load i8*, i8** %133, align 8, !tbaa !11
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #16
  store i8* null, i8** %4, align 8, !tbaa !11
  %135 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 7
  %136 = load i32, i32* %135, align 8, !tbaa !13
  %137 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 4
  %138 = load i32, i32* %137, align 8, !tbaa !14
  %139 = icmp eq i32 %136, %138
  br i1 %139, label %165, label %140

140:                                              ; preds = %130
  switch i32 %124, label %164 [
    i32 2, label %170
    i32 3, label %141
    i32 4, label %153
  ]

141:                                              ; preds = %140
  %142 = icmp eq i8* %134, null
  br i1 %142, label %165, label %143

143:                                              ; preds = %141
  %144 = call i64 @strtol(i8* nonnull %134, i8** nonnull %4, i32 0) #16
  %145 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 3
  %146 = bitcast i8** %145 to i64**
  %147 = load i64*, i64** %146, align 8, !tbaa !15
  store i64 %144, i64* %147, align 8, !tbaa !19
  %148 = load i8*, i8** %4, align 8, !tbaa !11
  %149 = load i8, i8* %148, align 1, !tbaa !10
  %150 = icmp eq i8 %149, 0
  br i1 %150, label %151, label %165

151:                                              ; preds = %143
  %152 = load i32, i32* %135, align 8, !tbaa !13
  br label %167

153:                                              ; preds = %140
  %154 = icmp eq i8* %134, null
  br i1 %154, label %165, label %155

155:                                              ; preds = %153
  %156 = icmp sgt i32 %138, 1
  %157 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 3
  %158 = bitcast i8** %157 to i8***
  %159 = load i8**, i8*** %158, align 8, !tbaa !15
  br i1 %156, label %160, label %163

160:                                              ; preds = %155
  %161 = sext i32 %136 to i64
  %162 = getelementptr inbounds i8*, i8** %159, i64 %161
  store i8* %134, i8** %162, align 8, !tbaa !11
  br label %167

163:                                              ; preds = %155
  store i8* %134, i8** %159, align 8, !tbaa !11
  br label %167

164:                                              ; preds = %140
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 137, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__.args_parse_option, i64 0, i64 0)) #17
  unreachable

165:                                              ; preds = %130, %153, %141, %143
  %166 = phi i32 [ 4, %153 ], [ 3, %143 ], [ 3, %141 ], [ 2, %130 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #16
  br label %207

167:                                              ; preds = %151, %163, %160
  %168 = phi i32 [ %152, %151 ], [ %136, %163 ], [ %136, %160 ]
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %135, align 8, !tbaa !13
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #16
  br label %190

170:                                              ; preds = %140
  %171 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 3
  %172 = load i8*, i8** %171, align 8, !tbaa !15
  %173 = load i8, i8* %172, align 1, !tbaa !16, !range !18
  %174 = xor i8 %173, 1
  store i8 %174, i8* %172, align 1, !tbaa !16
  %175 = add nsw i32 %136, 1
  store i32 %175, i32* %135, align 8, !tbaa !13
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #16
  br label %190

176:                                              ; preds = %123
  %177 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 7
  %178 = load i32, i32* %177, align 8, !tbaa !13
  %179 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 4
  %180 = load i32, i32* %179, align 8, !tbaa !14
  %181 = icmp eq i32 %178, %180
  br i1 %181, label %203, label %182

182:                                              ; preds = %176
  switch i32 %124, label %189 [
    i32 2, label %183
    i32 3, label %203
    i32 4, label %207
  ]

183:                                              ; preds = %182
  %184 = getelementptr inbounds %struct._args_option, %struct._args_option* %125, i64 0, i32 3
  %185 = load i8*, i8** %184, align 8, !tbaa !15
  %186 = load i8, i8* %185, align 1, !tbaa !16, !range !18
  %187 = xor i8 %186, 1
  store i8 %187, i8* %185, align 1, !tbaa !16
  %188 = add nsw i32 %178, 1
  store i32 %188, i32* %177, align 8, !tbaa !13
  br label %190

189:                                              ; preds = %182
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 137, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__.args_parse_option, i64 0, i64 0)) #17
  unreachable

190:                                              ; preds = %170, %167, %183
  %191 = phi i32 [ %131, %167 ], [ %107, %170 ], [ %107, %183 ]
  %192 = load i8, i8* %127, align 1, !tbaa !10
  %193 = icmp eq i8 %192, 0
  br i1 %193, label %209, label %104

194:                                              ; preds = %25, %28, %17
  %195 = add nsw i32 %19, 1
  %196 = sext i32 %19 to i64
  %197 = getelementptr inbounds i8*, i8** %2, i64 %196
  store i8* %22, i8** %197, align 8, !tbaa !11
  br label %209

198:                                              ; preds = %57, %70
  %199 = phi i32 [ 3, %70 ], [ 2, %57 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #16
  br label %207

200:                                              ; preds = %78, %65, %88, %85
  %201 = phi i32 [ %79, %78 ], [ %60, %65 ], [ %60, %88 ], [ %60, %85 ]
  %202 = add nsw i32 %201, 1
  store i32 %202, i32* %59, align 8, !tbaa !13
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #16
  br label %209

203:                                              ; preds = %176, %182, %104
  %204 = phi i32 [ 1, %104 ], [ 2, %176 ], [ %124, %182 ]
  br label %207

205:                                              ; preds = %90, %96, %32
  %206 = phi i32 [ 1, %32 ], [ 2, %90 ], [ %36, %96 ]
  br label %207

207:                                              ; preds = %49, %117, %96, %182, %205, %203, %165, %198
  %208 = phi i32 [ %199, %198 ], [ %166, %165 ], [ %204, %203 ], [ %206, %205 ], [ 4, %182 ], [ 4, %96 ], [ 1, %117 ], [ 1, %49 ]
  tail call void @args_print_error(i32 %208, i8* nonnull %22)
  tail call void @exit(i32 1) #17
  unreachable

209:                                              ; preds = %190, %97, %194, %200
  %210 = phi i32 [ %18, %200 ], [ %18, %97 ], [ %18, %194 ], [ %191, %190 ]
  %211 = phi i32 [ %19, %200 ], [ %19, %97 ], [ %195, %194 ], [ %19, %190 ]
  %212 = add nsw i32 %210, 1
  %213 = icmp slt i32 %212, %1
  br i1 %213, label %17, label %12

214:                                              ; preds = %12, %214
  %215 = phi %struct._args_option* [ %217, %214 ], [ %0, %12 ]
  %216 = getelementptr inbounds %struct._args_option, %struct._args_option* %215, i64 0, i32 3
  store i8* null, i8** %216, align 8, !tbaa !15
  %217 = getelementptr inbounds %struct._args_option, %struct._args_option* %215, i64 1
  %218 = getelementptr inbounds %struct._args_option, %struct._args_option* %217, i64 0, i32 0
  %219 = load i32, i32* %218, align 8, !tbaa !2
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %221, label %214

221:                                              ; preds = %214, %12
  ret i32 %13
}

; Function Attrs: nofree nounwind readonly
declare dso_local i8* @strchr(i8*, i32) local_unnamed_addr #9

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #7

; Function Attrs: nounwind uwtable
define dso_local void @args_print_usage(%struct._args_option* nocapture readonly %0, i32 %1) local_unnamed_addr #4 {
  %3 = alloca [128 x i8], align 16
  %4 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %4) #16
  %5 = getelementptr inbounds %struct._args_option, %struct._args_option* %0, i64 0, i32 0
  %6 = load i32, i32* %5, align 8, !tbaa !2
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %69, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 2
  br label %10

10:                                               ; preds = %8, %61
  %11 = phi i32* [ %5, %8 ], [ %66, %61 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(3) %4, i8* nonnull align 1 dereferenceable(3) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i64 3, i1 false)
  %12 = getelementptr inbounds i32, i32* %11, i64 1
  %13 = bitcast i32* %12 to i8*
  %14 = load i8, i8* %13, align 4, !tbaa !8
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %20, label %16

16:                                               ; preds = %10
  %17 = sext i8 %14 to i32
  %18 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %9, i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i32 %17) #16
  %19 = add nsw i32 %18, 2
  br label %21

20:                                               ; preds = %10
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %9, i8* nonnull align 1 dereferenceable(6) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0), i64 6, i1 false)
  br label %21

21:                                               ; preds = %20, %16
  %22 = phi i32 [ %19, %16 ], [ 7, %20 ]
  %23 = load i8, i8* %13, align 4, !tbaa !8
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %35, label %25

25:                                               ; preds = %21
  %26 = getelementptr inbounds i32, i32* %11, i64 2
  %27 = bitcast i32* %26 to i8**
  %28 = load i8*, i8** %27, align 8, !tbaa !9
  %29 = icmp eq i8* %28, null
  br i1 %29, label %35, label %30

30:                                               ; preds = %25
  %31 = sext i32 %22 to i64
  %32 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 %31
  %33 = bitcast i8* %32 to i32*
  store i32 2105388, i32* %33, align 1
  %34 = add nsw i32 %22, 3
  br label %35

35:                                               ; preds = %25, %21, %30
  %36 = phi i32 [ %34, %30 ], [ %22, %25 ], [ %22, %21 ]
  %37 = getelementptr inbounds i32, i32* %11, i64 2
  %38 = bitcast i32* %37 to i8**
  %39 = load i8*, i8** %38, align 8, !tbaa !9
  %40 = icmp eq i8* %39, null
  br i1 %40, label %46, label %41

41:                                               ; preds = %35
  %42 = sext i32 %36 to i64
  %43 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 %42
  %44 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %43, i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i64 0, i64 0), i8* nonnull %39) #16
  %45 = add nsw i32 %44, %36
  br label %46

46:                                               ; preds = %35, %41
  %47 = phi i32 [ %45, %41 ], [ %36, %35 ]
  %48 = load i32, i32* %11, align 8, !tbaa !2
  %49 = add i32 %48, -3
  %50 = icmp ult i32 %49, 2
  br i1 %50, label %51, label %61

51:                                               ; preds = %46
  %52 = sext i32 %47 to i64
  %53 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 %52
  %54 = load i8*, i8** %38, align 8, !tbaa !9
  %55 = icmp eq i8* %54, null
  %56 = select i1 %55, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0)
  %57 = getelementptr inbounds i32, i32* %11, i64 10
  %58 = bitcast i32* %57 to i8**
  %59 = load i8*, i8** %58, align 8, !tbaa !21
  %60 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %53, i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i64 0, i64 0), i8* %56, i8* %59) #16
  br label %61

61:                                               ; preds = %46, %51
  %62 = getelementptr inbounds i32, i32* %11, i64 8
  %63 = bitcast i32* %62 to i8**
  %64 = load i8*, i8** %63, align 8, !tbaa !22
  %65 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i64 0, i64 0), i32 %1, i8* nonnull %4, i8* %64)
  %66 = getelementptr inbounds i32, i32* %11, i64 14
  %67 = load i32, i32* %66, align 8, !tbaa !2
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %10

69:                                               ; preds = %61, %2
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %4) #16
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nofree nounwind
declare dso_local i32 @sprintf(i8* noalias nocapture, i8* nocapture readonly, ...) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local void @args_free(%struct._args_option* nocapture readonly %0) local_unnamed_addr #4 {
  br label %2

2:                                                ; preds = %11, %1
  %3 = phi %struct._args_option* [ %0, %1 ], [ %12, %11 ]
  %4 = getelementptr inbounds %struct._args_option, %struct._args_option* %3, i64 0, i32 0
  %5 = load i32, i32* %4, align 8, !tbaa !2
  switch i32 %5, label %11 [
    i32 0, label %13
    i32 4, label %6
  ]

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct._args_option, %struct._args_option* %3, i64 0, i32 3
  %8 = load i8*, i8** %7, align 8, !tbaa !15
  %9 = icmp eq i8* %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %6
  tail call void @free(i8* nonnull %8) #16
  br label %11

11:                                               ; preds = %2, %6, %10
  %12 = getelementptr inbounds %struct._args_option, %struct._args_option* %3, i64 1
  br label %2

13:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @compile_files(%struct._YR_COMPILER* %0, i32 %1, i8** nocapture readonly %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %1, 1
  br i1 %4, label %5, label %46

5:                                                ; preds = %3
  %6 = add nsw i32 %1, -1
  %7 = zext i32 %6 to i64
  br label %10

8:                                                ; preds = %41
  %9 = icmp eq i64 %45, %7
  br i1 %9, label %46, label %10

10:                                               ; preds = %8, %5
  %11 = phi i64 [ 0, %5 ], [ %45, %8 ]
  %12 = getelementptr inbounds i8*, i8** %2, i64 %11
  %13 = load i8*, i8** %12, align 8, !tbaa !11
  %14 = tail call i32 @access(i8* %13, i32 0) #16
  %15 = icmp eq i32 %14, 0
  %16 = load i8*, i8** %12, align 8, !tbaa !11
  br i1 %15, label %26, label %17

17:                                               ; preds = %10
  %18 = tail call i8* @strchr(i8* nonnull dereferenceable(1) %16, i32 58) #15
  %19 = icmp eq i8* %18, null
  br i1 %19, label %26, label %20

20:                                               ; preds = %17
  %21 = getelementptr inbounds i8, i8* %18, i64 1
  %22 = load i8, i8* %21, align 1, !tbaa !10
  %23 = icmp eq i8 %22, 92
  br i1 %23, label %26, label %24

24:                                               ; preds = %20
  store i8 0, i8* %18, align 1, !tbaa !10
  %25 = load i8*, i8** %12, align 8, !tbaa !11
  br label %26

26:                                               ; preds = %10, %17, %20, %24
  %27 = phi i8* [ %25, %24 ], [ null, %20 ], [ null, %17 ], [ null, %10 ]
  %28 = phi i8* [ %21, %24 ], [ %16, %20 ], [ %16, %17 ], [ %16, %10 ]
  %29 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %28, i8* nonnull dereferenceable(2) getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0)) #15
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %26
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !tbaa !11
  br label %35

33:                                               ; preds = %26
  %34 = tail call %struct._IO_FILE* @fopen(i8* %28, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1.11, i64 0, i64 0))
  br label %35

35:                                               ; preds = %33, %31
  %36 = phi %struct._IO_FILE* [ %32, %31 ], [ %34, %33 ]
  %37 = icmp eq %struct._IO_FILE* %36, null
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2.12, i64 0, i64 0), i8* %28) #18
  br label %46

41:                                               ; preds = %35
  %42 = tail call i32 @yr_compiler_add_file(%struct._YR_COMPILER* %0, %struct._IO_FILE* nonnull %36, i8* %27, i8* %28) #16
  %43 = tail call i32 @fclose(%struct._IO_FILE* nonnull %36)
  %44 = icmp sgt i32 %42, 0
  %45 = add nuw nsw i64 %11, 1
  br i1 %44, label %46, label %8

46:                                               ; preds = %41, %8, %3, %38
  %47 = phi i1 [ false, %38 ], [ true, %3 ], [ true, %8 ], [ false, %41 ]
  ret i1 %47
}

; Function Attrs: nofree nounwind
declare dso_local i32 @access(i8* nocapture readonly, i32) local_unnamed_addr #6

; Function Attrs: nofree nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #6

declare dso_local i32 @yr_compiler_add_file(%struct._YR_COMPILER*, %struct._IO_FILE*, i8*, i8*) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local i32 @define_external_variables(i8** nocapture readonly %0, %struct.YR_RULES* %1, %struct._YR_COMPILER* %2) local_unnamed_addr #4 {
  %4 = load i8*, i8** %0, align 8, !tbaa !11
  %5 = icmp eq i8* %4, null
  br i1 %5, label %119, label %6

6:                                                ; preds = %3
  %7 = icmp eq %struct.YR_RULES* %1, null
  %8 = icmp eq %struct._YR_COMPILER* %2, null
  br label %9

9:                                                ; preds = %6, %110
  %10 = phi i64 [ 0, %6 ], [ %112, %110 ]
  %11 = phi i8* [ %4, %6 ], [ %114, %110 ]
  %12 = phi i8** [ %0, %6 ], [ %113, %110 ]
  %13 = phi i32 [ 0, %6 ], [ %111, %110 ]
  %14 = tail call i8* @strchr(i8* nonnull %11, i32 61) #15
  %15 = icmp eq i8* %14, null
  br i1 %15, label %116, label %16

16:                                               ; preds = %9
  store i8 0, i8* %14, align 1, !tbaa !10
  %17 = getelementptr inbounds i8, i8* %14, i64 1
  %18 = load i8*, i8** %12, align 8, !tbaa !11
  %19 = load i8, i8* %17, align 1, !tbaa !10
  %20 = icmp eq i8 %19, 45
  %21 = getelementptr inbounds i8, i8* %14, i64 2
  %22 = select i1 %20, i8* %21, i8* %17
  %23 = load i8, i8* %22, align 1, !tbaa !10
  %24 = icmp eq i8 %23, 46
  br i1 %24, label %58, label %25

25:                                               ; preds = %16, %40
  %26 = phi i8 [ %43, %40 ], [ %23, %16 ]
  %27 = phi i8* [ %42, %40 ], [ %22, %16 ]
  %28 = phi i8 [ %41, %40 ], [ 0, %16 ]
  switch i8 %26, label %32 [
    i8 0, label %44
    i8 46, label %29
  ]

29:                                               ; preds = %25
  %30 = and i8 %28, 1
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %40, label %56

32:                                               ; preds = %25
  %33 = tail call i16** @__ctype_b_loc() #19
  %34 = load i16*, i16** %33, align 8, !tbaa !11
  %35 = sext i8 %26 to i64
  %36 = getelementptr inbounds i16, i16* %34, i64 %35
  %37 = load i16, i16* %36, align 2, !tbaa !23
  %38 = and i16 %37, 2048
  %39 = icmp eq i16 %38, 0
  br i1 %39, label %56, label %40

40:                                               ; preds = %32, %29
  %41 = phi i8 [ %28, %32 ], [ 1, %29 ]
  %42 = getelementptr inbounds i8, i8* %27, i64 1
  %43 = load i8, i8* %42, align 1, !tbaa !10
  br label %25

44:                                               ; preds = %25
  %45 = and i8 %28, 1
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %56, label %47

47:                                               ; preds = %44
  br i1 %7, label %51, label %48

48:                                               ; preds = %47
  %49 = tail call double @strtod(i8* nocapture nonnull %17, i8** null) #16
  %50 = tail call i32 @yr_rules_define_float_variable(%struct.YR_RULES* nonnull %1, i8* %18, double %49) #16
  br label %51

51:                                               ; preds = %47, %48
  %52 = phi i32 [ %50, %48 ], [ %13, %47 ]
  br i1 %8, label %110, label %53

53:                                               ; preds = %51
  %54 = tail call double @strtod(i8* nocapture nonnull %17, i8** null) #16
  %55 = tail call i32 @yr_compiler_define_float_variable(%struct._YR_COMPILER* nonnull %2, i8* %18, double %54) #16
  br label %110

56:                                               ; preds = %32, %29, %44
  %57 = icmp eq i8 %23, 0
  br i1 %57, label %86, label %58

58:                                               ; preds = %16, %56
  %59 = tail call i16** @__ctype_b_loc() #19
  %60 = load i16*, i16** %59, align 8, !tbaa !11
  br label %61

61:                                               ; preds = %69, %58
  %62 = phi i8* [ %22, %58 ], [ %70, %69 ]
  %63 = phi i8 [ %23, %58 ], [ %71, %69 ]
  %64 = sext i8 %63 to i64
  %65 = getelementptr inbounds i16, i16* %60, i64 %64
  %66 = load i16, i16* %65, align 2, !tbaa !23
  %67 = and i16 %66, 2048
  %68 = icmp eq i16 %67, 0
  br i1 %68, label %86, label %69

69:                                               ; preds = %61
  %70 = getelementptr inbounds i8, i8* %62, i64 1
  %71 = load i8, i8* %70, align 1, !tbaa !10
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %73, label %61

73:                                               ; preds = %69
  br i1 %7, label %79, label %74

74:                                               ; preds = %73
  %75 = tail call i64 @strtol(i8* nocapture nonnull %17, i8** null, i32 10) #16
  %76 = shl i64 %75, 32
  %77 = ashr exact i64 %76, 32
  %78 = tail call i32 @yr_rules_define_integer_variable(%struct.YR_RULES* nonnull %1, i8* %18, i64 %77) #16
  br label %79

79:                                               ; preds = %73, %74
  %80 = phi i32 [ %78, %74 ], [ %13, %73 ]
  br i1 %8, label %110, label %81

81:                                               ; preds = %79
  %82 = tail call i64 @strtol(i8* nocapture nonnull %17, i8** null, i32 10) #16
  %83 = shl i64 %82, 32
  %84 = ashr exact i64 %83, 32
  %85 = tail call i32 @yr_compiler_define_integer_variable(%struct._YR_COMPILER* nonnull %2, i8* %18, i64 %84) #16
  br label %110

86:                                               ; preds = %61, %56
  %87 = tail call i32 @strcmp(i8* nonnull %17, i8* nonnull dereferenceable(5) getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.13, i64 0, i64 0)) #15
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %92, label %89

89:                                               ; preds = %86
  %90 = tail call i32 @strcmp(i8* nonnull %17, i8* nonnull dereferenceable(6) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5.14, i64 0, i64 0)) #15
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %103

92:                                               ; preds = %89, %86
  br i1 %7, label %96, label %93

93:                                               ; preds = %92
  %94 = zext i1 %88 to i32
  %95 = tail call i32 @yr_rules_define_boolean_variable(%struct.YR_RULES* nonnull %1, i8* %18, i32 %94) #16
  br label %96

96:                                               ; preds = %92, %93
  %97 = phi i32 [ %95, %93 ], [ %13, %92 ]
  br i1 %8, label %110, label %98

98:                                               ; preds = %96
  %99 = tail call i32 @strcmp(i8* nonnull %17, i8* nonnull dereferenceable(5) getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.13, i64 0, i64 0)) #15
  %100 = icmp eq i32 %99, 0
  %101 = zext i1 %100 to i32
  %102 = tail call i32 @yr_compiler_define_boolean_variable(%struct._YR_COMPILER* nonnull %2, i8* %18, i32 %101) #16
  br label %110

103:                                              ; preds = %89
  br i1 %7, label %106, label %104

104:                                              ; preds = %103
  %105 = tail call i32 @yr_rules_define_string_variable(%struct.YR_RULES* nonnull %1, i8* %18, i8* nonnull %17) #16
  br label %106

106:                                              ; preds = %103, %104
  %107 = phi i32 [ %105, %104 ], [ %13, %103 ]
  br i1 %8, label %110, label %108

108:                                              ; preds = %106
  %109 = tail call i32 @yr_compiler_define_string_variable(%struct._YR_COMPILER* nonnull %2, i8* %18, i8* nonnull %17) #16
  br label %110

110:                                              ; preds = %51, %79, %96, %106, %81, %108, %98, %53
  %111 = phi i32 [ %107, %106 ], [ %109, %108 ], [ %97, %96 ], [ %102, %98 ], [ %80, %79 ], [ %85, %81 ], [ %52, %51 ], [ %55, %53 ]
  %112 = add nuw i64 %10, 1
  %113 = getelementptr inbounds i8*, i8** %0, i64 %112
  %114 = load i8*, i8** %113, align 8, !tbaa !11
  %115 = icmp eq i8* %114, null
  br i1 %115, label %119, label %9

116:                                              ; preds = %9
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %118 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3.15, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %117) #18
  br label %119

119:                                              ; preds = %110, %3, %116
  %120 = phi i32 [ 0, %116 ], [ 0, %3 ], [ %111, %110 ]
  ret i32 %120
}

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare dso_local double @strtod(i8* readonly, i8** nocapture) local_unnamed_addr #6

declare dso_local i32 @yr_rules_define_float_variable(%struct.YR_RULES*, i8*, double) local_unnamed_addr #11

declare dso_local i32 @yr_compiler_define_float_variable(%struct._YR_COMPILER*, i8*, double) local_unnamed_addr #11

declare dso_local i32 @yr_rules_define_integer_variable(%struct.YR_RULES*, i8*, i64) local_unnamed_addr #11

declare dso_local i32 @yr_compiler_define_integer_variable(%struct._YR_COMPILER*, i8*, i64) local_unnamed_addr #11

declare dso_local i32 @yr_rules_define_boolean_variable(%struct.YR_RULES*, i8*, i32) local_unnamed_addr #11

declare dso_local i32 @yr_compiler_define_boolean_variable(%struct._YR_COMPILER*, i8*, i32) local_unnamed_addr #11

declare dso_local i32 @yr_rules_define_string_variable(%struct.YR_RULES*, i8*, i8*) local_unnamed_addr #11

declare dso_local i32 @yr_compiler_define_string_variable(%struct._YR_COMPILER*, i8*, i8*) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #13

; Function Attrs: nounwind readonly uwtable
define dso_local zeroext i1 @is_float(i8* nocapture readonly %0) local_unnamed_addr #1 {
  %2 = load i8, i8* %0, align 1, !tbaa !10
  %3 = icmp eq i8 %2, 45
  %4 = getelementptr inbounds i8, i8* %0, i64 1
  %5 = select i1 %3, i8* %4, i8* %0
  %6 = load i8, i8* %5, align 1, !tbaa !10
  %7 = icmp eq i8 %6, 46
  br i1 %7, label %30, label %8

8:                                                ; preds = %1, %23
  %9 = phi i8 [ %26, %23 ], [ %6, %1 ]
  %10 = phi i8* [ %25, %23 ], [ %5, %1 ]
  %11 = phi i8 [ %24, %23 ], [ 0, %1 ]
  switch i8 %9, label %15 [
    i8 0, label %27
    i8 46, label %12
  ]

12:                                               ; preds = %8
  %13 = and i8 %11, 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %23, label %30

15:                                               ; preds = %8
  %16 = tail call i16** @__ctype_b_loc() #19
  %17 = load i16*, i16** %16, align 8, !tbaa !11
  %18 = sext i8 %9 to i64
  %19 = getelementptr inbounds i16, i16* %17, i64 %18
  %20 = load i16, i16* %19, align 2, !tbaa !23
  %21 = and i16 %20, 2048
  %22 = icmp eq i16 %21, 0
  br i1 %22, label %30, label %23

23:                                               ; preds = %12, %15
  %24 = phi i8 [ %11, %15 ], [ 1, %12 ]
  %25 = getelementptr inbounds i8, i8* %10, i64 1
  %26 = load i8, i8* %25, align 1, !tbaa !10
  br label %8

27:                                               ; preds = %8
  %28 = and i8 %11, 1
  %29 = icmp ne i8 %28, 0
  br label %30

30:                                               ; preds = %15, %12, %1, %27
  %31 = phi i1 [ %29, %27 ], [ false, %1 ], [ false, %12 ], [ false, %15 ]
  ret i1 %31
}

; Function Attrs: nounwind readonly uwtable
define dso_local zeroext i1 @is_integer(i8* nocapture readonly %0) local_unnamed_addr #1 {
  %2 = load i8, i8* %0, align 1, !tbaa !10
  %3 = icmp eq i8 %2, 45
  %4 = getelementptr inbounds i8, i8* %0, i64 1
  %5 = select i1 %3, i8* %4, i8* %0
  %6 = load i8, i8* %5, align 1, !tbaa !10
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %23, label %8

8:                                                ; preds = %1
  %9 = tail call i16** @__ctype_b_loc() #19
  %10 = load i16*, i16** %9, align 8, !tbaa !11
  br label %11

11:                                               ; preds = %8, %19
  %12 = phi i8* [ %5, %8 ], [ %20, %19 ]
  %13 = phi i8 [ %6, %8 ], [ %21, %19 ]
  %14 = sext i8 %13 to i64
  %15 = getelementptr inbounds i16, i16* %10, i64 %14
  %16 = load i16, i16* %15, align 2, !tbaa !23
  %17 = and i16 %16, 2048
  %18 = icmp eq i16 %17, 0
  br i1 %18, label %23, label %19

19:                                               ; preds = %11
  %20 = getelementptr inbounds i8, i8* %12, i64 1
  %21 = load i8, i8* %20, align 1, !tbaa !10
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %23, label %11

23:                                               ; preds = %11, %19, %1
  %24 = phi i1 [ false, %1 ], [ false, %11 ], [ true, %19 ]
  ret i1 %24
}

; Function Attrs: nounwind uwtable
define dso_local i32 @cli_mutex_init(%union.pthread_mutex_t* %0) local_unnamed_addr #4 {
  %2 = tail call i32 @pthread_mutex_init(%union.pthread_mutex_t* %0, %union.anon.21* null) #16
  ret i32 %2
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.anon.21*) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local void @cli_mutex_destroy(%union.pthread_mutex_t* %0) local_unnamed_addr #4 {
  %2 = tail call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* %0) #16
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_destroy(%union.pthread_mutex_t*) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local void @cli_mutex_lock(%union.pthread_mutex_t* %0) local_unnamed_addr #4 {
  %2 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %0) #16
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local void @cli_mutex_unlock(%union.pthread_mutex_t* %0) local_unnamed_addr #4 {
  %2 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %0) #16
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local i32 @cli_semaphore_init(%union.sem_t** nocapture %0, i32 %1) local_unnamed_addr #4 {
  %3 = tail call noalias dereferenceable_or_null(32) i8* @malloc(i64 32) #16
  %4 = bitcast %union.sem_t** %0 to i8**
  store i8* %3, i8** %4, align 8, !tbaa !11
  %5 = icmp eq i8* %3, null
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = tail call i32* @__errno_location() #19
  %8 = load i32, i32* %7, align 4, !tbaa !12
  br label %12

9:                                                ; preds = %2
  %10 = bitcast i8* %3 to %union.sem_t*
  %11 = tail call i32 @sem_init(%union.sem_t* nonnull %10, i32 0, i32 %1) #16
  br label %12

12:                                               ; preds = %9, %6
  %13 = phi i32 [ %8, %6 ], [ %11, %9 ]
  ret i32 %13
}

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #6

; Function Attrs: nounwind readnone
declare dso_local i32* @__errno_location() local_unnamed_addr #12

; Function Attrs: nounwind
declare dso_local i32 @sem_init(%union.sem_t*, i32, i32) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local void @cli_semaphore_destroy(%union.sem_t** nocapture readonly %0) local_unnamed_addr #4 {
  %2 = load %union.sem_t*, %union.sem_t** %0, align 8, !tbaa !11
  %3 = tail call i32 @sem_close(%union.sem_t* %2) #16
  %4 = bitcast %union.sem_t** %0 to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !11
  tail call void @free(i8* %5) #16
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @sem_close(%union.sem_t*) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local i32 @cli_semaphore_wait(%union.sem_t** nocapture readonly %0, i64 %1) local_unnamed_addr #4 {
  %3 = alloca %struct.timespec, align 8
  %4 = tail call i64 @time(i64* null) #16
  %5 = sub nsw i64 %1, %4
  %6 = trunc i64 %5 to i32
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %22, label %8

8:                                                ; preds = %2
  %9 = bitcast %struct.timespec* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #16
  %10 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i64 0, i32 0
  store i64 %1, i64* %10, align 8, !tbaa !25
  %11 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i64 0, i32 1
  store i64 0, i64* %11, align 8, !tbaa !27
  %12 = load %union.sem_t*, %union.sem_t** %0, align 8, !tbaa !11
  %13 = call i32 @sem_timedwait(%union.sem_t* %12, %struct.timespec* nonnull %3) #16
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %19

15:                                               ; preds = %8
  %16 = tail call i32* @__errno_location() #19
  %17 = load i32, i32* %16, align 4, !tbaa !12
  %18 = icmp eq i32 %17, 110
  br i1 %18, label %20, label %19

19:                                               ; preds = %15, %8
  br label %20

20:                                               ; preds = %15, %19
  %21 = phi i32 [ 0, %19 ], [ 26, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #16
  br label %22

22:                                               ; preds = %2, %20
  %23 = phi i32 [ %21, %20 ], [ 26, %2 ]
  ret i32 %23
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) local_unnamed_addr #10

declare dso_local i32 @sem_timedwait(%union.sem_t*, %struct.timespec*) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define dso_local void @cli_semaphore_release(%union.sem_t** nocapture readonly %0) local_unnamed_addr #4 {
  %2 = load %union.sem_t*, %union.sem_t** %0, align 8, !tbaa !11
  %3 = tail call i32 @sem_post(%union.sem_t* %2) #16
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @sem_post(%union.sem_t*) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local i32 @cli_create_thread(i64* %0, i8* (i8*)* %1, i8* %2) local_unnamed_addr #4 {
  %4 = tail call i32 @pthread_create(i64* %0, %union.pthread_attr_t* null, i8* (i8*)* %1, i8* %2) #16
  ret i32 %4
}

; Function Attrs: nounwind
declare !callback !28 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local void @cli_thread_join(i64* nocapture readonly %0) local_unnamed_addr #4 {
  %2 = load i64, i64* %0, align 8, !tbaa !19
  %3 = tail call i32 @pthread_join(i64 %2, i8** null) #16
  ret void
}

declare dso_local i32 @pthread_join(i64, i8**) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define dso_local i32 @start_main(i32 %0, i8** %1) local_unnamed_addr #4 {
  %3 = alloca %struct.stat, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.stat, align 8
  %7 = alloca %struct.YR_RULES_STATS, align 4
  %8 = alloca %struct.YR_ARENA_REF, align 4
  %9 = alloca %struct._YR_COMPILER*, align 8
  %10 = alloca %struct.YR_RULES*, align 8
  %11 = alloca %struct.YR_SCAN_CONTEXT*, align 8
  %12 = alloca %struct.SCAN_OPTIONS, align 8
  %13 = alloca %struct._YR_STREAM, align 8
  %14 = alloca [32 x i64], align 16
  %15 = alloca [32 x %struct._THREAD_ARGS], align 16
  %16 = alloca %struct._CALLBACK_ARGS, align 8
  %17 = alloca i8*, align 8
  %18 = bitcast %struct.YR_ARENA_REF* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %18) #16
  %19 = bitcast %struct._YR_COMPILER** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19) #16
  store %struct._YR_COMPILER* null, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  %20 = bitcast %struct.YR_RULES** %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #16
  store %struct.YR_RULES* null, %struct.YR_RULES** %10, align 8, !tbaa !11
  %21 = bitcast %struct.YR_SCAN_CONTEXT** %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21) #16
  store %struct.YR_SCAN_CONTEXT* null, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  %22 = getelementptr inbounds %struct.SCAN_OPTIONS, %struct.SCAN_OPTIONS* %12, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %22) #16
  %23 = tail call i32 @args_parse(%struct._args_option* getelementptr inbounds ([31 x %struct._args_option], [31 x %struct._args_option]* @options, i64 0, i64 0), i32 %0, i8** %1) #16
  %24 = load i8, i8* @follow_symlinks, align 1, !tbaa !16, !range !18
  store i8 %24, i8* %22, align 8, !tbaa !30
  %25 = load i8, i8* @recursive_search, align 1, !tbaa !16, !range !18
  %26 = getelementptr inbounds %struct.SCAN_OPTIONS, %struct.SCAN_OPTIONS* %12, i64 0, i32 1
  store i8 %25, i8* %26, align 1, !tbaa !32
  %27 = load i8, i8* @show_version, align 1, !tbaa !16, !range !18
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %31, label %29

29:                                               ; preds = %2
  %30 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.69, i64 0, i64 0))
  br label %469

31:                                               ; preds = %2
  %32 = load i8, i8* @show_help, align 1, !tbaa !16, !range !18
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %37, label %34

34:                                               ; preds = %31
  %35 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([127 x i8], [127 x i8]* @.str.70, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.69, i64 0, i64 0), i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.71, i64 0, i64 0))
  tail call void @args_print_usage(%struct._args_option* getelementptr inbounds ([31 x %struct._args_option], [31 x %struct._args_option]* @options, i64 0, i64 0), i32 43) #16
  %36 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0))
  br label %469

37:                                               ; preds = %31
  %38 = load i32, i32* @threads, align 4, !tbaa !12
  %39 = icmp sgt i32 %38, 32
  br i1 %39, label %40, label %43

40:                                               ; preds = %37
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.73, i64 0, i64 0), i32 32) #18
  br label %469

43:                                               ; preds = %37
  %44 = icmp slt i32 %23, 2
  br i1 %44, label %45, label %52

45:                                               ; preds = %43
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.74, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %46) #18
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.75, i64 0, i64 0), i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.71, i64 0, i64 0)) #18
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.76, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %50) #18
  br label %469

52:                                               ; preds = %43
  %53 = load i8*, i8** getelementptr inbounds ([33 x i8*], [33 x i8*]* @modules_data, i64 0, i64 0), align 16, !tbaa !11
  %54 = icmp eq i8* %53, null
  br i1 %54, label %88, label %55

55:                                               ; preds = %52, %83
  %56 = phi i64 [ %84, %83 ], [ 0, %52 ]
  %57 = phi i8* [ %86, %83 ], [ %53, %52 ]
  %58 = phi i8** [ %85, %83 ], [ getelementptr inbounds ([33 x i8*], [33 x i8*]* @modules_data, i64 0, i64 0), %52 ]
  %59 = tail call i8* @strchr(i8* nonnull %57, i32 61) #15
  %60 = icmp eq i8* %59, null
  br i1 %60, label %61, label %64

61:                                               ; preds = %55
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %63 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.85, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %62) #20
  br label %443

64:                                               ; preds = %55
  store i8 0, i8* %59, align 1, !tbaa !10
  %65 = tail call noalias dereferenceable_or_null(40) i8* @malloc(i64 40) #16
  %66 = icmp eq i8* %65, null
  br i1 %66, label %83, label %67

67:                                               ; preds = %64
  %68 = bitcast i8** %58 to i64*
  %69 = load i64, i64* %68, align 8, !tbaa !11
  %70 = bitcast i8* %65 to i64*
  store i64 %69, i64* %70, align 8, !tbaa !33
  %71 = getelementptr inbounds i8, i8* %59, i64 1
  %72 = getelementptr inbounds i8, i8* %65, i64 8
  %73 = bitcast i8* %72 to %struct._YR_MAPPED_FILE*
  %74 = tail call i32 @yr_filemap_map(i8* nonnull %71, %struct._YR_MAPPED_FILE* nonnull %73) #16
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %80

76:                                               ; preds = %67
  %77 = load i64, i64* bitcast (%struct._MODULE_DATA** @modules_data_list to i64*), align 8, !tbaa !11
  %78 = getelementptr inbounds i8, i8* %65, i64 32
  %79 = bitcast i8* %78 to i64*
  store i64 %77, i64* %79, align 8, !tbaa !36
  store i8* %65, i8** bitcast (%struct._MODULE_DATA** @modules_data_list to i8**), align 8, !tbaa !11
  br label %83

80:                                               ; preds = %67
  tail call void @free(i8* nonnull %65) #16
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %82 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.86, i64 0, i64 0), i8* nonnull %71) #20
  br label %443

83:                                               ; preds = %76, %64
  %84 = add nuw i64 %56, 1
  %85 = getelementptr inbounds [33 x i8*], [33 x i8*]* @modules_data, i64 0, i64 %84
  %86 = load i8*, i8** %85, align 8, !tbaa !11
  %87 = icmp eq i8* %86, null
  br i1 %87, label %88, label %55

88:                                               ; preds = %83, %52
  %89 = tail call i32 @yr_initialize() #16
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %94, label %91

91:                                               ; preds = %88
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %93 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %92, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.77, i64 0, i64 0), i32 %89) #18
  br label %443

94:                                               ; preds = %88
  %95 = tail call i32 @yr_set_configuration(i32 0, i8* bitcast (i32* @stack_size to i8*)) #16
  %96 = tail call i32 @yr_set_configuration(i32 1, i8* bitcast (i32* @max_strings_per_rule to i8*)) #16
  %97 = tail call i32 @yr_set_configuration(i32 3, i8* bitcast (i32* @max_process_memory_chunk to i8*)) #16
  %98 = load i8, i8* @rules_are_compiled, align 1, !tbaa !16, !range !18
  %99 = icmp eq i8 %98, 0
  br i1 %99, label %121, label %100

100:                                              ; preds = %94
  %101 = icmp eq i32 %23, 2
  br i1 %101, label %105, label %102

102:                                              ; preds = %100
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %104 = tail call i64 @fwrite(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.78, i64 0, i64 0), i64 77, i64 1, %struct._IO_FILE* %103) #18
  br label %443

105:                                              ; preds = %100
  %106 = load i8*, i8** %1, align 8, !tbaa !11
  %107 = tail call %struct._IO_FILE* @fopen(i8* %106, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.79, i64 0, i64 0))
  %108 = icmp eq %struct._IO_FILE* %107, null
  br i1 %108, label %162, label %109

109:                                              ; preds = %105
  %110 = bitcast %struct._YR_STREAM* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %110) #16
  %111 = bitcast %struct._YR_STREAM* %13 to %struct._IO_FILE**
  store %struct._IO_FILE* %107, %struct._IO_FILE** %111, align 8, !tbaa !37
  %112 = getelementptr inbounds %struct._YR_STREAM, %struct._YR_STREAM* %13, i64 0, i32 1
  store i64 (i8*, i64, i64, i8*)* bitcast (i64 (i8*, i64, i64, %struct._IO_FILE*)* @fread to i64 (i8*, i64, i64, i8*)*), i64 (i8*, i64, i64, i8*)** %112, align 8, !tbaa !39
  %113 = call i32 @yr_rules_load_stream(%struct._YR_STREAM* nonnull %13, %struct.YR_RULES** nonnull %10) #16
  %114 = call i32 @fclose(%struct._IO_FILE* nonnull %107)
  %115 = icmp eq i32 %113, 0
  br i1 %115, label %116, label %119

116:                                              ; preds = %109
  %117 = load %struct.YR_RULES*, %struct.YR_RULES** %10, align 8, !tbaa !11
  %118 = call i32 @define_external_variables(i8** getelementptr inbounds ([33 x i8*], [33 x i8*]* @ext_vars, i64 0, i64 0), %struct.YR_RULES* %117, %struct._YR_COMPILER* null) #16
  br label %119

119:                                              ; preds = %116, %109
  %120 = phi i32 [ %118, %116 ], [ %113, %109 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %110) #16
  br label %159

121:                                              ; preds = %94
  %122 = call i32 @yr_compiler_create(%struct._YR_COMPILER** nonnull %9) #16
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %443

124:                                              ; preds = %121
  %125 = load %struct._YR_COMPILER*, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  %126 = call i32 @define_external_variables(i8** getelementptr inbounds ([33 x i8*], [33 x i8*]* @ext_vars, i64 0, i64 0), %struct.YR_RULES* null, %struct._YR_COMPILER* %125) #16
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %129, label %128

128:                                              ; preds = %124
  call fastcc void @print_error(i32 %126)
  br label %443

129:                                              ; preds = %124
  %130 = load i8*, i8** @atom_quality_table, align 8, !tbaa !11
  %131 = icmp eq i8* %130, null
  br i1 %131, label %139, label %132

132:                                              ; preds = %129
  %133 = load %struct._YR_COMPILER*, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  %134 = call i32 @yr_compiler_load_atom_quality_table(%struct._YR_COMPILER* %133, i8* nonnull %130, i8 zeroext 0) #16
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %139, label %136

136:                                              ; preds = %132
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %138 = call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.80, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %137) #18
  call fastcc void @print_error(i32 %134)
  br label %443

139:                                              ; preds = %132, %129
  %140 = getelementptr inbounds %struct.YR_ARENA_REF, %struct.YR_ARENA_REF* %8, i64 0, i32 0
  store i32 0, i32* %140, align 4, !tbaa !40
  %141 = getelementptr inbounds %struct.YR_ARENA_REF, %struct.YR_ARENA_REF* %8, i64 0, i32 1
  store i32 0, i32* %141, align 4, !tbaa !42
  %142 = load %struct._YR_COMPILER*, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  call void @yr_compiler_set_callback(%struct._YR_COMPILER* %142, void (i32, i8*, i32, %struct.YR_RULE*, i8*, i8*)* nonnull @print_compiler_error, i8* nonnull %18) #16
  %143 = load %struct._YR_COMPILER*, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  %144 = call zeroext i1 @compile_files(%struct._YR_COMPILER* %143, i32 %23, i8** %1) #16
  %145 = xor i1 %144, true
  %146 = load i32, i32* %140, align 4
  %147 = icmp sgt i32 %146, 0
  %148 = or i1 %147, %145
  br i1 %148, label %443, label %149

149:                                              ; preds = %139
  %150 = load i8, i8* @fail_on_warnings, align 1, !tbaa !16, !range !18
  %151 = icmp ne i8 %150, 0
  %152 = load i32, i32* %141, align 4
  %153 = icmp sgt i32 %152, 0
  %154 = and i1 %151, %153
  br i1 %154, label %443, label %155

155:                                              ; preds = %149
  %156 = load %struct._YR_COMPILER*, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  %157 = call i32 @yr_compiler_get_rules(%struct._YR_COMPILER* %156, %struct.YR_RULES** nonnull %10) #16
  %158 = load %struct._YR_COMPILER*, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  call void @yr_compiler_destroy(%struct._YR_COMPILER* %158) #16
  store %struct._YR_COMPILER* null, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  br label %159

159:                                              ; preds = %119, %155
  %160 = phi i32 [ %157, %155 ], [ %120, %119 ]
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %164, label %162

162:                                              ; preds = %105, %159
  %163 = phi i32 [ %160, %159 ], [ 3, %105 ]
  call fastcc void @print_error(i32 %163)
  br label %443

164:                                              ; preds = %159
  %165 = load i8, i8* @show_stats, align 1, !tbaa !16, !range !18
  %166 = icmp eq i8 %165, 0
  br i1 %166, label %213, label %167

167:                                              ; preds = %164
  %168 = load %struct.YR_RULES*, %struct.YR_RULES** %10, align 8, !tbaa !11
  %169 = bitcast %struct.YR_RULES_STATS* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 828, i8* nonnull %169) #16
  %170 = call i32 @yr_rules_get_stats(%struct.YR_RULES* %168, %struct.YR_RULES_STATS* nonnull %7) #16
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %173, label %172

172:                                              ; preds = %167
  call fastcc void @print_error(i32 %170) #16
  br label %212

173:                                              ; preds = %167
  %174 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 7
  %175 = load i32, i32* %174, align 4, !tbaa !43
  %176 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([41 x i8], [41 x i8]* @.str.101, i64 0, i64 0), i32 %175) #16
  %177 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 4
  %178 = load float, float* %177, align 4, !tbaa !46
  %179 = fpext float %178 to double
  %180 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([41 x i8], [41 x i8]* @.str.102, i64 0, i64 0), double %179) #16
  %181 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 0
  %182 = load i32, i32* %181, align 4, !tbaa !47
  %183 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([41 x i8], [41 x i8]* @.str.103, i64 0, i64 0), i32 %182) #16
  %184 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 1
  %185 = load i32, i32* %184, align 4, !tbaa !48
  %186 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([41 x i8], [41 x i8]* @.str.104, i64 0, i64 0), i32 %185) #16
  %187 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 2
  %188 = load i32, i32* %187, align 4, !tbaa !49
  %189 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([41 x i8], [41 x i8]* @.str.105, i64 0, i64 0), i32 %188) #16
  %190 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 3
  %191 = load i32, i32* %190, align 4, !tbaa !50
  %192 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([41 x i8], [41 x i8]* @.str.106, i64 0, i64 0), i32 %191) #16
  %193 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([46 x i8], [46 x i8]* @.str.107, i64 0, i64 0), i32 100) #16
  br label %196

194:                                              ; preds = %196
  %195 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([30 x i8], [30 x i8]* @str.144, i64 0, i64 0)) #16
  br label %204

196:                                              ; preds = %196, %173
  %197 = phi i64 [ 0, %173 ], [ %198, %196 ]
  %198 = add nuw nsw i64 %197, 1
  %199 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 5, i64 %197
  %200 = load i32, i32* %199, align 4, !tbaa !12
  %201 = trunc i64 %198 to i32
  %202 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.108, i64 0, i64 0), i32 %201, i32 %200) #16
  %203 = icmp eq i64 %198, 100
  br i1 %203, label %194, label %196

204:                                              ; preds = %204, %194
  %205 = phi i64 [ 100, %194 ], [ %210, %204 ]
  %206 = getelementptr inbounds %struct.YR_RULES_STATS, %struct.YR_RULES_STATS* %7, i64 0, i32 6, i64 %205
  %207 = load i32, i32* %206, align 4, !tbaa !12
  %208 = trunc i64 %205 to i32
  %209 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.108, i64 0, i64 0), i32 %208, i32 %207) #16
  %210 = add nsw i64 %205, -1
  %211 = icmp eq i64 %205, 0
  br i1 %211, label %212, label %204

212:                                              ; preds = %204, %172
  call void @llvm.lifetime.end.p0i8(i64 828, i8* nonnull %169) #16
  br label %213

213:                                              ; preds = %164, %212
  %214 = call i32 @cli_mutex_init(%union.pthread_mutex_t* nonnull @output_mutex) #16
  %215 = load i8, i8* @fast_scan, align 1, !tbaa !16, !range !18
  %216 = zext i8 %215 to i32
  %217 = call i64 @time(i64* null) #16
  %218 = load i32, i32* @timeout, align 4, !tbaa !12
  %219 = sext i32 %218 to i64
  %220 = add nsw i64 %217, %219
  %221 = getelementptr inbounds %struct.SCAN_OPTIONS, %struct.SCAN_OPTIONS* %12, i64 0, i32 2
  store i64 %220, i64* %221, align 8, !tbaa !51
  %222 = add nsw i32 %23, -1
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i8*, i8** %1, i64 %223
  %225 = load i8*, i8** %224, align 8, !tbaa !11
  %226 = bitcast %struct.stat* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %226) #16
  %227 = call i32 @__xstat(i32 1, i8* nonnull %225, %struct.stat* nonnull %6) #16
  %228 = icmp eq i32 %227, 0
  %229 = getelementptr inbounds %struct.stat, %struct.stat* %6, i64 0, i32 3
  %230 = load i32, i32* %229, align 8
  %231 = and i32 %230, 61440
  %232 = icmp eq i32 %231, 16384
  %233 = and i1 %228, %232
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %226) #16
  %234 = load i8, i8* @scan_list_search, align 1, !tbaa !16, !range !18
  %235 = icmp eq i8 %234, 0
  %236 = and i1 %228, %232
  %237 = xor i1 %236, true
  %238 = or i1 %235, %237
  br i1 %238, label %242, label %239

239:                                              ; preds = %213
  %240 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %241 = call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.81, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %240) #18
  br label %443

242:                                              ; preds = %213
  %243 = xor i1 %235, true
  %244 = or i1 %233, %243
  br i1 %244, label %245, label %365

245:                                              ; preds = %242
  store i32 0, i32* @queue_tail, align 4, !tbaa !12
  store i32 0, i32* @queue_head, align 4, !tbaa !12
  %246 = call i32 @cli_mutex_init(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %248, label %254

248:                                              ; preds = %245
  %249 = call i32 @cli_semaphore_init(%union.sem_t** nonnull @used_slots, i32 0) #16
  %250 = icmp eq i32 %249, 0
  br i1 %250, label %251, label %254

251:                                              ; preds = %248
  %252 = call i32 @cli_semaphore_init(%union.sem_t** nonnull @unused_slots, i32 64) #16
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %257, label %254

254:                                              ; preds = %248, %245, %251
  %255 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %256 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %255, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.82, i64 0, i64 0), i32 31) #20
  br label %443

257:                                              ; preds = %251
  %258 = bitcast [32 x i64]* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %258) #16
  %259 = bitcast [32 x %struct._THREAD_ARGS]* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1280, i8* nonnull %259) #16
  %260 = load i32, i32* @threads, align 4, !tbaa !12
  %261 = icmp sgt i32 %260, 0
  br i1 %261, label %266, label %289

262:                                              ; preds = %276
  %263 = load i32, i32* @threads, align 4, !tbaa !12
  %264 = sext i32 %263 to i64
  %265 = icmp slt i64 %285, %264
  br i1 %265, label %266, label %289

266:                                              ; preds = %257, %262
  %267 = phi i64 [ %285, %262 ], [ 0, %257 ]
  %268 = getelementptr inbounds [32 x %struct._THREAD_ARGS], [32 x %struct._THREAD_ARGS]* %15, i64 0, i64 %267
  %269 = getelementptr inbounds [32 x %struct._THREAD_ARGS], [32 x %struct._THREAD_ARGS]* %15, i64 0, i64 %267, i32 2
  store i64 %220, i64* %269, align 8, !tbaa !52
  %270 = getelementptr inbounds [32 x %struct._THREAD_ARGS], [32 x %struct._THREAD_ARGS]* %15, i64 0, i64 %267, i32 3
  store i32 0, i32* %270, align 8, !tbaa !55
  %271 = load %struct.YR_RULES*, %struct.YR_RULES** %10, align 8, !tbaa !11
  %272 = getelementptr inbounds %struct._THREAD_ARGS, %struct._THREAD_ARGS* %268, i64 0, i32 0
  %273 = call i32 @yr_scanner_create(%struct.YR_RULES* %271, %struct.YR_SCAN_CONTEXT** nonnull %272) #16
  %274 = icmp eq i32 %273, 0
  br i1 %274, label %276, label %275

275:                                              ; preds = %266
  call fastcc void @print_error(i32 %273)
  br label %363

276:                                              ; preds = %266
  %277 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %272, align 8, !tbaa !56
  %278 = getelementptr inbounds [32 x %struct._THREAD_ARGS], [32 x %struct._THREAD_ARGS]* %15, i64 0, i64 %267, i32 1
  %279 = bitcast %struct._CALLBACK_ARGS* %278 to i8*
  call void @yr_scanner_set_callback(%struct.YR_SCAN_CONTEXT* %277, i32 (%struct.YR_SCAN_CONTEXT*, i32, i8*, i8*)* nonnull @callback, i8* nonnull %279) #16
  %280 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %272, align 8, !tbaa !56
  call void @yr_scanner_set_flags(%struct.YR_SCAN_CONTEXT* %280, i32 %216) #16
  %281 = getelementptr inbounds [32 x i64], [32 x i64]* %14, i64 0, i64 %267
  %282 = bitcast %struct._THREAD_ARGS* %268 to i8*
  %283 = call i32 @cli_create_thread(i64* nonnull %281, i8* (i8*)* nonnull @scanning_thread, i8* nonnull %282) #16
  %284 = icmp eq i32 %283, 0
  %285 = add nuw nsw i64 %267, 1
  br i1 %284, label %262, label %286

286:                                              ; preds = %276
  %287 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %288 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %287, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.82, i64 0, i64 0), i32 100) #20
  br label %363

289:                                              ; preds = %262, %257
  %290 = load i8*, i8** %224, align 8, !tbaa !11
  br i1 %233, label %291, label %293

291:                                              ; preds = %289
  %292 = call fastcc i32 @scan_dir(i8* %290, %struct.SCAN_OPTIONS* nonnull %12)
  br label %343

293:                                              ; preds = %289
  %294 = bitcast i64* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %294) #16
  store i64 0, i64* %4, align 8, !tbaa !19
  %295 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %295) #16
  store i8* null, i8** %5, align 8, !tbaa !11
  %296 = call %struct._IO_FILE* @fopen(i8* %290, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.141, i64 0, i64 0)) #16
  %297 = icmp eq %struct._IO_FILE* %296, null
  br i1 %297, label %301, label %298

298:                                              ; preds = %293
  %299 = bitcast %struct.stat* %3 to i8*
  %300 = getelementptr inbounds %struct.stat, %struct.stat* %3, i64 0, i32 3
  br label %304

301:                                              ; preds = %293
  %302 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %303 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %302, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.86, i64 0, i64 0), i8* %290) #20
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %295) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %294) #16
  br label %363

304:                                              ; preds = %335, %298
  %305 = phi i32 [ 0, %298 ], [ %336, %335 ]
  %306 = call i64 @getline(i8** nonnull %5, i64* nonnull %4, %struct._IO_FILE* nonnull %296) #16
  switch i64 %306, label %307 [
    i64 -1, label %338
    i64 0, label %314
  ]

307:                                              ; preds = %304
  %308 = load i8*, i8** %5, align 8, !tbaa !11
  %309 = add nsw i64 %306, -1
  %310 = getelementptr inbounds i8, i8* %308, i64 %309
  %311 = load i8, i8* %310, align 1, !tbaa !10
  %312 = icmp eq i8 %311, 10
  br i1 %312, label %313, label %314

313:                                              ; preds = %307
  store i8 0, i8* %310, align 1, !tbaa !10
  br label %314

314:                                              ; preds = %313, %307, %304
  %315 = load i8*, i8** %5, align 8, !tbaa !11
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %299) #16
  %316 = call i32 @__xstat(i32 1, i8* nonnull %315, %struct.stat* nonnull %3) #16
  %317 = icmp eq i32 %316, 0
  %318 = load i32, i32* %300, align 8
  %319 = and i32 %318, 61440
  %320 = icmp eq i32 %319, 16384
  %321 = and i1 %317, %320
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %299) #16
  %322 = load i8*, i8** %5, align 8, !tbaa !11
  br i1 %321, label %323, label %325

323:                                              ; preds = %314
  %324 = call fastcc i32 @scan_dir(i8* %322, %struct.SCAN_OPTIONS* nonnull %12) #16
  br label %335

325:                                              ; preds = %314
  %326 = call i32 @cli_semaphore_wait(%union.sem_t** nonnull @unused_slots, i64 %220) #16
  %327 = icmp eq i32 %326, 26
  br i1 %327, label %338, label %328

328:                                              ; preds = %325
  call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  %329 = call noalias i8* @strdup(i8* %322) #16
  %330 = load i32, i32* @queue_tail, align 4, !tbaa !12
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [65 x %union.anon.0], [65 x %union.anon.0]* @file_queue, i64 0, i64 %331, i32 0
  store i8* %329, i8** %332, align 8, !tbaa !57
  %333 = add nsw i32 %330, 1
  %334 = srem i32 %333, 65
  store i32 %334, i32* @queue_tail, align 4, !tbaa !12
  call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  br label %335

335:                                              ; preds = %328, %323
  %336 = phi i32 [ %324, %323 ], [ 0, %328 ]
  %337 = icmp eq i32 %336, 26
  br i1 %337, label %338, label %304

338:                                              ; preds = %304, %325, %335
  %339 = phi i32 [ %305, %304 ], [ 26, %335 ], [ 26, %325 ]
  %340 = load i8*, i8** %5, align 8, !tbaa !11
  call void @free(i8* %340) #16
  %341 = call i32 @fclose(%struct._IO_FILE* nonnull %296) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %295) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %294) #16
  %342 = icmp eq i32 %339, 0
  br i1 %342, label %343, label %363

343:                                              ; preds = %338, %291
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  %344 = load i32, i32* @threads, align 4, !tbaa !12
  %345 = icmp sgt i32 %344, 0
  br i1 %345, label %348, label %364

346:                                              ; preds = %348
  %347 = icmp sgt i32 %352, 0
  br i1 %347, label %355, label %364

348:                                              ; preds = %343, %348
  %349 = phi i64 [ %351, %348 ], [ 0, %343 ]
  %350 = getelementptr inbounds [32 x i64], [32 x i64]* %14, i64 0, i64 %349
  call void @cli_thread_join(i64* nonnull %350) #16
  %351 = add nuw nsw i64 %349, 1
  %352 = load i32, i32* @threads, align 4, !tbaa !12
  %353 = sext i32 %352 to i64
  %354 = icmp slt i64 %351, %353
  br i1 %354, label %348, label %346

355:                                              ; preds = %346, %355
  %356 = phi i64 [ %359, %355 ], [ 0, %346 ]
  %357 = getelementptr inbounds [32 x %struct._THREAD_ARGS], [32 x %struct._THREAD_ARGS]* %15, i64 0, i64 %356, i32 0
  %358 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %357, align 8, !tbaa !56
  call void @yr_scanner_destroy(%struct.YR_SCAN_CONTEXT* %358) #16
  %359 = add nuw nsw i64 %356, 1
  %360 = load i32, i32* @threads, align 4, !tbaa !12
  %361 = sext i32 %360 to i64
  %362 = icmp slt i64 %359, %361
  br i1 %362, label %355, label %364

363:                                              ; preds = %338, %301, %275, %286
  call void @llvm.lifetime.end.p0i8(i64 1280, i8* nonnull %259) #16
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %258) #16
  br label %443

364:                                              ; preds = %355, %343, %346
  call void @cli_mutex_destroy(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  call void @cli_semaphore_destroy(%union.sem_t** nonnull @unused_slots) #16
  call void @cli_semaphore_destroy(%union.sem_t** nonnull @used_slots) #16
  call void @llvm.lifetime.end.p0i8(i64 1280, i8* nonnull %259) #16
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %258) #16
  br label %443

365:                                              ; preds = %242
  %366 = bitcast %struct._CALLBACK_ARGS* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %366) #16
  %367 = bitcast i8** %224 to i64*
  %368 = load i64, i64* %367, align 8, !tbaa !11
  %369 = bitcast %struct._CALLBACK_ARGS* %16 to i64*
  store i64 %368, i64* %369, align 8, !tbaa !59
  %370 = getelementptr inbounds %struct._CALLBACK_ARGS, %struct._CALLBACK_ARGS* %16, i64 0, i32 1
  store i32 0, i32* %370, align 8, !tbaa !60
  %371 = load %struct.YR_RULES*, %struct.YR_RULES** %10, align 8, !tbaa !11
  %372 = call i32 @yr_scanner_create(%struct.YR_RULES* %371, %struct.YR_SCAN_CONTEXT** nonnull %11) #16
  %373 = icmp eq i32 %372, 0
  br i1 %373, label %377, label %374

374:                                              ; preds = %365
  %375 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %376 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %375, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.82, i64 0, i64 0), i32 %372) #18
  br label %442

377:                                              ; preds = %365
  %378 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  call void @yr_scanner_set_callback(%struct.YR_SCAN_CONTEXT* %378, i32 (%struct.YR_SCAN_CONTEXT*, i32, i8*, i8*)* nonnull @callback, i8* nonnull %366) #16
  %379 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  call void @yr_scanner_set_flags(%struct.YR_SCAN_CONTEXT* %379, i32 %216) #16
  %380 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  %381 = load i32, i32* @timeout, align 4, !tbaa !12
  call void @yr_scanner_set_timeout(%struct.YR_SCAN_CONTEXT* %380, i32 %381) #16
  %382 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  %383 = load i8*, i8** %224, align 8, !tbaa !11
  %384 = call i32 (i8*, i32, ...) @open(i8* %383, i32 0) #16
  %385 = icmp eq i32 %384, -1
  br i1 %385, label %390, label %386

386:                                              ; preds = %377
  %387 = call i32 @yr_scanner_scan_fd(%struct.YR_SCAN_CONTEXT* %382, i32 %384) #16
  %388 = call i32 @close(i32 %384) #16
  %389 = icmp eq i32 %387, 3
  br i1 %389, label %390, label %408

390:                                              ; preds = %377, %386
  %391 = bitcast i8** %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %391) #16
  store i8* null, i8** %17, align 8, !tbaa !11
  %392 = load i8*, i8** %224, align 8, !tbaa !11
  %393 = call i64 @strtol(i8* %392, i8** nonnull %17, i32 10) #16
  %394 = icmp sgt i64 %393, 0
  br i1 %394, label %395, label %406

395:                                              ; preds = %390
  %396 = load i8*, i8** %224, align 8, !tbaa !11
  %397 = icmp eq i8* %396, null
  br i1 %397, label %406, label %398

398:                                              ; preds = %395
  %399 = load i8*, i8** %17, align 8, !tbaa !11
  %400 = load i8, i8* %399, align 1, !tbaa !10
  %401 = icmp eq i8 %400, 0
  br i1 %401, label %402, label %406

402:                                              ; preds = %398
  %403 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  %404 = trunc i64 %393 to i32
  %405 = call i32 @yr_scanner_scan_proc(%struct.YR_SCAN_CONTEXT* %403, i32 %404) #16
  br label %406

406:                                              ; preds = %395, %402, %398, %390
  %407 = phi i32 [ %405, %402 ], [ 3, %398 ], [ 3, %395 ], [ 3, %390 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %391) #16
  br label %408

408:                                              ; preds = %406, %386
  %409 = phi i32 [ %407, %406 ], [ %387, %386 ]
  %410 = icmp eq i32 %409, 0
  br i1 %410, label %435, label %411

411:                                              ; preds = %408
  %412 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %413 = load i8*, i8** %224, align 8, !tbaa !11
  %414 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %412, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.83, i64 0, i64 0), i8* %413) #18
  %415 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  %416 = call %struct.YR_RULE* @yr_scanner_last_error_rule(%struct.YR_SCAN_CONTEXT* %415) #16
  %417 = call %struct.YR_STRING* @yr_scanner_last_error_string(%struct.YR_SCAN_CONTEXT* %415) #16
  %418 = icmp ne %struct.YR_RULE* %416, null
  %419 = icmp ne %struct.YR_STRING* %417, null
  %420 = and i1 %418, %419
  br i1 %420, label %421, label %428

421:                                              ; preds = %411
  %422 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %423 = getelementptr inbounds %struct.YR_STRING, %struct.YR_STRING* %417, i64 0, i32 9, i32 0
  %424 = load i8*, i8** %423, align 8, !tbaa !10
  %425 = getelementptr inbounds %struct.YR_RULE, %struct.YR_RULE* %416, i64 0, i32 2, i32 0
  %426 = load i8*, i8** %425, align 8, !tbaa !10
  %427 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %422, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.142, i64 0, i64 0), i8* %424, i8* %426) #20
  br label %434

428:                                              ; preds = %411
  br i1 %418, label %429, label %434

429:                                              ; preds = %428
  %430 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %431 = getelementptr inbounds %struct.YR_RULE, %struct.YR_RULE* %416, i64 0, i32 2, i32 0
  %432 = load i8*, i8** %431, align 8, !tbaa !10
  %433 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %430, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.143, i64 0, i64 0), i8* %432) #20
  br label %434

434:                                              ; preds = %421, %428, %429
  call fastcc void @print_error(i32 %409) #16
  br label %442

435:                                              ; preds = %408
  %436 = load i8, i8* @print_count_only, align 1, !tbaa !16, !range !18
  %437 = icmp eq i8 %436, 0
  br i1 %437, label %441, label %438

438:                                              ; preds = %435
  %439 = load i32, i32* %370, align 8, !tbaa !60
  %440 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.84, i64 0, i64 0), i32 %439)
  br label %441

441:                                              ; preds = %435, %438
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %366) #16
  br label %443

442:                                              ; preds = %434, %374
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %366) #16
  br label %443

443:                                              ; preds = %80, %61, %364, %441, %442, %363, %139, %149, %121, %254, %239, %162, %136, %128, %102, %91
  %444 = phi i32 [ 1, %91 ], [ 1, %102 ], [ 1, %162 ], [ 1, %239 ], [ 1, %254 ], [ 1, %442 ], [ 1, %128 ], [ 1, %136 ], [ 1, %121 ], [ 1, %139 ], [ 1, %149 ], [ 1, %363 ], [ 0, %441 ], [ 0, %364 ], [ 1, %61 ], [ 1, %80 ]
  %445 = load %struct._MODULE_DATA*, %struct._MODULE_DATA** @modules_data_list, align 8, !tbaa !11
  %446 = icmp eq %struct._MODULE_DATA* %445, null
  br i1 %446, label %454, label %447

447:                                              ; preds = %443, %447
  %448 = phi %struct._MODULE_DATA* [ %450, %447 ], [ %445, %443 ]
  %449 = getelementptr inbounds %struct._MODULE_DATA, %struct._MODULE_DATA* %448, i64 0, i32 2
  %450 = load %struct._MODULE_DATA*, %struct._MODULE_DATA** %449, align 8, !tbaa !36
  %451 = getelementptr inbounds %struct._MODULE_DATA, %struct._MODULE_DATA* %448, i64 0, i32 1
  call void @yr_filemap_unmap(%struct._YR_MAPPED_FILE* nonnull %451) #16
  %452 = bitcast %struct._MODULE_DATA* %448 to i8*
  call void @free(i8* %452) #16
  %453 = icmp eq %struct._MODULE_DATA* %450, null
  br i1 %453, label %454, label %447

454:                                              ; preds = %447, %443
  store %struct._MODULE_DATA* null, %struct._MODULE_DATA** @modules_data_list, align 8, !tbaa !11
  %455 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %11, align 8, !tbaa !11
  %456 = icmp eq %struct.YR_SCAN_CONTEXT* %455, null
  br i1 %456, label %458, label %457

457:                                              ; preds = %454
  call void @yr_scanner_destroy(%struct.YR_SCAN_CONTEXT* nonnull %455) #16
  br label %458

458:                                              ; preds = %454, %457
  %459 = load %struct._YR_COMPILER*, %struct._YR_COMPILER** %9, align 8, !tbaa !11
  %460 = icmp eq %struct._YR_COMPILER* %459, null
  br i1 %460, label %462, label %461

461:                                              ; preds = %458
  call void @yr_compiler_destroy(%struct._YR_COMPILER* nonnull %459) #16
  br label %462

462:                                              ; preds = %458, %461
  %463 = load %struct.YR_RULES*, %struct.YR_RULES** %10, align 8, !tbaa !11
  %464 = icmp eq %struct.YR_RULES* %463, null
  br i1 %464, label %467, label %465

465:                                              ; preds = %462
  %466 = call i32 @yr_rules_destroy(%struct.YR_RULES* nonnull %463) #16
  br label %467

467:                                              ; preds = %462, %465
  %468 = call i32 @yr_finalize() #16
  call void @args_free(%struct._args_option* getelementptr inbounds ([31 x %struct._args_option], [31 x %struct._args_option]* @options, i64 0, i64 0)) #16
  br label %469

469:                                              ; preds = %467, %45, %40, %34, %29
  %470 = phi i32 [ 0, %29 ], [ 0, %34 ], [ 1, %40 ], [ 1, %45 ], [ %444, %467 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %22) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18) #16
  ret i32 %470
}

; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #13

declare dso_local i32 @yr_filemap_map(i8*, %struct._YR_MAPPED_FILE*) local_unnamed_addr #11

declare dso_local i32 @yr_initialize() local_unnamed_addr #11

declare dso_local i32 @yr_set_configuration(i32, i8*) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare dso_local i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

declare dso_local i32 @yr_rules_load_stream(%struct._YR_STREAM*, %struct.YR_RULES**) local_unnamed_addr #11

declare dso_local i32 @yr_compiler_create(%struct._YR_COMPILER**) local_unnamed_addr #11

; Function Attrs: nofree nounwind uwtable
define internal fastcc void @print_error(i32 %0) unnamed_addr #8 {
  switch i32 %0, label %32 [
    i32 0, label %35
    i32 2, label %2
    i32 1, label %5
    i32 26, label %8
    i32 3, label %11
    i32 8, label %14
    i32 6, label %17
    i32 7, label %20
    i32 25, label %23
    i32 48, label %26
    i32 30, label %29
  ]

2:                                                ; preds = %1
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.87, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %3) #18
  br label %35

5:                                                ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.88, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %6) #18
  br label %35

8:                                                ; preds = %1
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.89, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %9) #18
  br label %35

11:                                               ; preds = %1
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.90, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %12) #18
  br label %35

14:                                               ; preds = %1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.91, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %15) #18
  br label %35

17:                                               ; preds = %1
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.92, i64 0, i64 0), i64 29, i64 1, %struct._IO_FILE* %18) #18
  br label %35

20:                                               ; preds = %1
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.93, i64 0, i64 0), i64 29, i64 1, %struct._IO_FILE* %21) #18
  br label %35

23:                                               ; preds = %1
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.94, i64 0, i64 0), i64 71, i64 1, %struct._IO_FILE* %24) #18
  br label %35

26:                                               ; preds = %1
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.95, i64 0, i64 0), i64 35, i64 1, %struct._IO_FILE* %27) #18
  br label %35

29:                                               ; preds = %1
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.96, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %30) #18
  br label %35

32:                                               ; preds = %1
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.82, i64 0, i64 0), i32 %0) #18
  br label %35

35:                                               ; preds = %32, %29, %1, %26, %23, %20, %17, %14, %11, %8, %5, %2
  ret void
}

declare dso_local i32 @yr_compiler_load_atom_quality_table(%struct._YR_COMPILER*, i8*, i8 zeroext) local_unnamed_addr #11

; Function Attrs: nofree nounwind uwtable
define internal void @print_compiler_error(i32 %0, i8* %1, i32 %2, %struct.YR_RULE* readonly %3, i8* %4, i8* nocapture %5) #8 {
  %7 = icmp eq i32 %0, 0
  br i1 %7, label %16, label %8

8:                                                ; preds = %6
  %9 = load i8, i8* @ignore_warnings, align 1, !tbaa !16, !range !18
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %26

11:                                               ; preds = %8
  %12 = getelementptr inbounds i8, i8* %5, i64 4
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 4, !tbaa !42
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %13, align 4, !tbaa !42
  br label %16

16:                                               ; preds = %6, %11
  %17 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.98, i64 0, i64 0), %11 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.97, i64 0, i64 0), %6 ]
  %18 = icmp eq %struct.YR_RULE* %3, null
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  br i1 %18, label %24, label %20

20:                                               ; preds = %16
  %21 = getelementptr inbounds %struct.YR_RULE, %struct.YR_RULE* %3, i64 0, i32 2, i32 0
  %22 = load i8*, i8** %21, align 8, !tbaa !10
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.99, i64 0, i64 0), i8* %17, i8* %22, i8* %1, i32 %2, i8* %4) #18
  br label %26

24:                                               ; preds = %16
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.100, i64 0, i64 0), i8* %1, i32 %2, i8* %17, i8* %4) #18
  br label %26

26:                                               ; preds = %20, %24, %8
  ret void
}

declare dso_local void @yr_compiler_set_callback(%struct._YR_COMPILER*, void (i32, i8*, i32, %struct.YR_RULE*, i8*, i8*)*, i8*) local_unnamed_addr #11

declare dso_local i32 @yr_compiler_get_rules(%struct._YR_COMPILER*, %struct.YR_RULES**) local_unnamed_addr #11

declare dso_local void @yr_compiler_destroy(%struct._YR_COMPILER*) local_unnamed_addr #11

declare dso_local i32 @yr_rules_get_stats(%struct.YR_RULES*, %struct.YR_RULES_STATS*) local_unnamed_addr #11

; Function Attrs: nounwind
declare dso_local i32 @__xstat(i32, i8*, %struct.stat*) local_unnamed_addr #10

declare dso_local i32 @yr_scanner_create(%struct.YR_RULES*, %struct.YR_SCAN_CONTEXT**) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define internal i32 @callback(%struct.YR_SCAN_CONTEXT* nocapture readonly %0, i32 %1, i8* %2, i8* nocapture %3) #4 {
  switch i32 %1, label %375 [
    i32 1, label %11
    i32 2, label %11
    i32 4, label %5
    i32 5, label %347
    i32 6, label %353
  ]

5:                                                ; preds = %4
  %6 = load %struct._MODULE_DATA*, %struct._MODULE_DATA** @modules_data_list, align 8, !tbaa !11
  %7 = icmp eq %struct._MODULE_DATA* %6, null
  br i1 %7, label %375, label %8

8:                                                ; preds = %5
  %9 = bitcast i8* %2 to i8**
  %10 = load i8*, i8** %9, align 8, !tbaa !61
  br label %330

11:                                               ; preds = %4, %4
  %12 = load i8*, i8** getelementptr inbounds ([33 x i8*], [33 x i8*]* @tags, i64 0, i64 0), align 16, !tbaa !11
  %13 = icmp eq i8* %12, null
  br i1 %13, label %46, label %14

14:                                               ; preds = %11
  %15 = getelementptr inbounds i8, i8* %2, i64 16
  %16 = bitcast i8* %15 to i8**
  %17 = load i8*, i8** %16, align 8, !tbaa !10
  %18 = icmp eq i8* %17, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %14
  %20 = load i8, i8* %17, align 1, !tbaa !10
  %21 = icmp eq i8 %20, 0
  br label %28

22:                                               ; preds = %14, %22
  %23 = phi i64 [ %24, %22 ], [ 0, %14 ]
  %24 = add nuw i64 %23, 1
  %25 = getelementptr inbounds [33 x i8*], [33 x i8*]* @tags, i64 0, i64 %24
  %26 = load i8*, i8** %25, align 8, !tbaa !11
  %27 = icmp eq i8* %26, null
  br i1 %27, label %46, label %22

28:                                               ; preds = %19, %41
  %29 = phi i64 [ %42, %41 ], [ 0, %19 ]
  %30 = phi i8* [ %44, %41 ], [ %12, %19 ]
  br i1 %21, label %41, label %31

31:                                               ; preds = %28, %35
  %32 = phi i8* [ %38, %35 ], [ %17, %28 ]
  %33 = tail call i32 @strcmp(i8* nonnull %32, i8* nonnull dereferenceable(1) %30) #15
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %46, label %35

35:                                               ; preds = %31
  %36 = tail call i64 @strlen(i8* nonnull %32) #15
  %37 = add i64 %36, 1
  %38 = getelementptr inbounds i8, i8* %32, i64 %37
  %39 = load i8, i8* %38, align 1, !tbaa !10
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %41, label %31

41:                                               ; preds = %35, %28
  %42 = add nuw i64 %29, 1
  %43 = getelementptr inbounds [33 x i8*], [33 x i8*]* @tags, i64 0, i64 %42
  %44 = load i8*, i8** %43, align 8, !tbaa !11
  %45 = icmp eq i8* %44, null
  br i1 %45, label %46, label %28

46:                                               ; preds = %41, %31, %22, %11
  %47 = phi i8 [ 1, %11 ], [ 0, %22 ], [ 1, %31 ], [ 0, %41 ]
  %48 = load i8*, i8** getelementptr inbounds ([33 x i8*], [33 x i8*]* @identifiers, i64 0, i64 0), align 16, !tbaa !11
  %49 = icmp eq i8* %48, null
  br i1 %49, label %68, label %50

50:                                               ; preds = %46
  %51 = getelementptr inbounds i8, i8* %2, i64 8
  %52 = bitcast i8* %51 to i8**
  %53 = load i8*, i8** %52, align 8, !tbaa !10
  br label %60

54:                                               ; preds = %60
  %55 = getelementptr inbounds [33 x i8*], [33 x i8*]* @identifiers, i64 0, i64 %65
  %56 = load i8*, i8** %55, align 8, !tbaa !11
  %57 = icmp eq i8* %56, null
  br i1 %57, label %58, label %60

58:                                               ; preds = %54
  %59 = icmp eq i32 %1, 1
  br i1 %59, label %316, label %323

60:                                               ; preds = %54, %50
  %61 = phi i64 [ 0, %50 ], [ %65, %54 ]
  %62 = phi i8* [ %48, %50 ], [ %56, %54 ]
  %63 = tail call i32 @strcmp(i8* nonnull %62, i8* nonnull dereferenceable(1) %53) #15
  %64 = icmp eq i32 %63, 0
  %65 = add nuw i64 %61, 1
  br i1 %64, label %66, label %54

66:                                               ; preds = %60
  %67 = icmp eq i32 %1, 1
  br label %71

68:                                               ; preds = %46
  %69 = icmp eq i32 %1, 1
  %70 = icmp eq i8 %47, 0
  br i1 %70, label %314, label %71

71:                                               ; preds = %68, %66
  %72 = phi i1 [ %67, %66 ], [ %69, %68 ]
  %73 = load i8, i8* @negate, align 1, !tbaa !16, !range !18
  %74 = icmp eq i8 %73, 0
  %75 = icmp ne i8 %73, 0
  %76 = select i1 %72, i1 %74, i1 %75
  %77 = load i8, i8* @print_count_only, align 1
  %78 = icmp eq i8 %77, 0
  %79 = and i1 %76, %78
  br i1 %79, label %80, label %314

80:                                               ; preds = %71
  tail call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  %81 = load i8, i8* @show_namespace, align 1, !tbaa !16, !range !18
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %90, label %83

83:                                               ; preds = %80
  %84 = getelementptr inbounds i8, i8* %2, i64 40
  %85 = bitcast i8* %84 to %struct.YR_NAMESPACE**
  %86 = load %struct.YR_NAMESPACE*, %struct.YR_NAMESPACE** %85, align 8, !tbaa !10
  %87 = getelementptr inbounds %struct.YR_NAMESPACE, %struct.YR_NAMESPACE* %86, i64 0, i32 0, i32 0
  %88 = load i8*, i8** %87, align 8, !tbaa !10
  %89 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.112, i64 0, i64 0), i8* %88) #16
  br label %90

90:                                               ; preds = %83, %80
  %91 = getelementptr inbounds i8, i8* %2, i64 8
  %92 = bitcast i8* %91 to i8**
  %93 = load i8*, i8** %92, align 8, !tbaa !10
  %94 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.113, i64 0, i64 0), i8* %93) #16
  %95 = load i8, i8* @show_tags, align 1, !tbaa !16, !range !18
  %96 = icmp eq i8 %95, 0
  br i1 %96, label %123, label %97

97:                                               ; preds = %90
  %98 = tail call i32 @putchar(i32 91) #16
  %99 = getelementptr inbounds i8, i8* %2, i64 16
  %100 = bitcast i8* %99 to i8**
  %101 = load i8*, i8** %100, align 8, !tbaa !10
  %102 = icmp eq i8* %101, null
  br i1 %102, label %121, label %103

103:                                              ; preds = %97
  %104 = load i8, i8* %101, align 1, !tbaa !10
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %121, label %106

106:                                              ; preds = %103, %119
  %107 = phi i8* [ %120, %119 ], [ %101, %103 ]
  %108 = phi i8* [ %116, %119 ], [ %101, %103 ]
  %109 = icmp eq i8* %108, %107
  br i1 %109, label %112, label %110

110:                                              ; preds = %106
  %111 = tail call i32 @putchar(i32 44) #16
  br label %112

112:                                              ; preds = %110, %106
  %113 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.116, i64 0, i64 0), i8* nonnull %108) #16
  %114 = tail call i64 @strlen(i8* nonnull %108) #15
  %115 = add i64 %114, 1
  %116 = getelementptr inbounds i8, i8* %108, i64 %115
  %117 = load i8, i8* %116, align 1, !tbaa !10
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %121, label %119

119:                                              ; preds = %112
  %120 = load i8*, i8** %100, align 8, !tbaa !10
  br label %106

121:                                              ; preds = %112, %103, %97
  %122 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.117, i64 0, i64 0)) #16
  br label %123

123:                                              ; preds = %121, %90
  %124 = load i8, i8* @show_meta, align 1, !tbaa !16, !range !18
  %125 = icmp eq i8 %124, 0
  br i1 %125, label %204, label %126

126:                                              ; preds = %123
  %127 = tail call i32 @putchar(i32 91) #16
  %128 = getelementptr inbounds i8, i8* %2, i64 24
  %129 = bitcast i8* %128 to %struct.YR_META**
  %130 = load %struct.YR_META*, %struct.YR_META** %129, align 8, !tbaa !10
  %131 = icmp eq %struct.YR_META* %130, null
  br i1 %131, label %202, label %132

132:                                              ; preds = %126, %199
  %133 = phi %struct.YR_META* [ %201, %199 ], [ %130, %126 ]
  %134 = phi %struct.YR_META* [ %200, %199 ], [ %130, %126 ]
  %135 = icmp eq %struct.YR_META* %134, %133
  br i1 %135, label %138, label %136

136:                                              ; preds = %132
  %137 = tail call i32 @putchar(i32 44) #16
  br label %138

138:                                              ; preds = %136, %132
  %139 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 0, i32 3
  %140 = load i32, i32* %139, align 8, !tbaa !63
  %141 = icmp eq i32 %140, 1
  br i1 %141, label %142, label %148

142:                                              ; preds = %138
  %143 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 0, i32 0, i32 0
  %144 = load i8*, i8** %143, align 8, !tbaa !10
  %145 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 0, i32 2
  %146 = load i64, i64* %145, align 8, !tbaa !65
  %147 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.118, i64 0, i64 0), i8* %144, i64 %146) #16
  br label %194

148:                                              ; preds = %138
  %149 = icmp eq i32 %140, 3
  %150 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 0, i32 0, i32 0
  %151 = load i8*, i8** %150, align 8, !tbaa !10
  br i1 %149, label %152, label %158

152:                                              ; preds = %148
  %153 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 0, i32 2
  %154 = load i64, i64* %153, align 8, !tbaa !65
  %155 = icmp eq i64 %154, 0
  %156 = select i1 %155, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.121, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.120, i64 0, i64 0)
  %157 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.119, i64 0, i64 0), i8* %151, i8* %156) #16
  br label %194

158:                                              ; preds = %148
  %159 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @.str.122, i64 0, i64 0), i8* %151) #16
  %160 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 0, i32 1, i32 0
  %161 = load i8*, i8** %160, align 8, !tbaa !10
  %162 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %161) #15
  %163 = icmp eq i64 %162, 0
  br i1 %163, label %192, label %164

164:                                              ; preds = %158, %189
  %165 = phi i64 [ %190, %189 ], [ 0, %158 ]
  %166 = getelementptr inbounds i8, i8* %161, i64 %165
  %167 = load i8, i8* %166, align 1, !tbaa !10
  %168 = zext i8 %167 to i32
  switch i8 %167, label %171 [
    i8 34, label %169
    i8 39, label %169
    i8 92, label %169
  ]

169:                                              ; preds = %164, %164, %164
  %170 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.127, i64 0, i64 0), i32 %168) #16
  br label %189

171:                                              ; preds = %164
  %172 = icmp ugt i8 %167, 126
  br i1 %172, label %173, label %175

173:                                              ; preds = %171
  %174 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.128, i64 0, i64 0), i32 %168) #16
  br label %189

175:                                              ; preds = %171
  %176 = icmp ugt i8 %167, 31
  br i1 %176, label %177, label %179

177:                                              ; preds = %175
  %178 = tail call i32 @putchar(i32 %168) #16
  br label %189

179:                                              ; preds = %175
  %180 = zext i8 %167 to i64
  %181 = getelementptr inbounds [32 x i8], [32 x i8]* bitcast (<{ [14 x i8], [18 x i8] }>* @cescapes to [32 x i8]*), i64 0, i64 %180
  %182 = load i8, i8* %181, align 1, !tbaa !10
  %183 = icmp eq i8 %182, 0
  br i1 %183, label %187, label %184

184:                                              ; preds = %179
  %185 = sext i8 %182 to i32
  %186 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.127, i64 0, i64 0), i32 %185) #16
  br label %189

187:                                              ; preds = %179
  %188 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.128, i64 0, i64 0), i32 %168) #16
  br label %189

189:                                              ; preds = %187, %184, %177, %173, %169
  %190 = add nuw i64 %165, 1
  %191 = icmp eq i64 %190, %162
  br i1 %191, label %192, label %164

192:                                              ; preds = %189, %158
  %193 = tail call i32 @putchar(i32 34) #16
  br label %194

194:                                              ; preds = %192, %152, %142
  %195 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 0, i32 4
  %196 = load i32, i32* %195, align 4, !tbaa !66
  %197 = and i32 %196, 1
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %202

199:                                              ; preds = %194
  %200 = getelementptr inbounds %struct.YR_META, %struct.YR_META* %134, i64 1
  %201 = load %struct.YR_META*, %struct.YR_META** %129, align 8, !tbaa !10
  br label %132

202:                                              ; preds = %194, %126
  %203 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.117, i64 0, i64 0)) #16
  br label %204

204:                                              ; preds = %202, %123
  %205 = bitcast i8* %3 to i8**
  %206 = load i8*, i8** %205, align 8, !tbaa !59
  %207 = tail call i32 @puts(i8* nonnull dereferenceable(1) %206) #16
  %208 = load i8, i8* @show_strings, align 1, !tbaa !16, !range !18
  %209 = load i8, i8* @show_string_length, align 1
  %210 = or i8 %209, %208
  %211 = icmp eq i8 %210, 0
  br i1 %211, label %313, label %212

212:                                              ; preds = %204
  %213 = getelementptr inbounds i8, i8* %2, i64 32
  %214 = bitcast i8* %213 to %struct.YR_STRING**
  %215 = load %struct.YR_STRING*, %struct.YR_STRING** %214, align 8, !tbaa !10
  %216 = icmp eq %struct.YR_STRING* %215, null
  br i1 %216, label %313, label %217

217:                                              ; preds = %212
  %218 = getelementptr inbounds %struct.YR_SCAN_CONTEXT, %struct.YR_SCAN_CONTEXT* %0, i64 0, i32 18
  br label %219

219:                                              ; preds = %307, %217
  %220 = phi %struct.YR_STRING* [ %215, %217 ], [ %312, %307 ]
  %221 = load %struct.YR_MATCHES*, %struct.YR_MATCHES** %218, align 8, !tbaa !67
  %222 = getelementptr inbounds %struct.YR_STRING, %struct.YR_STRING* %220, i64 0, i32 1
  %223 = load i32, i32* %222, align 4, !tbaa !73
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds %struct.YR_MATCHES, %struct.YR_MATCHES* %221, i64 %224, i32 0
  %226 = load %struct.YR_MATCH*, %struct.YR_MATCH** %225, align 8, !tbaa !11
  %227 = icmp eq %struct.YR_MATCH* %226, null
  br i1 %227, label %307, label %228

228:                                              ; preds = %219
  %229 = getelementptr inbounds %struct.YR_STRING, %struct.YR_STRING* %220, i64 0, i32 9, i32 0
  %230 = getelementptr inbounds %struct.YR_STRING, %struct.YR_STRING* %220, i64 0, i32 0
  br label %231

231:                                              ; preds = %303, %228
  %232 = phi %struct.YR_MATCH* [ %226, %228 ], [ %305, %303 ]
  %233 = getelementptr inbounds %struct.YR_MATCH, %struct.YR_MATCH* %232, i64 0, i32 8
  %234 = load i8, i8* %233, align 4, !tbaa !75, !range !18
  %235 = icmp eq i8 %234, 0
  br i1 %235, label %236, label %303

236:                                              ; preds = %231
  %237 = load i8, i8* @show_string_length, align 1, !tbaa !16, !range !18
  %238 = icmp eq i8 %237, 0
  %239 = getelementptr inbounds %struct.YR_MATCH, %struct.YR_MATCH* %232, i64 0, i32 0
  %240 = load i64, i64* %239, align 8, !tbaa !77
  %241 = getelementptr inbounds %struct.YR_MATCH, %struct.YR_MATCH* %232, i64 0, i32 1
  %242 = load i64, i64* %241, align 8, !tbaa !78
  %243 = add nsw i64 %242, %240
  br i1 %238, label %249, label %244

244:                                              ; preds = %236
  %245 = getelementptr inbounds %struct.YR_MATCH, %struct.YR_MATCH* %232, i64 0, i32 3
  %246 = load i32, i32* %245, align 4, !tbaa !79
  %247 = load i8*, i8** %229, align 8, !tbaa !10
  %248 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @.str.124, i64 0, i64 0), i64 %243, i32 %246, i8* %247) #16
  br label %252

249:                                              ; preds = %236
  %250 = load i8*, i8** %229, align 8, !tbaa !10
  %251 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([9 x i8], [9 x i8]* @.str.125, i64 0, i64 0), i64 %243, i8* %250) #16
  br label %252

252:                                              ; preds = %249, %244
  %253 = load i8, i8* @show_strings, align 1, !tbaa !16, !range !18
  %254 = icmp eq i8 %253, 0
  br i1 %254, label %301, label %255

255:                                              ; preds = %252
  %256 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.126, i64 0, i64 0)) #16
  %257 = load i32, i32* %230, align 8, !tbaa !80
  %258 = and i32 %257, 2
  %259 = icmp eq i32 %258, 0
  %260 = getelementptr inbounds %struct.YR_MATCH, %struct.YR_MATCH* %232, i64 0, i32 4
  %261 = load i8*, i8** %260, align 8, !tbaa !81
  %262 = getelementptr inbounds %struct.YR_MATCH, %struct.YR_MATCH* %232, i64 0, i32 3
  %263 = load i32, i32* %262, align 4, !tbaa !79
  br i1 %259, label %283, label %264

264:                                              ; preds = %255
  %265 = icmp sgt i32 %263, 64
  %266 = icmp sgt i32 %263, 0
  br i1 %266, label %267, label %270

267:                                              ; preds = %264
  %268 = select i1 %265, i32 64, i32 %263
  %269 = sext i32 %268 to i64
  br label %271

270:                                              ; preds = %271, %264
  br i1 %265, label %281, label %301

271:                                              ; preds = %271, %267
  %272 = phi i64 [ 0, %267 ], [ %279, %271 ]
  %273 = icmp eq i64 %272, 0
  %274 = select i1 %273, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.132, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.133, i64 0, i64 0)
  %275 = getelementptr inbounds i8, i8* %261, i64 %272
  %276 = load i8, i8* %275, align 1, !tbaa !10
  %277 = zext i8 %276 to i32
  %278 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.131, i64 0, i64 0), i8* %274, i32 %277) #16
  %279 = add nuw nsw i64 %272, 1
  %280 = icmp slt i64 %279, %269
  br i1 %280, label %271, label %270

281:                                              ; preds = %270
  %282 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @.str.134, i64 0, i64 0)) #16
  br label %301

283:                                              ; preds = %255
  %284 = icmp sgt i32 %263, 0
  br i1 %284, label %285, label %301

285:                                              ; preds = %283
  %286 = zext i32 %263 to i64
  br label %287

287:                                              ; preds = %298, %285
  %288 = phi i64 [ 0, %285 ], [ %299, %298 ]
  %289 = getelementptr inbounds i8, i8* %261, i64 %288
  %290 = load i8, i8* %289, align 1, !tbaa !10
  %291 = zext i8 %290 to i32
  %292 = add i8 %290, -32
  %293 = icmp ult i8 %292, 95
  br i1 %293, label %294, label %296

294:                                              ; preds = %287
  %295 = tail call i32 @putchar(i32 %291) #16
  br label %298

296:                                              ; preds = %287
  %297 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.135, i64 0, i64 0), i32 %291) #16
  br label %298

298:                                              ; preds = %296, %294
  %299 = add nuw nsw i64 %288, 1
  %300 = icmp eq i64 %299, %286
  br i1 %300, label %301, label %287

301:                                              ; preds = %298, %283, %281, %270, %252
  %302 = tail call i32 @putchar(i32 10) #16
  br label %303

303:                                              ; preds = %301, %231
  %304 = getelementptr inbounds %struct.YR_MATCH, %struct.YR_MATCH* %232, i64 0, i32 6
  %305 = load %struct.YR_MATCH*, %struct.YR_MATCH** %304, align 8, !tbaa !11
  %306 = icmp eq %struct.YR_MATCH* %305, null
  br i1 %306, label %307, label %231

307:                                              ; preds = %303, %219
  %308 = getelementptr inbounds %struct.YR_STRING, %struct.YR_STRING* %220, i64 0, i32 0
  %309 = load i32, i32* %308, align 8, !tbaa !80
  %310 = and i32 %309, 4096
  %311 = icmp eq i32 %310, 0
  %312 = getelementptr inbounds %struct.YR_STRING, %struct.YR_STRING* %220, i64 1
  br i1 %311, label %219, label %313

313:                                              ; preds = %307, %212, %204
  tail call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  br i1 %72, label %316, label %323

314:                                              ; preds = %71, %68
  %315 = phi i1 [ %69, %68 ], [ %72, %71 ]
  br i1 %315, label %316, label %323

316:                                              ; preds = %314, %313, %58
  %317 = getelementptr inbounds i8, i8* %3, i64 8
  %318 = bitcast i8* %317 to i32*
  %319 = load i32, i32* %318, align 8, !tbaa !60
  %320 = add nsw i32 %319, 1
  store i32 %320, i32* %318, align 8, !tbaa !60
  %321 = load i32, i32* @total_count, align 4, !tbaa !12
  %322 = add nsw i32 %321, 1
  store i32 %322, i32* @total_count, align 4, !tbaa !12
  br label %323

323:                                              ; preds = %58, %313, %314, %316
  %324 = load i32, i32* @limit, align 4, !tbaa !12
  %325 = icmp ne i32 %324, 0
  %326 = load i32, i32* @total_count, align 4
  %327 = icmp sge i32 %326, %324
  %328 = and i1 %325, %327
  %329 = zext i1 %328 to i32
  br label %375

330:                                              ; preds = %8, %343
  %331 = phi %struct._MODULE_DATA* [ %6, %8 ], [ %345, %343 ]
  %332 = getelementptr inbounds %struct._MODULE_DATA, %struct._MODULE_DATA* %331, i64 0, i32 0
  %333 = load i8*, i8** %332, align 8, !tbaa !33
  %334 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %333, i8* nonnull dereferenceable(1) %10) #15
  %335 = icmp eq i32 %334, 0
  br i1 %335, label %336, label %343

336:                                              ; preds = %330
  %337 = getelementptr inbounds i8, i8* %2, i64 8
  %338 = getelementptr inbounds %struct._MODULE_DATA, %struct._MODULE_DATA* %331, i64 0, i32 1, i32 1
  %339 = bitcast i64* %338 to <2 x i64>*
  %340 = load <2 x i64>, <2 x i64>* %339, align 8, !tbaa !10
  %341 = shufflevector <2 x i64> %340, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %342 = bitcast i8* %337 to <2 x i64>*
  store <2 x i64> %341, <2 x i64>* %342, align 8, !tbaa !10
  br label %375

343:                                              ; preds = %330
  %344 = getelementptr inbounds %struct._MODULE_DATA, %struct._MODULE_DATA* %331, i64 0, i32 2
  %345 = load %struct._MODULE_DATA*, %struct._MODULE_DATA** %344, align 8, !tbaa !11
  %346 = icmp eq %struct._MODULE_DATA* %345, null
  br i1 %346, label %375, label %330

347:                                              ; preds = %4
  %348 = load i8, i8* @show_module_data, align 1, !tbaa !16, !range !18
  %349 = icmp eq i8 %348, 0
  br i1 %349, label %375, label %350

350:                                              ; preds = %347
  %351 = bitcast i8* %2 to %struct.YR_OBJECT*
  tail call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  tail call void @yr_object_print_data(%struct.YR_OBJECT* %351, i32 0, i32 1) #16
  %352 = tail call i32 @putchar(i32 10)
  tail call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  br label %375

353:                                              ; preds = %4
  %354 = load i8, i8* @ignore_warnings, align 1, !tbaa !16, !range !18
  %355 = icmp eq i8 %354, 0
  br i1 %355, label %356, label %375

356:                                              ; preds = %353
  %357 = getelementptr inbounds %struct.YR_SCAN_CONTEXT, %struct.YR_SCAN_CONTEXT* %0, i64 0, i32 7
  %358 = load %struct.YR_RULES*, %struct.YR_RULES** %357, align 8, !tbaa !82
  %359 = getelementptr inbounds %struct.YR_RULES, %struct.YR_RULES* %358, i64 0, i32 1, i32 0
  %360 = load %struct.YR_RULE*, %struct.YR_RULE** %359, align 8, !tbaa !10
  %361 = getelementptr inbounds i8, i8* %2, i64 16
  %362 = bitcast i8* %361 to i32*
  %363 = load i32, i32* %362, align 8, !tbaa !83
  %364 = zext i32 %363 to i64
  %365 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %366 = getelementptr inbounds %struct.YR_RULE, %struct.YR_RULE* %360, i64 %364, i32 2, i32 0
  %367 = load i8*, i8** %366, align 8, !tbaa !10
  %368 = getelementptr inbounds i8, i8* %2, i64 48
  %369 = bitcast i8* %368 to i8**
  %370 = load i8*, i8** %369, align 8, !tbaa !10
  %371 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %365, i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.111, i64 0, i64 0), i8* %367, i8* %370) #18
  %372 = load i8, i8* @fail_on_warnings, align 1, !tbaa !16, !range !18
  %373 = icmp eq i8 %372, 0
  %374 = select i1 %373, i32 0, i32 2
  br label %375

375:                                              ; preds = %343, %5, %4, %356, %353, %350, %347, %336, %323
  %376 = phi i32 [ %329, %323 ], [ 0, %336 ], [ 0, %347 ], [ 0, %350 ], [ 0, %353 ], [ %374, %356 ], [ 2, %4 ], [ 0, %5 ], [ 0, %343 ]
  ret i32 %376
}

declare dso_local void @yr_scanner_set_callback(%struct.YR_SCAN_CONTEXT*, i32 (%struct.YR_SCAN_CONTEXT*, i32, i8*, i8*)*, i8*) local_unnamed_addr #11

declare dso_local void @yr_scanner_set_flags(%struct.YR_SCAN_CONTEXT*, i32) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define internal noalias i8* @scanning_thread(i8* nocapture %0) #4 {
  %2 = getelementptr inbounds i8, i8* %0, i64 24
  %3 = bitcast i8* %2 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !52
  %5 = tail call i32 @cli_semaphore_wait(%union.sem_t** nonnull @used_slots, i64 %4) #16
  %6 = icmp eq i32 %5, 26
  br i1 %6, label %90, label %7

7:                                                ; preds = %1
  tail call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  %8 = load i32, i32* @queue_head, align 4, !tbaa !12
  %9 = load i32, i32* @queue_tail, align 4, !tbaa !12
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %17, label %11

11:                                               ; preds = %7
  %12 = sext i32 %8 to i64
  %13 = getelementptr inbounds [65 x %union.anon.0], [65 x %union.anon.0]* @file_queue, i64 0, i64 %12, i32 0
  %14 = load i8*, i8** %13, align 8, !tbaa !57
  %15 = add nsw i32 %8, 1
  %16 = srem i32 %15, 65
  store i32 %16, i32* @queue_head, align 4, !tbaa !12
  br label %17

17:                                               ; preds = %7, %11
  %18 = phi i8* [ %14, %11 ], [ null, %7 ]
  tail call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  tail call void @cli_semaphore_release(%union.sem_t** nonnull @unused_slots) #16
  %19 = icmp eq i8* %18, null
  br i1 %19, label %90, label %20

20:                                               ; preds = %17
  %21 = getelementptr inbounds i8, i8* %0, i64 8
  %22 = getelementptr inbounds i8, i8* %0, i64 16
  %23 = bitcast i8* %22 to i32*
  %24 = bitcast i8* %21 to i8**
  %25 = bitcast i8* %0 to %struct.YR_SCAN_CONTEXT**
  br label %26

26:                                               ; preds = %20, %87
  %27 = phi i8* [ %18, %20 ], [ %88, %87 ]
  store i32 0, i32* %23, align 8, !tbaa !84
  store i8* %27, i8** %24, align 8, !tbaa !85
  %28 = tail call i64 @time(i64* null) #16
  %29 = load i64, i64* %3, align 8, !tbaa !52
  %30 = icmp sgt i64 %29, %28
  br i1 %30, label %31, label %90

31:                                               ; preds = %26
  %32 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %25, align 8, !tbaa !56
  %33 = sub nsw i64 %29, %28
  %34 = trunc i64 %33 to i32
  tail call void @yr_scanner_set_timeout(%struct.YR_SCAN_CONTEXT* %32, i32 %34) #16
  %35 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %25, align 8, !tbaa !56
  %36 = tail call i32 (i8*, i32, ...) @open(i8* nonnull %27, i32 0) #16
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %41, label %38

38:                                               ; preds = %31
  %39 = tail call i32 @yr_scanner_scan_fd(%struct.YR_SCAN_CONTEXT* %35, i32 %36) #16
  %40 = tail call i32 @close(i32 %36) #16
  br label %41

41:                                               ; preds = %31, %38
  %42 = phi i32 [ %39, %38 ], [ 3, %31 ]
  %43 = load i8, i8* @print_count_only, align 1, !tbaa !16, !range !18
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %41
  tail call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  %46 = load i32, i32* %23, align 8, !tbaa !84
  %47 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.136, i64 0, i64 0), i8* nonnull %27, i32 %46)
  tail call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  br label %48

48:                                               ; preds = %41, %45
  %49 = icmp eq i32 %42, 0
  br i1 %49, label %73, label %50

50:                                               ; preds = %48
  tail call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %52 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.83, i64 0, i64 0), i8* nonnull %27) #18
  %53 = load %struct.YR_SCAN_CONTEXT*, %struct.YR_SCAN_CONTEXT** %25, align 8, !tbaa !56
  %54 = tail call %struct.YR_RULE* @yr_scanner_last_error_rule(%struct.YR_SCAN_CONTEXT* %53) #16
  %55 = tail call %struct.YR_STRING* @yr_scanner_last_error_string(%struct.YR_SCAN_CONTEXT* %53) #16
  %56 = icmp ne %struct.YR_RULE* %54, null
  %57 = icmp ne %struct.YR_STRING* %55, null
  %58 = and i1 %56, %57
  br i1 %58, label %59, label %66

59:                                               ; preds = %50
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %61 = getelementptr inbounds %struct.YR_STRING, %struct.YR_STRING* %55, i64 0, i32 9, i32 0
  %62 = load i8*, i8** %61, align 8, !tbaa !10
  %63 = getelementptr inbounds %struct.YR_RULE, %struct.YR_RULE* %54, i64 0, i32 2, i32 0
  %64 = load i8*, i8** %63, align 8, !tbaa !10
  %65 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.142, i64 0, i64 0), i8* %62, i8* %64) #20
  br label %72

66:                                               ; preds = %50
  br i1 %56, label %67, label %72

67:                                               ; preds = %66
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %69 = getelementptr inbounds %struct.YR_RULE, %struct.YR_RULE* %54, i64 0, i32 2, i32 0
  %70 = load i8*, i8** %69, align 8, !tbaa !10
  %71 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.143, i64 0, i64 0), i8* %70) #20
  br label %72

72:                                               ; preds = %59, %66, %67
  tail call fastcc void @print_error(i32 %42) #16
  tail call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @output_mutex) #16
  br label %73

73:                                               ; preds = %48, %72
  tail call void @free(i8* nonnull %27) #16
  %74 = load i64, i64* %3, align 8, !tbaa !52
  %75 = tail call i32 @cli_semaphore_wait(%union.sem_t** nonnull @used_slots, i64 %74) #16
  %76 = icmp eq i32 %75, 26
  br i1 %76, label %90, label %77

77:                                               ; preds = %73
  tail call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  %78 = load i32, i32* @queue_head, align 4, !tbaa !12
  %79 = load i32, i32* @queue_tail, align 4, !tbaa !12
  %80 = icmp eq i32 %78, %79
  br i1 %80, label %87, label %81

81:                                               ; preds = %77
  %82 = sext i32 %78 to i64
  %83 = getelementptr inbounds [65 x %union.anon.0], [65 x %union.anon.0]* @file_queue, i64 0, i64 %82, i32 0
  %84 = load i8*, i8** %83, align 8, !tbaa !57
  %85 = add nsw i32 %78, 1
  %86 = srem i32 %85, 65
  store i32 %86, i32* @queue_head, align 4, !tbaa !12
  br label %87

87:                                               ; preds = %77, %81
  %88 = phi i8* [ %84, %81 ], [ null, %77 ]
  tail call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  tail call void @cli_semaphore_release(%union.sem_t** nonnull @unused_slots) #16
  %89 = icmp eq i8* %88, null
  br i1 %89, label %90, label %26

90:                                               ; preds = %73, %26, %87, %1, %17
  ret i8* null
}

; Function Attrs: nounwind uwtable
define internal fastcc i32 @scan_dir(i8* %0, %struct.SCAN_OPTIONS* nocapture readonly %1) unnamed_addr #4 {
  %3 = alloca [1024 x i8], align 16
  %4 = alloca %struct.stat, align 8
  %5 = alloca [2 x i8], align 1
  %6 = tail call %struct.__dirstream* @opendir(i8* %0)
  %7 = icmp eq %struct.__dirstream* %6, null
  br i1 %7, label %99, label %8

8:                                                ; preds = %2
  %9 = tail call %struct.dirent* @readdir(%struct.__dirstream* nonnull %6) #16
  %10 = icmp eq %struct.dirent* %9, null
  br i1 %10, label %96, label %11

11:                                               ; preds = %8
  %12 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  %13 = bitcast %struct.stat* %4 to i8*
  %14 = getelementptr inbounds %struct.stat, %struct.stat* %4, i64 0, i32 3
  %15 = getelementptr inbounds %struct.SCAN_OPTIONS, %struct.SCAN_OPTIONS* %1, i64 0, i32 0
  %16 = getelementptr inbounds [2 x i8], [2 x i8]* %5, i64 0, i64 0
  %17 = getelementptr inbounds %struct.SCAN_OPTIONS, %struct.SCAN_OPTIONS* %1, i64 0, i32 1
  %18 = getelementptr inbounds %struct.stat, %struct.stat* %4, i64 0, i32 8
  %19 = getelementptr inbounds %struct.SCAN_OPTIONS, %struct.SCAN_OPTIONS* %1, i64 0, i32 2
  br label %20

20:                                               ; preds = %11, %90
  %21 = phi i32 [ 0, %11 ], [ %92, %90 ]
  %22 = phi %struct.dirent* [ %9, %11 ], [ %91, %90 ]
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %12) #16
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %13) #16
  %23 = getelementptr inbounds %struct.dirent, %struct.dirent* %22, i64 0, i32 4, i64 0
  %24 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* nonnull %12, i64 1024, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.137, i64 0, i64 0), i8* %0, i8* nonnull %23) #16
  %25 = call i32 @lstat(i8* nonnull %12, %struct.stat* nonnull %4) #16
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %34

27:                                               ; preds = %20
  %28 = load i32, i32* %14, align 8, !tbaa !86
  %29 = and i32 %28, 61440
  %30 = icmp eq i32 %29, 40960
  br i1 %30, label %31, label %46

31:                                               ; preds = %27
  %32 = load i8, i8* %15, align 8, !tbaa !30, !range !18
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %31, %20
  %35 = call %struct.dirent* @readdir(%struct.__dirstream* nonnull %6) #16
  br label %90

36:                                               ; preds = %31
  call void @llvm.lifetime.start.p0i8(i64 2, i8* nonnull %16) #16
  %37 = call i64 @readlink(i8* nonnull %12, i8* nonnull %16, i64 2) #16
  %38 = trunc i64 %37 to i32
  %39 = icmp eq i32 %38, 1
  %40 = load i8, i8* %16, align 1
  %41 = icmp eq i8 %40, 46
  %42 = and i1 %39, %41
  br i1 %42, label %44, label %43

43:                                               ; preds = %36
  call void @llvm.lifetime.end.p0i8(i64 2, i8* nonnull %16) #16
  br label %46

44:                                               ; preds = %36
  %45 = call %struct.dirent* @readdir(%struct.__dirstream* nonnull %6) #16
  call void @llvm.lifetime.end.p0i8(i64 2, i8* nonnull %16) #16
  br label %90

46:                                               ; preds = %43, %27
  %47 = call i32 @__xstat(i32 1, i8* nonnull %12, %struct.stat* nonnull %4) #16
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %87

49:                                               ; preds = %46
  %50 = load i32, i32* %14, align 8, !tbaa !86
  %51 = and i32 %50, 61440
  %52 = icmp eq i32 %51, 32768
  br i1 %52, label %53, label %74

53:                                               ; preds = %49
  %54 = load i32, i32* @skip_larger, align 4, !tbaa !12
  %55 = sext i32 %54 to i64
  %56 = load i64, i64* %18, align 8, !tbaa !88
  %57 = icmp slt i64 %56, %55
  %58 = icmp slt i32 %54, 1
  %59 = or i1 %58, %57
  br i1 %59, label %60, label %71

60:                                               ; preds = %53
  %61 = load i64, i64* %19, align 8, !tbaa !51
  %62 = call i32 @cli_semaphore_wait(%union.sem_t** nonnull @unused_slots, i64 %61) #16
  %63 = icmp eq i32 %62, 26
  br i1 %63, label %87, label %64

64:                                               ; preds = %60
  call void @cli_mutex_lock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  %65 = call noalias i8* @strdup(i8* nonnull %12) #16
  %66 = load i32, i32* @queue_tail, align 4, !tbaa !12
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [65 x %union.anon.0], [65 x %union.anon.0]* @file_queue, i64 0, i64 %67, i32 0
  store i8* %65, i8** %68, align 8, !tbaa !57
  %69 = add nsw i32 %66, 1
  %70 = srem i32 %69, 65
  store i32 %70, i32* @queue_tail, align 4, !tbaa !12
  call void @cli_mutex_unlock(%union.pthread_mutex_t* nonnull @queue_mutex) #16
  call void @cli_semaphore_release(%union.sem_t** nonnull @used_slots) #16
  br label %87

71:                                               ; preds = %53
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !11
  %73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.138, i64 0, i64 0), i8* nonnull %12, i64 %56, i32 %54) #18
  br label %87

74:                                               ; preds = %49
  %75 = load i8, i8* %17, align 1, !tbaa !32, !range !18
  %76 = icmp ne i8 %75, 0
  %77 = icmp eq i32 %51, 16384
  %78 = and i1 %77, %76
  br i1 %78, label %79, label %87

79:                                               ; preds = %74
  %80 = call i32 @strcmp(i8* nonnull %23, i8* nonnull dereferenceable(2) getelementptr inbounds ([2 x i8], [2 x i8]* @.str.139, i64 0, i64 0)) #15
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %87, label %82

82:                                               ; preds = %79
  %83 = call i32 @strcmp(i8* nonnull %23, i8* nonnull dereferenceable(3) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.140, i64 0, i64 0)) #15
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %87, label %85

85:                                               ; preds = %82
  %86 = call fastcc i32 @scan_dir(i8* nonnull %12, %struct.SCAN_OPTIONS* nonnull %1)
  br label %87

87:                                               ; preds = %64, %60, %74, %82, %79, %71, %85, %46
  %88 = phi i32 [ %21, %71 ], [ %86, %85 ], [ %21, %82 ], [ %21, %79 ], [ %21, %74 ], [ %21, %46 ], [ 0, %64 ], [ 26, %60 ]
  %89 = call %struct.dirent* @readdir(%struct.__dirstream* nonnull %6) #16
  br label %90

90:                                               ; preds = %44, %87, %34
  %91 = phi %struct.dirent* [ %35, %34 ], [ %89, %87 ], [ %45, %44 ]
  %92 = phi i32 [ %21, %34 ], [ %88, %87 ], [ %21, %44 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %13) #16
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %12) #16
  %93 = icmp ne %struct.dirent* %91, null
  %94 = icmp ne i32 %92, 26
  %95 = and i1 %93, %94
  br i1 %95, label %20, label %96

96:                                               ; preds = %90, %8
  %97 = phi i32 [ 0, %8 ], [ %92, %90 ]
  %98 = call i32 @closedir(%struct.__dirstream* nonnull %6)
  br label %99

99:                                               ; preds = %2, %96
  %100 = phi i32 [ %97, %96 ], [ 0, %2 ]
  ret i32 %100
}

declare dso_local i64 @getline(i8**, i64*, %struct._IO_FILE*) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @strdup(i8* nocapture readonly) local_unnamed_addr #6

declare dso_local void @yr_scanner_destroy(%struct.YR_SCAN_CONTEXT*) local_unnamed_addr #11

declare dso_local void @yr_scanner_set_timeout(%struct.YR_SCAN_CONTEXT*, i32) local_unnamed_addr #11

; Function Attrs: nofree
declare dso_local i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #14

declare dso_local i32 @yr_scanner_scan_fd(%struct.YR_SCAN_CONTEXT*, i32) local_unnamed_addr #11

declare dso_local i32 @close(i32) local_unnamed_addr #11

declare dso_local i32 @yr_scanner_scan_proc(%struct.YR_SCAN_CONTEXT*, i32) local_unnamed_addr #11

declare dso_local %struct.YR_RULE* @yr_scanner_last_error_rule(%struct.YR_SCAN_CONTEXT*) local_unnamed_addr #11

declare dso_local %struct.YR_STRING* @yr_scanner_last_error_string(%struct.YR_SCAN_CONTEXT*) local_unnamed_addr #11

declare dso_local void @yr_filemap_unmap(%struct._YR_MAPPED_FILE*) local_unnamed_addr #11

declare dso_local i32 @yr_rules_destroy(%struct.YR_RULES*) local_unnamed_addr #11

declare dso_local i32 @yr_finalize() local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare dso_local noalias %struct.__dirstream* @opendir(i8* nocapture readonly) local_unnamed_addr #6

declare dso_local %struct.dirent* @readdir(%struct.__dirstream*) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare dso_local i32 @snprintf(i8* noalias nocapture, i64, i8* nocapture readonly, ...) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local i32 @lstat(i8* nocapture readonly, %struct.stat* nocapture) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local i64 @readlink(i8* nocapture readonly, i8* nocapture, i64) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local i32 @closedir(%struct.__dirstream* nocapture) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare i32 @putchar(i32) local_unnamed_addr #13

declare dso_local void @yr_object_print_data(%struct.YR_OBJECT*, i32, i32) local_unnamed_addr #11

attributes #0 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind readonly }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nofree nounwind }
attributes #14 = { nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind readonly }
attributes #16 = { nounwind }
attributes #17 = { noreturn nounwind }
attributes #18 = { cold }
attributes #19 = { nounwind readnone }
attributes #20 = { cold nounwind }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!3, !4, i64 0}
!3 = !{!"_args_option", !4, i64 0, !4, i64 4, !6, i64 8, !6, i64 16, !7, i64 24, !6, i64 32, !6, i64 40, !7, i64 48}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"any pointer", !4, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!3, !4, i64 4}
!9 = !{!3, !6, i64 8}
!10 = !{!4, !4, i64 0}
!11 = !{!6, !6, i64 0}
!12 = !{!7, !7, i64 0}
!13 = !{!3, !7, i64 48}
!14 = !{!3, !7, i64 24}
!15 = !{!3, !6, i64 16}
!16 = !{!17, !17, i64 0}
!17 = !{!"_Bool", !4, i64 0}
!18 = !{i8 0, i8 2}
!19 = !{!20, !20, i64 0}
!20 = !{!"long", !4, i64 0}
!21 = !{!3, !6, i64 40}
!22 = !{!3, !6, i64 32}
!23 = !{!24, !24, i64 0}
!24 = !{!"short", !4, i64 0}
!25 = !{!26, !20, i64 0}
!26 = !{!"timespec", !20, i64 0, !20, i64 8}
!27 = !{!26, !20, i64 8}
!28 = !{!29}
!29 = !{i64 2, i64 3, i1 false}
!30 = !{!31, !17, i64 0}
!31 = !{!"SCAN_OPTIONS", !17, i64 0, !17, i64 1, !20, i64 8}
!32 = !{!31, !17, i64 1}
!33 = !{!34, !6, i64 0}
!34 = !{!"_MODULE_DATA", !6, i64 0, !35, i64 8, !6, i64 32}
!35 = !{!"_YR_MAPPED_FILE", !7, i64 0, !20, i64 8, !6, i64 16}
!36 = !{!34, !6, i64 32}
!37 = !{!38, !6, i64 0}
!38 = !{!"_YR_STREAM", !6, i64 0, !6, i64 8, !6, i64 16}
!39 = !{!38, !6, i64 8}
!40 = !{!41, !7, i64 0}
!41 = !{!"COMPILER_RESULTS", !7, i64 0, !7, i64 4}
!42 = !{!41, !7, i64 4}
!43 = !{!44, !7, i64 824}
!44 = !{!"YR_RULES_STATS", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !45, i64 16, !4, i64 20, !4, i64 420, !7, i64 824}
!45 = !{!"float", !4, i64 0}
!46 = !{!44, !45, i64 16}
!47 = !{!44, !7, i64 0}
!48 = !{!44, !7, i64 4}
!49 = !{!44, !7, i64 8}
!50 = !{!44, !7, i64 12}
!51 = !{!31, !20, i64 8}
!52 = !{!53, !20, i64 24}
!53 = !{!"_THREAD_ARGS", !6, i64 0, !54, i64 8, !20, i64 24, !7, i64 32}
!54 = !{!"_CALLBACK_ARGS", !6, i64 0, !7, i64 8}
!55 = !{!53, !7, i64 32}
!56 = !{!53, !6, i64 0}
!57 = !{!58, !6, i64 0}
!58 = !{!"_QUEUED_FILE", !6, i64 0}
!59 = !{!54, !6, i64 0}
!60 = !{!54, !7, i64 8}
!61 = !{!62, !6, i64 0}
!62 = !{!"YR_MODULE_IMPORT", !6, i64 0, !6, i64 8, !20, i64 16}
!63 = !{!64, !7, i64 24}
!64 = !{!"YR_META", !4, i64 0, !4, i64 8, !20, i64 16, !7, i64 24, !7, i64 28}
!65 = !{!64, !20, i64 16}
!66 = !{!64, !7, i64 28}
!67 = !{!68, !6, i64 160}
!68 = !{!"YR_SCAN_CONTEXT", !20, i64 0, !20, i64 8, !7, i64 16, !7, i64 20, !20, i64 24, !6, i64 32, !6, i64 40, !6, i64 48, !6, i64 56, !6, i64 64, !6, i64 72, !6, i64 80, !69, i64 88, !70, i64 104, !72, i64 128, !6, i64 136, !6, i64 144, !6, i64 152, !6, i64 160, !6, i64 168, !6, i64 176}
!69 = !{!"_YR_STOPWATCH", !4, i64 0}
!70 = !{!"RE_FIBER_POOL", !7, i64 0, !71, i64 8}
!71 = !{!"RE_FIBER_LIST", !6, i64 0, !6, i64 8}
!72 = !{!"RE_FAST_EXEC_POSITION_POOL", !6, i64 0}
!73 = !{!74, !7, i64 4}
!74 = !{!"YR_STRING", !7, i64 0, !7, i64 4, !20, i64 8, !7, i64 16, !7, i64 20, !4, i64 24, !4, i64 32, !7, i64 40, !7, i64 44, !4, i64 48}
!75 = !{!76, !17, i64 52}
!76 = !{!"YR_MATCH", !20, i64 0, !20, i64 8, !7, i64 16, !7, i64 20, !6, i64 24, !6, i64 32, !6, i64 40, !7, i64 48, !17, i64 52}
!77 = !{!76, !20, i64 0}
!78 = !{!76, !20, i64 8}
!79 = !{!76, !7, i64 20}
!80 = !{!74, !7, i64 0}
!81 = !{!76, !6, i64 24}
!82 = !{!68, !6, i64 48}
!83 = !{!74, !7, i64 16}
!84 = !{!53, !7, i64 16}
!85 = !{!53, !6, i64 8}
!86 = !{!87, !7, i64 24}
!87 = !{!"stat", !20, i64 0, !20, i64 8, !20, i64 16, !7, i64 24, !7, i64 28, !7, i64 32, !7, i64 36, !20, i64 40, !20, i64 48, !20, i64 56, !20, i64 64, !26, i64 72, !26, i64 88, !26, i64 104, !4, i64 120}
!88 = !{!87, !20, i64 48}
