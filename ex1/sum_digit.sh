#!/bin/bash
n=$1
m=0
while [ $n -gt 0 ]
do
    i=$(expr $n % 10)
    m=$(expr $m + $i)
    n=$(expr $n / 10)
done
echo $m
