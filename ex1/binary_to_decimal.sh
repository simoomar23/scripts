#!/bin/bash
n="$1"
s=0
l=1
m=$(echo $n | sed 's/./& /g')
for x in $m
do
    
	 if [ $x -ne 0 ] && [ $x -ne 1 ]
	 then
	     ./readme.sh
	     exit 0
	 fi
	 
done
while [ $n -gt 0 ]
do
    k=$((n % 2))
    s=$((s + k * l))
    l=$((2 * l))
    n=$((n / 10))
done
echo $s
