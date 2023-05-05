all: test-global afl-test-global

test-global: test-global.c
	../../closure-compiler.py -g -no-fuzz ./test-global.c -o test-global 

afl-test-global: test-global.c
	../../closure-compiler.py -g ./test-global.c -o afl-test-global

clean:
	rm -rf *.ll test-global afl-test-global
