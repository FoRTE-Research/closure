#!/bin/bash
for (( c=0; c<= 10000; c++ ))
do
	./yara_plain -c ../../../FoRTE-FuzzBench-ZUT-master/yara/seed_dir/seed01.yar /dev/null
done	
