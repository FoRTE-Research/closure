/**
 * This pass is for renaming the main function of the desired piece of code.
 */

#include "ExitPass.h"

// Replaces free and malloc with my own implementation of free and malloc from the
// main stub
void ExitHookPass::hookExit(Module &M)
{
    auto exitFunc = M.getFunction("exit");

    if (exitFunc != nullptr)
    {
        // We have calls to malloc in this module, replace them
        auto exitHook = M.getOrInsertFunction("exitHook", exitFunc->getFunctionType());
        exitFunc->replaceAllUsesWith(exitHook.getCallee());
    }
}

/**
 * RUN FUNCTION TO PERFORM PASS ON THE INPUT FUNCTION
 */
bool ExitHookPass::runOnModule(Module &M)
{

    errs() << "Exit Pass opt for " << M.getName() << "\n";

    if (M.getName().contains("stubMain") == true)
    {
        errs() << "Not running exit pass for " << M.getName() << "\n";
        return false;
    }

    hookExit(M);
    return true;
}

char ExitHookPass::ID = 4;
