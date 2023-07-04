// trace-pc-guard-cb.cc
#include <sanitizer/coverage_interface.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>

extern FILE* cov_dump_file;

extern char* closure_edge_dump;
extern char* closure_ptr;
extern int closure_edge_coverage_data_written;

void __sanitizer_cov_trace_pc_guard_init(uint32_t* start, uint32_t* stop) {
    static uint64_t N;  // Counter for the guards.
    if (start == stop || *start)
        return;  // Initialize only once.
    printf("INIT: %p %p\n", start, stop);
    for (uint32_t* x = start; x < stop; x++)
        *x = ++N;  // Guards should start from 1.
}

void __sanitizer_cov_trace_pc_guard(uint32_t* guard) {
    if (!*guard) {
        return;
    }

    // if (cov_dump_file != NULL) {
    //     if (closure_edge_coverage_data_written > 9990) {
    //         fwrite(closure_edge_dump, 1, closure_edge_coverage_data_written, cov_dump_file);
    //         memset(closure_edge_dump, 0, closure_edge_coverage_data_written);
    //         closure_edge_coverage_data_written = 0;
    //         closure_ptr                        = closure_edge_dump;
    //     }
    //     char s[20]  = {0};
    //     int siz     = sprintf(s, "%d,", *guard);
    //     closure_ptr = mempcpy(closure_ptr, s, siz);

    //     closure_edge_coverage_data_written += siz;
    // }
    // else {
    //     printf("%d,", *guard);
    // }
}