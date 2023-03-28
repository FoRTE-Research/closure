
#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "strmap.h"

StrMap *sm;
char buf[255];
int result;



int main(int argc, char *argv[]) 
{
    
    clock_t start, end;
    double cpu_time_used;
    FILE *fp;
    fp = fopen("hash_untooled.txt", "a");   
    start = clock();
    if (argc == 2)
    {
        int num = atoi(argv[1]);
        sm = sm_new(num);
        if (sm == NULL) {
            /* Handle allocation failure... */
        }
        
        
        //printf("time %d %d\n", start, num);
        for (int i = num; i > 0; i--)
        {
            sm_put(sm, "test" + i, "test");
            result = sm_get(sm, "test" + i, buf, sizeof(buf));
            if (result == 0) {
                /* Handle value not found... */
                
            }
            //printf("value: %s %d\n", buf, i);
        }
        sm_delete(sm);
    }
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    //printf("%fs to run %d times\n",cpu_time_used, atoi(argv[1]));
    fprintf(fp, "%f\n", cpu_time_used);

    return 0;
}