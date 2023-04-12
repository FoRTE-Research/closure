#include <stdio.h>

int g1 = 10;

int main(int argc, char **argv)
{

    printf("Original Value of global var b: 20\n");
    printf("Value after previous execution %d\n", g1);
    g1 = 30;
    return 1;
    int *a = malloc(0x4);
    int *b = malloc(0x4);
    printf("Malloced: %p %p\n", a, b);
    free(a);
    g1 = 30;
    return 1;
}
