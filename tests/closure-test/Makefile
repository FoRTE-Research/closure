all: test afl-test

test: test.c
	../../closure-compiler.py -g -no-fuzz ./test.c -o test 

afl-test: test.c
	../../closure-compiler.py -g ./test.c -o afl-test

clean:
	rm -rf *.ll test afl-test
