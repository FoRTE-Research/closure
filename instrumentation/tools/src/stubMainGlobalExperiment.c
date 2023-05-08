#include "uthash.h"
#include <fcntl.h>
#include <setjmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

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

int check_and_restore_global_sections(char *closure_global_section_addr, char *closure_global_section_copy,
                                      int closure_global_section_size)
{
    // Count the number of modified bytes in the global section
    // This is a byte level comparison and not a variable level comparison
    int num_modified = 0;
    mode_t given_mode = 0666;
    int fd = open("./global_restoration_bitmap", O_RDWR | O_CREAT, given_mode);
    for (int i = 0; i < closure_global_section_size; ++i)
    {
        if (closure_global_section_addr[i] != closure_global_section_copy[i])
        {
            num_modified++;
        }
        char byte = (closure_global_section_copy[i] ^ closure_global_section_addr[i]) & 0x1;
        write(fd, &byte, 1);
    }
    close(fd);
    mempcpy(closure_global_section_addr, closure_global_section_copy, closure_global_section_size);
    return num_modified;
}

// Might want to account for frees that happen out of order,
// use some null checks to properly iterate through the array, _ctr
// just points to the deepest point of the array,
int main(int argc, char *argv[])
{
    // Run the program x number of times, the setjmp/longjmp logic
    // does not impact the loop counters

    int closure_global_section_size = atoi(getenv("CLOSURE_GLOBAL_SECTION_SIZE"));

    int closure_global_section_addr = atoi(getenv("CLOSURE_GLOBAL_SECTION_ADDR"));

    char *closure_global_section_copy = malloc(closure_global_section_size);

    copy_global_sections(closure_global_section_addr, closure_global_section_copy, closure_global_section_size);

    for (int i = 0; i < 1; ++i)
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

        free_ptrs();
        printf("Closure - section addr %p\n", closure_global_section_addr);
        int num_modified = check_and_restore_global_sections(closure_global_section_addr, closure_global_section_copy,
                                                             closure_global_section_size);

        printf("Global Section size = %d\n Number of global bytes modified = %d", closure_global_section_size,
               num_modified);
    }

    printf("\n---Done with Testing---\n");

    return ret;
}
