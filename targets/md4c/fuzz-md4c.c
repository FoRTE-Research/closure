
#include <stdint.h>
#include <stdlib.h>
#include "md4c-html.h"
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static void
process_output(const MD_CHAR* text, MD_SIZE size, void* userdata)
{
   /* This is a dummy function because we don't need to generate any output
    * actually. */
   return;
}

int
LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
{
    unsigned parser_flags, renderer_flags;

    if(size < 2 * sizeof(unsigned)) {
        /* We interpret the 1st 8 bytes as parser flags and renderer flags. */
        return 0;
    }

    parser_flags = *(unsigned*)data;
    data += sizeof(unsigned); size -= sizeof(unsigned);

    renderer_flags = *(unsigned*)data;
    data += sizeof(unsigned); size -= sizeof(unsigned);

    /* Allocate enough space */
    md_html(data, size, process_output, NULL, parser_flags, renderer_flags);

    return 0;
}



int main(int argc, char **argv) {
  int i;
  fprintf(stderr, "Running %d inputs\n", argc - 1);

  for (i = 1; i < argc; i++) {
    size_t len, err, n_read = 0;
    uint8_t *buf;
    FILE *f = NULL;

    f = fopen(argv[i], "rb+");
    if (f == NULL) {
      /* Failed to open this file: it may be a directory. */
      fprintf(stderr, "Skipping: %s\n", argv[i]);
      continue;
    }
    fprintf(stderr, "Running: %s %s\n", argv[0], argv[i]);

    fseek(f, 0, SEEK_END);
    len = ftell(f);
    fseek(f, 0, SEEK_SET);

    buf = (unsigned char *)malloc(len);
    if (buf != NULL) {
      n_read = fread(buf, 1, len, f);
      assert(n_read == len);
      LLVMFuzzerTestOneInput(buf, len);
      free(buf);
    }

    err = fclose(f);
    assert(err == 0);
    (void)err;

    fprintf(stderr, "Done:    %s: (%d bytes)\n", argv[i], (int)n_read);
  }

  return 0;
}
