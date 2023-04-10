#include <stdio.h>

int a = 10;
int b = 20;

int main() {
	printf("Original Value of global var b: 20\n");
	printf("Value after previous execution %d\n", b);
	b = 30;
	return 1;
}
