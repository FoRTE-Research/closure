; ModuleID = 'buildfiles/joined.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ptr_obj = type { i32, i8*, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { %struct.UT_hash_table*, i8*, i8*, %struct.UT_hash_handle*, %struct.UT_hash_handle*, i8*, i32, i32 }
%struct.UT_hash_table = type { %struct.UT_hash_bucket*, i32, i32, i32, %struct.UT_hash_handle*, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { %struct.UT_hash_handle*, i32, i32 }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct.DataItem = type { i32, i32 }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@_ctr = dso_local global i32 0, align 4
@ptr_map = dso_local global %struct.ptr_obj* null, align 8
@_buf = common dso_local global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@PTRTRACKER = common dso_local global [100 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"\0A!!!Saved by long jump!!!\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"\0A___Start_Main___\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"\0A---Done with Testing---\0A\00", align 1
@RANDOM_INIT = dso_local global i32 0, align 4
@hashArray = common dso_local global [20 x %struct.DataItem*] zeroinitializer, align 16
@dummyItem = common dso_local global %struct.DataItem* null, align 8
@t = common dso_local global i64 0, align 8
@timeinfo = common dso_local global %struct.tm* null, align 8
@RANDOM_UNIT = common dso_local global i32 0, align 4
@item = common dso_local global %struct.DataItem* null, align 8
@.str.3 = private unnamed_addr constant [9 x i8] c" (%d,%d)\00", align 1
@.str.1.4 = private unnamed_addr constant [5 x i8] c" ~~ \00", align 1
@.str.2.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3.6 = private unnamed_addr constant [19 x i8] c"%d %d %d %d:%d:%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"../results/untooled/random_exit_untooled.txt\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.7 = private unnamed_addr constant [35 x i8] c"___BEFORE INITIALIZING RANDOMS___\0A\00", align 1
@.str.8 = private unnamed_addr constant [31 x i8] c"Random Unintialized Value: %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [29 x i8] c"Random initilized Value: %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [67 x i8] c"\0ARANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\0A\00", align 1
@.str.11 = private unnamed_addr constant [35 x i8] c"\0A___AFTER INITIALIZING RANDOMS___\0A\00", align 1
@.str.12 = private unnamed_addr constant [37 x i8] c"-----------------------------------\0A\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Element found: %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [19 x i8] c"Element not found\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @add_ptr(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.ptr_obj*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.UT_hash_bucket*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.UT_hash_handle*, align 8
  %14 = alloca %struct.UT_hash_handle*, align 8
  %15 = alloca %struct.UT_hash_bucket*, align 8
  %16 = alloca %struct.UT_hash_bucket*, align 8
  store i8* %0, i8** %2, align 8
  %17 = call noalias i8* @malloc(i64 72) #7
  %18 = bitcast i8* %17 to %struct.ptr_obj*
  store %struct.ptr_obj* %18, %struct.ptr_obj** %3, align 8
  %19 = load i8*, i8** %2, align 8
  %20 = ptrtoint i8* %19 to i32
  %21 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %22 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %21, i32 0, i32 0
  store i32 %20, i32* %22, align 8
  %23 = load i8*, i8** %2, align 8
  %24 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %25 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %24, i32 0, i32 1
  store i8* %23, i8** %25, align 8
  br label %26

26:                                               ; preds = %1
  br label %27

27:                                               ; preds = %26
  br label %28

28:                                               ; preds = %27
  %29 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %30 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %29, i32 0, i32 0
  %31 = bitcast i32* %30 to i8*
  store i8* %31, i8** %8, align 8
  store i32 -17973521, i32* %4, align 4
  store i32 -1640531527, i32* %6, align 4
  store i32 -1640531527, i32* %5, align 4
  store i32 4, i32* %7, align 4
  br label %32

32:                                               ; preds = %199, %28
  %33 = load i32, i32* %7, align 4
  %34 = icmp uge i32 %33, 12
  br i1 %34, label %35, label %204

35:                                               ; preds = %32
  %36 = load i8*, i8** %8, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 0
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = load i8*, i8** %8, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 1
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = shl i32 %43, 8
  %45 = add i32 %39, %44
  %46 = load i8*, i8** %8, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 2
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = shl i32 %49, 16
  %51 = add i32 %45, %50
  %52 = load i8*, i8** %8, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 3
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = shl i32 %55, 24
  %57 = add i32 %51, %56
  %58 = load i32, i32* %5, align 4
  %59 = add i32 %58, %57
  store i32 %59, i32* %5, align 4
  %60 = load i8*, i8** %8, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 4
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = load i8*, i8** %8, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 5
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = shl i32 %67, 8
  %69 = add i32 %63, %68
  %70 = load i8*, i8** %8, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 6
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = shl i32 %73, 16
  %75 = add i32 %69, %74
  %76 = load i8*, i8** %8, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 7
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = shl i32 %79, 24
  %81 = add i32 %75, %80
  %82 = load i32, i32* %6, align 4
  %83 = add i32 %82, %81
  store i32 %83, i32* %6, align 4
  %84 = load i8*, i8** %8, align 8
  %85 = getelementptr inbounds i8, i8* %84, i64 8
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = load i8*, i8** %8, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 9
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = shl i32 %91, 8
  %93 = add i32 %87, %92
  %94 = load i8*, i8** %8, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 10
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = shl i32 %97, 16
  %99 = add i32 %93, %98
  %100 = load i8*, i8** %8, align 8
  %101 = getelementptr inbounds i8, i8* %100, i64 11
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = shl i32 %103, 24
  %105 = add i32 %99, %104
  %106 = load i32, i32* %4, align 4
  %107 = add i32 %106, %105
  store i32 %107, i32* %4, align 4
  br label %108

108:                                              ; preds = %35
  %109 = load i32, i32* %6, align 4
  %110 = load i32, i32* %5, align 4
  %111 = sub i32 %110, %109
  store i32 %111, i32* %5, align 4
  %112 = load i32, i32* %4, align 4
  %113 = load i32, i32* %5, align 4
  %114 = sub i32 %113, %112
  store i32 %114, i32* %5, align 4
  %115 = load i32, i32* %4, align 4
  %116 = lshr i32 %115, 13
  %117 = load i32, i32* %5, align 4
  %118 = xor i32 %117, %116
  store i32 %118, i32* %5, align 4
  %119 = load i32, i32* %4, align 4
  %120 = load i32, i32* %6, align 4
  %121 = sub i32 %120, %119
  store i32 %121, i32* %6, align 4
  %122 = load i32, i32* %5, align 4
  %123 = load i32, i32* %6, align 4
  %124 = sub i32 %123, %122
  store i32 %124, i32* %6, align 4
  %125 = load i32, i32* %5, align 4
  %126 = shl i32 %125, 8
  %127 = load i32, i32* %6, align 4
  %128 = xor i32 %127, %126
  store i32 %128, i32* %6, align 4
  %129 = load i32, i32* %5, align 4
  %130 = load i32, i32* %4, align 4
  %131 = sub i32 %130, %129
  store i32 %131, i32* %4, align 4
  %132 = load i32, i32* %6, align 4
  %133 = load i32, i32* %4, align 4
  %134 = sub i32 %133, %132
  store i32 %134, i32* %4, align 4
  %135 = load i32, i32* %6, align 4
  %136 = lshr i32 %135, 13
  %137 = load i32, i32* %4, align 4
  %138 = xor i32 %137, %136
  store i32 %138, i32* %4, align 4
  %139 = load i32, i32* %6, align 4
  %140 = load i32, i32* %5, align 4
  %141 = sub i32 %140, %139
  store i32 %141, i32* %5, align 4
  %142 = load i32, i32* %4, align 4
  %143 = load i32, i32* %5, align 4
  %144 = sub i32 %143, %142
  store i32 %144, i32* %5, align 4
  %145 = load i32, i32* %4, align 4
  %146 = lshr i32 %145, 12
  %147 = load i32, i32* %5, align 4
  %148 = xor i32 %147, %146
  store i32 %148, i32* %5, align 4
  %149 = load i32, i32* %4, align 4
  %150 = load i32, i32* %6, align 4
  %151 = sub i32 %150, %149
  store i32 %151, i32* %6, align 4
  %152 = load i32, i32* %5, align 4
  %153 = load i32, i32* %6, align 4
  %154 = sub i32 %153, %152
  store i32 %154, i32* %6, align 4
  %155 = load i32, i32* %5, align 4
  %156 = shl i32 %155, 16
  %157 = load i32, i32* %6, align 4
  %158 = xor i32 %157, %156
  store i32 %158, i32* %6, align 4
  %159 = load i32, i32* %5, align 4
  %160 = load i32, i32* %4, align 4
  %161 = sub i32 %160, %159
  store i32 %161, i32* %4, align 4
  %162 = load i32, i32* %6, align 4
  %163 = load i32, i32* %4, align 4
  %164 = sub i32 %163, %162
  store i32 %164, i32* %4, align 4
  %165 = load i32, i32* %6, align 4
  %166 = lshr i32 %165, 5
  %167 = load i32, i32* %4, align 4
  %168 = xor i32 %167, %166
  store i32 %168, i32* %4, align 4
  %169 = load i32, i32* %6, align 4
  %170 = load i32, i32* %5, align 4
  %171 = sub i32 %170, %169
  store i32 %171, i32* %5, align 4
  %172 = load i32, i32* %4, align 4
  %173 = load i32, i32* %5, align 4
  %174 = sub i32 %173, %172
  store i32 %174, i32* %5, align 4
  %175 = load i32, i32* %4, align 4
  %176 = lshr i32 %175, 3
  %177 = load i32, i32* %5, align 4
  %178 = xor i32 %177, %176
  store i32 %178, i32* %5, align 4
  %179 = load i32, i32* %4, align 4
  %180 = load i32, i32* %6, align 4
  %181 = sub i32 %180, %179
  store i32 %181, i32* %6, align 4
  %182 = load i32, i32* %5, align 4
  %183 = load i32, i32* %6, align 4
  %184 = sub i32 %183, %182
  store i32 %184, i32* %6, align 4
  %185 = load i32, i32* %5, align 4
  %186 = shl i32 %185, 10
  %187 = load i32, i32* %6, align 4
  %188 = xor i32 %187, %186
  store i32 %188, i32* %6, align 4
  %189 = load i32, i32* %5, align 4
  %190 = load i32, i32* %4, align 4
  %191 = sub i32 %190, %189
  store i32 %191, i32* %4, align 4
  %192 = load i32, i32* %6, align 4
  %193 = load i32, i32* %4, align 4
  %194 = sub i32 %193, %192
  store i32 %194, i32* %4, align 4
  %195 = load i32, i32* %6, align 4
  %196 = lshr i32 %195, 15
  %197 = load i32, i32* %4, align 4
  %198 = xor i32 %197, %196
  store i32 %198, i32* %4, align 4
  br label %199

199:                                              ; preds = %108
  %200 = load i8*, i8** %8, align 8
  %201 = getelementptr inbounds i8, i8* %200, i64 12
  store i8* %201, i8** %8, align 8
  %202 = load i32, i32* %7, align 4
  %203 = sub i32 %202, 12
  store i32 %203, i32* %7, align 4
  br label %32

204:                                              ; preds = %32
  %205 = load i32, i32* %4, align 4
  %206 = add i32 %205, 4
  store i32 %206, i32* %4, align 4
  %207 = load i32, i32* %7, align 4
  switch i32 %207, label %294 [
    i32 11, label %208
    i32 10, label %216
    i32 9, label %224
    i32 8, label %232
    i32 7, label %240
    i32 6, label %248
    i32 5, label %256
    i32 4, label %263
    i32 3, label %271
    i32 2, label %279
    i32 1, label %287
  ]

208:                                              ; preds = %204
  %209 = load i8*, i8** %8, align 8
  %210 = getelementptr inbounds i8, i8* %209, i64 10
  %211 = load i8, i8* %210, align 1
  %212 = zext i8 %211 to i32
  %213 = shl i32 %212, 24
  %214 = load i32, i32* %4, align 4
  %215 = add i32 %214, %213
  store i32 %215, i32* %4, align 4
  br label %216

216:                                              ; preds = %208, %204
  %217 = load i8*, i8** %8, align 8
  %218 = getelementptr inbounds i8, i8* %217, i64 9
  %219 = load i8, i8* %218, align 1
  %220 = zext i8 %219 to i32
  %221 = shl i32 %220, 16
  %222 = load i32, i32* %4, align 4
  %223 = add i32 %222, %221
  store i32 %223, i32* %4, align 4
  br label %224

224:                                              ; preds = %216, %204
  %225 = load i8*, i8** %8, align 8
  %226 = getelementptr inbounds i8, i8* %225, i64 8
  %227 = load i8, i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = shl i32 %228, 8
  %230 = load i32, i32* %4, align 4
  %231 = add i32 %230, %229
  store i32 %231, i32* %4, align 4
  br label %232

232:                                              ; preds = %224, %204
  %233 = load i8*, i8** %8, align 8
  %234 = getelementptr inbounds i8, i8* %233, i64 7
  %235 = load i8, i8* %234, align 1
  %236 = zext i8 %235 to i32
  %237 = shl i32 %236, 24
  %238 = load i32, i32* %6, align 4
  %239 = add i32 %238, %237
  store i32 %239, i32* %6, align 4
  br label %240

240:                                              ; preds = %232, %204
  %241 = load i8*, i8** %8, align 8
  %242 = getelementptr inbounds i8, i8* %241, i64 6
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = shl i32 %244, 16
  %246 = load i32, i32* %6, align 4
  %247 = add i32 %246, %245
  store i32 %247, i32* %6, align 4
  br label %248

248:                                              ; preds = %240, %204
  %249 = load i8*, i8** %8, align 8
  %250 = getelementptr inbounds i8, i8* %249, i64 5
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = shl i32 %252, 8
  %254 = load i32, i32* %6, align 4
  %255 = add i32 %254, %253
  store i32 %255, i32* %6, align 4
  br label %256

256:                                              ; preds = %248, %204
  %257 = load i8*, i8** %8, align 8
  %258 = getelementptr inbounds i8, i8* %257, i64 4
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = load i32, i32* %6, align 4
  %262 = add i32 %261, %260
  store i32 %262, i32* %6, align 4
  br label %263

263:                                              ; preds = %256, %204
  %264 = load i8*, i8** %8, align 8
  %265 = getelementptr inbounds i8, i8* %264, i64 3
  %266 = load i8, i8* %265, align 1
  %267 = zext i8 %266 to i32
  %268 = shl i32 %267, 24
  %269 = load i32, i32* %5, align 4
  %270 = add i32 %269, %268
  store i32 %270, i32* %5, align 4
  br label %271

271:                                              ; preds = %263, %204
  %272 = load i8*, i8** %8, align 8
  %273 = getelementptr inbounds i8, i8* %272, i64 2
  %274 = load i8, i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = shl i32 %275, 16
  %277 = load i32, i32* %5, align 4
  %278 = add i32 %277, %276
  store i32 %278, i32* %5, align 4
  br label %279

279:                                              ; preds = %271, %204
  %280 = load i8*, i8** %8, align 8
  %281 = getelementptr inbounds i8, i8* %280, i64 1
  %282 = load i8, i8* %281, align 1
  %283 = zext i8 %282 to i32
  %284 = shl i32 %283, 8
  %285 = load i32, i32* %5, align 4
  %286 = add i32 %285, %284
  store i32 %286, i32* %5, align 4
  br label %287

287:                                              ; preds = %279, %204
  %288 = load i8*, i8** %8, align 8
  %289 = getelementptr inbounds i8, i8* %288, i64 0
  %290 = load i8, i8* %289, align 1
  %291 = zext i8 %290 to i32
  %292 = load i32, i32* %5, align 4
  %293 = add i32 %292, %291
  store i32 %293, i32* %5, align 4
  br label %294

294:                                              ; preds = %287, %204
  br label %295

295:                                              ; preds = %294
  br label %296

296:                                              ; preds = %295
  %297 = load i32, i32* %6, align 4
  %298 = load i32, i32* %5, align 4
  %299 = sub i32 %298, %297
  store i32 %299, i32* %5, align 4
  %300 = load i32, i32* %4, align 4
  %301 = load i32, i32* %5, align 4
  %302 = sub i32 %301, %300
  store i32 %302, i32* %5, align 4
  %303 = load i32, i32* %4, align 4
  %304 = lshr i32 %303, 13
  %305 = load i32, i32* %5, align 4
  %306 = xor i32 %305, %304
  store i32 %306, i32* %5, align 4
  %307 = load i32, i32* %4, align 4
  %308 = load i32, i32* %6, align 4
  %309 = sub i32 %308, %307
  store i32 %309, i32* %6, align 4
  %310 = load i32, i32* %5, align 4
  %311 = load i32, i32* %6, align 4
  %312 = sub i32 %311, %310
  store i32 %312, i32* %6, align 4
  %313 = load i32, i32* %5, align 4
  %314 = shl i32 %313, 8
  %315 = load i32, i32* %6, align 4
  %316 = xor i32 %315, %314
  store i32 %316, i32* %6, align 4
  %317 = load i32, i32* %5, align 4
  %318 = load i32, i32* %4, align 4
  %319 = sub i32 %318, %317
  store i32 %319, i32* %4, align 4
  %320 = load i32, i32* %6, align 4
  %321 = load i32, i32* %4, align 4
  %322 = sub i32 %321, %320
  store i32 %322, i32* %4, align 4
  %323 = load i32, i32* %6, align 4
  %324 = lshr i32 %323, 13
  %325 = load i32, i32* %4, align 4
  %326 = xor i32 %325, %324
  store i32 %326, i32* %4, align 4
  %327 = load i32, i32* %6, align 4
  %328 = load i32, i32* %5, align 4
  %329 = sub i32 %328, %327
  store i32 %329, i32* %5, align 4
  %330 = load i32, i32* %4, align 4
  %331 = load i32, i32* %5, align 4
  %332 = sub i32 %331, %330
  store i32 %332, i32* %5, align 4
  %333 = load i32, i32* %4, align 4
  %334 = lshr i32 %333, 12
  %335 = load i32, i32* %5, align 4
  %336 = xor i32 %335, %334
  store i32 %336, i32* %5, align 4
  %337 = load i32, i32* %4, align 4
  %338 = load i32, i32* %6, align 4
  %339 = sub i32 %338, %337
  store i32 %339, i32* %6, align 4
  %340 = load i32, i32* %5, align 4
  %341 = load i32, i32* %6, align 4
  %342 = sub i32 %341, %340
  store i32 %342, i32* %6, align 4
  %343 = load i32, i32* %5, align 4
  %344 = shl i32 %343, 16
  %345 = load i32, i32* %6, align 4
  %346 = xor i32 %345, %344
  store i32 %346, i32* %6, align 4
  %347 = load i32, i32* %5, align 4
  %348 = load i32, i32* %4, align 4
  %349 = sub i32 %348, %347
  store i32 %349, i32* %4, align 4
  %350 = load i32, i32* %6, align 4
  %351 = load i32, i32* %4, align 4
  %352 = sub i32 %351, %350
  store i32 %352, i32* %4, align 4
  %353 = load i32, i32* %6, align 4
  %354 = lshr i32 %353, 5
  %355 = load i32, i32* %4, align 4
  %356 = xor i32 %355, %354
  store i32 %356, i32* %4, align 4
  %357 = load i32, i32* %6, align 4
  %358 = load i32, i32* %5, align 4
  %359 = sub i32 %358, %357
  store i32 %359, i32* %5, align 4
  %360 = load i32, i32* %4, align 4
  %361 = load i32, i32* %5, align 4
  %362 = sub i32 %361, %360
  store i32 %362, i32* %5, align 4
  %363 = load i32, i32* %4, align 4
  %364 = lshr i32 %363, 3
  %365 = load i32, i32* %5, align 4
  %366 = xor i32 %365, %364
  store i32 %366, i32* %5, align 4
  %367 = load i32, i32* %4, align 4
  %368 = load i32, i32* %6, align 4
  %369 = sub i32 %368, %367
  store i32 %369, i32* %6, align 4
  %370 = load i32, i32* %5, align 4
  %371 = load i32, i32* %6, align 4
  %372 = sub i32 %371, %370
  store i32 %372, i32* %6, align 4
  %373 = load i32, i32* %5, align 4
  %374 = shl i32 %373, 10
  %375 = load i32, i32* %6, align 4
  %376 = xor i32 %375, %374
  store i32 %376, i32* %6, align 4
  %377 = load i32, i32* %5, align 4
  %378 = load i32, i32* %4, align 4
  %379 = sub i32 %378, %377
  store i32 %379, i32* %4, align 4
  %380 = load i32, i32* %6, align 4
  %381 = load i32, i32* %4, align 4
  %382 = sub i32 %381, %380
  store i32 %382, i32* %4, align 4
  %383 = load i32, i32* %6, align 4
  %384 = lshr i32 %383, 15
  %385 = load i32, i32* %4, align 4
  %386 = xor i32 %385, %384
  store i32 %386, i32* %4, align 4
  br label %387

387:                                              ; preds = %296
  br label %388

388:                                              ; preds = %387
  br label %389

389:                                              ; preds = %388
  br label %390

390:                                              ; preds = %389
  %391 = load i32, i32* %4, align 4
  %392 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %393 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %392, i32 0, i32 2
  %394 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %393, i32 0, i32 7
  store i32 %391, i32* %394, align 4
  %395 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %396 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %395, i32 0, i32 0
  %397 = bitcast i32* %396 to i8*
  %398 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %399 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %398, i32 0, i32 2
  %400 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %399, i32 0, i32 5
  store i8* %397, i8** %400, align 8
  %401 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %402 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %401, i32 0, i32 2
  %403 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %402, i32 0, i32 6
  store i32 4, i32* %403, align 8
  %404 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %405 = icmp ne %struct.ptr_obj* %404, null
  br i1 %405, label %493, label %406

406:                                              ; preds = %390
  %407 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %408 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %407, i32 0, i32 2
  %409 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %408, i32 0, i32 2
  store i8* null, i8** %409, align 8
  %410 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %411 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %410, i32 0, i32 2
  %412 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %411, i32 0, i32 1
  store i8* null, i8** %412, align 8
  br label %413

413:                                              ; preds = %406
  %414 = call noalias i8* @malloc(i64 64) #7
  %415 = bitcast i8* %414 to %struct.UT_hash_table*
  %416 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %417 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %416, i32 0, i32 2
  %418 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %417, i32 0, i32 0
  store %struct.UT_hash_table* %415, %struct.UT_hash_table** %418, align 8
  %419 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %420 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %419, i32 0, i32 2
  %421 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %420, i32 0, i32 0
  %422 = load %struct.UT_hash_table*, %struct.UT_hash_table** %421, align 8
  %423 = icmp ne %struct.UT_hash_table* %422, null
  br i1 %423, label %425, label %424

424:                                              ; preds = %413
  call void @exit(i32 -1) #8
  unreachable

425:                                              ; preds = %413
  %426 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %427 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %426, i32 0, i32 2
  %428 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %427, i32 0, i32 0
  %429 = load %struct.UT_hash_table*, %struct.UT_hash_table** %428, align 8
  %430 = bitcast %struct.UT_hash_table* %429 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %430, i8 0, i64 64, i1 false)
  %431 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %432 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %431, i32 0, i32 2
  %433 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %434 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %433, i32 0, i32 2
  %435 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %434, i32 0, i32 0
  %436 = load %struct.UT_hash_table*, %struct.UT_hash_table** %435, align 8
  %437 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %436, i32 0, i32 4
  store %struct.UT_hash_handle* %432, %struct.UT_hash_handle** %437, align 8
  %438 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %439 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %438, i32 0, i32 2
  %440 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %439, i32 0, i32 0
  %441 = load %struct.UT_hash_table*, %struct.UT_hash_table** %440, align 8
  %442 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %441, i32 0, i32 1
  store i32 32, i32* %442, align 8
  %443 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %444 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %443, i32 0, i32 2
  %445 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %444, i32 0, i32 0
  %446 = load %struct.UT_hash_table*, %struct.UT_hash_table** %445, align 8
  %447 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %446, i32 0, i32 2
  store i32 5, i32* %447, align 4
  %448 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %449 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %448, i32 0, i32 2
  %450 = bitcast %struct.UT_hash_handle* %449 to i8*
  %451 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %452 = bitcast %struct.ptr_obj* %451 to i8*
  %453 = ptrtoint i8* %450 to i64
  %454 = ptrtoint i8* %452 to i64
  %455 = sub i64 %453, %454
  %456 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %457 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %456, i32 0, i32 2
  %458 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %457, i32 0, i32 0
  %459 = load %struct.UT_hash_table*, %struct.UT_hash_table** %458, align 8
  %460 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %459, i32 0, i32 5
  store i64 %455, i64* %460, align 8
  %461 = call noalias i8* @malloc(i64 512) #7
  %462 = bitcast i8* %461 to %struct.UT_hash_bucket*
  %463 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %464 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %463, i32 0, i32 2
  %465 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %464, i32 0, i32 0
  %466 = load %struct.UT_hash_table*, %struct.UT_hash_table** %465, align 8
  %467 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %466, i32 0, i32 0
  store %struct.UT_hash_bucket* %462, %struct.UT_hash_bucket** %467, align 8
  %468 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %469 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %468, i32 0, i32 2
  %470 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %469, i32 0, i32 0
  %471 = load %struct.UT_hash_table*, %struct.UT_hash_table** %470, align 8
  %472 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %471, i32 0, i32 10
  store i32 -1609490463, i32* %472, align 8
  %473 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %474 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %473, i32 0, i32 2
  %475 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %474, i32 0, i32 0
  %476 = load %struct.UT_hash_table*, %struct.UT_hash_table** %475, align 8
  %477 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %476, i32 0, i32 0
  %478 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %477, align 8
  %479 = icmp ne %struct.UT_hash_bucket* %478, null
  br i1 %479, label %481, label %480

480:                                              ; preds = %425
  call void @exit(i32 -1) #8
  unreachable

481:                                              ; preds = %425
  %482 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %483 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %482, i32 0, i32 2
  %484 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %483, i32 0, i32 0
  %485 = load %struct.UT_hash_table*, %struct.UT_hash_table** %484, align 8
  %486 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %485, i32 0, i32 0
  %487 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %486, align 8
  %488 = bitcast %struct.UT_hash_bucket* %487 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %488, i8 0, i64 512, i1 false)
  br label %489

489:                                              ; preds = %481
  br label %490

490:                                              ; preds = %489
  br label %491

491:                                              ; preds = %490
  %492 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  store %struct.ptr_obj* %492, %struct.ptr_obj** @ptr_map, align 8
  br label %540

493:                                              ; preds = %390
  %494 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %495 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %494, i32 0, i32 2
  %496 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %495, i32 0, i32 0
  %497 = load %struct.UT_hash_table*, %struct.UT_hash_table** %496, align 8
  %498 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %499 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %498, i32 0, i32 2
  %500 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %499, i32 0, i32 0
  store %struct.UT_hash_table* %497, %struct.UT_hash_table** %500, align 8
  br label %501

501:                                              ; preds = %493
  %502 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %503 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %502, i32 0, i32 2
  %504 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %503, i32 0, i32 2
  store i8* null, i8** %504, align 8
  %505 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %506 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %505, i32 0, i32 2
  %507 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %506, i32 0, i32 0
  %508 = load %struct.UT_hash_table*, %struct.UT_hash_table** %507, align 8
  %509 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %508, i32 0, i32 4
  %510 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %509, align 8
  %511 = bitcast %struct.UT_hash_handle* %510 to i8*
  %512 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %513 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %512, i32 0, i32 2
  %514 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %513, i32 0, i32 0
  %515 = load %struct.UT_hash_table*, %struct.UT_hash_table** %514, align 8
  %516 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %515, i32 0, i32 5
  %517 = load i64, i64* %516, align 8
  %518 = sub i64 0, %517
  %519 = getelementptr inbounds i8, i8* %511, i64 %518
  %520 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %521 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %520, i32 0, i32 2
  %522 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %521, i32 0, i32 1
  store i8* %519, i8** %522, align 8
  %523 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %524 = bitcast %struct.ptr_obj* %523 to i8*
  %525 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %526 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %525, i32 0, i32 2
  %527 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %526, i32 0, i32 0
  %528 = load %struct.UT_hash_table*, %struct.UT_hash_table** %527, align 8
  %529 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %528, i32 0, i32 4
  %530 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %529, align 8
  %531 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %530, i32 0, i32 2
  store i8* %524, i8** %531, align 8
  %532 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %533 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %532, i32 0, i32 2
  %534 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %535 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %534, i32 0, i32 2
  %536 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %535, i32 0, i32 0
  %537 = load %struct.UT_hash_table*, %struct.UT_hash_table** %536, align 8
  %538 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %537, i32 0, i32 4
  store %struct.UT_hash_handle* %533, %struct.UT_hash_handle** %538, align 8
  br label %539

539:                                              ; preds = %501
  br label %540

540:                                              ; preds = %539, %491
  br label %541

541:                                              ; preds = %540
  %542 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %543 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %542, i32 0, i32 2
  %544 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %543, i32 0, i32 0
  %545 = load %struct.UT_hash_table*, %struct.UT_hash_table** %544, align 8
  %546 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %545, i32 0, i32 3
  %547 = load i32, i32* %546, align 8
  %548 = add i32 %547, 1
  store i32 %548, i32* %546, align 8
  br label %549

549:                                              ; preds = %541
  %550 = load i32, i32* %4, align 4
  %551 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %552 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %551, i32 0, i32 2
  %553 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %552, i32 0, i32 0
  %554 = load %struct.UT_hash_table*, %struct.UT_hash_table** %553, align 8
  %555 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %554, i32 0, i32 1
  %556 = load i32, i32* %555, align 8
  %557 = sub i32 %556, 1
  %558 = and i32 %550, %557
  store i32 %558, i32* %9, align 4
  br label %559

559:                                              ; preds = %549
  br label %560

560:                                              ; preds = %559
  %561 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %562 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %561, i32 0, i32 2
  %563 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %562, i32 0, i32 0
  %564 = load %struct.UT_hash_table*, %struct.UT_hash_table** %563, align 8
  %565 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %564, i32 0, i32 0
  %566 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %565, align 8
  %567 = load i32, i32* %9, align 4
  %568 = zext i32 %567 to i64
  %569 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %566, i64 %568
  store %struct.UT_hash_bucket* %569, %struct.UT_hash_bucket** %10, align 8
  %570 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %571 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %570, i32 0, i32 1
  %572 = load i32, i32* %571, align 8
  %573 = add i32 %572, 1
  store i32 %573, i32* %571, align 8
  %574 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %575 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %574, i32 0, i32 0
  %576 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %575, align 8
  %577 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %578 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %577, i32 0, i32 2
  %579 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %578, i32 0, i32 4
  store %struct.UT_hash_handle* %576, %struct.UT_hash_handle** %579, align 8
  %580 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %581 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %580, i32 0, i32 2
  %582 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %581, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %582, align 8
  %583 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %584 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %583, i32 0, i32 0
  %585 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %584, align 8
  %586 = icmp ne %struct.UT_hash_handle* %585, null
  br i1 %586, label %587, label %594

587:                                              ; preds = %560
  %588 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %589 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %588, i32 0, i32 2
  %590 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %591 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %590, i32 0, i32 0
  %592 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %591, align 8
  %593 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %592, i32 0, i32 3
  store %struct.UT_hash_handle* %589, %struct.UT_hash_handle** %593, align 8
  br label %594

594:                                              ; preds = %587, %560
  %595 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %596 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %595, i32 0, i32 2
  %597 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %598 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %597, i32 0, i32 0
  store %struct.UT_hash_handle* %596, %struct.UT_hash_handle** %598, align 8
  %599 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %600 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %599, i32 0, i32 1
  %601 = load i32, i32* %600, align 8
  %602 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %603 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %602, i32 0, i32 2
  %604 = load i32, i32* %603, align 4
  %605 = add i32 %604, 1
  %606 = mul i32 %605, 10
  %607 = icmp uge i32 %601, %606
  br i1 %607, label %608, label %873

608:                                              ; preds = %594
  %609 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %610 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %609, i32 0, i32 2
  %611 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %610, i32 0, i32 0
  %612 = load %struct.UT_hash_table*, %struct.UT_hash_table** %611, align 8
  %613 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %612, i32 0, i32 9
  %614 = load i32, i32* %613, align 4
  %615 = icmp ne i32 %614, 0
  br i1 %615, label %873, label %616

616:                                              ; preds = %608
  br label %617

617:                                              ; preds = %616
  %618 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %619 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %618, i32 0, i32 2
  %620 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %619, i32 0, i32 0
  %621 = load %struct.UT_hash_table*, %struct.UT_hash_table** %620, align 8
  %622 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %621, i32 0, i32 1
  %623 = load i32, i32* %622, align 8
  %624 = zext i32 %623 to i64
  %625 = mul i64 16, %624
  %626 = mul i64 %625, 2
  %627 = call noalias i8* @malloc(i64 %626) #7
  %628 = bitcast i8* %627 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %628, %struct.UT_hash_bucket** %15, align 8
  %629 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %630 = icmp ne %struct.UT_hash_bucket* %629, null
  br i1 %630, label %632, label %631

631:                                              ; preds = %617
  call void @exit(i32 -1) #8
  unreachable

632:                                              ; preds = %617
  %633 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %634 = bitcast %struct.UT_hash_bucket* %633 to i8*
  %635 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %636 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %635, i32 0, i32 2
  %637 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %636, i32 0, i32 0
  %638 = load %struct.UT_hash_table*, %struct.UT_hash_table** %637, align 8
  %639 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %638, i32 0, i32 1
  %640 = load i32, i32* %639, align 8
  %641 = zext i32 %640 to i64
  %642 = mul i64 16, %641
  %643 = mul i64 %642, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %634, i8 0, i64 %643, i1 false)
  %644 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %645 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %644, i32 0, i32 2
  %646 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %645, i32 0, i32 0
  %647 = load %struct.UT_hash_table*, %struct.UT_hash_table** %646, align 8
  %648 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %647, i32 0, i32 3
  %649 = load i32, i32* %648, align 8
  %650 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %651 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %650, i32 0, i32 2
  %652 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %651, i32 0, i32 0
  %653 = load %struct.UT_hash_table*, %struct.UT_hash_table** %652, align 8
  %654 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %653, i32 0, i32 2
  %655 = load i32, i32* %654, align 4
  %656 = add i32 %655, 1
  %657 = lshr i32 %649, %656
  %658 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %659 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %658, i32 0, i32 2
  %660 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %659, i32 0, i32 0
  %661 = load %struct.UT_hash_table*, %struct.UT_hash_table** %660, align 8
  %662 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %661, i32 0, i32 3
  %663 = load i32, i32* %662, align 8
  %664 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %665 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %664, i32 0, i32 2
  %666 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %665, i32 0, i32 0
  %667 = load %struct.UT_hash_table*, %struct.UT_hash_table** %666, align 8
  %668 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %667, i32 0, i32 1
  %669 = load i32, i32* %668, align 8
  %670 = mul i32 %669, 2
  %671 = sub i32 %670, 1
  %672 = and i32 %663, %671
  %673 = icmp ne i32 %672, 0
  %674 = zext i1 %673 to i64
  %675 = select i1 %673, i32 1, i32 0
  %676 = add i32 %657, %675
  %677 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %678 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %677, i32 0, i32 2
  %679 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %678, i32 0, i32 0
  %680 = load %struct.UT_hash_table*, %struct.UT_hash_table** %679, align 8
  %681 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %680, i32 0, i32 6
  store i32 %676, i32* %681, align 8
  %682 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %683 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %682, i32 0, i32 2
  %684 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %683, i32 0, i32 0
  %685 = load %struct.UT_hash_table*, %struct.UT_hash_table** %684, align 8
  %686 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %685, i32 0, i32 7
  store i32 0, i32* %686, align 4
  store i32 0, i32* %12, align 4
  br label %687

