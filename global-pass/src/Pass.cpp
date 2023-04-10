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
  struct CloneGlobalsPass : public ModulePass
  {
    static char ID;
    CloneGlobalsPass() : ModulePass(ID) {}

    // Adds the longjmp to any point where an exit occurs to avoid the function from crashing
    void jumpExit(Module &M, Value &V)
    {
      Function *main = M.getFunction("start_main");
      BasicBlock *first_bb = &*main->begin()->getNextNode();

      auto &context = M.getContext();
      auto VoidTy = Type::getVoidTy(context);
      auto Int32Ty = Type::getInt32Ty(context);
      auto Int32PtrTy = Type::getInt32PtrTy(context);

      std::vector<Type *> longjmpArgs;
      longjmpArgs.push_back(V.getType());
      longjmpArgs.push_back(Int32Ty);
      FunctionCallee c =
          M.getOrInsertFunction("longjmp", FunctionType::get(
                                               VoidTy, longjmpArgs,
                                               false));

      llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(context);
      llvm::Constant *i32_val = llvm::ConstantInt::get(i32_type, 1 /*value*/, true);
      std::vector<Value *> args;
      args.push_back(&V);
      args.push_back(i32_val);
      IRBuilder<> *builder = new IRBuilder<>(context);
      for (auto &F : M)
      {
        errs() << F.getName() << "\n";
        for (auto &B : F)
        {

          BasicBlock::iterator insertion_pt = B.getFirstInsertionPt();

          for (auto &I : B)
          {
            if (F.getName().contains("main") == 1 && F.getName().str().length() == 4)
            {
              errs() << "found start_main"
                     << "\n";
              // errs() << I << "\n";
              if (ReturnInst *ret = dyn_cast<ReturnInst>(&I))
              {
                builder->SetInsertPoint(&*insertion_pt);
                CallInst *call2 = builder->CreateCall(c, args, "");
                errs() << "found the return"
                       << "\n";
                break;
              }
            }

            // Alloca: Log i32* stack address
            if (AllocaInst *alloca = dyn_cast<AllocaInst>(&I))
            {
            }
            if (CallInst *call = dyn_cast<CallInst>(&I))
            {
              // errs() << call->getCalledFunction() << "\n";
              if (call->getCalledFunction() == 0x0)
              {
                errs() << "wait what\n";
              }
              else
              {
                if ((call->getCalledFunction()->getName().contains("exit") == 1 && call->getCalledFunction()->getName().str().length() == 4) && F.getName().contains("main") != 1)
                {
                  errs() << "Test\n";
                  builder->SetInsertPoint(&*insertion_pt);
                  CallInst *call2 = builder->CreateCall(c, args, "");
                  // errs() << call2->getCalledFunction()->getName() << "\n";
                }
              }
            }
            insertion_pt++;
          }
        }
      }
    }

    /**
     * This method inserts instructions to restore the global variable after every execution (using Load and Store)
     * It uses the copy of every global variable made in the cloneGlobals method.
     * We insert the restoration instructions in the entry block of `start_main` function (renamed `main`)
     */
    void restoreGlobalVariables(Module &M, GlobalVariable &original, GlobalVariable &clone)
    {
      Function *main = M.getFunction("start_main");
      BasicBlock &entryBlock = main->getEntryBlock();

      auto insertion_pt = entryBlock.getFirstInsertionPt();

      IRBuilder<> IR(&entryBlock, insertion_pt);
      Value *v = dyn_cast<Value>(&clone);
      Value *v2 = dyn_cast<Value>(&original);
      LoadInst *Load = IR.CreateLoad(v);
      StoreInst *Store = IR.CreateStore(Load, v2);
    }

    /**
     * Method for adding a copy of each global variable, and calls
     * restoreGlobalVariables which adds a load and store inst to initialize the
     * variables from their shadow backups
     */
    void cloneGlobals(Module &M)
    {
      outs() << M.getName() << "\n\n";
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
            errs() << new_var->getName() << '\n';
            errs() << Global.getName() << '\n';
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
      outs() << "Running global variable clone pass\n";
      cloneGlobals(M);
      return true;
    }
  };
}

char CloneGlobalsPass::ID = 0;

// Register the pass so `opt -mempass` runs it.
static RegisterPass<CloneGlobalsPass> X("clone-globals", "generating shadow copy backups");