#!/bin/bash
awk '{if ($3=="Nom:Mas+InvPL" || $3=="Ver:Inf" || $3=="Ver:PPas+Mas+SG" || $3=="Adj:Mas+SG" || $3=="Adj:Mas+SG" || $3=="Adv" || $3=="Pro:Mas+SG" || $3=="Int") print $1}' dico.utf8 > mots.txt

word=$1
echo "$word" > word.txt
grep "^[$word]" mots.txt > sol.txt

awk -v word="$word" '{if (length($1) <= length(word)) print $1}' sol.txt > so.txt

awk '{print $1,length($1)}' so.txt | sort -k 2,2 -r | awk '{print $1}' > s.txt
p=$(cat s.txt | wc -l)

while [ $p -gt 0 ]
do
    c="1"
    x=$(head -n 1 s.txt)

    for i in $x
    do
        if ! grep -q "$i" word.txt
        then
            c="0"
        fi
    done

    if [ $c = "1" ]
    then
        echo $x
        break
    else
	grep -v "$x" s.txt > so.txt
	cat so.txt > s.txt
	p=$((p-1))

    fi

done