687:                                              ; preds = %796, %632
  %688 = load i32, i32* %12, align 4
  %689 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %690 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %689, i32 0, i32 2
  %691 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %690, i32 0, i32 0
  %692 = load %struct.UT_hash_table*, %struct.UT_hash_table** %691, align 8
  %693 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %692, i32 0, i32 1
  %694 = load i32, i32* %693, align 8
  %695 = icmp ult i32 %688, %694
  br i1 %695, label %696, label %799

696:                                              ; preds = %687
  %697 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %698 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %697, i32 0, i32 2
  %699 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %698, i32 0, i32 0
  %700 = load %struct.UT_hash_table*, %struct.UT_hash_table** %699, align 8
  %701 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %700, i32 0, i32 0
  %702 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %701, align 8
  %703 = load i32, i32* %12, align 4
  %704 = zext i32 %703 to i64
  %705 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %702, i64 %704
  %706 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %705, i32 0, i32 0
  %707 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %706, align 8
  store %struct.UT_hash_handle* %707, %struct.UT_hash_handle** %13, align 8
  br label %708

708:                                              ; preds = %790, %696
  %709 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %710 = icmp ne %struct.UT_hash_handle* %709, null
  br i1 %710, label %711, label %795

711:                                              ; preds = %708
  %712 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %713 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %712, i32 0, i32 4
  %714 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %713, align 8
  store %struct.UT_hash_handle* %714, %struct.UT_hash_handle** %14, align 8
  br label %715

