#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <setjmp.h>
#include "uthash.h"

jmp_buf __longjmp_buf__;

typedef struct {
    void* key;            /* we'll use this field as the key */
    int i;         /* this field is for the hashed object */
    UT_hash_handle hh; /* makes this structure hashable */ //IDK how this works, they just said it does and it did
} ptr_obj;

ptr_obj *ptr_map = NULL;

void add_ptr(void* key_ptr) {
    ptr_obj *s;

    s = malloc(sizeof(ptr_obj));
    s->key = key_ptr;
    s->i = 1;
    HASH_ADD_PTR(ptr_map, key, s);  /* id: name of key field!!! LOOK MORE INTO THIS, REPLACE WITH THE CORRECT FUNCTION FOR ADDING A VOID POINTER AND THEN RECREATE WITH FIND */

}

// Responsible for finding the pointer to confirm that 
ptr_obj *find_ptr(void* ptr_id) {
    ptr_obj *s;

    HASH_FIND_PTR(ptr_map, &ptr_id, s); // Change to the correct function for storing a void pointer, maybe this can be simplified.
    return s;
}

// Deletes the pointer object from the hash table
void delete_ptr(ptr_obj *obj) {
        if(obj != NULL)
        {
            HASH_DEL(ptr_map, obj);
            free(obj);
        }
}

/*
 * myMalloc is a stub function for malloc which stores the returned void type pointer
 * inside of an array to be deallocated in the event that free is never called 
 */
void* myMalloc(size_t size)
{
    void *tmp = malloc(size);
    //printf("Allocated Pointer: %x\n", tmp);
    add_ptr(tmp);
    return tmp;
}

/*
 * My Free is a stub function for free which removes the pointer
 * from the array of void pointers and then frees the passed in 
 * pointer
 */
void myFree(void* ptr)
{
    //printf("Freeing Pointer: %x\n", ptr);
    ptr_obj *p = find_ptr(ptr);
    delete_ptr(p);
    free(ptr);
}

void free_ptrs() {
    ptr_obj *s, *tmp;
    //printf("Freeing all pointers");
    /*for (s = ptr_map; s != NULL; s = s->hh.next) {
        myFree(s->key);
    }*/

    HASH_ITER(hh, ptr_map, s, tmp) {
        free(s->key);
        //delete_ptr(s);
    }
}

/*
 * Used for closing a file if the program exits before closing the
 * file. Should be added into the compiler pass so it finds the pointer
 * created via fopen, and then adds the call to close_file_if_open before
 * the call to free pointers
 */
void close_file_if_open(FILE* fp) {
    if (fp)
    {
        fclose(fp);
    }
}

// Might want to account for frees that happen out of order,
// use some null checks to properly iterate through the array, _ctr
// just points to the deepest point of the array,
int main(int argc, char *argv[]) 
{
    /*FILE *fp = fopen("/Users/ianpaterson/Downloads/Grad_Research-main/experiment/src/results/results_temp.txt", "w");
    clock_t start, start_total, end, end_total;
    double cpu_time_used;
        
    start_total = clock();*/

    // Run the program x number of times, the setjmp/longjmp logic
    // does not impact the loop counters
    //for (int i = 0; i < 10000; ++i)
    //{
        //start = clock();
        // set the buffer for the program to reset to this point instead of exiting
    int i = 1;
    setjmp(__longjmp_buf__);
    printf("\n___Start_Main %d___\n", i++);
    free_ptrs();
    if(i == 100000)
    {
        printf("\n---Done with Testing---\n");
        exit(1);
    }
    printf("\n!!!Saved by long jump!!!\n");
    /*end_total = clock();
    cpu_time_used = ((double) (end_total - start_total)) / CLOCKS_PER_SEC;
    //printf("%fs to run %d times\n",cpu_time_used, num);
    printf("Time to test: %f\n", cpu_time_used);*/

    return 0;
}

