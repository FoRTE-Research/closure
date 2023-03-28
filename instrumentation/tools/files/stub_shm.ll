; ModuleID = 'files/stub_shm.bc'
source_filename = "stubMainnoLoop_shm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ptr_obj = type { i8*, i32, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { %struct.UT_hash_table*, i8*, i8*, %struct.UT_hash_handle*, %struct.UT_hash_handle*, i8*, i32, i32 }
%struct.UT_hash_table = type { %struct.UT_hash_bucket*, i32, i32, i32, %struct.UT_hash_handle*, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { %struct.UT_hash_handle*, i32, i32 }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@ptr_map = dso_local global %struct.ptr_obj* null, align 8
@.str = private unnamed_addr constant [7 x i8] c"shmget\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"shmat\00", align 1
@__longjmp_buf__ = common dso_local global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [26 x i8] c"\0A---Done with Testing---\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"\0A___Start_Main___\0A\00", align 1

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
  %20 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %21 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %20, i32 0, i32 0
  store i8* %19, i8** %21, align 8
  %22 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %23 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %22, i32 0, i32 1
  store i32 1, i32* %23, align 8
  br label %24

24:                                               ; preds = %1
  br label %25

25:                                               ; preds = %24
  br label %26

26:                                               ; preds = %25
  %27 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %28 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %27, i32 0, i32 0
  %29 = bitcast i8** %28 to i8*
  store i8* %29, i8** %8, align 8
  store i32 -17973521, i32* %4, align 4
  store i32 -1640531527, i32* %6, align 4
  store i32 -1640531527, i32* %5, align 4
  store i32 8, i32* %7, align 4
  br label %30

30:                                               ; preds = %197, %26
  %31 = load i32, i32* %7, align 4
  %32 = icmp uge i32 %31, 12
  br i1 %32, label %33, label %202

33:                                               ; preds = %30
  %34 = load i8*, i8** %8, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 0
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = load i8*, i8** %8, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 1
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = shl i32 %41, 8
  %43 = add i32 %37, %42
  %44 = load i8*, i8** %8, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 2
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = shl i32 %47, 16
  %49 = add i32 %43, %48
  %50 = load i8*, i8** %8, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 3
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = shl i32 %53, 24
  %55 = add i32 %49, %54
  %56 = load i32, i32* %5, align 4
  %57 = add i32 %56, %55
  store i32 %57, i32* %5, align 4
  %58 = load i8*, i8** %8, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 4
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = load i8*, i8** %8, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 5
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = shl i32 %65, 8
  %67 = add i32 %61, %66
  %68 = load i8*, i8** %8, align 8
  %69 = getelementptr inbounds i8, i8* %68, i64 6
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = shl i32 %71, 16
  %73 = add i32 %67, %72
  %74 = load i8*, i8** %8, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 7
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = shl i32 %77, 24
  %79 = add i32 %73, %78
  %80 = load i32, i32* %6, align 4
  %81 = add i32 %80, %79
  store i32 %81, i32* %6, align 4
  %82 = load i8*, i8** %8, align 8
  %83 = getelementptr inbounds i8, i8* %82, i64 8
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = load i8*, i8** %8, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 9
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = shl i32 %89, 8
  %91 = add i32 %85, %90
  %92 = load i8*, i8** %8, align 8
  %93 = getelementptr inbounds i8, i8* %92, i64 10
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl i32 %95, 16
  %97 = add i32 %91, %96
  %98 = load i8*, i8** %8, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 11
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = shl i32 %101, 24
  %103 = add i32 %97, %102
  %104 = load i32, i32* %4, align 4
  %105 = add i32 %104, %103
  store i32 %105, i32* %4, align 4
  br label %106

106:                                              ; preds = %33
  %107 = load i32, i32* %6, align 4
  %108 = load i32, i32* %5, align 4
  %109 = sub i32 %108, %107
  store i32 %109, i32* %5, align 4
  %110 = load i32, i32* %4, align 4
  %111 = load i32, i32* %5, align 4
  %112 = sub i32 %111, %110
  store i32 %112, i32* %5, align 4
  %113 = load i32, i32* %4, align 4
  %114 = lshr i32 %113, 13
  %115 = load i32, i32* %5, align 4
  %116 = xor i32 %115, %114
  store i32 %116, i32* %5, align 4
  %117 = load i32, i32* %4, align 4
  %118 = load i32, i32* %6, align 4
  %119 = sub i32 %118, %117
  store i32 %119, i32* %6, align 4
  %120 = load i32, i32* %5, align 4
  %121 = load i32, i32* %6, align 4
  %122 = sub i32 %121, %120
  store i32 %122, i32* %6, align 4
  %123 = load i32, i32* %5, align 4
  %124 = shl i32 %123, 8
  %125 = load i32, i32* %6, align 4
  %126 = xor i32 %125, %124
  store i32 %126, i32* %6, align 4
  %127 = load i32, i32* %5, align 4
  %128 = load i32, i32* %4, align 4
  %129 = sub i32 %128, %127
  store i32 %129, i32* %4, align 4
  %130 = load i32, i32* %6, align 4
  %131 = load i32, i32* %4, align 4
  %132 = sub i32 %131, %130
  store i32 %132, i32* %4, align 4
  %133 = load i32, i32* %6, align 4
  %134 = lshr i32 %133, 13
  %135 = load i32, i32* %4, align 4
  %136 = xor i32 %135, %134
  store i32 %136, i32* %4, align 4
  %137 = load i32, i32* %6, align 4
  %138 = load i32, i32* %5, align 4
  %139 = sub i32 %138, %137
  store i32 %139, i32* %5, align 4
  %140 = load i32, i32* %4, align 4
  %141 = load i32, i32* %5, align 4
  %142 = sub i32 %141, %140
  store i32 %142, i32* %5, align 4
  %143 = load i32, i32* %4, align 4
  %144 = lshr i32 %143, 12
  %145 = load i32, i32* %5, align 4
  %146 = xor i32 %145, %144
  store i32 %146, i32* %5, align 4
  %147 = load i32, i32* %4, align 4
  %148 = load i32, i32* %6, align 4
  %149 = sub i32 %148, %147
  store i32 %149, i32* %6, align 4
  %150 = load i32, i32* %5, align 4
  %151 = load i32, i32* %6, align 4
  %152 = sub i32 %151, %150
  store i32 %152, i32* %6, align 4
  %153 = load i32, i32* %5, align 4
  %154 = shl i32 %153, 16
  %155 = load i32, i32* %6, align 4
  %156 = xor i32 %155, %154
  store i32 %156, i32* %6, align 4
  %157 = load i32, i32* %5, align 4
  %158 = load i32, i32* %4, align 4
  %159 = sub i32 %158, %157
  store i32 %159, i32* %4, align 4
  %160 = load i32, i32* %6, align 4
  %161 = load i32, i32* %4, align 4
  %162 = sub i32 %161, %160
  store i32 %162, i32* %4, align 4
  %163 = load i32, i32* %6, align 4
  %164 = lshr i32 %163, 5
  %165 = load i32, i32* %4, align 4
  %166 = xor i32 %165, %164
  store i32 %166, i32* %4, align 4
  %167 = load i32, i32* %6, align 4
  %168 = load i32, i32* %5, align 4
  %169 = sub i32 %168, %167
  store i32 %169, i32* %5, align 4
  %170 = load i32, i32* %4, align 4
  %171 = load i32, i32* %5, align 4
  %172 = sub i32 %171, %170
  store i32 %172, i32* %5, align 4
  %173 = load i32, i32* %4, align 4
  %174 = lshr i32 %173, 3
  %175 = load i32, i32* %5, align 4
  %176 = xor i32 %175, %174
  store i32 %176, i32* %5, align 4
  %177 = load i32, i32* %4, align 4
  %178 = load i32, i32* %6, align 4
  %179 = sub i32 %178, %177
  store i32 %179, i32* %6, align 4
  %180 = load i32, i32* %5, align 4
  %181 = load i32, i32* %6, align 4
  %182 = sub i32 %181, %180
  store i32 %182, i32* %6, align 4
  %183 = load i32, i32* %5, align 4
  %184 = shl i32 %183, 10
  %185 = load i32, i32* %6, align 4
  %186 = xor i32 %185, %184
  store i32 %186, i32* %6, align 4
  %187 = load i32, i32* %5, align 4
  %188 = load i32, i32* %4, align 4
  %189 = sub i32 %188, %187
  store i32 %189, i32* %4, align 4
  %190 = load i32, i32* %6, align 4
  %191 = load i32, i32* %4, align 4
  %192 = sub i32 %191, %190
  store i32 %192, i32* %4, align 4
  %193 = load i32, i32* %6, align 4
  %194 = lshr i32 %193, 15
  %195 = load i32, i32* %4, align 4
  %196 = xor i32 %195, %194
  store i32 %196, i32* %4, align 4
  br label %197

197:                                              ; preds = %106
  %198 = load i8*, i8** %8, align 8
  %199 = getelementptr inbounds i8, i8* %198, i64 12
  store i8* %199, i8** %8, align 8
  %200 = load i32, i32* %7, align 4
  %201 = sub i32 %200, 12
  store i32 %201, i32* %7, align 4
  br label %30

202:                                              ; preds = %30
  %203 = load i32, i32* %4, align 4
  %204 = add i32 %203, 8
  store i32 %204, i32* %4, align 4
  %205 = load i32, i32* %7, align 4
  switch i32 %205, label %292 [
    i32 11, label %206
    i32 10, label %214
    i32 9, label %222
    i32 8, label %230
    i32 7, label %238
    i32 6, label %246
    i32 5, label %254
    i32 4, label %261
    i32 3, label %269
    i32 2, label %277
    i32 1, label %285
  ]

206:                                              ; preds = %202
  %207 = load i8*, i8** %8, align 8
  %208 = getelementptr inbounds i8, i8* %207, i64 10
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = shl i32 %210, 24
  %212 = load i32, i32* %4, align 4
  %213 = add i32 %212, %211
  store i32 %213, i32* %4, align 4
  br label %214

214:                                              ; preds = %202, %206
  %215 = load i8*, i8** %8, align 8
  %216 = getelementptr inbounds i8, i8* %215, i64 9
  %217 = load i8, i8* %216, align 1
  %218 = zext i8 %217 to i32
  %219 = shl i32 %218, 16
  %220 = load i32, i32* %4, align 4
  %221 = add i32 %220, %219
  store i32 %221, i32* %4, align 4
  br label %222

222:                                              ; preds = %202, %214
  %223 = load i8*, i8** %8, align 8
  %224 = getelementptr inbounds i8, i8* %223, i64 8
  %225 = load i8, i8* %224, align 1
  %226 = zext i8 %225 to i32
  %227 = shl i32 %226, 8
  %228 = load i32, i32* %4, align 4
  %229 = add i32 %228, %227
  store i32 %229, i32* %4, align 4
  br label %230

230:                                              ; preds = %202, %222
  %231 = load i8*, i8** %8, align 8
  %232 = getelementptr inbounds i8, i8* %231, i64 7
  %233 = load i8, i8* %232, align 1
  %234 = zext i8 %233 to i32
  %235 = shl i32 %234, 24
  %236 = load i32, i32* %6, align 4
  %237 = add i32 %236, %235
  store i32 %237, i32* %6, align 4
  br label %238

238:                                              ; preds = %202, %230
  %239 = load i8*, i8** %8, align 8
  %240 = getelementptr inbounds i8, i8* %239, i64 6
  %241 = load i8, i8* %240, align 1
  %242 = zext i8 %241 to i32
  %243 = shl i32 %242, 16
  %244 = load i32, i32* %6, align 4
  %245 = add i32 %244, %243
  store i32 %245, i32* %6, align 4
  br label %246

246:                                              ; preds = %202, %238
  %247 = load i8*, i8** %8, align 8
  %248 = getelementptr inbounds i8, i8* %247, i64 5
  %249 = load i8, i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = shl i32 %250, 8
  %252 = load i32, i32* %6, align 4
  %253 = add i32 %252, %251
  store i32 %253, i32* %6, align 4
  br label %254

254:                                              ; preds = %202, %246
  %255 = load i8*, i8** %8, align 8
  %256 = getelementptr inbounds i8, i8* %255, i64 4
  %257 = load i8, i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = load i32, i32* %6, align 4
  %260 = add i32 %259, %258
  store i32 %260, i32* %6, align 4
  br label %261

261:                                              ; preds = %202, %254
  %262 = load i8*, i8** %8, align 8
  %263 = getelementptr inbounds i8, i8* %262, i64 3
  %264 = load i8, i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = shl i32 %265, 24
  %267 = load i32, i32* %5, align 4
  %268 = add i32 %267, %266
  store i32 %268, i32* %5, align 4
  br label %269

269:                                              ; preds = %202, %261
  %270 = load i8*, i8** %8, align 8
  %271 = getelementptr inbounds i8, i8* %270, i64 2
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = shl i32 %273, 16
  %275 = load i32, i32* %5, align 4
  %276 = add i32 %275, %274
  store i32 %276, i32* %5, align 4
  br label %277

277:                                              ; preds = %202, %269
  %278 = load i8*, i8** %8, align 8
  %279 = getelementptr inbounds i8, i8* %278, i64 1
  %280 = load i8, i8* %279, align 1
  %281 = zext i8 %280 to i32
  %282 = shl i32 %281, 8
  %283 = load i32, i32* %5, align 4
  %284 = add i32 %283, %282
  store i32 %284, i32* %5, align 4
  br label %285

285:                                              ; preds = %202, %277
  %286 = load i8*, i8** %8, align 8
  %287 = getelementptr inbounds i8, i8* %286, i64 0
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = load i32, i32* %5, align 4
  %291 = add i32 %290, %289
  store i32 %291, i32* %5, align 4
  br label %292

292:                                              ; preds = %202, %285
  br label %293

293:                                              ; preds = %292
  br label %294

294:                                              ; preds = %293
  %295 = load i32, i32* %6, align 4
  %296 = load i32, i32* %5, align 4
  %297 = sub i32 %296, %295
  store i32 %297, i32* %5, align 4
  %298 = load i32, i32* %4, align 4
  %299 = load i32, i32* %5, align 4
  %300 = sub i32 %299, %298
  store i32 %300, i32* %5, align 4
  %301 = load i32, i32* %4, align 4
  %302 = lshr i32 %301, 13
  %303 = load i32, i32* %5, align 4
  %304 = xor i32 %303, %302
  store i32 %304, i32* %5, align 4
  %305 = load i32, i32* %4, align 4
  %306 = load i32, i32* %6, align 4
  %307 = sub i32 %306, %305
  store i32 %307, i32* %6, align 4
  %308 = load i32, i32* %5, align 4
  %309 = load i32, i32* %6, align 4
  %310 = sub i32 %309, %308
  store i32 %310, i32* %6, align 4
  %311 = load i32, i32* %5, align 4
  %312 = shl i32 %311, 8
  %313 = load i32, i32* %6, align 4
  %314 = xor i32 %313, %312
  store i32 %314, i32* %6, align 4
  %315 = load i32, i32* %5, align 4
  %316 = load i32, i32* %4, align 4
  %317 = sub i32 %316, %315
  store i32 %317, i32* %4, align 4
  %318 = load i32, i32* %6, align 4
  %319 = load i32, i32* %4, align 4
  %320 = sub i32 %319, %318
  store i32 %320, i32* %4, align 4
  %321 = load i32, i32* %6, align 4
  %322 = lshr i32 %321, 13
  %323 = load i32, i32* %4, align 4
  %324 = xor i32 %323, %322
  store i32 %324, i32* %4, align 4
  %325 = load i32, i32* %6, align 4
  %326 = load i32, i32* %5, align 4
  %327 = sub i32 %326, %325
  store i32 %327, i32* %5, align 4
  %328 = load i32, i32* %4, align 4
  %329 = load i32, i32* %5, align 4
  %330 = sub i32 %329, %328
  store i32 %330, i32* %5, align 4
  %331 = load i32, i32* %4, align 4
  %332 = lshr i32 %331, 12
  %333 = load i32, i32* %5, align 4
  %334 = xor i32 %333, %332
  store i32 %334, i32* %5, align 4
  %335 = load i32, i32* %4, align 4
  %336 = load i32, i32* %6, align 4
  %337 = sub i32 %336, %335
  store i32 %337, i32* %6, align 4
  %338 = load i32, i32* %5, align 4
  %339 = load i32, i32* %6, align 4
  %340 = sub i32 %339, %338
  store i32 %340, i32* %6, align 4
  %341 = load i32, i32* %5, align 4
  %342 = shl i32 %341, 16
  %343 = load i32, i32* %6, align 4
  %344 = xor i32 %343, %342
  store i32 %344, i32* %6, align 4
  %345 = load i32, i32* %5, align 4
  %346 = load i32, i32* %4, align 4
  %347 = sub i32 %346, %345
  store i32 %347, i32* %4, align 4
  %348 = load i32, i32* %6, align 4
  %349 = load i32, i32* %4, align 4
  %350 = sub i32 %349, %348
  store i32 %350, i32* %4, align 4
  %351 = load i32, i32* %6, align 4
  %352 = lshr i32 %351, 5
  %353 = load i32, i32* %4, align 4
  %354 = xor i32 %353, %352
  store i32 %354, i32* %4, align 4
  %355 = load i32, i32* %6, align 4
  %356 = load i32, i32* %5, align 4
  %357 = sub i32 %356, %355
  store i32 %357, i32* %5, align 4
  %358 = load i32, i32* %4, align 4
  %359 = load i32, i32* %5, align 4
  %360 = sub i32 %359, %358
  store i32 %360, i32* %5, align 4
  %361 = load i32, i32* %4, align 4
  %362 = lshr i32 %361, 3
  %363 = load i32, i32* %5, align 4
  %364 = xor i32 %363, %362
  store i32 %364, i32* %5, align 4
  %365 = load i32, i32* %4, align 4
  %366 = load i32, i32* %6, align 4
  %367 = sub i32 %366, %365
  store i32 %367, i32* %6, align 4
  %368 = load i32, i32* %5, align 4
  %369 = load i32, i32* %6, align 4
  %370 = sub i32 %369, %368
  store i32 %370, i32* %6, align 4
  %371 = load i32, i32* %5, align 4
  %372 = shl i32 %371, 10
  %373 = load i32, i32* %6, align 4
  %374 = xor i32 %373, %372
  store i32 %374, i32* %6, align 4
  %375 = load i32, i32* %5, align 4
  %376 = load i32, i32* %4, align 4
  %377 = sub i32 %376, %375
  store i32 %377, i32* %4, align 4
  %378 = load i32, i32* %6, align 4
  %379 = load i32, i32* %4, align 4
  %380 = sub i32 %379, %378
  store i32 %380, i32* %4, align 4
  %381 = load i32, i32* %6, align 4
  %382 = lshr i32 %381, 15
  %383 = load i32, i32* %4, align 4
  %384 = xor i32 %383, %382
  store i32 %384, i32* %4, align 4
  br label %385

385:                                              ; preds = %294
  br label %386

386:                                              ; preds = %385
  br label %387

387:                                              ; preds = %386
  br label %388

388:                                              ; preds = %387
  %389 = load i32, i32* %4, align 4
  %390 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %391 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %390, i32 0, i32 2
  %392 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %391, i32 0, i32 7
  store i32 %389, i32* %392, align 4
  %393 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %394 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %393, i32 0, i32 0
  %395 = bitcast i8** %394 to i8*
  %396 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %397 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %396, i32 0, i32 2
  %398 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %397, i32 0, i32 5
  store i8* %395, i8** %398, align 8
  %399 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %400 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %399, i32 0, i32 2
  %401 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %400, i32 0, i32 6
  store i32 8, i32* %401, align 8
  %402 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %403 = icmp ne %struct.ptr_obj* %402, null
  br i1 %403, label %491, label %404

404:                                              ; preds = %388
  %405 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %406 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %405, i32 0, i32 2
  %407 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %406, i32 0, i32 2
  store i8* null, i8** %407, align 8
  %408 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %409 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %408, i32 0, i32 2
  %410 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %409, i32 0, i32 1
  store i8* null, i8** %410, align 8
  br label %411

411:                                              ; preds = %404
  %412 = call noalias i8* @malloc(i64 64) #7
  %413 = bitcast i8* %412 to %struct.UT_hash_table*
  %414 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %415 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %414, i32 0, i32 2
  %416 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %415, i32 0, i32 0
  store %struct.UT_hash_table* %413, %struct.UT_hash_table** %416, align 8
  %417 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %418 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %417, i32 0, i32 2
  %419 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %418, i32 0, i32 0
  %420 = load %struct.UT_hash_table*, %struct.UT_hash_table** %419, align 8
  %421 = icmp ne %struct.UT_hash_table* %420, null
  br i1 %421, label %423, label %422

422:                                              ; preds = %411
  call void @exit(i32 -1) #8
  unreachable

423:                                              ; preds = %411
  %424 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %425 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %424, i32 0, i32 2
  %426 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %425, i32 0, i32 0
  %427 = load %struct.UT_hash_table*, %struct.UT_hash_table** %426, align 8
  %428 = bitcast %struct.UT_hash_table* %427 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %428, i8 0, i64 64, i1 false)
  %429 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %430 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %429, i32 0, i32 2
  %431 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %432 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %431, i32 0, i32 2
  %433 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %432, i32 0, i32 0
  %434 = load %struct.UT_hash_table*, %struct.UT_hash_table** %433, align 8
  %435 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %434, i32 0, i32 4
  store %struct.UT_hash_handle* %430, %struct.UT_hash_handle** %435, align 8
  %436 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %437 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %436, i32 0, i32 2
  %438 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %437, i32 0, i32 0
  %439 = load %struct.UT_hash_table*, %struct.UT_hash_table** %438, align 8
  %440 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %439, i32 0, i32 1
  store i32 32, i32* %440, align 8
  %441 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %442 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %441, i32 0, i32 2
  %443 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %442, i32 0, i32 0
  %444 = load %struct.UT_hash_table*, %struct.UT_hash_table** %443, align 8
  %445 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %444, i32 0, i32 2
  store i32 5, i32* %445, align 4
  %446 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %447 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %446, i32 0, i32 2
  %448 = bitcast %struct.UT_hash_handle* %447 to i8*
  %449 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %450 = bitcast %struct.ptr_obj* %449 to i8*
  %451 = ptrtoint i8* %448 to i64
  %452 = ptrtoint i8* %450 to i64
  %453 = sub i64 %451, %452
  %454 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %455 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %454, i32 0, i32 2
  %456 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %455, i32 0, i32 0
  %457 = load %struct.UT_hash_table*, %struct.UT_hash_table** %456, align 8
  %458 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %457, i32 0, i32 5
  store i64 %453, i64* %458, align 8
  %459 = call noalias i8* @malloc(i64 512) #7
  %460 = bitcast i8* %459 to %struct.UT_hash_bucket*
  %461 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %462 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %461, i32 0, i32 2
  %463 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %462, i32 0, i32 0
  %464 = load %struct.UT_hash_table*, %struct.UT_hash_table** %463, align 8
  %465 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %464, i32 0, i32 0
  store %struct.UT_hash_bucket* %460, %struct.UT_hash_bucket** %465, align 8
  %466 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %467 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %466, i32 0, i32 2
  %468 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %467, i32 0, i32 0
  %469 = load %struct.UT_hash_table*, %struct.UT_hash_table** %468, align 8
  %470 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %469, i32 0, i32 10
  store i32 -1609490463, i32* %470, align 8
  %471 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %472 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %471, i32 0, i32 2
  %473 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %472, i32 0, i32 0
  %474 = load %struct.UT_hash_table*, %struct.UT_hash_table** %473, align 8
  %475 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %474, i32 0, i32 0
  %476 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %475, align 8
  %477 = icmp ne %struct.UT_hash_bucket* %476, null
  br i1 %477, label %479, label %478