715:                                              ; preds = %711
  %716 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %717 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %716, i32 0, i32 7
  %718 = load i32, i32* %717, align 4
  %719 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %720 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %719, i32 0, i32 2
  %721 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %720, i32 0, i32 0
  %722 = load %struct.UT_hash_table*, %struct.UT_hash_table** %721, align 8
  %723 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %722, i32 0, i32 1
  %724 = load i32, i32* %723, align 8
  %725 = mul i32 %724, 2
  %726 = sub i32 %725, 1
  %727 = and i32 %718, %726
  store i32 %727, i32* %11, align 4
  br label %728

728:                                              ; preds = %715
  %729 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %730 = load i32, i32* %11, align 4
  %731 = zext i32 %730 to i64
  %732 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %729, i64 %731
  store %struct.UT_hash_bucket* %732, %struct.UT_hash_bucket** %16, align 8
  %733 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %734 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %733, i32 0, i32 1
  %735 = load i32, i32* %734, align 8
  %736 = add i32 %735, 1
  store i32 %736, i32* %734, align 8
  %737 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %738 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %737, i32 0, i32 2
  %739 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %738, i32 0, i32 0
  %740 = load %struct.UT_hash_table*, %struct.UT_hash_table** %739, align 8
  %741 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %740, i32 0, i32 6
  %742 = load i32, i32* %741, align 8
  %743 = icmp ugt i32 %736, %742
  br i1 %743, label %744, label %772

