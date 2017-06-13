#!/bin/bash

request=$1
concurrency=$2
concurrencyMax=$3
concurrenxyUp=$4
maxLoop=$5
countLoop=1
url=$6

while [ $concurrency -le $concurrencyMax ]
do
    ./loadtest-loop.sh $request $concurrency $maxLoop $url
    (( concurrency+=$4 ))
done
