#!/bin/bash

OIFS=$IFS
IFS=','

for fpath in $1/*;
do
    cmd_copy=$3
    fname=${fpath#"$1/"}
    # echo $fname
    for token in $fname
    do
        if [[ "$token" == *"id:"* ]]; then
            id=${token#"id:"}
            
            export COVERAGE_DUMP_FILE=$2/"coverage"${id}

        fi
    done
    if [ -f $2/"coverage"${id} ];
    then
        echo "Already cached - $id"
    else
        cmd=${cmd_copy/"@@"/$fpath}
        echo "Parsing $id"
        eval "$cmd" > /dev/null 2>&1
    fi
done
