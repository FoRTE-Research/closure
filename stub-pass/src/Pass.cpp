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
#include <llvm/Analysis/LoopPass.h>

using namespace llvm;

namespace
{
	struct ModifyStubPass : public ModulePass
	{
		static char ID;
		ModifyStubPass() : ModulePass(ID){};

		virtual bool runOnModule(Module &M) override
		{
			// We have to insert calls to restore-global functions just before
			// the call to start_main.

			bool hasMain = false;
			Function *mainFunc = nullptr;
			for (auto &F : M)
			{
				if (F.getName() == "main")
				{
					mainFunc = &F;
					hasMain = true;
				}
			}

			if (hasMain == false)
			{
				return false;
			}

			Instruction *insertPt = nullptr;

			for (auto &BB : *mainFunc)
			{
				for (auto &I : BB)
				{

					if (auto call = dyn_cast<CallInst>(&I))
					{
						Function *fp = call->getCalledFunction();
						StringRef fname = "";
						if (fp == NULL)
						{
							Value *v = call->getCalledValue();
							Value *sv = v->stripPointerCasts();
							fname = sv->getName();
						}
						else
						{
							fname = fp->getName();
						}

						if (fname == "start_main")
						{
							insertPt = &I;
						}
					}
				}
			}

			if (insertPt == nullptr)
			{
				errs() << "Could not find any call to start_main\n";
			}

			auto restoreGlobalsFunc = M.getOrInsertFunction("restore_globals_test_global", FunctionType::get(Type::getVoidTy(M.getContext()), false));
			CallInst::Create(restoreGlobalsFunc.getFunctionType(), restoreGlobalsFunc.getCallee(), "", insertPt);
			return true;
		}
	};
}

char ModifyStubPass::ID = 0;

void addModifyStubPass(const PassManagerBuilder & /* unused */,
					   legacy::PassManagerBase &PM)
{
	PM.add(new ModifyStubPass());
}

// Register the pass so `opt -mempass` runs it.
static RegisterPass<ModifyStubPass> X("modify-stub", "Modify Stub to insert global clear calls");
// Tell frontends to run the pass automatically.
static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
								addModifyStubPass);
static RegisterStandardPasses
	Z(PassManagerBuilder::EP_EnabledOnOptLevel0, addModifyStubPass);
