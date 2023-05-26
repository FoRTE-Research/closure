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
        - `Run cmake with DCMAKE_C_COMPILER and DBUILD_SHARED_LIBS=Off DLIBXML2_WITH_PYTHON`
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
        - `Run cmake with DCMAKE_C_COMPILER and DBUILD_SHARED_LIBS=Off`
        - Build harness.c with libfreetype.a
            - `cp ../pngfix.c ./closure-build` (Do not directly use pngfix from the library, use this instead)
            - `cd closure-build`
            - `closure-compiler -lz -lm -I../ ./harness.c ./libpng16.a -o pngfix`
    - Fuzz command
        - Input type - png
        - `./pngfix @@`