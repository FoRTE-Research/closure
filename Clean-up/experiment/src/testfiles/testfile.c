
#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>


int main(int argc, char *argv[]) 
{
        FILE *fp;
        fp = fopen("../results/untooled/testfile_untooled.txt", "a");

        clock_t start, end;
        double cpu_time_used;
        
        start = clock();

        int *p1 = malloc(128*sizeof(int));  // allocates enough for an array of 4 int
    
        if(p1) {
            for(int n=0; n<128; ++n) // populate the array
                p1[n] = n*n;
        }
        end = clock();
        cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
        //printf("%fs to run %d times\n",cpu_time_used, num);
        fprintf(fp, "%f\n", cpu_time_used);
}