all: test-global-inst

test-global-inst: test-global-instrumented.ll
	clang test-global-instrumented.ll -o test-global
	rm *.ll

test-global-instrumented.ll: test-global-linked.ll
	opt -S -load ../../global-pass/build/libcloneGlobals.so -clone-globals ./test-global-linked.ll -o test-global-instrumented.ll

test-global-linked.ll: stubMain.ll test-global-renamed.ll
	llvm-link -S stubMain.ll test-global-renamed.ll -o test-global-linked.ll

stubMain.ll:
	clang -I../../instrumentation/tools/src/ -S -emit-llvm stubMain.c

test-global-renamed.ll: test-global.ll
	opt -S -load ../../main-pass/build/librenameMain.so -rename-main ./test-global.ll -o test-global-renamed.ll

test-global.ll:
	clang -S -emit-llvm ./test-global.c -o test-global.ll

clean:
	rm -rf *.ll test-global