478:                                              ; preds = %423
  call void @exit(i32 -1) #8
  unreachable

479:                                              ; preds = %423
  %480 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %481 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %480, i32 0, i32 2
  %482 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %481, i32 0, i32 0
  %483 = load %struct.UT_hash_table*, %struct.UT_hash_table** %482, align 8
  %484 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %483, i32 0, i32 0
  %485 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %484, align 8
  %486 = bitcast %struct.UT_hash_bucket* %485 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %486, i8 0, i64 512, i1 false)
  br label %487

487:                                              ; preds = %479
  br label %488

488:                                              ; preds = %487
  br label %489

489:                                              ; preds = %488
  %490 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  store %struct.ptr_obj* %490, %struct.ptr_obj** @ptr_map, align 8
  br label %538

491:                                              ; preds = %388
  %492 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %493 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %492, i32 0, i32 2
  %494 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %493, i32 0, i32 0
  %495 = load %struct.UT_hash_table*, %struct.UT_hash_table** %494, align 8
  %496 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %497 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %496, i32 0, i32 2
  %498 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %497, i32 0, i32 0
  store %struct.UT_hash_table* %495, %struct.UT_hash_table** %498, align 8
  br label %499

499:                                              ; preds = %491
  %500 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %501 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %500, i32 0, i32 2
  %502 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %501, i32 0, i32 2
  store i8* null, i8** %502, align 8
  %503 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %504 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %503, i32 0, i32 2
  %505 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %504, i32 0, i32 0
  %506 = load %struct.UT_hash_table*, %struct.UT_hash_table** %505, align 8
  %507 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %506, i32 0, i32 4
  %508 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %507, align 8
  %509 = bitcast %struct.UT_hash_handle* %508 to i8*
  %510 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %511 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %510, i32 0, i32 2
  %512 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %511, i32 0, i32 0
  %513 = load %struct.UT_hash_table*, %struct.UT_hash_table** %512, align 8
  %514 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %513, i32 0, i32 5
  %515 = load i64, i64* %514, align 8
  %516 = sub i64 0, %515
  %517 = getelementptr inbounds i8, i8* %509, i64 %516
  %518 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %519 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %518, i32 0, i32 2
  %520 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %519, i32 0, i32 1
  store i8* %517, i8** %520, align 8
  %521 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %522 = bitcast %struct.ptr_obj* %521 to i8*
  %523 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %524 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %523, i32 0, i32 2
  %525 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %524, i32 0, i32 0
  %526 = load %struct.UT_hash_table*, %struct.UT_hash_table** %525, align 8
  %527 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %526, i32 0, i32 4
  %528 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %527, align 8
  %529 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %528, i32 0, i32 2
  store i8* %522, i8** %529, align 8
  %530 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %531 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %530, i32 0, i32 2
  %532 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %533 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %532, i32 0, i32 2
  %534 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %533, i32 0, i32 0
  %535 = load %struct.UT_hash_table*, %struct.UT_hash_table** %534, align 8
  %536 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %535, i32 0, i32 4
  store %struct.UT_hash_handle* %531, %struct.UT_hash_handle** %536, align 8
  br label %537

