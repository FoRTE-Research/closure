#pragma once

#include "Common.h"

#define FOPEN "fopen"
#define FOPEN_HOOK "fopen_hook"

#define FCLOSE "fclose"
#define FCLOSE_HOOK "fclose_hook"

/**
 * @brief This pass is used to replace exit calls in the program to
 * custom exit in the closure stub which uses longjmp to return to closure
 * iteration point.
 *
 */
class FileHookPass : public ModulePass
{
  public:
    static char ID;

    FileHookPass() : ModulePass(ID){};

    virtual bool runOnModule(Module &M) override;

    void hookFileRelatedCalls(Module &M);
};