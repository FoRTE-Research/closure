all: test afl-test

test: test.c
	../../build/compiler/closure-compiler -g -no-fuzz ./test.c -o test 

afl-test: test.c
	../../build/compiler/closure-compiler -g ./test.c -o afl-test

clean:
	rm -rf *.ll test afl-test