744:                                              ; preds = %728
  %745 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %746 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %745, i32 0, i32 2
  %747 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %746, i32 0, i32 0
  %748 = load %struct.UT_hash_table*, %struct.UT_hash_table** %747, align 8
  %749 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %748, i32 0, i32 7
  %750 = load i32, i32* %749, align 4
  %751 = add i32 %750, 1
  store i32 %751, i32* %749, align 4
  %752 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %753 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %752, i32 0, i32 1
  %754 = load i32, i32* %753, align 8
  %755 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %756 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %755, i32 0, i32 2
  %757 = load i32, i32* %756, align 4
  %758 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %759 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %758, i32 0, i32 2
  %760 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %759, i32 0, i32 0
  %761 = load %struct.UT_hash_table*, %struct.UT_hash_table** %760, align 8
  %762 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %761, i32 0, i32 6
  %763 = load i32, i32* %762, align 8
  %764 = mul i32 %757, %763
  %765 = icmp ugt i32 %754, %764
  br i1 %765, label %766, label %771

766:                                              ; preds = %744
  %767 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %768 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %767, i32 0, i32 2
  %769 = load i32, i32* %768, align 4
  %770 = add i32 %769, 1
  store i32 %770, i32* %768, align 4
  br label %771

771:                                              ; preds = %766, %744
  br label %772

772:                                              ; preds = %771, %728
  %773 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %774 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %773, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %774, align 8
  %775 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %776 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %775, i32 0, i32 0
  %777 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %776, align 8
  %778 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %779 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %778, i32 0, i32 4
  store %struct.UT_hash_handle* %777, %struct.UT_hash_handle** %779, align 8
  %780 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %781 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %780, i32 0, i32 0
  %782 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %781, align 8
  %783 = icmp ne %struct.UT_hash_handle* %782, null
  br i1 %783, label %784, label %790

784:                                              ; preds = %772
  %785 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %786 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %787 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %786, i32 0, i32 0
  %788 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %787, align 8
  %789 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %788, i32 0, i32 3
  store %struct.UT_hash_handle* %785, %struct.UT_hash_handle** %789, align 8
  br label %790

790:                                              ; preds = %784, %772
  %791 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %792 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %793 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %792, i32 0, i32 0
  store %struct.UT_hash_handle* %791, %struct.UT_hash_handle** %793, align 8
  %794 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %14, align 8
  store %struct.UT_hash_handle* %794, %struct.UT_hash_handle** %13, align 8
  br label %708

795:                                              ; preds = %708
  br label %796

796:                                              ; preds = %795
  %797 = load i32, i32* %12, align 4
  %798 = add i32 %797, 1
  store i32 %798, i32* %12, align 4
  br label %687

799:                                              ; preds = %687
  %800 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %801 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %800, i32 0, i32 2
  %802 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %801, i32 0, i32 0
  %803 = load %struct.UT_hash_table*, %struct.UT_hash_table** %802, align 8
  %804 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %803, i32 0, i32 0
  %805 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %804, align 8
  %806 = bitcast %struct.UT_hash_bucket* %805 to i8*
  call void @free(i8* %806) #7
  %807 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %808 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %807, i32 0, i32 2
  %809 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %808, i32 0, i32 0
  %810 = load %struct.UT_hash_table*, %struct.UT_hash_table** %809, align 8
  %811 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %810, i32 0, i32 1
  %812 = load i32, i32* %811, align 8
  %813 = mul i32 %812, 2
  store i32 %813, i32* %811, align 8
  %814 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %815 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %814, i32 0, i32 2
  %816 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %815, i32 0, i32 0
  %817 = load %struct.UT_hash_table*, %struct.UT_hash_table** %816, align 8
  %818 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %817, i32 0, i32 2
  %819 = load i32, i32* %818, align 4
  %820 = add i32 %819, 1
  store i32 %820, i32* %818, align 4
  %821 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %822 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %823 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %822, i32 0, i32 2
  %824 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %823, i32 0, i32 0
  %825 = load %struct.UT_hash_table*, %struct.UT_hash_table** %824, align 8
  %826 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %825, i32 0, i32 0
  store %struct.UT_hash_bucket* %821, %struct.UT_hash_bucket** %826, align 8
  %827 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %828 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %827, i32 0, i32 2
  %829 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %828, i32 0, i32 0
  %830 = load %struct.UT_hash_table*, %struct.UT_hash_table** %829, align 8
  %831 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %830, i32 0, i32 7
  %832 = load i32, i32* %831, align 4
  %833 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %834 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %833, i32 0, i32 2
  %835 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %834, i32 0, i32 0
  %836 = load %struct.UT_hash_table*, %struct.UT_hash_table** %835, align 8
  %837 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %836, i32 0, i32 3
  %838 = load i32, i32* %837, align 8
  %839 = lshr i32 %838, 1
  %840 = icmp ugt i32 %832, %839
  br i1 %840, label %841, label %849

841:                                              ; preds = %799
  %842 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %843 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %842, i32 0, i32 2
  %844 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %843, i32 0, i32 0
  %845 = load %struct.UT_hash_table*, %struct.UT_hash_table** %844, align 8
  %846 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %845, i32 0, i32 8
  %847 = load i32, i32* %846, align 8
  %848 = add i32 %847, 1
  br label %850

849:                                              ; preds = %799
  br label %850

850:                                              ; preds = %849, %841
  %851 = phi i32 [ %848, %841 ], [ 0, %849 ]
  %852 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %853 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %852, i32 0, i32 2
  %854 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %853, i32 0, i32 0
  %855 = load %struct.UT_hash_table*, %struct.UT_hash_table** %854, align 8
  %856 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %855, i32 0, i32 8
  store i32 %851, i32* %856, align 8
  %857 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %858 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %857, i32 0, i32 2
  %859 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %858, i32 0, i32 0
  %860 = load %struct.UT_hash_table*, %struct.UT_hash_table** %859, align 8
  %861 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %860, i32 0, i32 8
  %862 = load i32, i32* %861, align 8
  %863 = icmp ugt i32 %862, 1
  br i1 %863, label %864, label %870

864:                                              ; preds = %850
  %865 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %866 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %865, i32 0, i32 2
  %867 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %866, i32 0, i32 0
  %868 = load %struct.UT_hash_table*, %struct.UT_hash_table** %867, align 8
  %869 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %868, i32 0, i32 9
  store i32 1, i32* %869, align 4
  br label %870

870:                                              ; preds = %864, %850
  br label %871

871:                                              ; preds = %870
  br label %872

872:                                              ; preds = %871
  br label %873

873:                                              ; preds = %872, %608, %594
  br label %874

874:                                              ; preds = %873
  br label %875

875:                                              ; preds = %874
  br label %876

876:                                              ; preds = %875
  br label %877

