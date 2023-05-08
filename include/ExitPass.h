#pragma once

#include "Common.h"

/**
 * @brief This pass is used to replace exit calls in the program to
 * custom exit in the closure stub which uses longjmp to return to closure
 * iteration point.
 *
 */
class ExitHookPass : public ModulePass
{
  public:
    static char ID;

    ExitHookPass() : ModulePass(ID){};

    virtual bool runOnModule(Module &M) override;

    void hookExit(Module &M);
};