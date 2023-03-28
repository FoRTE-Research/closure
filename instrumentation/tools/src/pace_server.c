#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>
#include <fcntl.h>
#include <time.h>

int main(int argc, char* argv[]) {
	for (int i = 0; i <= 10000; i++) {
		int fd = open("step", O_WRONLY);
		if (fd == -1) {
			return 1;
		}
		if (write(fd, &i, sizeof(int)) == -1) {	
			return 2;
		}
		close(fd);
		fd = open("step", O_RDONLY);
		if (fd == -1) {
			return 3;
		}
		if (read(fd, &i, sizeof(int)) == -1) {
			return 4;
		}
		printf("Iteration %d\n", i);
		close(fd);
	}	
	return 0;
}
