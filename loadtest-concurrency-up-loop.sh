#!/bin/bash

request=$1
request=$1
concurrency=$2
concurrencyMax=$3
concurrenxyUp=$4
maxLoop=$5
countLoop=1
url=$6

echo "start test" > ./result-test/log-req-per-sec.txt
printf "\n" >> ./result-test/log-req-per-sec.txt

while true
do
    if [ $countLoop -gt $maxLoop ]
    then
        break
    else
        while [ $concurrency -le $concurrencyMax ]
        do
            echo "Request: $1, Concurrency $concurrency" >> ./result-test/log-req-per-sec.txt
            ab -n $1 -c $concurrency -g "./result-test/$1-$concurrency-$countLoop-res.data" -e "./result-test/$1-$concurrency-$countLoop-res-serv.csv" $6 > ./result-test/$1-$concurrency-$countLoop-log.txt
            numberOfLine=`awk 'END{print FNR}' ./result-test/$1-$concurrency-$countLoop-log.txt`
            if [ $numberOfLine -eq 44 ]
            then
                awk '(NR==23){print $4}' ./result-test/$1-$concurrency-$countLoop-log.txt >> ./result-test/log-req-per-sec.txt
            else
                awk '(NR==22){print $4}' ./result-test/$1-$concurrency-$countLoop-log.txt >> ./result-test/log-req-per-sec.txt
            fi
            (( concurrency+=$4 ))
            printf "\n" >> ./result-test/log-req-per-sec.txt
        done
        (( countLoop+=1 ))
        (( concurrency=$2 ))
    fi
done

echo "end test" >> ./result-test/log-req-per-sec.txt
