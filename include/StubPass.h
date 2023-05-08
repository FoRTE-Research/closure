#pragma once

#include "Common.h"

/**
 * @brief This Pass modifies the closure-stub, and inserts calls to
 * globals variable restoration functions in every other Module
 *
 */
class ModifyStubPass : public ModulePass
{
  public:
    static char ID;

    ModifyStubPass() : ModulePass(ID){};

    virtual bool runOnModule(Module &M);
};