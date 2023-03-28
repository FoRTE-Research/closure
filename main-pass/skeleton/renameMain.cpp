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

    /**
     * Simple function to rename the main method of a C program to 
     * Start_main, this way the stub is capable of calling the program
     */ 
    void rename_main(Module& M) {
			for (auto &F : M) {
				if (F.getName().str().find("main") != std::string::npos &&
            F.getName().str().length() == 4) {
          errs() << F.getName() << "\n";
					F.setName("start_main");
				}
			}
		}


    /**
     * This method adds a store and load instruction to the start of a basic block
     */
    void addShadowBackup(Module &M, GlobalVariable &original, GlobalVariable &clone)
    {
      Function* main = M.getFunction("start_main");
      BasicBlock* first_bb = &*main->begin();
      BasicBlock::iterator insertion_pt = first_bb->getFirstInsertionPt();
      
      IRBuilder<> IR(first_bb, insertion_pt);
      Value *v = dyn_cast<Value>(&clone);
      Value *v2 = dyn_cast<Value>(&original);
      LoadInst *Load = IR.CreateLoad(v);
      //Value *Inc = IR.CreateAdd(IR.getInt32(1), Load);
      StoreInst *Store = IR.CreateStore(Load, v2);
    }


    /**
     * Method for adding a copy of each global variable, and calls
     * addShadowBackup which adds a load and store inst to initialize the 
     * variables from their shadow backups
     */
    void cloneGlobals(Module& M)
    {
      auto& list = M.getGlobalList();
      for (auto &Global : list)
      {
        if(Global.getName().contains("_copy") != 1)
        {
          if(Global.getName().contains('.') != 1)
          {
            GlobalVariable* new_var = new GlobalVariable(
              M,
              (Global.getType()->isPointerTy() ? Global.getType()->getPointerElementType() : Global.getType()),
              Global.isConstant(),
              Global.getLinkage(),
              Global.getInitializer(),
              Global.getName() + "_copy"
            );
            new_var->setAlignment(MaybeAlign(Global.getAlignment()));
            //new_var->setInitializer(Global.getInitializer());
            errs() << new_var->getName() << '\n';
            //Global.setName(Global.getName() + "_copy");
            errs() << Global.getName() << '\n';
            addShadowBackup(M, Global, *new_var);
          }
        }
        else
        {
          errs() << "STOP COPYS\n";
        }
      }
    }

    /**
     * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
     */
    virtual bool runOnModule(Module &M) {
        rename_main(M);
        return true;
  }
};
}

char SkeletonPass::ID = 0;

// Register the pass so `opt -mempass` runs it.
static RegisterPass<SkeletonPass> X("mainpass", "renaming main");