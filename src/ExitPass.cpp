/**
 * This pass is for renaming the main function of the desired piece of code.
 */

#include "ExitPass.h"

/**
 * @brief This function is called by runOnModule method of Pass to replace exit with exitHook
 *
 * @param M - Module being compiled
 */
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
 * @brief runOnModule method of Module Pass
 *
 * @param M
 * @return true
 * @return false
 */
bool ExitHookPass::runOnModule(Module &M)
{

    errs() << "Exit Pass opt for " << M.getName() << "\n";

    if (isClosureStubModule(M.getName()))
    {
        return false;
    }

    hookExit(M);
    return true;
}

char ExitHookPass::ID = 4;
