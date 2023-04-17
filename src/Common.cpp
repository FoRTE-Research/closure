#include <random>
#include "Common.h"

bool isClosureStubModule(StringRef moduleName)
{
    return (moduleName.contains(STUB_FILE_NAME_PREFIX));
}

std::string generateRandomString(int len)
{
    srand((unsigned)time(NULL));

    static const char alphanum[] =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "abcdefghijklmnopqrstuvwxyz";
    std::string randStr;
    randStr.reserve(len);

    for (int i = 0; i < len; ++i)
    {
        randStr += alphanum[rand() % (sizeof(alphanum) - 1)];
    }

    return randStr;
}