AFL_CLANG=~/projects/AFLplusplus/afl-clang-fast

all: test-inst

test-heap-afl: test-instrumented.ll
	$(AFL_CLANG) -S -emit-llvm test-heap-instrumented.ll -o test-heap-afl.ll
	llc -filetype=obj ./test-heap-afl.ll
	$(AFL_CLANG) ./test-heap-afl.o -o ./test-heap-afl

test-inst: test-instrumented.ll stubMain.ll
	clang  test-instrumented.ll stubMain.ll -o test-heap
	rm *.ll

# test-heap-instrumented.ll: test-heap.ll
# 	opt -S -load ../../heap-pass/build/libheapReset.so -heapreset ./test-heap.ll -o test-heap-instrumented.ll

stubMain.ll:
	$(AFL_CLANG) -E -I../../instrumentation/tools/src/ stubMain.c -o stubMain-preprocessed.c
	clang -I../../instrumentation/tools/src/ -S -emit-llvm stubMain-preprocessed.c -o stubMain.ll

test-instrumented.ll: test.ll
	opt -S  -load ../../build/heap-pass/libheapReset.so -heapreset ./test.ll -o ./test-instrumented.ll

test.ll:
	clang -S -emit-llvm ./test.c -o test.ll

clean:
	rm -rf *.ll test-heap test-heap-afl *.o
