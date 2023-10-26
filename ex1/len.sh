#!/bin/bash
n=$1
i=0
while [ $n -gt 0 ]
do
    n=$(expr $n  / 10)
    i=$(expr $i + 1)
done
echo $i
