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
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>
using namespace llvm;

namespace
{
  struct CloneGlobalsPass : public ModulePass
  {
    static char ID;
    CloneGlobalsPass() : ModulePass(ID) {}

    /**
     * This method inserts instructions to restore the global variable after every execution (using Load and Store)
     * It uses the copy of every global variable made in the cloneGlobals method.
     * Since globals can be present and used in any compilation unit, we insert a new function in each module
     * to restore globals
     */
    void restoreGlobalVariables(Module &M, GlobalVariable &original, GlobalVariable &clone)
    {
      auto funcType = FunctionType::get(Type::getVoidTy(M.getContext()), false);
      auto funcName = "restore-globals-" + M.getName().slice(2, M.getName().size() - 3);
      auto restoreGlobal = dyn_cast<Function>(M.getOrInsertFunction(funcName.str(), funcType).getCallee());
      BasicBlock *entryBlock = nullptr;

      if (restoreGlobal->getInstructionCount() == 0)
      {
        // Function has just been created, insert a basic block into it
        entryBlock = BasicBlock::Create(M.getContext(), "entry", restoreGlobal);
        ReturnInst::Create(M.getContext(), entryBlock);
      }
      else
      {
        entryBlock = &(restoreGlobal->getEntryBlock());
      }

      IRBuilder<> builder(M.getContext());
      builder.SetInsertPoint(entryBlock->getTerminator());

      // Let's create terminator for the function before inserting anything else

      Value *v = dyn_cast<Value>(&clone);
      Value *v2 = dyn_cast<Value>(&original);
      LoadInst *Load = builder.CreateLoad(v);
      StoreInst *Store = builder.CreateStore(Load, v2);
    }

    /**
     * Method for adding a copy of each global variable, and calls
     * restoreGlobalVariables which adds a load and store inst to initialize the
     * variables from their shadow backups
     */
    void cloneGlobals(Module &M)
    {

      auto &list = M.getGlobalList();

      for (auto &Global : list)
      {
        if (Global.getName().contains("_copy") == false)
        {
          if (Global.getName().contains('.') == false)
          {
            GlobalVariable *new_var = new GlobalVariable(
                M,
                (Global.getType()->isPointerTy() ? Global.getType()->getPointerElementType() : Global.getType()),
                Global.isConstant(),
                Global.getLinkage(),
                Global.getInitializer(),
                Global.getName() + "_copy");
            new_var->setAlignment(MaybeAlign(Global.getAlignment()));

            restoreGlobalVariables(M, Global, *new_var);
          }
        }
      }
    }

    /**
     * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
     */
    virtual bool runOnModule(Module &M)
    {
      errs() << "Running global variable clone pass\n";
      errs() << M.getName() << "\n\n";
      if (M.getFunction("start_main") == nullptr)
      {
        return false;
      }
      cloneGlobals(M);
      return true;
    }
  };
}

char CloneGlobalsPass::ID = 0;

void addModifyStubPass(const PassManagerBuilder & /* unused */,
                       legacy::PassManagerBase &PM)
{
  PM.add(new CloneGlobalsPass());
}

// Register the pass so `opt -mempass` runs it.
static RegisterPass<CloneGlobalsPass> X("clone-globals", "generating shadow copy backups");

// Tell frontends to run the pass automatically.
static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
                                addModifyStubPass);
static RegisterStandardPasses
    Z(PassManagerBuilder::EP_EnabledOnOptLevel0, addModifyStubPass);