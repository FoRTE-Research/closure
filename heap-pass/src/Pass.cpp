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
  struct HeapResetPass : public ModulePass {
    static char ID;
    HeapResetPass() : ModulePass(ID) {}


    // Replaces free and malloc with my own implementation of free and malloc from the 
    // main stub
    void heapManage(Module&M)
    {
      M.getFunction("free")->replaceAllUsesWith(M.getFunction("myFree"));
      M.getFunction("malloc")->replaceAllUsesWith(M.getFunction("myMalloc")); 

      Function *F = M.getFunction("myMalloc");
      for (auto &B : *F) {
          for (auto &I : B) {
            if (CallInst* call = dyn_cast<CallInst>(&I)) {
              if( call->getCalledFunction() != 0x0)
              {
              if (call->getCalledFunction()->getName().contains("myMalloc") == 1)
                  {
                    call->setCalledFunction(M.getFunction("malloc"));
                  }
              if (call->getCalledFunction()->getName().contains("myFree") == 1)
              {
                call->setCalledFunction(M.getFunction("free"));
              }
            }}
          }
      }

      Function *F5 = M.getFunction("add_ptr");
      for (auto &B : *F5) {
          for (auto &I : B) {
            //errs() << I << "\n";
            //errs() << "I die here\n";
            if (CallInst* call = dyn_cast<CallInst>(&I)) {
              if( call->getCalledFunction() != 0x0)
              {
              if (call->getCalledFunction()->getName().contains("myMalloc") == 1)
                  {
                    call->setCalledFunction(M.getFunction("malloc"));
                  }
              if (call->getCalledFunction()->getName().contains("myFree") == 1)
              {
                call->setCalledFunction(M.getFunction("free"));
              }
              }
            }
          }
      }
      //errs() << "jk again\n";
      Function *F4 = M.getFunction("free_ptrs");
      bool s = true;
      /*for (auto &B : *F4) {
          for (auto &I : B) {
            if (CallInst* call = dyn_cast<CallInst>(&I)) {
              if( call->getCalledFunction() != 0x0)
              {
              if (call->getCalledFunction()->getName().contains("myFree") == 1 && !s)
              {
                call->setCalledFunction(M.getFunction("free"));
              }
              else
              {
                s = false;
              }
            }
            }
          }
      }*/
      Function *F3 = M.getFunction("delete_ptr");
      for (auto &B : *F3) {
          for (auto &I : B) {
            if (CallInst* call = dyn_cast<CallInst>(&I)) {
              if( call->getCalledFunction() != 0x0)
              {
              if (call->getCalledFunction()->getName().contains("myMalloc") == 1)
                  {
                    call->setCalledFunction(M.getFunction("malloc"));
                  }
              if (call->getCalledFunction()->getName().contains("myFree") == 1)
              {
                call->setCalledFunction(M.getFunction("free"));
              }
            }
            }
          }
      }

      Function *F2 = M.getFunction("myFree");
      for (auto &B : *F2) {
          for (auto &I : B) {
            if (CallInst* call = dyn_cast<CallInst>(&I)) {
                            if( call->getCalledFunction() != 0x0)
              {
              if (call->getCalledFunction()->getName().contains("myFree") == 1)
              {
                call->setCalledFunction(M.getFunction("free"));
              }
            }}
          }
      }
    }

    // Adds the longjmp to any point where an exit occurs to avoid the function from crashing
    void jumpExit(Module &M, Value &V)
    {
      Function* main = M.getFunction("start_main");
      BasicBlock* first_bb = &*main->begin()->getNextNode();

      auto &context = M.getContext();
      auto VoidTy = Type::getVoidTy(context);
      auto Int32Ty = Type::getInt32Ty(context);
      auto Int32PtrTy = Type::getInt32PtrTy(context);

      std::vector<Type*> longjmpArgs;
      longjmpArgs.push_back(V.getType());
      longjmpArgs.push_back(Int32Ty);
      FunctionCallee c = 
						M.getOrInsertFunction("longjmp", FunctionType::get(
								VoidTy, longjmpArgs,
								false));

      llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(context);
      llvm::Constant *i32_val = llvm::ConstantInt::get(i32_type, 1/*value*/, true);
      std::vector<Value*> args;
      args.push_back(&V);
      args.push_back(i32_val);
      IRBuilder<>* builder = new IRBuilder<>(context);
      for (auto &F : M) {
        errs() << F.getName() << "\n";
        for (auto &B : F) {

          BasicBlock::iterator insertion_pt = B.getFirstInsertionPt();
          
          for (auto &I : B) {
            if(F.getName().contains("main") == 1 && F.getName().str().length() == 4)
            {
              errs() << "found start_main" << "\n";
              //errs() << I << "\n";
              if (ReturnInst* ret = dyn_cast<ReturnInst>(&I)) {
                builder->SetInsertPoint(&*insertion_pt);
                CallInst* call2 = builder->CreateCall(c, args, "");
                errs() << "found the return" << "\n";
                break;
              }
            }
            
            // Alloca: Log i32* stack address
            if (AllocaInst* alloca = dyn_cast<AllocaInst>(&I)) {
              
            }
            if (CallInst* call = dyn_cast<CallInst>(&I)) {
                //errs() << call->getCalledFunction() << "\n";
                if (call->getCalledFunction() == 0x0)
                {
                  errs() << "wait what\n";
                }
                else
                {
                  if ((call->getCalledFunction()->getName().contains("exit") == 1
                      && call->getCalledFunction()->getName().str().length() == 4)
                      && F.getName().contains("main") != 1)
                  {
                    errs() << "Test\n";
                    builder->SetInsertPoint(&*insertion_pt);
                    CallInst* call2 = builder->CreateCall(c, args, "");
                    //errs() << call2->getCalledFunction()->getName() << "\n"; 
                  }
                }
                
              //}start_
                //errs() << "Exit found\n";
              
            }
            insertion_pt++;
          }
        }
      }
    }


    /**
     * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
     */
    virtual bool runOnModule(Module &M) {
        heapManage(M);
        return true;
  }
};
}

char HeapResetPass::ID = 0;

// Register the pass so `opt -mempass` runs it.   
static RegisterPass<HeapResetPass> X("heapreset", "Reset heap chunks after every execution");