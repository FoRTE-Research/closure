#include "Common.h"

bool isClosureStubModule(StringRef moduleName)
{
    return (moduleName.contains(STUB_FILE_NAME_PREFIX));
}