537:                                              ; preds = %499
  br label %538

538:                                              ; preds = %537, %489
  br label %539

539:                                              ; preds = %538
  %540 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %541 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %540, i32 0, i32 2
  %542 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %541, i32 0, i32 0
  %543 = load %struct.UT_hash_table*, %struct.UT_hash_table** %542, align 8
  %544 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %543, i32 0, i32 3
  %545 = load i32, i32* %544, align 8
  %546 = add i32 %545, 1
  store i32 %546, i32* %544, align 8
  br label %547

547:                                              ; preds = %539
  %548 = load i32, i32* %4, align 4
  %549 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %550 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %549, i32 0, i32 2
  %551 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %550, i32 0, i32 0
  %552 = load %struct.UT_hash_table*, %struct.UT_hash_table** %551, align 8
  %553 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %552, i32 0, i32 1
  %554 = load i32, i32* %553, align 8
  %555 = sub i32 %554, 1
  %556 = and i32 %548, %555
  store i32 %556, i32* %9, align 4
  br label %557

557:                                              ; preds = %547
  br label %558

558:                                              ; preds = %557
  %559 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %560 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %559, i32 0, i32 2
  %561 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %560, i32 0, i32 0
  %562 = load %struct.UT_hash_table*, %struct.UT_hash_table** %561, align 8
  %563 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %562, i32 0, i32 0
  %564 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %563, align 8
  %565 = load i32, i32* %9, align 4
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %564, i64 %566
  store %struct.UT_hash_bucket* %567, %struct.UT_hash_bucket** %10, align 8
  %568 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %569 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %568, i32 0, i32 1
  %570 = load i32, i32* %569, align 8
  %571 = add i32 %570, 1
  store i32 %571, i32* %569, align 8
  %572 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %573 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %572, i32 0, i32 0
  %574 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %573, align 8
  %575 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %576 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %575, i32 0, i32 2
  %577 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %576, i32 0, i32 4
  store %struct.UT_hash_handle* %574, %struct.UT_hash_handle** %577, align 8
  %578 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %579 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %578, i32 0, i32 2
  %580 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %579, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %580, align 8
  %581 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %582 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %581, i32 0, i32 0
  %583 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %582, align 8
  %584 = icmp ne %struct.UT_hash_handle* %583, null
  br i1 %584, label %585, label %592

