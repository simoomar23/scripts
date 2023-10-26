#!/bin/bash
n=$1
m=""
while [ $n -gt 0 ]
do
    i=$(expr $n % 10)
    m="${m}${i}"
    n=$(expr $n / 10)
done
echo $m
