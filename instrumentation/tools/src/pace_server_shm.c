#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <errno.h>
#include <fcntl.h>
#include <time.h>
#define SHMSZ     1

int main(int argc, char* argv[]) {
     int pid = fork();

	if ( pid == 0 ) {
        char *argv2[argc];
        argv2[0] = "Command-line";
        for ( int i = 2; i < argc; i++)
        {
            argv2[i - 1] = argv[i];
        }
        argv2[argc - 1] = NULL;
        execvp( argv[1], argv2 );
                
	} 
    else {
        char c;
        int shmid;
        key_t key;
        int *shm, *s;

        key = 5555;
        
        if ((shmid = shmget(key, SHMSZ, IPC_CREAT | 0666)) < 0) {
            perror("shmget");
            exit(1);
        }

        if ((shm = shmat(shmid, NULL, 0)) == -1) {
            perror("shmat");
            exit(1);
        }
        for (int i = 0; i <= 10000; i++) {
                printf("%d\n", i);
                s = shm;
                *s++ = i;
                *s = NULL;

                while (*shm != -2 && i != 10000) {
                }
            }
    }
	
	return 0;
}