877:                                              ; preds = %876
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.ptr_obj* @find_ptr(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.ptr_obj*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  br label %10

10:                                               ; preds = %1
  store %struct.ptr_obj* null, %struct.ptr_obj** %3, align 8
  %11 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %12 = icmp ne %struct.ptr_obj* %11, null
  br i1 %12, label %13, label %485

13:                                               ; preds = %10
  br label %14

14:                                               ; preds = %13
  br label %15

15:                                               ; preds = %14
  %16 = bitcast i32* %2 to i8*
  store i8* %16, i8** %8, align 8
  store i32 -17973521, i32* %4, align 4
  store i32 -1640531527, i32* %6, align 4
  store i32 -1640531527, i32* %5, align 4
  store i32 4, i32* %7, align 4
  br label %17

17:                                               ; preds = %184, %15
  %18 = load i32, i32* %7, align 4
  %19 = icmp uge i32 %18, 12
  br i1 %19, label %20, label %189

20:                                               ; preds = %17
  %21 = load i8*, i8** %8, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 0
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = load i8*, i8** %8, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 1
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = shl i32 %28, 8
  %30 = add i32 %24, %29
  %31 = load i8*, i8** %8, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 2
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = shl i32 %34, 16
  %36 = add i32 %30, %35
  %37 = load i8*, i8** %8, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 3
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = shl i32 %40, 24
  %42 = add i32 %36, %41
  %43 = load i32, i32* %5, align 4
  %44 = add i32 %43, %42
  store i32 %44, i32* %5, align 4
  %45 = load i8*, i8** %8, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 4
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = load i8*, i8** %8, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 5
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = shl i32 %52, 8
  %54 = add i32 %48, %53
  %55 = load i8*, i8** %8, align 8
  %56 = getelementptr inbounds i8, i8* %55, i64 6
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl i32 %58, 16
  %60 = add i32 %54, %59
  %61 = load i8*, i8** %8, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 7
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 24
  %66 = add i32 %60, %65
  %67 = load i32, i32* %6, align 4
  %68 = add i32 %67, %66
  store i32 %68, i32* %6, align 4
  %69 = load i8*, i8** %8, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 8
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = load i8*, i8** %8, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 9
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = shl i32 %76, 8
  %78 = add i32 %72, %77
  %79 = load i8*, i8** %8, align 8
  %80 = getelementptr inbounds i8, i8* %79, i64 10
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = shl i32 %82, 16
  %84 = add i32 %78, %83
  %85 = load i8*, i8** %8, align 8
  %86 = getelementptr inbounds i8, i8* %85, i64 11
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = shl i32 %88, 24
  %90 = add i32 %84, %89
  %91 = load i32, i32* %4, align 4
  %92 = add i32 %91, %90
  store i32 %92, i32* %4, align 4
  br label %93

93:                                               ; preds = %20
  %94 = load i32, i32* %6, align 4
  %95 = load i32, i32* %5, align 4
  %96 = sub i32 %95, %94
  store i32 %96, i32* %5, align 4
  %97 = load i32, i32* %4, align 4
  %98 = load i32, i32* %5, align 4
  %99 = sub i32 %98, %97
  store i32 %99, i32* %5, align 4
  %100 = load i32, i32* %4, align 4
  %101 = lshr i32 %100, 13
  %102 = load i32, i32* %5, align 4
  %103 = xor i32 %102, %101
  store i32 %103, i32* %5, align 4
  %104 = load i32, i32* %4, align 4
  %105 = load i32, i32* %6, align 4
  %106 = sub i32 %105, %104
  store i32 %106, i32* %6, align 4
  %107 = load i32, i32* %5, align 4
  %108 = load i32, i32* %6, align 4
  %109 = sub i32 %108, %107
  store i32 %109, i32* %6, align 4
  %110 = load i32, i32* %5, align 4
  %111 = shl i32 %110, 8
  %112 = load i32, i32* %6, align 4
  %113 = xor i32 %112, %111
  store i32 %113, i32* %6, align 4
  %114 = load i32, i32* %5, align 4
  %115 = load i32, i32* %4, align 4
  %116 = sub i32 %115, %114
  store i32 %116, i32* %4, align 4
  %117 = load i32, i32* %6, align 4
  %118 = load i32, i32* %4, align 4
  %119 = sub i32 %118, %117
  store i32 %119, i32* %4, align 4
  %120 = load i32, i32* %6, align 4
  %121 = lshr i32 %120, 13
  %122 = load i32, i32* %4, align 4
  %123 = xor i32 %122, %121
  store i32 %123, i32* %4, align 4
  %124 = load i32, i32* %6, align 4
  %125 = load i32, i32* %5, align 4
  %126 = sub i32 %125, %124
  store i32 %126, i32* %5, align 4
  %127 = load i32, i32* %4, align 4
  %128 = load i32, i32* %5, align 4
  %129 = sub i32 %128, %127
  store i32 %129, i32* %5, align 4
  %130 = load i32, i32* %4, align 4
  %131 = lshr i32 %130, 12
  %132 = load i32, i32* %5, align 4
  %133 = xor i32 %132, %131
  store i32 %133, i32* %5, align 4
  %134 = load i32, i32* %4, align 4
  %135 = load i32, i32* %6, align 4
  %136 = sub i32 %135, %134
  store i32 %136, i32* %6, align 4
  %137 = load i32, i32* %5, align 4
  %138 = load i32, i32* %6, align 4
  %139 = sub i32 %138, %137
  store i32 %139, i32* %6, align 4
  %140 = load i32, i32* %5, align 4
  %141 = shl i32 %140, 16
  %142 = load i32, i32* %6, align 4
  %143 = xor i32 %142, %141
  store i32 %143, i32* %6, align 4
  %144 = load i32, i32* %5, align 4
  %145 = load i32, i32* %4, align 4
  %146 = sub i32 %145, %144
  store i32 %146, i32* %4, align 4
  %147 = load i32, i32* %6, align 4
  %148 = load i32, i32* %4, align 4
  %149 = sub i32 %148, %147
  store i32 %149, i32* %4, align 4
  %150 = load i32, i32* %6, align 4
  %151 = lshr i32 %150, 5
  %152 = load i32, i32* %4, align 4
  %153 = xor i32 %152, %151
  store i32 %153, i32* %4, align 4
  %154 = load i32, i32* %6, align 4
  %155 = load i32, i32* %5, align 4
  %156 = sub i32 %155, %154
  store i32 %156, i32* %5, align 4
  %157 = load i32, i32* %4, align 4
  %158 = load i32, i32* %5, align 4
  %159 = sub i32 %158, %157
  store i32 %159, i32* %5, align 4
  %160 = load i32, i32* %4, align 4
  %161 = lshr i32 %160, 3
  %162 = load i32, i32* %5, align 4
  %163 = xor i32 %162, %161
  store i32 %163, i32* %5, align 4
  %164 = load i32, i32* %4, align 4
  %165 = load i32, i32* %6, align 4
  %166 = sub i32 %165, %164
  store i32 %166, i32* %6, align 4
  %167 = load i32, i32* %5, align 4
  %168 = load i32, i32* %6, align 4
  %169 = sub i32 %168, %167
  store i32 %169, i32* %6, align 4
  %170 = load i32, i32* %5, align 4
  %171 = shl i32 %170, 10
  %172 = load i32, i32* %6, align 4
  %173 = xor i32 %172, %171
  store i32 %173, i32* %6, align 4
  %174 = load i32, i32* %5, align 4
  %175 = load i32, i32* %4, align 4
  %176 = sub i32 %175, %174
  store i32 %176, i32* %4, align 4
  %177 = load i32, i32* %6, align 4
  %178 = load i32, i32* %4, align 4
  %179 = sub i32 %178, %177
  store i32 %179, i32* %4, align 4
  %180 = load i32, i32* %6, align 4
  %181 = lshr i32 %180, 15
  %182 = load i32, i32* %4, align 4
  %183 = xor i32 %182, %181
  store i32 %183, i32* %4, align 4
  br label %184

184:                                              ; preds = %93
  %185 = load i8*, i8** %8, align 8
  %186 = getelementptr inbounds i8, i8* %185, i64 12
  store i8* %186, i8** %8, align 8
  %187 = load i32, i32* %7, align 4
  %188 = sub i32 %187, 12
  store i32 %188, i32* %7, align 4
  br label %17

189:                                              ; preds = %17
  %190 = load i32, i32* %4, align 4
  %191 = add i32 %190, 4
  store i32 %191, i32* %4, align 4
  %192 = load i32, i32* %7, align 4
  switch i32 %192, label %279 [
    i32 11, label %193
    i32 10, label %201
    i32 9, label %209
    i32 8, label %217
    i32 7, label %225
    i32 6, label %233
    i32 5, label %241
    i32 4, label %248
    i32 3, label %256
    i32 2, label %264
    i32 1, label %272
  ]

193:                                              ; preds = %189
  %194 = load i8*, i8** %8, align 8
  %195 = getelementptr inbounds i8, i8* %194, i64 10
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = shl i32 %197, 24
  %199 = load i32, i32* %4, align 4
  %200 = add i32 %199, %198
  store i32 %200, i32* %4, align 4
  br label %201

201:                                              ; preds = %193, %189
  %202 = load i8*, i8** %8, align 8
  %203 = getelementptr inbounds i8, i8* %202, i64 9
  %204 = load i8, i8* %203, align 1
  %205 = zext i8 %204 to i32
  %206 = shl i32 %205, 16
  %207 = load i32, i32* %4, align 4
  %208 = add i32 %207, %206
  store i32 %208, i32* %4, align 4
  br label %209

209:                                              ; preds = %201, %189
  %210 = load i8*, i8** %8, align 8
  %211 = getelementptr inbounds i8, i8* %210, i64 8
  %212 = load i8, i8* %211, align 1
  %213 = zext i8 %212 to i32
  %214 = shl i32 %213, 8
  %215 = load i32, i32* %4, align 4
  %216 = add i32 %215, %214
  store i32 %216, i32* %4, align 4
  br label %217

217:                                              ; preds = %209, %189
  %218 = load i8*, i8** %8, align 8
  %219 = getelementptr inbounds i8, i8* %218, i64 7
  %220 = load i8, i8* %219, align 1
  %221 = zext i8 %220 to i32
  %222 = shl i32 %221, 24
  %223 = load i32, i32* %6, align 4
  %224 = add i32 %223, %222
  store i32 %224, i32* %6, align 4
  br label %225

225:                                              ; preds = %217, %189
  %226 = load i8*, i8** %8, align 8
  %227 = getelementptr inbounds i8, i8* %226, i64 6
  %228 = load i8, i8* %227, align 1
  %229 = zext i8 %228 to i32
  %230 = shl i32 %229, 16
  %231 = load i32, i32* %6, align 4
  %232 = add i32 %231, %230
  store i32 %232, i32* %6, align 4
  br label %233

233:                                              ; preds = %225, %189
  %234 = load i8*, i8** %8, align 8
  %235 = getelementptr inbounds i8, i8* %234, i64 5
  %236 = load i8, i8* %235, align 1
  %237 = zext i8 %236 to i32
  %238 = shl i32 %237, 8
  %239 = load i32, i32* %6, align 4
  %240 = add i32 %239, %238
  store i32 %240, i32* %6, align 4
  br label %241

241:                                              ; preds = %233, %189
  %242 = load i8*, i8** %8, align 8
  %243 = getelementptr inbounds i8, i8* %242, i64 4
  %244 = load i8, i8* %243, align 1
  %245 = zext i8 %244 to i32
  %246 = load i32, i32* %6, align 4
  %247 = add i32 %246, %245
  store i32 %247, i32* %6, align 4
  br label %248

248:                                              ; preds = %241, %189
  %249 = load i8*, i8** %8, align 8
  %250 = getelementptr inbounds i8, i8* %249, i64 3
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = shl i32 %252, 24
  %254 = load i32, i32* %5, align 4
  %255 = add i32 %254, %253
  store i32 %255, i32* %5, align 4
  br label %256

256:                                              ; preds = %248, %189
  %257 = load i8*, i8** %8, align 8
  %258 = getelementptr inbounds i8, i8* %257, i64 2
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = shl i32 %260, 16
  %262 = load i32, i32* %5, align 4
  %263 = add i32 %262, %261
  store i32 %263, i32* %5, align 4
  br label %264

264:                                              ; preds = %256, %189
  %265 = load i8*, i8** %8, align 8
  %266 = getelementptr inbounds i8, i8* %265, i64 1
  %267 = load i8, i8* %266, align 1
  %268 = zext i8 %267 to i32
  %269 = shl i32 %268, 8
  %270 = load i32, i32* %5, align 4
  %271 = add i32 %270, %269
  store i32 %271, i32* %5, align 4
  br label %272

272:                                              ; preds = %264, %189
  %273 = load i8*, i8** %8, align 8
  %274 = getelementptr inbounds i8, i8* %273, i64 0
  %275 = load i8, i8* %274, align 1
  %276 = zext i8 %275 to i32
  %277 = load i32, i32* %5, align 4
  %278 = add i32 %277, %276
  store i32 %278, i32* %5, align 4
  br label %279

279:                                              ; preds = %272, %189
  br label %280

280:                                              ; preds = %279
  br label %281

281:                                              ; preds = %280
  %282 = load i32, i32* %6, align 4
  %283 = load i32, i32* %5, align 4
  %284 = sub i32 %283, %282
  store i32 %284, i32* %5, align 4
  %285 = load i32, i32* %4, align 4
  %286 = load i32, i32* %5, align 4
  %287 = sub i32 %286, %285
  store i32 %287, i32* %5, align 4
  %288 = load i32, i32* %4, align 4
  %289 = lshr i32 %288, 13
  %290 = load i32, i32* %5, align 4
  %291 = xor i32 %290, %289
  store i32 %291, i32* %5, align 4
  %292 = load i32, i32* %4, align 4
  %293 = load i32, i32* %6, align 4
  %294 = sub i32 %293, %292
  store i32 %294, i32* %6, align 4
  %295 = load i32, i32* %5, align 4
  %296 = load i32, i32* %6, align 4
  %297 = sub i32 %296, %295
  store i32 %297, i32* %6, align 4
  %298 = load i32, i32* %5, align 4
  %299 = shl i32 %298, 8
  %300 = load i32, i32* %6, align 4
  %301 = xor i32 %300, %299
  store i32 %301, i32* %6, align 4
  %302 = load i32, i32* %5, align 4
  %303 = load i32, i32* %4, align 4
  %304 = sub i32 %303, %302
  store i32 %304, i32* %4, align 4
  %305 = load i32, i32* %6, align 4
  %306 = load i32, i32* %4, align 4
  %307 = sub i32 %306, %305
  store i32 %307, i32* %4, align 4
  %308 = load i32, i32* %6, align 4
  %309 = lshr i32 %308, 13
  %310 = load i32, i32* %4, align 4
  %311 = xor i32 %310, %309
  store i32 %311, i32* %4, align 4
  %312 = load i32, i32* %6, align 4
  %313 = load i32, i32* %5, align 4
  %314 = sub i32 %313, %312
  store i32 %314, i32* %5, align 4
  %315 = load i32, i32* %4, align 4
  %316 = load i32, i32* %5, align 4
  %317 = sub i32 %316, %315
  store i32 %317, i32* %5, align 4
  %318 = load i32, i32* %4, align 4
  %319 = lshr i32 %318, 12
  %320 = load i32, i32* %5, align 4
  %321 = xor i32 %320, %319
  store i32 %321, i32* %5, align 4
  %322 = load i32, i32* %4, align 4
  %323 = load i32, i32* %6, align 4
  %324 = sub i32 %323, %322
  store i32 %324, i32* %6, align 4
  %325 = load i32, i32* %5, align 4
  %326 = load i32, i32* %6, align 4
  %327 = sub i32 %326, %325
  store i32 %327, i32* %6, align 4
  %328 = load i32, i32* %5, align 4
  %329 = shl i32 %328, 16
  %330 = load i32, i32* %6, align 4
  %331 = xor i32 %330, %329
  store i32 %331, i32* %6, align 4
  %332 = load i32, i32* %5, align 4
  %333 = load i32, i32* %4, align 4
  %334 = sub i32 %333, %332
  store i32 %334, i32* %4, align 4
  %335 = load i32, i32* %6, align 4
  %336 = load i32, i32* %4, align 4
  %337 = sub i32 %336, %335
  store i32 %337, i32* %4, align 4
  %338 = load i32, i32* %6, align 4
  %339 = lshr i32 %338, 5
  %340 = load i32, i32* %4, align 4
  %341 = xor i32 %340, %339
  store i32 %341, i32* %4, align 4
  %342 = load i32, i32* %6, align 4
  %343 = load i32, i32* %5, align 4
  %344 = sub i32 %343, %342
  store i32 %344, i32* %5, align 4
  %345 = load i32, i32* %4, align 4
  %346 = load i32, i32* %5, align 4
  %347 = sub i32 %346, %345
  store i32 %347, i32* %5, align 4
  %348 = load i32, i32* %4, align 4
  %349 = lshr i32 %348, 3
  %350 = load i32, i32* %5, align 4
  %351 = xor i32 %350, %349
  store i32 %351, i32* %5, align 4
  %352 = load i32, i32* %4, align 4
  %353 = load i32, i32* %6, align 4
  %354 = sub i32 %353, %352
  store i32 %354, i32* %6, align 4
  %355 = load i32, i32* %5, align 4
  %356 = load i32, i32* %6, align 4
  %357 = sub i32 %356, %355
  store i32 %357, i32* %6, align 4
  %358 = load i32, i32* %5, align 4
  %359 = shl i32 %358, 10
  %360 = load i32, i32* %6, align 4
  %361 = xor i32 %360, %359
  store i32 %361, i32* %6, align 4
  %362 = load i32, i32* %5, align 4
  %363 = load i32, i32* %4, align 4
  %364 = sub i32 %363, %362
  store i32 %364, i32* %4, align 4
  %365 = load i32, i32* %6, align 4
  %366 = load i32, i32* %4, align 4
  %367 = sub i32 %366, %365
  store i32 %367, i32* %4, align 4
  %368 = load i32, i32* %6, align 4
  %369 = lshr i32 %368, 15
  %370 = load i32, i32* %4, align 4
  %371 = xor i32 %370, %369
  store i32 %371, i32* %4, align 4
  br label %372

372:                                              ; preds = %281
  br label %373

373:                                              ; preds = %372
  br label %374

374:                                              ; preds = %373
  br label %375

375:                                              ; preds = %374
  store %struct.ptr_obj* null, %struct.ptr_obj** %3, align 8
  %376 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %377 = icmp ne %struct.ptr_obj* %376, null
  br i1 %377, label %378, label %483

378:                                              ; preds = %375
  br label %379

379:                                              ; preds = %378
  %380 = load i32, i32* %4, align 4
  %381 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %382 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %381, i32 0, i32 2
  %383 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %382, i32 0, i32 0
  %384 = load %struct.UT_hash_table*, %struct.UT_hash_table** %383, align 8
  %385 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %384, i32 0, i32 1
  %386 = load i32, i32* %385, align 8
  %387 = sub i32 %386, 1
  %388 = and i32 %380, %387
  store i32 %388, i32* %9, align 4
  br label %389

389:                                              ; preds = %379
  br label %390

390:                                              ; preds = %389
  %391 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %392 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %391, i32 0, i32 2
  %393 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %392, i32 0, i32 0
  %394 = load %struct.UT_hash_table*, %struct.UT_hash_table** %393, align 8
  %395 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %394, i32 0, i32 0
  %396 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %395, align 8
  %397 = load i32, i32* %9, align 4
  %398 = zext i32 %397 to i64
  %399 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %396, i64 %398
  %400 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %399, i32 0, i32 0
  %401 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %400, align 8
  %402 = icmp ne %struct.UT_hash_handle* %401, null
  br i1 %402, label %403, label %427

403:                                              ; preds = %390
  br label %404

404:                                              ; preds = %403
  %405 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %406 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %405, i32 0, i32 2
  %407 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %406, i32 0, i32 0
  %408 = load %struct.UT_hash_table*, %struct.UT_hash_table** %407, align 8
  %409 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %408, i32 0, i32 0
  %410 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %409, align 8
  %411 = load i32, i32* %9, align 4
  %412 = zext i32 %411 to i64
  %413 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %410, i64 %412
  %414 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %413, i32 0, i32 0
  %415 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %414, align 8
  %416 = bitcast %struct.UT_hash_handle* %415 to i8*
  %417 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %418 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %417, i32 0, i32 2
  %419 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %418, i32 0, i32 0
  %420 = load %struct.UT_hash_table*, %struct.UT_hash_table** %419, align 8
  %421 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %420, i32 0, i32 5
  %422 = load i64, i64* %421, align 8
  %423 = sub i64 0, %422
  %424 = getelementptr inbounds i8, i8* %416, i64 %423
  %425 = bitcast i8* %424 to %struct.ptr_obj*
  store %struct.ptr_obj* %425, %struct.ptr_obj** %3, align 8
  br label %426

426:                                              ; preds = %404
  br label %428

427:                                              ; preds = %390
  store %struct.ptr_obj* null, %struct.ptr_obj** %3, align 8
  br label %428

428:                                              ; preds = %427, %426
  br label %429

429:                                              ; preds = %480, %428
  %430 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %431 = icmp ne %struct.ptr_obj* %430, null
  br i1 %431, label %432, label %481

432:                                              ; preds = %429
  %433 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %434 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %433, i32 0, i32 2
  %435 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %434, i32 0, i32 7
  %436 = load i32, i32* %435, align 4
  %437 = load i32, i32* %4, align 4
  %438 = icmp eq i32 %436, %437
  br i1 %438, label %439, label %456

439:                                              ; preds = %432
  %440 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %441 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %440, i32 0, i32 2
  %442 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %441, i32 0, i32 6
  %443 = load i32, i32* %442, align 8
  %444 = zext i32 %443 to i64
  %445 = icmp eq i64 %444, 4
  br i1 %445, label %446, label %456

446:                                              ; preds = %439
  %447 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %448 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %447, i32 0, i32 2
  %449 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %448, i32 0, i32 5
  %450 = load i8*, i8** %449, align 8
  %451 = bitcast i32* %2 to i8*
  %452 = call i32 @memcmp(i8* %450, i8* %451, i64 4) #9
  %453 = icmp eq i32 %452, 0
  br i1 %453, label %454, label %455

454:                                              ; preds = %446
  br label %481

455:                                              ; preds = %446
  br label %456

456:                                              ; preds = %455, %439, %432
  %457 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %458 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %457, i32 0, i32 2
  %459 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %458, i32 0, i32 4
  %460 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %459, align 8
  %461 = icmp ne %struct.UT_hash_handle* %460, null
  br i1 %461, label %462, label %479

462:                                              ; preds = %456
  br label %463

463:                                              ; preds = %462
  %464 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %465 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %464, i32 0, i32 2
  %466 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %465, i32 0, i32 4
  %467 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %466, align 8
  %468 = bitcast %struct.UT_hash_handle* %467 to i8*
  %469 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %470 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %469, i32 0, i32 2
  %471 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %470, i32 0, i32 0
  %472 = load %struct.UT_hash_table*, %struct.UT_hash_table** %471, align 8
  %473 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %472, i32 0, i32 5
  %474 = load i64, i64* %473, align 8
  %475 = sub i64 0, %474
  %476 = getelementptr inbounds i8, i8* %468, i64 %475
  %477 = bitcast i8* %476 to %struct.ptr_obj*
  store %struct.ptr_obj* %477, %struct.ptr_obj** %3, align 8
  br label %478

478:                                              ; preds = %463
  br label %480

479:                                              ; preds = %456
  store %struct.ptr_obj* null, %struct.ptr_obj** %3, align 8
  br label %480

480:                                              ; preds = %479, %478
  br label %429

481:                                              ; preds = %454, %429
  br label %482

482:                                              ; preds = %481
  br label %483

483:                                              ; preds = %482, %375
  br label %484

484:                                              ; preds = %483
  br label %485

485:                                              ; preds = %484, %10
  br label %486

486:                                              ; preds = %485
  %487 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  ret %struct.ptr_obj* %487
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @delete_ptr(%struct.ptr_obj* %0) #0 {
  %2 = alloca %struct.ptr_obj*, align 8
  %3 = alloca %struct.UT_hash_handle*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.UT_hash_bucket*, align 8
  store %struct.ptr_obj* %0, %struct.ptr_obj** %2, align 8
  br label %6

6:                                                ; preds = %1
  %7 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  %8 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %7, i32 0, i32 2
  store %struct.UT_hash_handle* %8, %struct.UT_hash_handle** %3, align 8
  %9 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %10 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %9, i32 0, i32 1
  %11 = load i8*, i8** %10, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %31

13:                                               ; preds = %6
  %14 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %15 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %14, i32 0, i32 2
  %16 = load i8*, i8** %15, align 8
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %31

18:                                               ; preds = %13
  %19 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %20 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %19, i32 0, i32 2
  %21 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %20, i32 0, i32 0
  %22 = load %struct.UT_hash_table*, %struct.UT_hash_table** %21, align 8
  %23 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %22, i32 0, i32 0
  %24 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %23, align 8
  %25 = bitcast %struct.UT_hash_bucket* %24 to i8*
  call void @free(i8* %25) #7
  %26 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %27 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %26, i32 0, i32 2
  %28 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %27, i32 0, i32 0
  %29 = load %struct.UT_hash_table*, %struct.UT_hash_table** %28, align 8
  %30 = bitcast %struct.UT_hash_table* %29 to i8*
  call void @free(i8* %30) #7
  store %struct.ptr_obj* null, %struct.ptr_obj** @ptr_map, align 8
  br label %180

31:                                               ; preds = %13, %6
  %32 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %33 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %34 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %33, i32 0, i32 2
  %35 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %34, i32 0, i32 0
  %36 = load %struct.UT_hash_table*, %struct.UT_hash_table** %35, align 8
  %37 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %36, i32 0, i32 4
  %38 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %37, align 8
  %39 = icmp eq %struct.UT_hash_handle* %32, %38
  br i1 %39, label %40, label %57

40:                                               ; preds = %31
  %41 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %42 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %41, i32 0, i32 1
  %43 = load i8*, i8** %42, align 8
  %44 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %45 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %44, i32 0, i32 2
  %46 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %45, i32 0, i32 0
  %47 = load %struct.UT_hash_table*, %struct.UT_hash_table** %46, align 8
  %48 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %47, i32 0, i32 5
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds i8, i8* %43, i64 %49
  %51 = bitcast i8* %50 to %struct.UT_hash_handle*
  %52 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %53 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %52, i32 0, i32 2
  %54 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %53, i32 0, i32 0
  %55 = load %struct.UT_hash_table*, %struct.UT_hash_table** %54, align 8
  %56 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %55, i32 0, i32 4
  store %struct.UT_hash_handle* %51, %struct.UT_hash_handle** %56, align 8
  br label %57

57:                                               ; preds = %40, %31
  %58 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %59 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %58, i32 0, i32 1
  %60 = load i8*, i8** %59, align 8
  %61 = icmp ne i8* %60, null
  br i1 %61, label %62, label %78

62:                                               ; preds = %57
  %63 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %64 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %63, i32 0, i32 2
  %65 = load i8*, i8** %64, align 8
  %66 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %67 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %66, i32 0, i32 1
  %68 = load i8*, i8** %67, align 8
  %69 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %70 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %69, i32 0, i32 2
  %71 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %70, i32 0, i32 0
  %72 = load %struct.UT_hash_table*, %struct.UT_hash_table** %71, align 8
  %73 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %72, i32 0, i32 5
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds i8, i8* %68, i64 %74
  %76 = bitcast i8* %75 to %struct.UT_hash_handle*
  %77 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %76, i32 0, i32 2
  store i8* %65, i8** %77, align 8
  br label %85

78:                                               ; preds = %57
  br label %79

79:                                               ; preds = %78
  %80 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %81 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %80, i32 0, i32 2
  %82 = load i8*, i8** %81, align 8
  %83 = bitcast i8* %82 to %struct.ptr_obj*
  store %struct.ptr_obj* %83, %struct.ptr_obj** @ptr_map, align 8
  br label %84

84:                                               ; preds = %79
  br label %85

85:                                               ; preds = %84, %62
  %86 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %87 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %86, i32 0, i32 2
  %88 = load i8*, i8** %87, align 8
  %89 = icmp ne i8* %88, null
  br i1 %89, label %90, label %106

90:                                               ; preds = %85
  %91 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %92 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %91, i32 0, i32 1
  %93 = load i8*, i8** %92, align 8
  %94 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %95 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %94, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8
  %97 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %98 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %97, i32 0, i32 2
  %99 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %98, i32 0, i32 0
  %100 = load %struct.UT_hash_table*, %struct.UT_hash_table** %99, align 8
  %101 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %100, i32 0, i32 5
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds i8, i8* %96, i64 %102
  %104 = bitcast i8* %103 to %struct.UT_hash_handle*
  %105 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %104, i32 0, i32 1
  store i8* %93, i8** %105, align 8
  br label %106

106:                                              ; preds = %90, %85
  br label %107

107:                                              ; preds = %106
  %108 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %109 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %108, i32 0, i32 7
  %110 = load i32, i32* %109, align 4
  %111 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %112 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %111, i32 0, i32 2
  %113 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %112, i32 0, i32 0
  %114 = load %struct.UT_hash_table*, %struct.UT_hash_table** %113, align 8
  %115 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %114, i32 0, i32 1
  %116 = load i32, i32* %115, align 8
  %117 = sub i32 %116, 1
  %118 = and i32 %110, %117
  store i32 %118, i32* %4, align 4
  br label %119

119:                                              ; preds = %107
  br label %120

120:                                              ; preds = %119
  %121 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %122 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %121, i32 0, i32 2
  %123 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %122, i32 0, i32 0
  %124 = load %struct.UT_hash_table*, %struct.UT_hash_table** %123, align 8
  %125 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %124, i32 0, i32 0
  %126 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %125, align 8
  %127 = load i32, i32* %4, align 4
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %126, i64 %128
  store %struct.UT_hash_bucket* %129, %struct.UT_hash_bucket** %5, align 8
  %130 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %5, align 8
  %131 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %130, i32 0, i32 1
  %132 = load i32, i32* %131, align 8
  %133 = add i32 %132, -1
  store i32 %133, i32* %131, align 8
  %134 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %5, align 8
  %135 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %134, i32 0, i32 0
  %136 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %135, align 8
  %137 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %138 = icmp eq %struct.UT_hash_handle* %136, %137
  br i1 %138, label %139, label %145

139:                                              ; preds = %120
  %140 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %141 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %140, i32 0, i32 4
  %142 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %141, align 8
  %143 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %5, align 8
  %144 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %143, i32 0, i32 0
  store %struct.UT_hash_handle* %142, %struct.UT_hash_handle** %144, align 8
  br label %145

145:                                              ; preds = %139, %120
  %146 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %147 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %146, i32 0, i32 3
  %148 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %147, align 8
  %149 = icmp ne %struct.UT_hash_handle* %148, null
  br i1 %149, label %150, label %158

150:                                              ; preds = %145
  %151 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %152 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %151, i32 0, i32 4
  %153 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %152, align 8
  %154 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %155 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %154, i32 0, i32 3
  %156 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %155, align 8
  %157 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %156, i32 0, i32 4
  store %struct.UT_hash_handle* %153, %struct.UT_hash_handle** %157, align 8
  br label %158

158:                                              ; preds = %150, %145
  %159 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %160 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %159, i32 0, i32 4
  %161 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %160, align 8
  %162 = icmp ne %struct.UT_hash_handle* %161, null
  br i1 %162, label %163, label %171

163:                                              ; preds = %158
  %164 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %165 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %164, i32 0, i32 3
  %166 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %165, align 8
  %167 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %168 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %167, i32 0, i32 4
  %169 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %168, align 8
  %170 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %169, i32 0, i32 3
  store %struct.UT_hash_handle* %166, %struct.UT_hash_handle** %170, align 8
  br label %171

171:                                              ; preds = %163, %158
  br label %172

172:                                              ; preds = %171
  %173 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %174 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %173, i32 0, i32 2
  %175 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %174, i32 0, i32 0
  %176 = load %struct.UT_hash_table*, %struct.UT_hash_table** %175, align 8
  %177 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %176, i32 0, i32 3
  %178 = load i32, i32* %177, align 8
  %179 = add i32 %178, -1
  store i32 %179, i32* %177, align 8
  br label %180

180:                                              ; preds = %172, %18
  br label %181

181:                                              ; preds = %180
  %182 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  %183 = bitcast %struct.ptr_obj* %182 to i8*
  call void @free(i8* %183) #7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @myMalloc(i64 %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call noalias i8* @malloc(i64 %4) #7
  store i8* %5, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  call void @add_ptr(i8* %6)
  %7 = load i8*, i8** %3, align 8
  ret i8* %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myFree(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = ptrtoint i8* %3 to i32
  %5 = call %struct.ptr_obj* @find_ptr(i32 %4)
  call void @delete_ptr(%struct.ptr_obj* %5)
  %6 = load i8*, i8** %2, align 8
  call void @free(i8* %6) #7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_ptrs() #0 {
  %1 = alloca %struct.ptr_obj*, align 8
  %2 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  store %struct.ptr_obj* %2, %struct.ptr_obj** %1, align 8
  br label %3

3:                                                ; preds = %10, %0
  %4 = load %struct.ptr_obj*, %struct.ptr_obj** %1, align 8
  %5 = icmp ne %struct.ptr_obj* %4, null
  br i1 %5, label %6, label %16

6:                                                ; preds = %3
  %7 = load %struct.ptr_obj*, %struct.ptr_obj** %1, align 8
  %8 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %7, i32 0, i32 1
  %9 = load i8*, i8** %8, align 8
  call void @myFree(i8* %9)
  br label %10

10:                                               ; preds = %6
  %11 = load %struct.ptr_obj*, %struct.ptr_obj** %1, align 8
  %12 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %11, i32 0, i32 2
  %13 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %12, i32 0, i32 2
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to %struct.ptr_obj*
  store %struct.ptr_obj* %15, %struct.ptr_obj** %1, align 8
  br label %3

16:                                               ; preds = %3
  br label %17

17:                                               ; preds = %16
  %18 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %19 = icmp ne %struct.ptr_obj* %18, null
  br i1 %19, label %20, label %33

20:                                               ; preds = %17
  %21 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %22 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %21, i32 0, i32 2
  %23 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %22, i32 0, i32 0
  %24 = load %struct.UT_hash_table*, %struct.UT_hash_table** %23, align 8
  %25 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %24, i32 0, i32 0
  %26 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %25, align 8
  %27 = bitcast %struct.UT_hash_bucket* %26 to i8*
  call void @free(i8* %27) #7
  %28 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %29 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %28, i32 0, i32 2
  %30 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %29, i32 0, i32 0
  %31 = load %struct.UT_hash_table*, %struct.UT_hash_table** %30, align 8
  %32 = bitcast %struct.UT_hash_table* %31 to i8*
  call void @free(i8* %32) #7
  store %struct.ptr_obj* null, %struct.ptr_obj** @ptr_map, align 8
  br label %33

33:                                               ; preds = %20, %17
  br label %34

34:                                               ; preds = %33
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %12 = call i64 @clock() #7
  store i64 %12, i64* %7, align 8
  store i32 0, i32* %11, align 4
  br label %13

13:                                               ; preds = %32, %2
  %14 = load i32, i32* %11, align 4
  %15 = icmp slt i32 %14, 10000
  br i1 %15, label %16, label %35

16:                                               ; preds = %13
  %17 = call i64 @clock() #7
  store i64 %17, i64* %6, align 8
  %18 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @_buf, i64 0, i64 0)) #10
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0))
  br label %25

