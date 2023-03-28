#!/bin/bash
#start_time="$(date -u +%s)"
for (( c=1; c<=10000000; c++ ))
do  
   curl 127.0.0.1
done
#end_time="$(date -u +%s)"
#elapsed="$(($end_time-$start_time))"
#echo "Total of $elapsed seconds elapsed for process (UNTOOLED LOOP)" >> out.txt

#start_time="$(date -u +%s)"
#./src/run.out
#end_time="$(date -u +%s)"
#elapsed="$(($end_time-$start_time))"
#echo "Total of $elapsed seconds elapsed for process (TOOLED LOOP)" >> out.txt
