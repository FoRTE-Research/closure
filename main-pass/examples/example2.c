/* This software was developed at the National Institute of Standards and
 * Technology by employees of the Federal Government in the course of their
 * official duties. Pursuant to title 17 Section 105 of the United States
 * Code this software is not subject to copyright protection and is in the
 * public domain. NIST assumes no responsibility whatsoever for its use by
 * other parties, and makes no guarantees, expressed or implied, about its
 * quality, reliability, or any other characteristic.

 * We would appreciate acknowledgement if the software is used.
 * The SAMATE project website is: http://samate.nist.gov
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <setjmp.h>

int a = 0;
int b = 10;
char greeting[] = "Hello";
jmp_buf buf;

int main(int argc, char *argv[])
{
    if(setjmp(buf))
    {
        printf("Jumped_too\n");
        b = 40;
        printf("A: %d\n", a);
    }
    else
    {
        printf("No_Jump\n");
        printf("A: %d\n", a);
    }
    // char *str[1] = {(char *)NULL};
    // *str = (char *)malloc(256*sizeof(char));
    int *ptr = (int *)malloc(16*sizeof(int));
    *ptr = 5;
    for (int i = 0; i < 10; i++){
        ptr[i] = i;
    }
    free(ptr);
    a = b;
    b = 20;
    if (a < b)
    {
        longjmp(buf, 1);
    }
	return 0;
}