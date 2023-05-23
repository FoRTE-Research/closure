#pragma once

#include "Common.h"

/**
 * @brief This Pass renames the main function to start_main
 * in target.
 *
 */
class RenameMainPass : public PassInfoMixin<RenameMainPass>
{
  public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

    virtual bool runOnModule(Module &M);
};