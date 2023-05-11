#include "uthash.h"
#include <setjmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

jmp_buf __longjmp_buf__;

extern char __bss_start;
extern char __data_start;

typedef struct
{
    void *key;                                             /* we'll use this field as the key */
    int i;                                                 /* this field is for the hashed object */
    UT_hash_handle hh; /* makes this structure hashable */ // IDK how this works, they just said it does and it did
} ptr_obj;

ptr_obj *ptr_map = NULL;

void add_ptr(void *key_ptr)
{
    ptr_obj *s;

    s = malloc(sizeof(ptr_obj));
    s->key = key_ptr;
    s->i = 1;
    HASH_ADD_PTR(ptr_map, key, s); /* id: name of key field!!! LOOK MORE INTO THIS, REPLACE WITH THE CORRECT FUNCTION
                                      FOR ADDING A VOID POINTER AND THEN RECREATE WITH FIND */
}

// Responsible for finding the pointer to confirm that
ptr_obj *find_ptr(void *ptr_id)
{
    ptr_obj *s;

    HASH_FIND_PTR(ptr_map, &ptr_id,
                  s); // Change to the correct function for storing a void pointer, maybe this can be simplified.
    return s;
}

// Deletes the pointer object from the hash table
void delete_ptr(ptr_obj *obj)
{
    if (obj != NULL)
    {
        HASH_DEL(ptr_map, obj);
        free(obj);
    }
}

/*
 * myMalloc is a stub function for malloc which stores the returned void type pointer
 * inside of an array to be deallocated in the event that free is never called
 */
void *myMalloc(size_t size)
{
    void *tmp = malloc(size);
    add_ptr(tmp);
    return tmp;
}

/*
 * myCalloc is a stub function for malloc which stores the returned void type pointer
 * inside of an array to be deallocated in the event that free is never called
 */
void *myCalloc(size_t nmemb, size_t size)
{
    void *tmp = calloc(nmemb, size);
    if (tmp != NULL)
    {
        add_ptr(tmp);
    }
    return tmp;
}

/*
 * myRealloc is a stub function for malloc which stores the returned void type pointer
 * inside of an array to be deallocated in the event that free is never called
 */
void *myRealloc(void *ptr, size_t size)
{
    void *tmp = realloc(ptr, size);
    if (ptr != NULL)
    {
        ptr_obj *p = find_ptr(ptr);
        delete_ptr(p);
    }
    if (tmp != NULL && size != 0)
    {
        add_ptr(tmp);
    }
    return tmp;
}

/*
 * My Free is a stub function for free which removes the pointer
 * from the array of void pointers and then frees the passed in
 * pointer
 */
void myFree(void *ptr)
{
    ptr_obj *p = find_ptr(ptr);
    free(ptr);
    delete_ptr(p);
}

void free_ptrs()
{
    ptr_obj *s, *tmp;
    HASH_ITER(hh, ptr_map, s, tmp)
    {
        free(s->key);
        delete_ptr(s);
    }
}

/*
 * Used for closing a file if the program exits before closing the
 * file. Should be added into the compiler pass so it finds the pointer
 * created via fopen, and then adds the call to close_file_if_open before
 * the call to free pointers
 */
void close_file_if_open(FILE *fp)
{
    if (fp)
    {
        fclose(fp);
    }
}

int ret = 0;

void exitHook(int status)
{
    ret = status;
    longjmp(__longjmp_buf__, status);
}

void copy_global_sections(char *closure_global_section_addr, char *closure_global_section_copy,
                          int closure_global_section_size)
{
    mempcpy(closure_global_section_copy, closure_global_section_addr, closure_global_section_size);
    return;
}

void restore_global_sections(char *closure_global_section_addr, char *closure_global_section_copy,
                             int closure_global_section_size)
{
    mempcpy(closure_global_section_addr, closure_global_section_copy, closure_global_section_size);
    return;
}

typedef struct
{
    FILE *f;                                               /* we'll use this field as the key */
    int i;                                                 /* this field is for the hashed object */
    UT_hash_handle hh; /* makes this structure hashable */ // IDK how this works, they just said it does and it did
} file_ptr_obj;

file_ptr_obj *file_ptr_map = NULL;

void add_file_ptr(FILE *key_ptr)
{
    file_ptr_obj *s;

    s = malloc(sizeof(file_ptr_obj));
    s->f = key_ptr;
    s->i = 1;
    HASH_ADD_PTR(file_ptr_map, f, s); /* id: name of key field!!! LOOK MORE INTO THIS, REPLACE WITH THE CORRECT
                                      FUNCTION FOR ADDING A VOID POINTER AND THEN RECREATE WITH FIND */
}

// Responsible for finding the pointer to confirm that
file_ptr_obj *find_file_ptr(FILE *ptr_id)
{
    file_ptr_obj *s;

    HASH_FIND_PTR(file_ptr_map, &ptr_id,
                  s); // Change to the correct function for storing a void pointer, maybe this can be simplified.
    return s;
}

// Deletes the pointer object from the hash table
void delete_file_ptr(file_ptr_obj *obj)
{
    if (obj != NULL)
    {
        HASH_DEL(file_ptr_map, obj);
        free(obj);
    }
}

FILE *fopen_hook(const char *pathname, const char *mode)
{
    FILE *f = fopen(pathname, mode);
    add_file_ptr(f);
    return f;
}

int fclose_hook(FILE *f)
{
    file_ptr_obj *p = find_file_ptr(f);
    int ret = fclose(f);
    delete_file_ptr(p);
    return ret;
}

void close_open_file_handles()
{
    file_ptr_obj *s, *tmp;
    HASH_ITER(hh, file_ptr_map, s, tmp)
    {
        fclose(s->f);
        delete_file_ptr(s);
    }
}

// Might want to account for frees that happen out of order,
// use some null checks to properly iterate through the array, _ctr
// just points to the deepest point of the array,
int main(int argc, char *argv[])
{
    // Run the program x number of times, the setjmp/longjmp logic
    // does not impact the loop counters

    int reset_globals = 0;
    int closure_global_section_size = 0;
    int closure_global_section_addr = 0;
    char *closure_global_section_copy = NULL;
    if (getenv("CLOSURE_GLOBAL_SECTION_SIZE") && getenv("CLOSURE_GLOBAL_SECTION_ADDR")) {
        closure_global_section_size = atoi(getenv("CLOSURE_GLOBAL_SECTION_SIZE"));

        closure_global_section_addr = atoi(getenv("CLOSURE_GLOBAL_SECTION_ADDR"));

        closure_global_section_copy = malloc(closure_global_section_size);

        reset_globals = 1;
    
    }
    for (int i = 0; i < 10; ++i)
    {

        //  set the buffer for the program to reset to this point instead of exiting
        if (setjmp(__longjmp_buf__))
        {
            printf("\n!!!Saved by long jump!!!\n");
        }
        else
        {
            // just verify that all pointers are null before starting program
            ret = start_main(argc, argv);
        }

        close_open_file_handles();
        free_ptrs();
        if (reset_globals != 0) {
            restore_global_sections(closure_global_section_addr, closure_global_section_copy, closure_global_section_size);
        }    
    }

    printf("\n---Done with Testing---\n");

    return ret;
}
