// trace-pc-guard-cb.cc
#include <sanitizer/coverage_interface.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>

FILE * cov_dump_file = 0x0;

char * closure_edge_dump = 0x0;
char * closure_ptr = 0x0;
int closure_edge_coverage_data_written = 0;

// This callback is inserted by the compiler as a module constructor
// into every DSO. 'start' and 'stop' correspond to the
// beginning and end of the section with the guards for the entire
// binary (executable or DSO). The callback will be called at least
// once per DSO and may be called multiple times with the same parameters.
void __sanitizer_cov_trace_pc_guard_init(uint32_t *start, uint32_t *stop)
{
    char *cov_dump_filename = 0;
    if (getenv("COVERAGE_DUMP_FILE")) {
        cov_dump_filename = getenv("COVERAGE_DUMP_FILE");
        cov_dump_file = fopen(cov_dump_filename, "w");
        closure_edge_dump = (char *)calloc(10000, 1);
        closure_ptr = closure_edge_dump;
    }

    static uint64_t N; // Counter for the guards.
    if (start == stop || *start)
        return; // Initialize only once.
    printf("INIT: %p %p\n", start, stop);
    for (uint32_t *x = start; x < stop; x++)
        *x = ++N; // Guards should start from 1.
}

static void closure_fini(void) __attribute__((destructor)) {
    
    fwrite(closure_edge_dump, 1, closure_edge_coverage_data_written, cov_dump_file);
    fclose(cov_dump_file);
}


// This callback is inserted by the compiler on every edge in the
// control flow (some optimizations apply).
// Typically, the compiler will emit the code like this:
//    if(*guard)
//      __sanitizer_cov_trace_pc_guard(guard);
// But for large functions it will emit a simple call:
//    __sanitizer_cov_trace_pc_guard(guard);
void __sanitizer_cov_trace_pc_guard(uint32_t *guard)
{
    if (!*guard) {
        void *PC = __builtin_return_address(0);
        char PcDescr[1024];
        __sanitizer_symbolize_pc(PC, "%p %F %L", PcDescr, sizeof(PcDescr));
        printf("Could not find guard for %s", PcDescr);
        return;
    } // Duplicate the guard check.
    // If you set *guard to 0 this code will not be called again for this edge.
    // Now you can get the PC and do whatever you want:
    //   store it somewhere or symbolize it and print right away.
    // The values of `*guard` are as you set them in
    // __sanitizer_cov_trace_pc_guard_init and so you can make them consecutive
    // and use them to dereference an array or a bit vector.


    // This function is a part of the sanitizer run-time.
    // To use it, link with AddressSanitizer or other sanitizer.
    if (cov_dump_file) {
        if (closure_edge_coverage_data_written > 9990) {
            fwrite(closure_edge_dump, 1, closure_edge_coverage_data_written, cov_dump_file);
            memset(closure_edge_dump, 0, closure_edge_coverage_data_written);
            closure_edge_coverage_data_written = 0;
            closure_ptr = closure_edge_dump;
        }
        char s[20] = {0};
        int siz = sprintf(s, "%d,", *guard);
        closure_ptr = mempcpy(closure_ptr, s, siz);
        
        closure_edge_coverage_data_written += siz;
    }
}