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

4. **cjson (fuzz-main)**
    - Package - cJSON (github latest commit)
    - Target binary is a libfuzzer harness built in the fuzzing folder
    - Build Type - cmake
        - `Use DCMAKE_C_COMPILER and DCMAKE_CXX_COMPILER to change compiler`
        - `To build with closure-compilers, comment out all the -W (warning) flags in compiler flag list
        in CMakeLists.txt, also remove if (flag_supported) check and add all remaining compiler flags`