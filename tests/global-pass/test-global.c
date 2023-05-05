#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int a = 10;
int b = 20;

int main(int argc, char ** argv) {
	printf("Original Value of global var b: 20\n");
	printf("Value after previous execution %d\n", b);
	b = 30;
	
	int fd = open(argv[3], O_RDONLY);
	if (fd == -1) {
		int err_fd = open("/tmp/check-persistent", O_WRONLY);
		int x1 = write(err_fd, "Could not open ", 16);
		int x2 = write(err_fd, argv[3], strlen(argv[3]));
		int x3 = write(err_fd, "\n", 1);
		close(err_fd);
	} else {
		int err_fd = open("/tmp/check-persistent", O_WRONLY);
		write(err_fd, "Able to open ", 14);
		write(err_fd, argv[3], strlen(argv[3]));
		write(err_fd, "\n", 1);
		close(err_fd);
	
	}

	return 1;
}
