#pragma once

#include "Common.h"

/**
 * @brief This pass is used to replace exit calls in the program to
 * custom exit in the closure stub which uses longjmp to return to closure
 * iteration point.
 *
 */
class ExitHookPass : public PassInfoMixin<ExitHookPass>
{
  public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

    bool runOnModule(Module &M);

    void hookExit(Module &M);
};