# Benchmarks

The following are the benchmarks used for closure experiments.

1. **djpeg-static**
    - Package - libjpeg-turbo (github latest commit)
    - Build Type - cmake
        - `Use DCMAKE_C_COMPILER and DCMAKE_CXX_COMPILER to change compiler`

2. **bsdtar**
    - Package - libarchive (github version 3.6.2)
    - Build Type - cmake 
        - `Use DCMAKE_C_COMPILER and DCMAKE_CXX_COMPILER to change compiler`
    - Fuzz command
        - Input type - .tar
        - `./bsdtar -xOf @@`

3. **nasm**
    - Package - nasm (github version 2.15.05)
    - Build Type - configure and make 
        - `Run configure with CC and CXX as closure-compilers`
    - Fuzz command
        - Input type - .asm
        - `./nasm -f as86 @@ -o fobj`

4. **cjson (fuzz-main)**
    - Package - cJSON (github latest commit)
    - Target binary is a libfuzzer harness built in the fuzzing folder
    - Build Type - cmake
        - `Use DCMAKE_C_COMPILER and DCMAKE_CXX_COMPILER to change compiler`
        - `To build with closure-compilers, comment out all the -W (warning) flags in compiler flag list
        in CMakeLists.txt, also remove if (flag_supported) check and add all remaining compiler flags`
    - Fuzz command
        - Input type - json
        - `cjson @@`


5. **sfconvert**
    - Package - audiofile (tar ball )
    - Target binary is sfconvert
    - Build Type - configure and make
        - `tar -xzf audiofile-0.2.7`
        - `Run configure CFLAGS="-g -O2 -no-pie" and CC as closure-compiler`
        - `make all`
    - Fuzz command
        - Input type - .wav
        - `sfconvert @@ out.mp3 format`

6. **xmllint**
    - Package - libxml2 (github version 2.10.3)
    - Build Type - cmake
        - `Run cmake with DCMAKE_C_COMPILER and DBUILD_SHARED_LIBS=Off DLIBXML2_WITH_PYTHON=Off`
    - Fuzz command 
        - Input type - .xml
        - `xmllint @@`

7. **freetype**
    - Package - freetype (github latest commit)
    - Target is a harness for freetype library
    - Build Type - cmake
        - `Run cmake with DCMAKE_C_COMPILER and DBUILD_SHARED_LIBS=Off`
        - Build harness.c with libfreetype.a
            - `cp ../harness.c ./closure-build`
            - `cd closure-build`
            - `closure-compiler -lz -lpng -lbz2 -I../include ./harness.c ./libfreetype.a -o freetype`
    - Fuzz command
        - Input type - ttf
        - `./freetype @@`

8. **pngfix**
    - Package - libpng (github latest commit)
    - Target is a png utility from the library
    - Build Type - cmake
        - `Run cmake with DCMAKE_C_COMPILER and DPNG_SHARED=Off`
        - Build pngfix.c with libpng16.a
            - `cp ../pngfix.c ./closure-build` (Do not directly use pngfix from the library, use this instead)
            - `cd closure-build`
            - `closure-compiler -lz -lm -I../ ./pngfix.c ./libpng16.a -o pngfix`
    - Fuzz command
        - Input type - png
        - `./pngfix @@`

9. **json-parser**
    - Package - json-parser (Github latest commit)
    - Target is an example source using libjsonparser library
    - Build Type - configure and make
        - `Run ./configure with CC=closure-compiler`
        - `make to build libraries`
        - `closure-compiler -I./ -lm ./examples/test_json.c ./libjsonparser.a -o json-parser`
    - Fuzz command
        - Input type - json
        - `./json-parser @@`

10. **imgdataopt**
    - Package - imgdataopt (Github latest commit)
    - Build Type - make
        - `Run make with CC=closure-compiler`
    - Fuzz commmand
        - Input type - png, pbm, pgm
        - `./imgdataopt @@ out.png`

11. **giftext**
    - Package - giflib (sourceforge download)
    - Target is a utility tool in giflib to process and print gif information
    - Build Type - make
        - `Run make with CC=closure-compiler`
    - Fuzz command
        - Input type - gif
        - `./giftext -c @@`

