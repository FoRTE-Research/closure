# heap-reset pass for Closure

This pass replaces all the heap related functions to
custom implementations in the harness stub. 

Build:

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ cd ..

Run (with opt):

    $ opt -load build/libheapReset.so -heapreset <input>.c
