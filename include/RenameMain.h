#pragma once

#include "Common.h"

/**
 * @brief This Pass renames the main function to start_main
 * in target.
 *
 */
class RenameMainPass : public ModulePass
{
public:
    static char ID;

    RenameMainPass() : ModulePass(ID) {}

    virtual bool runOnModule(Module &M);
};