585:                                              ; preds = %558
  %586 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %587 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %586, i32 0, i32 2
  %588 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %589 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %588, i32 0, i32 0
  %590 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %589, align 8
  %591 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %590, i32 0, i32 3
  store %struct.UT_hash_handle* %587, %struct.UT_hash_handle** %591, align 8
  br label %592

592:                                              ; preds = %585, %558
  %593 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %594 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %593, i32 0, i32 2
  %595 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %596 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %595, i32 0, i32 0
  store %struct.UT_hash_handle* %594, %struct.UT_hash_handle** %596, align 8
  %597 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %598 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %597, i32 0, i32 1
  %599 = load i32, i32* %598, align 8
  %600 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %601 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %600, i32 0, i32 2
  %602 = load i32, i32* %601, align 4
  %603 = add i32 %602, 1
  %604 = mul i32 %603, 10
  %605 = icmp uge i32 %599, %604
  br i1 %605, label %606, label %871

606:                                              ; preds = %592
  %607 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %608 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %607, i32 0, i32 2
  %609 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %608, i32 0, i32 0
  %610 = load %struct.UT_hash_table*, %struct.UT_hash_table** %609, align 8
  %611 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %610, i32 0, i32 9
  %612 = load i32, i32* %611, align 4
  %613 = icmp ne i32 %612, 0
  br i1 %613, label %871, label %614

614:                                              ; preds = %606
  br label %615

615:                                              ; preds = %614
  %616 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %617 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %616, i32 0, i32 2
  %618 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %617, i32 0, i32 0
  %619 = load %struct.UT_hash_table*, %struct.UT_hash_table** %618, align 8
  %620 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %619, i32 0, i32 1
  %621 = load i32, i32* %620, align 8
  %622 = zext i32 %621 to i64
  %623 = mul i64 16, %622
  %624 = mul i64 %623, 2
  %625 = call noalias i8* @malloc(i64 %624) #7
  %626 = bitcast i8* %625 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %626, %struct.UT_hash_bucket** %15, align 8
  %627 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %628 = icmp ne %struct.UT_hash_bucket* %627, null
  br i1 %628, label %630, label %629

629:                                              ; preds = %615
  call void @exit(i32 -1) #8
  unreachable

