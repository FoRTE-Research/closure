#include <stdio.h>

int g1 = 10;

int main(int argc, char **argv)
{
	if (g1 == 30)
	{
		int *x = (int *)(0x0);
		int q = *(x);
	}
	int *a = malloc(0x4);
	int *b = malloc(0x4);
	printf("Malloced: %p %p\n", a, b);
	free(a);
	g1 = 30;
	return 1;
}
