#!/bin/bash

request=$1
concurrency=$2
concurrencyMax=$3
concurrenxyUp=$4
url=$5

while [ $concurrency -le $concurrencyMax ]
do
    ab -n $1 -c $concurrency -g "$1-$concurrency.data" $5
    (( concurrency+=$4 ))
done