630:                                              ; preds = %615
  %631 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %632 = bitcast %struct.UT_hash_bucket* %631 to i8*
  %633 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %634 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %633, i32 0, i32 2
  %635 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %634, i32 0, i32 0
  %636 = load %struct.UT_hash_table*, %struct.UT_hash_table** %635, align 8
  %637 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %636, i32 0, i32 1
  %638 = load i32, i32* %637, align 8
  %639 = zext i32 %638 to i64
  %640 = mul i64 16, %639
  %641 = mul i64 %640, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %632, i8 0, i64 %641, i1 false)
  %642 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %643 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %642, i32 0, i32 2
  %644 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %643, i32 0, i32 0
  %645 = load %struct.UT_hash_table*, %struct.UT_hash_table** %644, align 8
  %646 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %645, i32 0, i32 3
  %647 = load i32, i32* %646, align 8
  %648 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %649 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %648, i32 0, i32 2
  %650 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %649, i32 0, i32 0
  %651 = load %struct.UT_hash_table*, %struct.UT_hash_table** %650, align 8
  %652 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %651, i32 0, i32 2
  %653 = load i32, i32* %652, align 4
  %654 = add i32 %653, 1
  %655 = lshr i32 %647, %654
  %656 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %657 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %656, i32 0, i32 2
  %658 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %657, i32 0, i32 0
  %659 = load %struct.UT_hash_table*, %struct.UT_hash_table** %658, align 8
  %660 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %659, i32 0, i32 3
  %661 = load i32, i32* %660, align 8
  %662 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %663 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %662, i32 0, i32 2
  %664 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %663, i32 0, i32 0
  %665 = load %struct.UT_hash_table*, %struct.UT_hash_table** %664, align 8
  %666 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %665, i32 0, i32 1
  %667 = load i32, i32* %666, align 8
  %668 = mul i32 %667, 2
  %669 = sub i32 %668, 1
  %670 = and i32 %661, %669
  %671 = icmp ne i32 %670, 0
  %672 = zext i1 %671 to i64
  %673 = select i1 %671, i32 1, i32 0
  %674 = add i32 %655, %673
  %675 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %676 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %675, i32 0, i32 2
  %677 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %676, i32 0, i32 0
  %678 = load %struct.UT_hash_table*, %struct.UT_hash_table** %677, align 8
  %679 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %678, i32 0, i32 6
  store i32 %674, i32* %679, align 8
  %680 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %681 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %680, i32 0, i32 2
  %682 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %681, i32 0, i32 0
  %683 = load %struct.UT_hash_table*, %struct.UT_hash_table** %682, align 8
  %684 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %683, i32 0, i32 7
  store i32 0, i32* %684, align 4
  store i32 0, i32* %12, align 4
  br label %685

685:                                              ; preds = %794, %630
  %686 = load i32, i32* %12, align 4
  %687 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %688 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %687, i32 0, i32 2
  %689 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %688, i32 0, i32 0
  %690 = load %struct.UT_hash_table*, %struct.UT_hash_table** %689, align 8
  %691 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %690, i32 0, i32 1
  %692 = load i32, i32* %691, align 8
  %693 = icmp ult i32 %686, %692
  br i1 %693, label %694, label %797

694:                                              ; preds = %685
  %695 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %696 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %695, i32 0, i32 2
  %697 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %696, i32 0, i32 0
  %698 = load %struct.UT_hash_table*, %struct.UT_hash_table** %697, align 8
  %699 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %698, i32 0, i32 0
  %700 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %699, align 8
  %701 = load i32, i32* %12, align 4
  %702 = zext i32 %701 to i64
  %703 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %700, i64 %702
  %704 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %703, i32 0, i32 0
  %705 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %704, align 8
  store %struct.UT_hash_handle* %705, %struct.UT_hash_handle** %13, align 8
  br label %706

706:                                              ; preds = %788, %694
  %707 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %708 = icmp ne %struct.UT_hash_handle* %707, null
  br i1 %708, label %709, label %793

709:                                              ; preds = %706
  %710 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %711 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %710, i32 0, i32 4
  %712 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %711, align 8
  store %struct.UT_hash_handle* %712, %struct.UT_hash_handle** %14, align 8
  br label %713

713:                                              ; preds = %709
  %714 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %715 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %714, i32 0, i32 7
  %716 = load i32, i32* %715, align 4
  %717 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %718 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %717, i32 0, i32 2
  %719 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %718, i32 0, i32 0
  %720 = load %struct.UT_hash_table*, %struct.UT_hash_table** %719, align 8
  %721 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %720, i32 0, i32 1
  %722 = load i32, i32* %721, align 8
  %723 = mul i32 %722, 2
  %724 = sub i32 %723, 1
  %725 = and i32 %716, %724
  store i32 %725, i32* %11, align 4
  br label %726

726:                                              ; preds = %713
  %727 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %728 = load i32, i32* %11, align 4
  %729 = zext i32 %728 to i64
  %730 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %727, i64 %729
  store %struct.UT_hash_bucket* %730, %struct.UT_hash_bucket** %16, align 8
  %731 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %732 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %731, i32 0, i32 1
  %733 = load i32, i32* %732, align 8
  %734 = add i32 %733, 1
  store i32 %734, i32* %732, align 8
  %735 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %736 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %735, i32 0, i32 2
  %737 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %736, i32 0, i32 0
  %738 = load %struct.UT_hash_table*, %struct.UT_hash_table** %737, align 8
  %739 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %738, i32 0, i32 6
  %740 = load i32, i32* %739, align 8
  %741 = icmp ugt i32 %734, %740
  br i1 %741, label %742, label %770

742:                                              ; preds = %726
  %743 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %744 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %743, i32 0, i32 2
  %745 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %744, i32 0, i32 0
  %746 = load %struct.UT_hash_table*, %struct.UT_hash_table** %745, align 8
  %747 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %746, i32 0, i32 7
  %748 = load i32, i32* %747, align 4
  %749 = add i32 %748, 1
  store i32 %749, i32* %747, align 4
  %750 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %751 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %750, i32 0, i32 1
  %752 = load i32, i32* %751, align 8
  %753 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %754 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %753, i32 0, i32 2
  %755 = load i32, i32* %754, align 4
  %756 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %757 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %756, i32 0, i32 2
  %758 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %757, i32 0, i32 0
  %759 = load %struct.UT_hash_table*, %struct.UT_hash_table** %758, align 8
  %760 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %759, i32 0, i32 6
  %761 = load i32, i32* %760, align 8
  %762 = mul i32 %755, %761
  %763 = icmp ugt i32 %752, %762
  br i1 %763, label %764, label %769

764:                                              ; preds = %742
  %765 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %766 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %765, i32 0, i32 2
  %767 = load i32, i32* %766, align 4
  %768 = add i32 %767, 1
  store i32 %768, i32* %766, align 4
  br label %769

769:                                              ; preds = %764, %742
  br label %770

770:                                              ; preds = %769, %726
  %771 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %772 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %771, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %772, align 8
  %773 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %774 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %773, i32 0, i32 0
  %775 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %774, align 8
  %776 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %777 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %776, i32 0, i32 4
  store %struct.UT_hash_handle* %775, %struct.UT_hash_handle** %777, align 8
  %778 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %779 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %778, i32 0, i32 0
  %780 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %779, align 8
  %781 = icmp ne %struct.UT_hash_handle* %780, null
  br i1 %781, label %782, label %788

782:                                              ; preds = %770
  %783 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %784 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %785 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %784, i32 0, i32 0
  %786 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %785, align 8
  %787 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %786, i32 0, i32 3
  store %struct.UT_hash_handle* %783, %struct.UT_hash_handle** %787, align 8
  br label %788

788:                                              ; preds = %782, %770
  %789 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %13, align 8
  %790 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %16, align 8
  %791 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %790, i32 0, i32 0
  store %struct.UT_hash_handle* %789, %struct.UT_hash_handle** %791, align 8
  %792 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %14, align 8
  store %struct.UT_hash_handle* %792, %struct.UT_hash_handle** %13, align 8
  br label %706