22:                                               ; preds = %16
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0))
  %24 = call i32 @start_main(i32 %0, i8** %1)
  br label %25

25:                                               ; preds = %22, %20
  call void @free_ptrs()
  %26 = call i64 @clock() #7
  store i64 %26, i64* %8, align 8
  %27 = load i64, i64* %8, align 8
  %28 = load i64, i64* %6, align 8
  %29 = sub nsw i64 %27, %28
  %30 = sitofp i64 %29 to double
  %31 = fdiv double %30, 1.000000e+06
  store double %31, double* %10, align 8
  br label %32

32:                                               ; preds = %25
  %33 = load i32, i32* %11, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %11, align 4
  br label %13

35:                                               ; preds = %13
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0))
  %37 = call i64 @clock() #7
  store i64 %37, i64* %9, align 8
  %38 = load i64, i64* %9, align 8
  %39 = load i64, i64* %7, align 8
  %40 = sub nsw i64 %38, %39
  %41 = sitofp i64 %40 to double
  %42 = fdiv double %41, 1.000000e+06
  store double %42, double* %10, align 8
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i64 @clock() #1

; Function Attrs: nounwind returns_twice
declare dso_local i32 @_setjmp(%struct.__jmp_buf_tag*) #5

declare dso_local i32 @printf(i8*, ...) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @hashCode(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = srem i32 %3, 20
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.DataItem* @search(i32 %0) #0 {
  %2 = alloca %struct.DataItem*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %5 = load i32, i32* %3, align 4
  %6 = call i32 @hashCode(i32 %5)
  store i32 %6, i32* %4, align 4
  br label %7

7:                                                ; preds = %27, %1
  %8 = load i32, i32* %4, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %9
  %11 = load %struct.DataItem*, %struct.DataItem** %10, align 8
  %12 = icmp ne %struct.DataItem* %11, null
  br i1 %12, label %13, label %32

13:                                               ; preds = %7
  %14 = load i32, i32* %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %15
  %17 = load %struct.DataItem*, %struct.DataItem** %16, align 8
  %18 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = load i32, i32* %3, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %22, label %27

22:                                               ; preds = %13
  %23 = load i32, i32* %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %24
  %26 = load %struct.DataItem*, %struct.DataItem** %25, align 8
  store %struct.DataItem* %26, %struct.DataItem** %2, align 8
  br label %33

27:                                               ; preds = %13
  %28 = load i32, i32* %4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %4, align 4
  %30 = load i32, i32* %4, align 4
  %31 = srem i32 %30, 20
  store i32 %31, i32* %4, align 4
  br label %7

32:                                               ; preds = %7
  store %struct.DataItem* null, %struct.DataItem** %2, align 8
  br label %33

33:                                               ; preds = %32, %22
  %34 = load %struct.DataItem*, %struct.DataItem** %2, align 8
  ret %struct.DataItem* %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @insert(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.DataItem*, align 8
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %7 = call noalias i8* @malloc(i64 8) #7
  %8 = bitcast i8* %7 to %struct.DataItem*
  store %struct.DataItem* %8, %struct.DataItem** %5, align 8
  %9 = load i32, i32* %4, align 4
  %10 = load %struct.DataItem*, %struct.DataItem** %5, align 8
  %11 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %10, i32 0, i32 0
  store i32 %9, i32* %11, align 4
  %12 = load i32, i32* %3, align 4
  %13 = load %struct.DataItem*, %struct.DataItem** %5, align 8
  %14 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %13, i32 0, i32 1
  store i32 %12, i32* %14, align 4
  %15 = load i32, i32* %3, align 4
  %16 = call i32 @hashCode(i32 %15)
  store i32 %16, i32* %6, align 4
  br label %17

17:                                               ; preds = %33, %2
  %18 = load i32, i32* %6, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %19
  %21 = load %struct.DataItem*, %struct.DataItem** %20, align 8
  %22 = icmp ne %struct.DataItem* %21, null
  br i1 %22, label %23, label %31

23:                                               ; preds = %17
  %24 = load i32, i32* %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %25
  %27 = load %struct.DataItem*, %struct.DataItem** %26, align 8
  %28 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %27, i32 0, i32 1
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, -1
  br label %31

31:                                               ; preds = %23, %17
  %32 = phi i1 [ false, %17 ], [ %30, %23 ]
  br i1 %32, label %33, label %38

33:                                               ; preds = %31
  %34 = load i32, i32* %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %6, align 4
  %36 = load i32, i32* %6, align 4
  %37 = srem i32 %36, 20
  store i32 %37, i32* %6, align 4
  br label %17

38:                                               ; preds = %31
  %39 = load %struct.DataItem*, %struct.DataItem** %5, align 8
  %40 = load i32, i32* %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %41
  store %struct.DataItem* %39, %struct.DataItem** %42, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.DataItem* @delete(%struct.DataItem* %0) #0 {
  %2 = alloca %struct.DataItem*, align 8
  %3 = alloca %struct.DataItem*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.DataItem*, align 8
  store %struct.DataItem* %0, %struct.DataItem** %3, align 8
  %7 = load %struct.DataItem*, %struct.DataItem** %3, align 8
  %8 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %7, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %4, align 4
  %10 = load i32, i32* %4, align 4
  %11 = call i32 @hashCode(i32 %10)
  store i32 %11, i32* %5, align 4
  br label %12

12:                                               ; preds = %37, %1
  %13 = load i32, i32* %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %14
  %16 = load %struct.DataItem*, %struct.DataItem** %15, align 8
  %17 = icmp ne %struct.DataItem* %16, null
  br i1 %17, label %18, label %42

18:                                               ; preds = %12
  %19 = load i32, i32* %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %20
  %22 = load %struct.DataItem*, %struct.DataItem** %21, align 8
  %23 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %4, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %37

27:                                               ; preds = %18
  %28 = load i32, i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %29
  %31 = load %struct.DataItem*, %struct.DataItem** %30, align 8
  store %struct.DataItem* %31, %struct.DataItem** %6, align 8
  %32 = load %struct.DataItem*, %struct.DataItem** @dummyItem, align 8
  %33 = load i32, i32* %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %34
  store %struct.DataItem* %32, %struct.DataItem** %35, align 8
  %36 = load %struct.DataItem*, %struct.DataItem** %6, align 8
  store %struct.DataItem* %36, %struct.DataItem** %2, align 8
  br label %43

37:                                               ; preds = %18
  %38 = load i32, i32* %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %5, align 4
  %40 = load i32, i32* %5, align 4
  %41 = srem i32 %40, 20
  store i32 %41, i32* %5, align 4
  br label %12

42:                                               ; preds = %12
  store %struct.DataItem* null, %struct.DataItem** %2, align 8
  br label %43

43:                                               ; preds = %42, %27
  %44 = load %struct.DataItem*, %struct.DataItem** %2, align 8
  ret %struct.DataItem* %44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @display() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %1, align 4
  br label %2

2:                                                ; preds = %28, %0
  %3 = load i32, i32* %1, align 4
  %4 = icmp slt i32 %3, 20
  br i1 %4, label %5, label %31

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %7
  %9 = load %struct.DataItem*, %struct.DataItem** %8, align 8
  %10 = icmp ne %struct.DataItem* %9, null
  br i1 %10, label %11, label %25

11:                                               ; preds = %5
  %12 = load i32, i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %13
  %15 = load %struct.DataItem*, %struct.DataItem** %14, align 8
  %16 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %15, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [20 x %struct.DataItem*], [20 x %struct.DataItem*]* @hashArray, i64 0, i64 %19
  %21 = load %struct.DataItem*, %struct.DataItem** %20, align 8
  %22 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %21, i32 0, i32 0
  %23 = load i32, i32* %22, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 %17, i32 %23)
  br label %27

25:                                               ; preds = %5
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.4, i64 0, i64 0))
  br label %27

