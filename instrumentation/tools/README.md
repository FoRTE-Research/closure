Src contains the pace_server and the stub to be added to each of the programs. This is probably not the best way to do this and instead the code could be added via another pass. I will look into this option if time permits. 


The pace_server works by setting a trigger flag via shared memory that triggers the stub to start executing the code of the fuzzed program.

Input is passed only a single time and is updated via afl after the program has finished execution. This means that only a single input can be tested per thread.