793:                                              ; preds = %706
  br label %794

794:                                              ; preds = %793
  %795 = load i32, i32* %12, align 4
  %796 = add i32 %795, 1
  store i32 %796, i32* %12, align 4
  br label %685

797:                                              ; preds = %685
  %798 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %799 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %798, i32 0, i32 2
  %800 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %799, i32 0, i32 0
  %801 = load %struct.UT_hash_table*, %struct.UT_hash_table** %800, align 8
  %802 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %801, i32 0, i32 0
  %803 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %802, align 8
  %804 = bitcast %struct.UT_hash_bucket* %803 to i8*
  call void @free(i8* %804) #7
  %805 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %806 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %805, i32 0, i32 2
  %807 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %806, i32 0, i32 0
  %808 = load %struct.UT_hash_table*, %struct.UT_hash_table** %807, align 8
  %809 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %808, i32 0, i32 1
  %810 = load i32, i32* %809, align 8
  %811 = mul i32 %810, 2
  store i32 %811, i32* %809, align 8
  %812 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %813 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %812, i32 0, i32 2
  %814 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %813, i32 0, i32 0
  %815 = load %struct.UT_hash_table*, %struct.UT_hash_table** %814, align 8
  %816 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %815, i32 0, i32 2
  %817 = load i32, i32* %816, align 4
  %818 = add i32 %817, 1
  store i32 %818, i32* %816, align 4
  %819 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %15, align 8
  %820 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %821 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %820, i32 0, i32 2
  %822 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %821, i32 0, i32 0
  %823 = load %struct.UT_hash_table*, %struct.UT_hash_table** %822, align 8
  %824 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %823, i32 0, i32 0
  store %struct.UT_hash_bucket* %819, %struct.UT_hash_bucket** %824, align 8
  %825 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %826 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %825, i32 0, i32 2
  %827 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %826, i32 0, i32 0
  %828 = load %struct.UT_hash_table*, %struct.UT_hash_table** %827, align 8
  %829 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %828, i32 0, i32 7
  %830 = load i32, i32* %829, align 4
  %831 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %832 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %831, i32 0, i32 2
  %833 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %832, i32 0, i32 0
  %834 = load %struct.UT_hash_table*, %struct.UT_hash_table** %833, align 8
  %835 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %834, i32 0, i32 3
  %836 = load i32, i32* %835, align 8
  %837 = lshr i32 %836, 1
  %838 = icmp ugt i32 %830, %837
  br i1 %838, label %839, label %847

839:                                              ; preds = %797
  %840 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %841 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %840, i32 0, i32 2
  %842 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %841, i32 0, i32 0
  %843 = load %struct.UT_hash_table*, %struct.UT_hash_table** %842, align 8
  %844 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %843, i32 0, i32 8
  %845 = load i32, i32* %844, align 8
  %846 = add i32 %845, 1
  br label %848

847:                                              ; preds = %797
  br label %848

848:                                              ; preds = %847, %839
  %849 = phi i32 [ %846, %839 ], [ 0, %847 ]
  %850 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %851 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %850, i32 0, i32 2
  %852 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %851, i32 0, i32 0
  %853 = load %struct.UT_hash_table*, %struct.UT_hash_table** %852, align 8
  %854 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %853, i32 0, i32 8
  store i32 %849, i32* %854, align 8
  %855 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %856 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %855, i32 0, i32 2
  %857 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %856, i32 0, i32 0
  %858 = load %struct.UT_hash_table*, %struct.UT_hash_table** %857, align 8
  %859 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %858, i32 0, i32 8
  %860 = load i32, i32* %859, align 8
  %861 = icmp ugt i32 %860, 1
  br i1 %861, label %862, label %868

862:                                              ; preds = %848
  %863 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %864 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %863, i32 0, i32 2
  %865 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %864, i32 0, i32 0
  %866 = load %struct.UT_hash_table*, %struct.UT_hash_table** %865, align 8
  %867 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %866, i32 0, i32 9
  store i32 1, i32* %867, align 4
  br label %868

868:                                              ; preds = %862, %848
  br label %869

869:                                              ; preds = %868
  br label %870

870:                                              ; preds = %869
  br label %871

871:                                              ; preds = %870, %606, %592
  br label %872

872:                                              ; preds = %871
  br label %873

873:                                              ; preds = %872
  br label %874

874:                                              ; preds = %873
  br label %875

