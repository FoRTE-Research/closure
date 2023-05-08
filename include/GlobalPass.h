#pragma once

#include "Common.h"

#define CLOSURE_GLOBAL_SECTION "closure_global_section"

/**
 * @brief This Pass creates a copy of all the global vairables defined
 * in the module. It also inserts a restore_global_variables function in every
 * compilation Module which restores each global variable to it's start-time
 * value
 *
 */
class CloneGlobalsPass : public ModulePass
{
  public:
    static char ID;

    bool insertedFuncName;

    std::string funcName;

    CloneGlobalsPass() : ModulePass(ID), insertedFuncName{false}, funcName{""} {};

    void restoreGlobalVariables(Module &M, GlobalVariable &original, GlobalVariable &clone);

    void cloneGlobals(Module &M);

    virtual bool runOnModule(Module &M);
};