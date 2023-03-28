#include <stdio.h>
#include <stdlib.h>
#include <setjmp.h>

jmp_buf _buf;

int main(int argc, char *argv[]) {
    for (int i = 0; i < 10000; ++i)
    {
        if (setjmp(_buf))
        {
            printf("\n!!!Saved by long jump!!!\n");
        }
        else
        {
            printf("\n___Start_Main___\n");
        }
    }

    printf("\n---Done with Testing---\n");
    return 0;
}