875:                                              ; preds = %874
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
define dso_local %struct.ptr_obj* @find_ptr(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.ptr_obj*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
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
  %16 = bitcast i8** %2 to i8*
  store i8* %16, i8** %8, align 8
  store i32 -17973521, i32* %4, align 4
  store i32 -1640531527, i32* %6, align 4
  store i32 -1640531527, i32* %5, align 4
  store i32 8, i32* %7, align 4
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
  %191 = add i32 %190, 8
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

201:                                              ; preds = %189, %193
  %202 = load i8*, i8** %8, align 8
  %203 = getelementptr inbounds i8, i8* %202, i64 9
  %204 = load i8, i8* %203, align 1
  %205 = zext i8 %204 to i32
  %206 = shl i32 %205, 16
  %207 = load i32, i32* %4, align 4
  %208 = add i32 %207, %206
  store i32 %208, i32* %4, align 4
  br label %209

209:                                              ; preds = %189, %201
  %210 = load i8*, i8** %8, align 8
  %211 = getelementptr inbounds i8, i8* %210, i64 8
  %212 = load i8, i8* %211, align 1
  %213 = zext i8 %212 to i32
  %214 = shl i32 %213, 8
  %215 = load i32, i32* %4, align 4
  %216 = add i32 %215, %214
  store i32 %216, i32* %4, align 4
  br label %217

217:                                              ; preds = %189, %209
  %218 = load i8*, i8** %8, align 8
  %219 = getelementptr inbounds i8, i8* %218, i64 7
  %220 = load i8, i8* %219, align 1
  %221 = zext i8 %220 to i32
  %222 = shl i32 %221, 24
  %223 = load i32, i32* %6, align 4
  %224 = add i32 %223, %222
  store i32 %224, i32* %6, align 4
  br label %225

225:                                              ; preds = %189, %217
  %226 = load i8*, i8** %8, align 8
  %227 = getelementptr inbounds i8, i8* %226, i64 6
  %228 = load i8, i8* %227, align 1
  %229 = zext i8 %228 to i32
  %230 = shl i32 %229, 16
  %231 = load i32, i32* %6, align 4
  %232 = add i32 %231, %230
  store i32 %232, i32* %6, align 4
  br label %233

233:                                              ; preds = %189, %225
  %234 = load i8*, i8** %8, align 8
  %235 = getelementptr inbounds i8, i8* %234, i64 5
  %236 = load i8, i8* %235, align 1
  %237 = zext i8 %236 to i32
  %238 = shl i32 %237, 8
  %239 = load i32, i32* %6, align 4
  %240 = add i32 %239, %238
  store i32 %240, i32* %6, align 4
  br label %241

241:                                              ; preds = %189, %233
  %242 = load i8*, i8** %8, align 8
  %243 = getelementptr inbounds i8, i8* %242, i64 4
  %244 = load i8, i8* %243, align 1
  %245 = zext i8 %244 to i32
  %246 = load i32, i32* %6, align 4
  %247 = add i32 %246, %245
  store i32 %247, i32* %6, align 4
  br label %248

248:                                              ; preds = %189, %241
  %249 = load i8*, i8** %8, align 8
  %250 = getelementptr inbounds i8, i8* %249, i64 3
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = shl i32 %252, 24
  %254 = load i32, i32* %5, align 4
  %255 = add i32 %254, %253
  store i32 %255, i32* %5, align 4
  br label %256

256:                                              ; preds = %189, %248
  %257 = load i8*, i8** %8, align 8
  %258 = getelementptr inbounds i8, i8* %257, i64 2
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = shl i32 %260, 16
  %262 = load i32, i32* %5, align 4
  %263 = add i32 %262, %261
  store i32 %263, i32* %5, align 4
  br label %264

264:                                              ; preds = %189, %256
  %265 = load i8*, i8** %8, align 8
  %266 = getelementptr inbounds i8, i8* %265, i64 1
  %267 = load i8, i8* %266, align 1
  %268 = zext i8 %267 to i32
  %269 = shl i32 %268, 8
  %270 = load i32, i32* %5, align 4
  %271 = add i32 %270, %269
  store i32 %271, i32* %5, align 4
  br label %272

272:                                              ; preds = %189, %264
  %273 = load i8*, i8** %8, align 8
  %274 = getelementptr inbounds i8, i8* %273, i64 0
  %275 = load i8, i8* %274, align 1
  %276 = zext i8 %275 to i32
  %277 = load i32, i32* %5, align 4
  %278 = add i32 %277, %276
  store i32 %278, i32* %5, align 4
  br label %279

279:                                              ; preds = %189, %272
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
  %445 = icmp eq i64 %444, 8
  br i1 %445, label %446, label %456

446:                                              ; preds = %439
  %447 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  %448 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %447, i32 0, i32 2
  %449 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %448, i32 0, i32 5
  %450 = load i8*, i8** %449, align 8
  %451 = bitcast i8** %2 to i8*
  %452 = call i32 @memcmp(i8* %450, i8* %451, i64 8) #9
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
  %6 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  %7 = icmp ne %struct.ptr_obj* %6, null
  br i1 %7, label %8, label %187

8:                                                ; preds = %1
  br label %9

9:                                                ; preds = %8
  %10 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  %11 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %10, i32 0, i32 2
  store %struct.UT_hash_handle* %11, %struct.UT_hash_handle** %3, align 8
  %12 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %13 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %12, i32 0, i32 1
  %14 = load i8*, i8** %13, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %34

16:                                               ; preds = %9
  %17 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %18 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %17, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %21, label %34

21:                                               ; preds = %16
  %22 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %23 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %22, i32 0, i32 2
  %24 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %23, i32 0, i32 0
  %25 = load %struct.UT_hash_table*, %struct.UT_hash_table** %24, align 8
  %26 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %25, i32 0, i32 0
  %27 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %28 = bitcast %struct.UT_hash_bucket* %27 to i8*
  call void @free(i8* %28) #7
  %29 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %30 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %29, i32 0, i32 2
  %31 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %30, i32 0, i32 0
  %32 = load %struct.UT_hash_table*, %struct.UT_hash_table** %31, align 8
  %33 = bitcast %struct.UT_hash_table* %32 to i8*
  call void @free(i8* %33) #7
  store %struct.ptr_obj* null, %struct.ptr_obj** @ptr_map, align 8
  br label %183

34:                                               ; preds = %16, %9
  %35 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %36 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %37 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %36, i32 0, i32 2
  %38 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %37, i32 0, i32 0
  %39 = load %struct.UT_hash_table*, %struct.UT_hash_table** %38, align 8
  %40 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %39, i32 0, i32 4
  %41 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %42 = icmp eq %struct.UT_hash_handle* %35, %41
  br i1 %42, label %43, label %60

43:                                               ; preds = %34
  %44 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %45 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %44, i32 0, i32 1
  %46 = load i8*, i8** %45, align 8
  %47 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %48 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %47, i32 0, i32 2
  %49 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %48, i32 0, i32 0
  %50 = load %struct.UT_hash_table*, %struct.UT_hash_table** %49, align 8
  %51 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %50, i32 0, i32 5
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds i8, i8* %46, i64 %52
  %54 = bitcast i8* %53 to %struct.UT_hash_handle*
  %55 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %56 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %55, i32 0, i32 2
  %57 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %56, i32 0, i32 0
  %58 = load %struct.UT_hash_table*, %struct.UT_hash_table** %57, align 8
  %59 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %58, i32 0, i32 4
  store %struct.UT_hash_handle* %54, %struct.UT_hash_handle** %59, align 8
  br label %60

60:                                               ; preds = %43, %34
  %61 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %62 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %61, i32 0, i32 1
  %63 = load i8*, i8** %62, align 8
  %64 = icmp ne i8* %63, null
  br i1 %64, label %65, label %81

65:                                               ; preds = %60
  %66 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %67 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %66, i32 0, i32 2
  %68 = load i8*, i8** %67, align 8
  %69 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %70 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %69, i32 0, i32 1
  %71 = load i8*, i8** %70, align 8
  %72 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %73 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %72, i32 0, i32 2
  %74 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %73, i32 0, i32 0
  %75 = load %struct.UT_hash_table*, %struct.UT_hash_table** %74, align 8
  %76 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %75, i32 0, i32 5
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds i8, i8* %71, i64 %77
  %79 = bitcast i8* %78 to %struct.UT_hash_handle*
  %80 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %79, i32 0, i32 2
  store i8* %68, i8** %80, align 8
  br label %88

81:                                               ; preds = %60
  br label %82

82:                                               ; preds = %81
  %83 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %84 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %83, i32 0, i32 2
  %85 = load i8*, i8** %84, align 8
  %86 = bitcast i8* %85 to %struct.ptr_obj*
  store %struct.ptr_obj* %86, %struct.ptr_obj** @ptr_map, align 8
  br label %87

87:                                               ; preds = %82
  br label %88

88:                                               ; preds = %87, %65
  %89 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %90 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %89, i32 0, i32 2
  %91 = load i8*, i8** %90, align 8
  %92 = icmp ne i8* %91, null
  br i1 %92, label %93, label %109

93:                                               ; preds = %88
  %94 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %95 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %94, i32 0, i32 1
  %96 = load i8*, i8** %95, align 8
  %97 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %98 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %97, i32 0, i32 2
  %99 = load i8*, i8** %98, align 8
  %100 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %101 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %100, i32 0, i32 2
  %102 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %101, i32 0, i32 0
  %103 = load %struct.UT_hash_table*, %struct.UT_hash_table** %102, align 8
  %104 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %103, i32 0, i32 5
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds i8, i8* %99, i64 %105
  %107 = bitcast i8* %106 to %struct.UT_hash_handle*
  %108 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %107, i32 0, i32 1
  store i8* %96, i8** %108, align 8
  br label %109

109:                                              ; preds = %93, %88
  br label %110

110:                                              ; preds = %109
  %111 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %112 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %111, i32 0, i32 7
  %113 = load i32, i32* %112, align 4
  %114 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %115 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %114, i32 0, i32 2
  %116 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %115, i32 0, i32 0
  %117 = load %struct.UT_hash_table*, %struct.UT_hash_table** %116, align 8
  %118 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %117, i32 0, i32 1
  %119 = load i32, i32* %118, align 8
  %120 = sub i32 %119, 1
  %121 = and i32 %113, %120
  store i32 %121, i32* %4, align 4
  br label %122

122:                                              ; preds = %110
  br label %123

123:                                              ; preds = %122
  %124 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %125 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %124, i32 0, i32 2
  %126 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %125, i32 0, i32 0
  %127 = load %struct.UT_hash_table*, %struct.UT_hash_table** %126, align 8
  %128 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %127, i32 0, i32 0
  %129 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %128, align 8
  %130 = load i32, i32* %4, align 4
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %129, i64 %131
  store %struct.UT_hash_bucket* %132, %struct.UT_hash_bucket** %5, align 8
  %133 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %5, align 8
  %134 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %133, i32 0, i32 1
  %135 = load i32, i32* %134, align 8
  %136 = add i32 %135, -1
  store i32 %136, i32* %134, align 8
  %137 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %5, align 8
  %138 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %137, i32 0, i32 0
  %139 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %138, align 8
  %140 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %141 = icmp eq %struct.UT_hash_handle* %139, %140
  br i1 %141, label %142, label %148

142:                                              ; preds = %123
  %143 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %144 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %143, i32 0, i32 4
  %145 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %144, align 8
  %146 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %5, align 8
  %147 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %146, i32 0, i32 0
  store %struct.UT_hash_handle* %145, %struct.UT_hash_handle** %147, align 8
  br label %148

148:                                              ; preds = %142, %123
  %149 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %150 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %149, i32 0, i32 3
  %151 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %150, align 8
  %152 = icmp ne %struct.UT_hash_handle* %151, null
  br i1 %152, label %153, label %161

153:                                              ; preds = %148
  %154 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %155 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %154, i32 0, i32 4
  %156 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %155, align 8
  %157 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %158 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %157, i32 0, i32 3
  %159 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %158, align 8
  %160 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %159, i32 0, i32 4
  store %struct.UT_hash_handle* %156, %struct.UT_hash_handle** %160, align 8
  br label %161

161:                                              ; preds = %153, %148
  %162 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %163 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %162, i32 0, i32 4
  %164 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %163, align 8
  %165 = icmp ne %struct.UT_hash_handle* %164, null
  br i1 %165, label %166, label %174

166:                                              ; preds = %161
  %167 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %168 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %167, i32 0, i32 3
  %169 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %168, align 8
  %170 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %3, align 8
  %171 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %170, i32 0, i32 4
  %172 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %171, align 8
  %173 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %172, i32 0, i32 3
  store %struct.UT_hash_handle* %169, %struct.UT_hash_handle** %173, align 8
  br label %174

174:                                              ; preds = %166, %161
  br label %175

175:                                              ; preds = %174
  %176 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %177 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %176, i32 0, i32 2
  %178 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %177, i32 0, i32 0
  %179 = load %struct.UT_hash_table*, %struct.UT_hash_table** %178, align 8
  %180 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %179, i32 0, i32 3
  %181 = load i32, i32* %180, align 8
  %182 = add i32 %181, -1
  store i32 %182, i32* %180, align 8
  br label %183

183:                                              ; preds = %175, %21
  br label %184

184:                                              ; preds = %183
  %185 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  %186 = bitcast %struct.ptr_obj* %185 to i8*
  call void @free(i8* %186) #7
  br label %187

187:                                              ; preds = %184, %1
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
  %3 = alloca %struct.ptr_obj*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call %struct.ptr_obj* @find_ptr(i8* %4)
  store %struct.ptr_obj* %5, %struct.ptr_obj** %3, align 8
  %6 = load %struct.ptr_obj*, %struct.ptr_obj** %3, align 8
  call void @delete_ptr(%struct.ptr_obj* %6)
  %7 = load i8*, i8** %2, align 8
  call void @free(i8* %7) #7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_ptrs() #0 {
  %1 = alloca %struct.ptr_obj*, align 8
  %2 = alloca %struct.ptr_obj*, align 8
  %3 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  store %struct.ptr_obj* %3, %struct.ptr_obj** %1, align 8
  %4 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %5 = icmp ne %struct.ptr_obj* %4, null
  br i1 %5, label %6, label %11

6:                                                ; preds = %0
  %7 = load %struct.ptr_obj*, %struct.ptr_obj** @ptr_map, align 8
  %8 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %7, i32 0, i32 2
  %9 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %8, i32 0, i32 2
  %10 = load i8*, i8** %9, align 8
  br label %12

11:                                               ; preds = %0
  br label %12

12:                                               ; preds = %11, %6
  %13 = phi i8* [ %10, %6 ], [ null, %11 ]
  %14 = bitcast i8* %13 to %struct.ptr_obj*
  store %struct.ptr_obj* %14, %struct.ptr_obj** %2, align 8
  br label %15

15:                                               ; preds = %32, %12
  %16 = load %struct.ptr_obj*, %struct.ptr_obj** %1, align 8
  %17 = icmp ne %struct.ptr_obj* %16, null
  br i1 %17, label %18, label %35

18:                                               ; preds = %15
  %19 = load %struct.ptr_obj*, %struct.ptr_obj** %1, align 8
  %20 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %19, i32 0, i32 0
  %21 = load i8*, i8** %20, align 8
  call void @free(i8* %21) #7
  br label %22

22:                                               ; preds = %18
  %23 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  store %struct.ptr_obj* %23, %struct.ptr_obj** %1, align 8
  %24 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  %25 = icmp ne %struct.ptr_obj* %24, null
  br i1 %25, label %26, label %31

26:                                               ; preds = %22
  %27 = load %struct.ptr_obj*, %struct.ptr_obj** %2, align 8
  %28 = getelementptr inbounds %struct.ptr_obj, %struct.ptr_obj* %27, i32 0, i32 2
  %29 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %28, i32 0, i32 2
  %30 = load i8*, i8** %29, align 8
  br label %32

31:                                               ; preds = %22
  br label %32

32:                                               ; preds = %31, %26
  %33 = phi i8* [ %30, %26 ], [ null, %31 ]
  %34 = bitcast i8* %33 to %struct.ptr_obj*
  store %struct.ptr_obj* %34, %struct.ptr_obj** %2, align 8
  br label %15

35:                                               ; preds = %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @close_file_if_open(%struct._IO_FILE* %0) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = icmp ne %struct._IO_FILE* %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %7 = call i32 @fclose(%struct._IO_FILE* %6)
  br label %8

8:                                                ; preds = %5, %1
  ret void
}

