/**
 * This pass is for renaming the main function of the desired piece of code.
 */
#include "RenameMain.h"

/**
 * @brief runOnModule method for Module Pass
 *
 * @param M
 * @return true
 * @return false
 */
bool RenameMainPass::runOnModule(Module &M)
{

    if (isClosureStubModule(M.getName()))
    {
        return false;
    }

    for (auto &F : M)
    {
        auto funcName = F.getName();
        if (funcName == ENTRYPOINT_NAME)
        {

            F.setName("start_main");
        }
    }
    return true;
}

PreservedAnalyses RenameMainPass::run(Module &M, ModuleAnalysisManager &AM)
{

    runOnModule(M);
    return PreservedAnalyses::none();
}
