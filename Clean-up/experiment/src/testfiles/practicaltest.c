#include<stdio.h>
#include<dirent.h>
#include<time.h>

int main(void)
{
    FILE *fp;
    fp = fopen("results_untooled_2.txt", "a");

    clock_t start, end;
    double cpu_time_used;
    
    start = clock();
    DIR *d;
    struct dirent *dir;
    d = opendir(".");
    if (d)
    {
        while ((dir = readdir(d)) != NULL)
        {
            printf("%s\n", dir->d_name);
        }
        closedir(d);
    }
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    //printf("%fs to run %d times\n",cpu_time_used, num);
    fprintf(fp, "%f\n", cpu_time_used);
    return(0);
}