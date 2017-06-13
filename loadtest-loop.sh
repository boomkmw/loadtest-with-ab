#!/bin/bash

request=$1
concurrency=$2
maxLoop=$3
countLoop=1
url=$4

while true
do
    if [ $countLoop -gt $maxLoop ]
    then
        break
    else
        ab -n $1 -c $concurrency -g "$1-$concurrency-$countLoop.data" $4
        (( countLoop+=1 ))
    fi
done
