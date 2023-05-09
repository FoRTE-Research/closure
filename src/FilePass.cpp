#include "FilePass.h"

void FileHookPass::hookFileRelatedCalls(Module &M)
{

    auto fopenFunc = M.getFunction(FOPEN);

    if (fopenFunc != nullptr)
    {

        auto fopenHook = M.getOrInsertFunction(FOPEN_HOOK, fopenFunc->getFunctionType());
        fopenFunc->replaceAllUsesWith(fopenHook.getCallee());
    }

    auto fcloseFunc = M.getFunction(FCLOSE);
    if (fcloseFunc != nullptr)
    {
        auto fcloseHook = M.getOrInsertFunction(FCLOSE_HOOK, fcloseFunc->getFunctionType());
        fcloseFunc->replaceAllUsesWith(fcloseHook.getCallee());
    }

    return;
}

bool FileHookPass::runOnModule(Module &M)
{

    if (isClosureStubModule(M.getName()))
    {
        return false;
    }
    hookFileRelatedCalls(M);
    return true;
}

char FileHookPass::ID = 0;
