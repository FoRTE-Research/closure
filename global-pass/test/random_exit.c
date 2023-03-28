#include <stdlib.h>
#include <time.h>
#include <stdio.h>

int RANDOM_UNIT;
int RANDOM_INIT = 0;
time_t t;
struct tm *timeinfo;

int possibleValue()
{
    return rand() % 10;
}

void possibleExit()
{
    if (possibleValue() > 4)
    {
        exit(0);
    }
    
}

void doStuff()
{
    time(&t);
    timeinfo = localtime(&t);
    printf("%d %d %d %d:%d:%d\n",timeinfo->tm_mday, timeinfo->tm_mon + 1, timeinfo->tm_year + 1900, timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
    if (timeinfo->tm_sec%3 == 1)
    {
        exit(0);
    }
    else
    {
        possibleExit();
    }
    printf("%d", timeinfo->tm_sec);
}

int main(int argc, char *argv[])
{
    srand(time(NULL));
    printf("___BEFORE INITIALIZING RANDOMS___\n");
    printf("Random Unintialized Value: %d\n", RANDOM_UNIT);
    printf("Random initilized Value: %d\n", RANDOM_INIT);

    RANDOM_UNIT = rand() % 10;
    RANDOM_INIT = rand() % 10;

    doStuff();

    if (RANDOM_UNIT - RANDOM_INIT > 0)
    {
        printf("\nRANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\n");
        exit(0);
    }
    printf("\n___AFTER INITIALIZING RANDOMS___\n");
    printf("Random Unintialized Value: %d\n", RANDOM_UNIT);
    printf("Random initilized Value: %d\n", RANDOM_INIT);
    printf("-----------------------------------\n");
    possibleExit();


    return 0;
}