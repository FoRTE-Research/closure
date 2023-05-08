/**
 * This pass helps stub a new main onto the original function so we can do further memory management
 * and rapid function testing.
 */
#include "StubPass.h"
#include <fstream>
#include <iostream>

using namespace llvm;

/**
 * @brief runOnModule method for Module Pass
 *
 * @param M
 * @return true
 * @return false
 */
bool ModifyStubPass::runOnModule(Module &M)
{
    // We have to insert calls to restore-global functions just before
    // the call to start_main.

    errs() << "Running stub modify pass for: " << M.getName() << "\n";

    if (isClosureStubModule(M.getName()) == false)
    {
        errs() << "Not the stub Module\n";
        return false;
    }

    Function *mainFunc = M.getFunction("main");

    if (mainFunc == nullptr)
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

    // Inserting calls to restore_globals_... functions
    std::fstream f;
    f.open(CLOSURE_GLOBAL_RESTORE_FILE, std::ios::in);
    std::string funcName;
    while (getline(f, funcName))
    {
        errs() << "Got function " << funcName << "\n";
        auto restoreGlobalsFunc =
            M.getOrInsertFunction(funcName, FunctionType::get(Type::getVoidTy(M.getContext()), false));
        CallInst::Create(restoreGlobalsFunc.getFunctionType(), restoreGlobalsFunc.getCallee(), "", insertPt);
    }
    f.close();
    return true;
}

char ModifyStubPass::ID = 1;
