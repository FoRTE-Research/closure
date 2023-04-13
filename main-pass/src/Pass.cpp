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

#define ENTRYPOINT_NAME "main"

using namespace llvm;

namespace
{
  struct RenameMainPass : public ModulePass
  {
    static char ID;
    RenameMainPass() : ModulePass(ID) {}

    /**
     * Simple function to rename the main method of a C program to
     * start_main, this way the stub is capable of calling the program
     */
    void rename_main(Module &M)
    {
      for (auto &F : M)
      {
        auto funcName = F.getName();
        if (funcName == ENTRYPOINT_NAME)
        {
          errs() << "Changing " << F.getName() << " to start_main"
                 << "\n";
          F.setName("start_main");
        }
      }
    }

    /**
     * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
     */
    virtual bool runOnModule(Module &M)
    {
      rename_main(M);
      return true;
    }
  };
}

char RenameMainPass::ID = 0;

void addRenameMainPass(const PassManagerBuilder & /* unused */,
                       legacy::PassManagerBase &PM)
{
  PM.add(new RenameMainPass());
}

// Register the pass so `opt -rename-main` runs it.
static RegisterPass<RenameMainPass> X("rename-main", "Pass to rename main");

// Tell frontends to run the pass automatically.
static struct RegisterStandardPasses Y(PassManagerBuilder::EP_VectorizerStart,
                                       addRenameMainPass);