27:                                               ; preds = %25, %11
  br label %28

28:                                               ; preds = %27
  %29 = load i32, i32* %1, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %1, align 4
  br label %2

31:                                               ; preds = %2
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2.5, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @possibleValue() #0 {
  %1 = call i32 @rand() #7
  %2 = srem i32 %1, 10
  ret i32 %2
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @possibleExit() #0 {
  %1 = call i32 @possibleValue()
  %2 = icmp sgt i32 %1, 4
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  call void @exit(i32 0) #8
  unreachable

4:                                                ; preds = %0
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @doStuff() #0 {
  %1 = call i64 @time(i64* @t) #7
  %2 = call %struct.tm* @localtime(i64* @t) #7
  store %struct.tm* %2, %struct.tm** @timeinfo, align 8
  %3 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %4 = getelementptr inbounds %struct.tm, %struct.tm* %3, i32 0, i32 3
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %7 = getelementptr inbounds %struct.tm, %struct.tm* %6, i32 0, i32 4
  %8 = load i32, i32* %7, align 8
  %9 = add nsw i32 %8, 1
  %10 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %11 = getelementptr inbounds %struct.tm, %struct.tm* %10, i32 0, i32 5
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %12, 1900
  %14 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %15 = getelementptr inbounds %struct.tm, %struct.tm* %14, i32 0, i32 2
  %16 = load i32, i32* %15, align 8
  %17 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %18 = getelementptr inbounds %struct.tm, %struct.tm* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %21 = getelementptr inbounds %struct.tm, %struct.tm* %20, i32 0, i32 0
  %22 = load i32, i32* %21, align 8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3.6, i64 0, i64 0), i32 %5, i32 %9, i32 %13, i32 %16, i32 %19, i32 %22)
  %24 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %25 = getelementptr inbounds %struct.tm, %struct.tm* %24, i32 0, i32 0
  %26 = load i32, i32* %25, align 8
  %27 = srem i32 %26, 3
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %29, label %30

