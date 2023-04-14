/**
 * This pass helps stub a new main onto the original function so we can do further memory management
 * and rapid function testing.
 */

#include "StubPass.h"

using namespace llvm;

bool ModifyStubPass::runOnModule(Module &M)
{
	// We have to insert calls to restore-global functions just before
	// the call to start_main.

	errs() << "Running stub modify pass for: " << M.getName() << "\n";

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
		errs() << "No main function found, returning" << M.getName() << "\n";
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

char ModifyStubPass::ID = 1;
