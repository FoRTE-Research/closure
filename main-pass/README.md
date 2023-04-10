# rename-main pass for Closure

This pass renames the `main` function of a module to
`start_main`, this enables the stub harness `main`
function to replace and call the target's `main` function
(now `start_main`) and perform start resetting after every execution

Build:

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ cd ..

Run:

    $ clang -Xclang -load -Xclang build/librenameMain.so <input>.c
