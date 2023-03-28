/**
 * This pass is for renaming the main function of the desired piece of code.
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
#include "llvm/IR/GlobalVariable.h"
using namespace llvm;

namespace {
  struct SkeletonPass : public ModulePass {
    static char ID;
    SkeletonPass() : ModulePass(ID) {}

  // Adds the longjmp to any point where an exit occurs to avoid the function from crashing
    void mutexClear(Module &M, GlobalVariable &G)
    {
      Function* main = M.getFunction("start_main");
      BasicBlock* first_bb = &*main->begin()->getNextNode();

      auto &context = M.getContext();
      auto VoidTy = Type::getVoidTy(context);
      auto Int32Ty = Type::getInt32Ty(context);
      auto Int32PtrTy = Type::getInt32PtrTy(context);

      std::vector<Type*> mDestroyArgs;
      mDestroyArgs.push_back(G.getType());
      FunctionCallee c = 
						M.getOrInsertFunction("pthread_mutex_destroy", FunctionType::get(
								Int32Ty, mDestroyArgs,
								false));

      std::vector<Value*> args;
      args.push_back(&G);
      IRBuilder<>* builder = new IRBuilder<>(context);
      for (auto &F : M) {
        for (auto &B : F) {

          BasicBlock::iterator insertion_pt = B.getFirstInsertionPt();
          
          for (auto &I : B) {
            if(F.getName().contains("main") == 1 && F.getName().str().length() == 4)
            {
              errs() << "found start_main" << "\n";
              //errs() << I << "\n";
              if (ReturnInst* ret = dyn_cast<ReturnInst>(&I)) {
                --insertion_pt;
                --insertion_pt;
                --insertion_pt;
                --insertion_pt;
                --insertion_pt;
                builder->SetInsertPoint(&*(insertion_pt));
                CallInst* call2 = builder->CreateCall(c, args, "");
                errs() << "found the return" << "\n";
                break;
              }
            }
            
            insertion_pt++;
          }
        }
      }
    }

    /*
     * Currently only handles mutex when they are pthread, should look into standard C mutex
     */
    void handleMutex(Module &M, GlobalVariable& G) {
      mutexClear(M, G);
    }

    void handleSemaphore(Module &M, GlobalVariable& G) {
      errs() << G.getName() << "\n";
    }

    void findGlobals(Module& M)
    {
      auto& list = M.getGlobalList();
      for (auto &Global : list)
      {
        if(Global.getName().contains("_copy") != 1 && Global.getName().contains("mutex") == 1)
        {
          handleMutex(M, Global);
        }
        else if(Global.getName().contains("_copy") != 1 && Global.getName().contains("sem") == 1)
        {
          handleSemaphore(M, Global);
        }
      }
    }

    /**
     * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
     */
    virtual bool runOnModule(Module &M) {
        findGlobals(M);
        return true;
  }
};
}

char SkeletonPass::ID = 0;

// Register the pass so `opt -mempass` runs it.   
static RegisterPass<SkeletonPass> X("mutex", "generating shadow copy backups");