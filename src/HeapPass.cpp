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
    auto callocFunc = M.getFunction("calloc");
    auto reallocFunc = M.getFunction("realloc");

    if (mallocFunc != nullptr)
    {
        // We have calls to malloc in this module, replace them
        auto myMalloc = M.getOrInsertFunction("myMalloc", mallocFunc->getFunctionType());
        mallocFunc->replaceAllUsesWith(myMalloc.getCallee());
    }
    if (callocFunc != nullptr)
    {
        // We have calls to malloc in this module, replace them
        auto myCalloc = M.getOrInsertFunction("myCalloc", callocFunc->getFunctionType());
        callocFunc->replaceAllUsesWith(myCalloc.getCallee());
    }
    if (reallocFunc != nullptr)
    {
        // We have calls to malloc in this module, replace them
        auto myRealloc = M.getOrInsertFunction("myRealloc", reallocFunc->getFunctionType());
        reallocFunc->replaceAllUsesWith(myRealloc.getCallee());
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

    if (isClosureStubModule(M.getName()))
    {
        return false;
    }

    heapManage(M);
    return true;
}

char HeapResetPass::ID = 3;
