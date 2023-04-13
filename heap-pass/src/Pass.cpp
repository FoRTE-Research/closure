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

namespace
{
  struct HeapResetPass : public ModulePass
  {
    static char ID;
    HeapResetPass() : ModulePass(ID) {}

    // Replaces free and malloc with my own implementation of free and malloc from the
    // main stub
    void heapManage(Module &M)
    {
      auto freeFunc = M.getFunction("free");
      auto mallocFunc = M.getFunction("malloc");

      auto myMalloc = M.getOrInsertFunction("myMalloc", mallocFunc->getFunctionType());
      auto myFree = M.getOrInsertFunction("myFree", freeFunc->getFunctionType());

      mallocFunc->replaceAllUsesWith(myMalloc.getCallee());
      freeFunc->replaceAllUsesWith(myFree.getCallee());
    }

    /**
     * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
     */
    virtual bool runOnModule(Module &M)
    {

      heapManage(M);
      return true;
    }
  };
}

char HeapResetPass::ID = 0;

void addModifyStubPass(const PassManagerBuilder & /* unused */,
                       legacy::PassManagerBase &PM)
{
  PM.add(new HeapResetPass());
}

// Register the pass so `opt -mempass` runs it.
static RegisterPass<HeapResetPass> X("heapreset", "Reset heap chunks after every execution");

// Tell frontends to run the pass automatically.
static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
                                addModifyStubPass);
static RegisterStandardPasses
    Z(PassManagerBuilder::EP_EnabledOnOptLevel0, addModifyStubPass);
