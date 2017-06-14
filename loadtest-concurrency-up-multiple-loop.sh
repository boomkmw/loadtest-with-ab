#!/bin/bash

request=$1
concurrency=$2
concurrencyMax=$3
concurrenxyUp=$4
maxLoop=$5
countLoop=1
url=$6

echo "start test" > ./result-test/log-req-per-sec.txt

while [ $concurrency -le $concurrencyMax ]
do
    echo "Request: $1, Concurrency $concurrency" >> ./result-test/log-req-per-sec.txt
    ./loadtest-loop.sh $request $concurrency $maxLoop $url
    (( concurrency+=$4 ))
    printf "\n" >> ./result-test/log-req-per-sec.txt
done

echo "end test" >> ./result-test/log-req-per-sec.txt
