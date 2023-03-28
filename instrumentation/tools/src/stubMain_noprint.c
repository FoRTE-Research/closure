#include <stdio.h>
#include <stdlib.h>
#include <setjmp.h>
#include "uthash.h"

jmp_buf _buf;
void *PTRTRACKER[100];
int _ctr = 0;

struct ptr_obj {
    int id;            /* we'll use this field as the key */
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

struct ptr_obj *find_ptr(int ptr_id) {
    struct ptr_obj *s;

    HASH_FIND_INT(ptr_map, &ptr_id, s);
    return s;
}

void delete_ptr(struct ptr_obj *ptr) {
    HASH_DEL(ptr_map, ptr);
    free(ptr);
}

/*
 * myMalloc is a stub function for malloc which stores the returned void type pointer
 * inside of an array to be deallocated in the event that free is never called 
 */
void* myMalloc(size_t size)
{
    void *tmp = (void*) malloc(size);
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
    delete_ptr(find_ptr(ptr));
    //_ctr--;
    //PTRTRACKER[_ctr] = NULL;
    free(ptr);
}

void free_ptrs() {
    struct ptr_obj *s;

    for (s = ptr_map; s != NULL; s = s->hh.next) {
        myFree(s->ptr);
    }
    HASH_CLEAR(hh, ptr_map);
}


// Might want to account for frees that happen out of order,
// use some null checks to properly iterate through the array, _ctr
// just points to the deepest point of the array,
int main(int argc, char *argv[]) 
{

    // Run the program x number of times, the setjmp/longjmp logic
    // does not impact the loop counters
    for (int i = 0; i < 100000; ++i)
    {
        // set the buffer for the program to reset to this point instead of exiting
        if (setjmp(_buf))
        {

        }
        else
        {
            // just verify that all pointers are null before starting program
            printf("Start_Main\n");
        }
        free_ptrs();
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

    return 0;
}