12. **gpmf-parser**
    - Package - gpmf-parser(Github latest commit)
    - Build Type - cmake
        - `Run cmake with DCMAKE_C_COMPILER=closure-compiler`
    - Fuzz command
        - Input type - mp4 (with gpfmf metadata)
        - `./gpmf-parser @@`

13. **libpcap**
    - Package - libpcap (Github latest commit)
    - Target is the `fuzz_both` binary in run directory
    - Build Type - cmake
        - Install flex, bison and libnl-genl-3-dev
        - `Run cmake with DCMAKE_C_COMPILER=closure-compiler DBUILD_SHARED_LIBS=Off`
    - Fuzz command
        - Input type - pcap
        - `./run/fuzz_both @@`

14. **zlib**
    - Package - zlib (Github latest commit)
    - Target is a harness from Google fuzzbench
    - Build Type - configure and make
        - `Run CC=closure-compiler ./configure followed by make to build the library`
        - `mkdir closure-build`
        - `closure-compiler ../../harness.c ../libz.a -o zlib_harness`
    - Fuzz Command
        - Input type - zlib archive
        - `./zlib_harness @@`

15. **c-blosc2**
    - Package - c-blocs2 (Github latest commit)
    - Target is a fuzz harness present in c-blosc2 repository
    - Build Type - CMake
        - `Run cmake with DCMAKE_C_COMPILER=closure-compiler and DBUILD_STATIC=On DBUILD_SHARED=Off`
    - Fuzz command
        - Input Type - bframe
        - `./tests/fuzz/decompress_chunk_fuzzer @@`

16. **cgif**
    - Package - cigf (Github latest commit)
    - Build type - Manual compilation
        - `closure-compiler -I../inc ../src/cgif.c ../src/cgif_raw.c ../fuzz/cgif_fuzzer.c ../fuzz/cgif_fuzzer_standalone.c -o cgif_harness`
    - Fuzz command
        - Input type - gif
        - `./cgif_harness @@`

17. **libbpf**
    - Package - libbpf (Linux kernel repo!!!)
    - Target requires installation of `libelf-dev`    
    - Build Type - make
        - `make CC=closure-compiler`
        - `closure-compiler -g -I../src/ -lz -lelf ../../bpf-object-fuzzer.c ./libbpf.a -o libbpf_harness`
    - Fuzz command
        - Input type - object file (included in repo)
        - `./libbpf_harness @@` 

18. **libdwarf**
    - Package - libdwarf-code (Github latest commit)
    - Build type - cmake and harness compilation
        - `Run cmake with DCMAKE_C_COMPILER=closure-compiler`
        - `cd closure-build`
        - `closure-compiler -I../src/lib/libdwarf -lz ../../fuzz_dnames.c ./src/lib/libdwarf/libdwarf.a -o libdwarf_harness`
    - Fuzz command
        - Input type - ELF binaries (corpus is on [Github](https://github.com/davea42/libdwarf-binary-samples/tree/master))
        - `./libdwarf_harness @@`

19. **lighttpd**
    - Package - lighttpd (Github latest commit)
    - Build type - configure and manual harness compilation
        - `sudo apt-get install pkg-config libtool`
        - `./autogen.sh`
        - `./configure --without-pcre --without-pcre2 --enable-static CC=closure-compiler`
        - `closure-compiler -I./src ./harness.c ./src/lighttpd-burl.o ./src/lighttpd-buffer.o ./src/lighttpd-base64.o ./src/lighttpd-ck.o -o fuzz_burl`
    - Fuzz command
        - Input type - URL
        - `./fuzz_burl @@`
    
20. **md4c**
    - Package - md4c (Github latest commit)
    - Build type - cmake and manual harness compilation
        - `cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_C_COMPILER=closure-compiler ..`
        - `closure-compiler -I../src ../../fuzz-md4c.c ./src/libmd4c-html.a ./src/libmd4c.a -o fuzz_md4c`
    - Fuzz command
        - Input type - .md files (corpus in test/fuzz-corpus folder)
        - `./fuzz_md4c @@`