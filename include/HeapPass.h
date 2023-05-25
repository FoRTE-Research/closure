#pragma once

#include "Common.h"

/**
 * @brief This Pass replaces calls to malloc and free in the binary to
 * custom malloc and free implementations in closure-stub which tracks all the
 * dynamic memory allocations and frees them after every execution
 *
 */
class HeapResetPass : public PassInfoMixin<HeapResetPass>
{
  public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
    virtual bool runOnModule(Module &M);

    void heapManage(Module &M);
};