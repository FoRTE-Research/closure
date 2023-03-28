/**
 * This pass helps stub a new main onto the original function so we can do further memory management
 * and rapid function testing.
 */ 

#include "llvm/Pass.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Dominators.h"


using namespace llvm;

namespace {
  struct SkeletonPass : public ModulePass {
    static char ID;
    SkeletonPass() : ModulePass(ID) {}

    void add_start_to_main(Module& M) {
		auto &context = M.getContext();
      	auto VoidTy = Type::getVoidTy(context);
      	auto Int64Ty = Type::getInt64Ty(context);
      	auto Int8PtrTy = Type::getInt8PtrTy(context);
		auto Int8Ty  = Type::getInt8Ty(context);
      	auto Int32PtrTy = Type::getInt32PtrTy(context);
		auto Int32Ty  = Type::getInt32Ty(context);

		std::vector<Type*> mainArgs;
		//mainArgs.push_back(Int32PtrTy);
      	//mainArgs.push_back(Int8PtrTy);

		Function* main = M.getFunction("main");
      	BasicBlock* first_bb = &*main->begin()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode()->getNextNode();
		errs() << first_bb << "\n";
      	BasicBlock::iterator insertion_pt = first_bb->getFirstInsertionPt();
		std::vector<Value*> argsV; 
		for(auto args = main->arg_begin(); args != main->arg_end(); ++args) {
			argsV.push_back(&*args);
			mainArgs.push_back(args->getType());
		}
		insertion_pt++;
		insertion_pt++;
		insertion_pt++;

		FunctionCallee c = 
						M.getOrInsertFunction("start_main", FunctionType::get(
								Int32Ty, mainArgs,
								false));
		//Value *val1 = &*main->arg_begin();
        //Value *valarray = &*main->arg_end();

		//args.push_back(val1);
		//args.push_back(valarray);

      	IRBuilder<>* builder = new IRBuilder<>(context);
      	builder->SetInsertPoint(&*insertion_pt);
      	CallInst* call = builder->CreateCall(c, argsV, "");

			/**for (auto &F : M) {
				if (F.getName().str().find("main") != std::string::npos) {
					Instruction* firstInst = &(F.front().front());
				 FunctionCallee c = 
						M.getOrInsertFunction("start_main", FunctionType::get(
								VoidTy, mainArgs, 
								false));
					//Function start_main = dyncast<Function>(c);				
					
					CallInst::Create(start_main, {}, "", firstInst);
				}
			}*/
		}

    virtual bool runOnModule(Module &M) {
        add_start_to_main(M);
        return true;
  }
};
}

char SkeletonPass::ID = 0;

// Register the pass so `opt -mempass` runs it.
static RegisterPass<SkeletonPass> X("falsestart", "altering the utility");