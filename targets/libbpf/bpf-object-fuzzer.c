#include "libbpf.h"
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>


static int libbpf_print_fn(enum libbpf_print_level level, const char *format, va_list args)
{
	return 0;
}

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
	struct bpf_object *obj = NULL;
	DECLARE_LIBBPF_OPTS(bpf_object_open_opts, opts);
	int err;

	libbpf_set_print(libbpf_print_fn);

	opts.object_name = "fuzz-object";
	obj = bpf_object__open_mem(data, size, &opts);
	err = libbpf_get_error(obj);
	if (err)
		return 0;

	bpf_object__close(obj);
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
