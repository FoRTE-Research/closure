#include <stdio.h>
//#include <time.h>
#include <stdlib.h>
#include <setjmp.h>
#include "uthash.h"

jmp_buf __longjmp_buf__;
//void *PTRTRACKER[100];
//int _ctr = 0;

struct ptr_obj {
    void* id;            /* we'll use this field as the key */
    void* ptr;         /* this field is for the hashed object */
    UT_hash_handle hh; /* makes this structure hashable */ //IDK how this works, they just said it does and it did
};

struct ptr_obj *ptr_map = NULL;

void add_ptr(void* key_ptr) {
    struct ptr_obj *s;

    s = malloc(sizeof(struct ptr_obj));
    s->id = key_ptr;
    s->ptr = key_ptr;
    HASH_ADD_INT(ptr_map, id, s);  /* id: name of key field */

}

struct ptr_obj *find_ptr(void* ptr_id) {
    struct ptr_obj *s;
    if(ptr_id == 0)
    {
        return NULL;
    }

    HASH_FIND_INT(ptr_map, ptr_id, s);
    return s;
}

void delete_ptr(struct ptr_obj *ptr) {
    HASH_DEL(ptr_map, ptr);
    //if(ptr != NULL)
    //{
      //  free(ptr);
    //}
}

/*
 * myMalloc is a stub function for malloc which stores the returned void type pointer
 * inside of an array to be deallocated in the event that free is never called 
 */
void* myMalloc(size_t size)
{
    void *tmp = (void*) malloc(size);
    //printf("Allocated Pointer: %d\n", tmp);
    add_ptr(tmp);
    //PTRTRACKER[_ctr] = tmp;
    //_ctr++;
    return tmp;
}

/*
 * My Free is a stub function for free which removes the pointer
 * from the array of void pointers and then frees the passed in 
 * pointer
 */
void myFree(void* ptr)
{
    //printf("Freeing Pointer: %d\n", ptr);
    if(ptr != NULL)
    {
        struct ptr_obj* tmp = find_ptr(ptr);
        //printf("%d\n",tmp);
        //printf("uhh oh, we've gone too far");
        //delete_ptr(tmp);
        free(ptr);
        //_ctr--;
        //PTRTRACKER[_ctr] = NULL;
        
    }
}

void free_ptrs() {
    struct ptr_obj *s;

    for (s = ptr_map; s != NULL; s = s->hh.next) {
        if(s->ptr != NULL)
        {
            myFree(s->ptr);
        }
    }
}


// Might want to account for frees that happen out of order,
// use some null checks to properly iterate through the array, _ctr
// just points to the deepest point of the array,
int main(int argc, char *argv[]) 
{
    //FILE *fp = fopen("/home/ian/Desktop/Grad_Research-main/experiment/src/results/results_curl.txt", "w");
    //clock_t start, start_total, end, end_total;
    //double cpu_time_used;
        
    //start_total = clock();

    // Run the program x number of times, the setjmp/longjmp logic
    // does not impact the loop counters
    for (int i = 0; i < 10000000; ++i)
    {
        //start = clock();
        // set the buffer for the program to reset to this point instead of exiting
        if (setjmp(__longjmp_buf__))
        {
            printf("\n!!!Saved by long jump!!!\n");
        }
        else
        {
            // just verify that all pointers are null before starting program
            printf("\n___Start_Main___\n");
        }
        free_ptrs();
        //end = clock();
        //cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
        //fprintf(fp,  "%f\n", cpu_time_used);
        // make sure all currently logged pointers are deallocated
        /*for (int j = 99; j >= 0; j--)
        {
            if (PTRTRACKER[j] != NULL)
            {
                printf("PTR: %d\n", PTRTRACKER[j]);
                myFree(PTRTRACKER[j]);
            }
        }*/
    }

    printf("\n---Done with Testing---\n");
    //end_total = clock();
    //cpu_time_used = ((double) (end_total - start_total)) / CLOCKS_PER_SEC;
    //printf("%fs to run %d times\n",cpu_time_used, num);
    //printf("Time to test: %f\n", cpu_time_used);

    return 0;
}