29:                                               ; preds = %0
  call void @exit(i32 0) #8
  unreachable

30:                                               ; preds = %0
  call void @possibleExit()
  br label %31

31:                                               ; preds = %30
  %32 = load %struct.tm*, %struct.tm** @timeinfo, align 8
  %33 = getelementptr inbounds %struct.tm, %struct.tm* %32, i32 0, i32 0
  %34 = load i32, i32* %33, align 8
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32 %34)
  ret void
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #1

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @start_main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %6, align 8
  %8 = call i64 @time(i64* null) #7
  %9 = trunc i64 %8 to i32
  call void @srand(i32 %9) #7
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7, i64 0, i64 0))
  %11 = load i32, i32* @RANDOM_UNIT, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.8, i64 0, i64 0), i32 %11)
  %13 = load i32, i32* @RANDOM_INIT, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.9, i64 0, i64 0), i32 %13)
  %15 = call i32 @rand() #7
  %16 = srem i32 %15, 10
  store i32 %16, i32* @RANDOM_UNIT, align 4
  %17 = call i32 @rand() #7
  %18 = srem i32 %17, 10
  store i32 %18, i32* @RANDOM_INIT, align 4
  call void @doStuff()
  %19 = load i32, i32* @RANDOM_UNIT, align 4
  %20 = load i32, i32* @RANDOM_INIT, align 4
  %21 = sub nsw i32 %19, %20
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %2
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.10, i64 0, i64 0))
  call void @exit(i32 0) #8
  unreachable

25:                                               ; preds = %2
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.11, i64 0, i64 0))
  %27 = load i32, i32* @RANDOM_UNIT, align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.8, i64 0, i64 0), i32 %27)
  %29 = load i32, i32* @RANDOM_INIT, align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.9, i64 0, i64 0), i32 %29)
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.12, i64 0, i64 0))
  call void @possibleExit()
  %32 = call noalias i8* @malloc(i64 8) #7
  %33 = bitcast i8* %32 to %struct.DataItem*
  store %struct.DataItem* %33, %struct.DataItem** @dummyItem, align 8
  %34 = load %struct.DataItem*, %struct.DataItem** @dummyItem, align 8
  %35 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %34, i32 0, i32 0
  store i32 -1, i32* %35, align 4
  %36 = load %struct.DataItem*, %struct.DataItem** @dummyItem, align 8
  %37 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %36, i32 0, i32 1
  store i32 -1, i32* %37, align 4
  call void @insert(i32 1, i32 20)
  call void @insert(i32 2, i32 70)
  call void @insert(i32 42, i32 80)
  call void @insert(i32 4, i32 25)
  call void @insert(i32 12, i32 44)
  call void @insert(i32 14, i32 32)
  call void @insert(i32 17, i32 11)
  call void @insert(i32 13, i32 78)
  call void @insert(i32 37, i32 97)
  call void @display()
  %38 = call %struct.DataItem* @search(i32 37)
  store %struct.DataItem* %38, %struct.DataItem** @item, align 8
  %39 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %40 = icmp ne %struct.DataItem* %39, null
  br i1 %40, label %41, label %46

41:                                               ; preds = %25
  %42 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %43 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %42, i32 0, i32 0
  %44 = load i32, i32* %43, align 4
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i64 0, i64 0), i32 %44)
  br label %48

46:                                               ; preds = %25
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.14, i64 0, i64 0))
  br label %48

48:                                               ; preds = %46, %41
  %49 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %50 = call %struct.DataItem* @delete(%struct.DataItem* %49)
  %51 = call %struct.DataItem* @search(i32 37)
  store %struct.DataItem* %51, %struct.DataItem** @item, align 8
  %52 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %53 = icmp ne %struct.DataItem* %52, null
  br i1 %53, label %54, label %59

54:                                               ; preds = %48
  %55 = load %struct.DataItem*, %struct.DataItem** @item, align 8
  %56 = getelementptr inbounds %struct.DataItem, %struct.DataItem* %55, i32 0, i32 0
  %57 = load i32, i32* %56, align 4
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i64 0, i64 0), i32 %57)
  br label %61

59:                                               ; preds = %48
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.14, i64 0, i64 0))
  br label %61

61:                                               ; preds = %59, %54
  ret i32 0
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #6

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }
attributes #10 = { nounwind returns_twice }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
