#!/bin/bash
n=$1
m=""
while [ $n -gt 0 ]
do
    i=$(expr $n % 2)
    m="${i}${m}"
    n=$(expr $n / 2)
done
echo $m
