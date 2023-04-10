AFL_CLANG=~/projects/AFLplusplus/afl-clang-fast

all: test-heap-inst

test-heap-afl: test-heap-instrumented.ll
	$(AFL_CLANG) -S -emit-llvm test-heap-instrumented.ll -o test-heap-afl.ll
	llc -filetype=obj ./test-heap-afl.ll
	$(AFL_CLANG) ./test-heap-afl.o -o ./test-heap-afl

test-heap-inst: test-heap-instrumented.ll
	clang  test-heap-instrumented.ll -o test-heap
	rm *.ll

test-heap-instrumented.ll: test-heap-linked.ll
	opt -S -load ../../heap-pass/build/libheapReset.so -heapreset ./test-heap-linked.ll -o test-heap-instrumented.ll

test-heap-linked.ll: stubMain.ll test-heap-global.ll
	llvm-link -S stubMain.ll test-heap-global.ll -o test-heap-linked.ll

stubMain.ll:
	$(AFL_CLANG) -E -I../../instrumentation/tools/src/ stubMain.c -o stubMain-preprocessed.c
	clang -I../../instrumentation/tools/src/ -S -emit-llvm stubMain-preprocessed.c -o stubMain.ll

test-heap-global.ll: test-heap-renamed.ll
	opt -S -load ../../global-pass/build/libcloneGlobals.so -clone-globals ./test-heap-renamed.ll -o test-heap-global.ll

test-heap-renamed.ll: test-heap.ll
	opt -S -load ../../main-pass/build/librenameMain.so -rename-main ./test-heap.ll -o test-heap-renamed.ll

test-heap.ll:
	clang -S -emit-llvm ./test-heap.c -o test-heap.ll

clean:
	rm -rf *.ll test-heap test-heap-afl *.o
