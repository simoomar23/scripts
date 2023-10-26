#!/bin/bash
base="CarnetsDeVoyage"
filtrage() {
    echo "$(ls $base | grep "^19[7-9][1-9][-_][A-Z].*")"
    
}
identify_rep() {
    for i in $*  
    do
	if [ -d $base/$i ]
	then
	   echo $i
	fi
    done
    
}

find_itineraries() {
    find $1 -type f -name "Itineraire"
}

rep=$( identify_rep $( filtrage ) )
find_itineraries $rep
 
