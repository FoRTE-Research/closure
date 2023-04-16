/**
 * This pass is for renaming the main function of the desired piece of code.
 */

#include "HeapPass.h"

/**
 * @brief Replaces free and malloc with my own implementation of free and malloc from the
 * main stub
 *
 * @param M
 */
void HeapResetPass::heapManage(Module &M)
{
  auto freeFunc = M.getFunction("free");
  auto mallocFunc = M.getFunction("malloc");

  if (mallocFunc != nullptr)
  {
    // We have calls to malloc in this module, replace them
    auto myMalloc = M.getOrInsertFunction("myMalloc", mallocFunc->getFunctionType());
    mallocFunc->replaceAllUsesWith(myMalloc.getCallee());
  }
  if (freeFunc != nullptr)
  {
    // We have calls to free in this module, replace them
    auto myFree = M.getOrInsertFunction("myFree", freeFunc->getFunctionType());

    freeFunc->replaceAllUsesWith(myFree.getCallee());
  }
}

/**
 * @brief runOnModule method for Module Pass
 *
 * @param M
 * @return true
 * @return false
 */
bool HeapResetPass::runOnModule(Module &M)
{

  errs() << "Heap Pass opt for " << M.getName() << "\n";

  if (isClosureStubModule(M.getName()))
  {
    return false;
  }

  heapManage(M);
  return true;
}

char HeapResetPass::ID = 3;
