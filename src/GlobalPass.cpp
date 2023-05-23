#include "GlobalPass.h"
#include <fstream>
#include <iostream>

/**
 * @brief Method for adding a copy of each global variable, and calls
 * restoreGlobalVariables which adds a load and store inst to initialize the
 * variables from their shadow backups
 *
 * @param M
 */
void CloneGlobalsPass::cloneGlobals(Module &M)
{

    auto &list = M.getGlobalList();

    for (auto &Global : list)
    {

        if (Global.hasSection() == false && Global.isConstant() == false)
        {
            Global.setSection(CLOSURE_GLOBAL_SECTION);
        }
    }
}

/**
 * @brief runOnModule method for Module Pass
 *
 * @param M
 * @return true
 * @return false
 */
bool CloneGlobalsPass::runOnModule(Module &M)
{
    if (isClosureStubModule(M.getName()))
    {
        return false;
    }

    cloneGlobals(M);
    return true;
}

PreservedAnalyses CloneGlobalsPass::run(Module &M, ModuleAnalysisManager &AM)
{

    runOnModule(M);
    return PreservedAnalyses::none();
}
