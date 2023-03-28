build_test_hash:
	make build_t_hash FILE=testfiles/test_file_hash.c

build_hash:
	make build FILE=testfiles/random_exit_opt  hashmap.c

build_t_hash: 
	make stub
	clang -c -emit-llvm $(FILE) -o buildfiles/t.bc
	clang -c -emit-llvm testfiles/strmap.c -o buildfiles/strmap.bc
	llvm-dis buildfiles/t.bc
	opt -load ../../llvm-pass-renameMain/build/skeleton/libSkeletonPass.so -mainpass buildfiles/t.ll -o buildfiles/prog.bc
	llvm-dis buildfiles/prog.bc
	make joined
	llvm-link buildfiles/strmap.bc buildfiles/joined-opt.ll -o buildfiles/joined-opt.bc
	llvm-dis buildfiles/joined-opt.bc 
	make run_t

build: 
	make stub
	clang -c -emit-llvm $(FILE) -o buildfiles/prog.bc
	llvm-dis buildfiles/prog.bc
	opt -load ../../llvm-pass-renameMain/build/skeleton/libSkeletonPass.so -mainpass buildfiles/prog.ll -o buildfiles/prog.bc
	llvm-dis buildfiles/prog.bc
	make joined
	make run

build_noprint: 
	make stub_noprint
	clang -c -emit-llvm $(FILE) -o buildfiles/prog.bc
	llvm-dis buildfiles/prog.bc
	opt -load ../../llvm-pass-renameMain/build/skeleton/libSkeletonPass.so -mainpass buildfiles/prog.ll -o buildfiles/prog.bc
	llvm-dis buildfiles/prog.bc
	make joined_noprint
	make run

stub: stubMain.c
	clang -c -emit-llvm stubMain.c -o buildfiles/stub.bc
	llvm-dis buildfiles/stub.bc
	opt -load ../../llvm-pass-modifyStub/build/skeleton/libSkeletonPass.so -falsestart buildfiles/stub.ll -o buildfiles/stub.bc
	llvm-dis buildfiles/stub.bc
	
stub_noprint: stubMain_noprint.c
	clang -c -emit-llvm stubMain_noprint.c -o buildfiles/stub_noprint.bc
	llvm-dis buildfiles/stub_noprint.bc
	opt -load ../../llvm-pass-modifyStub/build/skeleton/libSkeletonPass.so -falsestart stub_noprint.ll -o stub_noprint.bc
	llvm-dis buildfiles/stub_noprint.bc

joined: buildfiles/stub.ll buildfiles/prog.ll
	llvm-link buildfiles/stub.ll buildfiles/prog.ll -o buildfiles/joined.bc
	llvm-dis buildfiles/joined.bc
	opt -load ../../llvm-pass-shadowGlobals/build/skeleton/libSkeletonPass.so -shadowGlobals buildfiles/joined.ll -o buildfiles/joined-opt.bc
	llvm-dis buildfiles/joined-opt.bc

joined_noprint: buildfiles/stub.ll buildfiles/prog.ll
	llvm-link buildfiles/stub_noprint.ll buildfiles/prog.ll -o buildfiles/joined.bc
	llvm-dis buildfiles/joined.bc
	opt -load ../../llvm-pass-shadowGlobals/build/skeleton/libSkeletonPass.so -shadowGlobals joined.ll -o joined-opt.bc
	llvm-dis buildfiles/joined-opt.bc

run: buildfiles/joined-opt.ll
	clang buildfiles/joined-opt.ll -o run.out


run_t: buildfiles/joined-opt.ll
	clang buildfiles/joined-opt.ll -o run.out