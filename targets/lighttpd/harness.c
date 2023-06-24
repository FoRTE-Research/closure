#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#include "burl.h"
#include "buffer.h"

void run_burl_normalize (buffer *psrc, buffer *ptmp, 
						int flags, int line, const char *in, 
						size_t in_len) {
    int qs;
    buffer_copy_string_len(psrc, in, in_len);
    qs = burl_normalize(psrc, ptmp, flags);
}

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    if (size <= 4) {
        return 0;
    }
    int flags = ((int*)data)[0];
    data += 4;
    size -= 4;
    char *new_str = (char *)malloc(size+1);
    if (new_str == NULL){
        return 0;
    }
    memcpy(new_str, data, size);
    new_str[size] = '\0';

    /* main fuzzer entrypoint for library */
    buffer *psrc = buffer_init();
    buffer *ptmp = buffer_init();
    run_burl_normalize(psrc, ptmp, flags, __LINE__, new_str, size);
    buffer_urldecode_path(psrc);

    buffer_free(psrc);
    buffer_free(ptmp);
    free(new_str);
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