declare dso_local i32 @fclose(%struct._IO_FILE*) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 5555, i32* %7, align 4
  %10 = load i32, i32* %7, align 4
  %11 = call i32 @shmget(i32 %10, i64 1, i32 438) #7
  store i32 %11, i32* %6, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 1) #8
  unreachable

14:                                               ; preds = %2
  %15 = load i32, i32* %6, align 4
  %16 = call i8* @shmat(i32 %15, i8* null, i32 0) #7
  %17 = bitcast i8* %16 to i32*
  store i32* %17, i32** %8, align 8
  %18 = icmp eq i32* %17, inttoptr (i64 -1 to i32*)
  br i1 %18, label %19, label %20

19:                                               ; preds = %14
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0))
  call void @exit(i32 1) #8
  unreachable

20:                                               ; preds = %14
  %21 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @__longjmp_buf__, i64 0, i64 0)) #10
  br label %22

22:                                               ; preds = %26, %20
  %23 = load i32*, i32** %8, align 8
  %24 = load i32, i32* %23, align 4
  %25 = icmp eq i32 %24, -2
  br i1 %25, label %26, label %27

26:                                               ; preds = %22
  br label %22

27:                                               ; preds = %22
  %28 = load i32*, i32** %8, align 8
  store i32* %28, i32** %9, align 8
  br label %29

29:                                               ; preds = %42, %27
  %30 = load i32*, i32** %9, align 8
  %31 = load i32, i32* %30, align 4
  %32 = sext i32 %31 to i64
  %33 = inttoptr i64 %32 to i8*
  %34 = icmp ne i8* %33, null
  br i1 %34, label %35, label %45

35:                                               ; preds = %29
  %36 = load i32*, i32** %9, align 8
  %37 = load i32, i32* %36, align 4
  %38 = icmp eq i32 %37, 10000
  br i1 %38, label %39, label %41

39:                                               ; preds = %35
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0))
  call void @exit(i32 1) #8
  unreachable

41:                                               ; preds = %35
  br label %42

42:                                               ; preds = %41
  %43 = load i32*, i32** %9, align 8
  %44 = getelementptr inbounds i32, i32* %43, i32 1
  store i32* %44, i32** %9, align 8
  br label %29

45:                                               ; preds = %29
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0))
  %47 = call i32 @start_main(i32 %0, i8** %1)
  call void @free_ptrs()
  %48 = load i32*, i32** %8, align 8
  store i32 -2, i32* %48, align 4
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @shmget(i32, i64, i32) #1

declare dso_local void @perror(i8*) #5

; Function Attrs: nounwind
declare dso_local i8* @shmat(i32, i8*, i32) #1

; Function Attrs: nounwind returns_twice
declare dso_local i32 @_setjmp(%struct.__jmp_buf_tag*) #6

declare dso_local i32 @printf(i8*, ...) #5

declare i32 @start_main(i32, i8**)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }
attributes #10 = { nounwind returns_twice }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
