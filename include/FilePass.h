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
class FileHookPass : public PassInfoMixin<FileHookPass>
{
  public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

    bool runOnModule(Module &M);

    void hookFileRelatedCalls(Module &M);
};