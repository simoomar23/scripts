#!/bin/bash
if [ $# -lt 2 ]
then
    echo bla bla
    ./readme.sh
    exit 0
fi	
op=$1
case $op in
    dec)
	op="d"
	;;
    len)
	op="l"
	;;
    mir)
	op="mir"
	;;
    sum)
	op="sum"
	;;
    bin)
	op="bin"
	;;
    int)
	op="int"
	;;
esac
shift
ne=0
neg=0
args="$*"
for x in $args
do
    isnum="$(expr 0 + $x 2>/dev/null)"
    if [ -z "$isnum" ]
    then
	ne=1
    else
	if [ $x -lt 0 ]
	then	    
	    neg=1	    
	fi	
    fi
done
if [ $ne -eq 1 ]
then
    echo "au moins un non nombre"
    ./readme.sh
else
    if [ $neg -eq 1 ]
    then
	echo "au moins un negatif"
	./readme.sh
    else
	case $op in
	    d)
		for x in $*
		do
		    ./decimal_to_binary.sh "$x"
		done	      
		;;
	    len)
		for x in $*
		do
		    ./len.sh "$x"
		done
		;;
	    mir)
		for x in $*
		do
		    ./mirror.sh "$x"
		done
		;;
	    sum)
		for x in $*
		do
		    ./sum_digit.sh "$x"
		done
		;;
	    bin)
		for x in $*
		do
		    ./binary_to_decimal.sh "$x"
		done
		;;
	    *)
		echo "enter un op valide"
		./readme.sh
	    ;;
	esac
    fi
fi
exit 0

    
    

