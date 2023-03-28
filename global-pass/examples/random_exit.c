#include <stdlib.h>
#include <stdio.h>

int RANDOM_UNIT;
int RANDOM_INIT = 0;

int main(int argc, char *argv[])
{
    srand(time(NULL));
    printf("___BEFORE INITIALIZING RANDOMS___\n");
    printf("Random Unintialized Value: %d\n", RANDOM_UNIT);
    printf("Random initilized Value: %d\n", RANDOM_INIT);

    RANDOM_UNIT = rand() % 10;
    RANDOM_INIT = rand() % 10;

    if (RANDOM_UNIT - RANDOM_INIT > 0)
    {
        printf("\nRANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\n");
        exit(0);
    }
    printf("\n___AFTER INITIALIZING RANDOMS___\n");
    printf("Random Unintialized Value: %d\n", RANDOM_UNIT);
    printf("Random initilized Value: %d\n", RANDOM_INIT);
    printf("-----------------------------------\n");


    return 0;
}