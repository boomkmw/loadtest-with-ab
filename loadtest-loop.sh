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
        ab -n $1 -c $concurrency -g "./result-test/$1-$concurrency-$countLoop-res.data" -e "./result-test/$1-$concurrency-$countLoop-res-serv.csv" $4 > ./result-test/$1-$concurrency-$countLoop-log.txt
        awk '(NR==21){print $4}' ./result-test/$1-$concurrency-$countLoop-log.txt >> ./result-test/log-req-per-sec.txt
        (( countLoop+=1 ))
    fi
done
