#!/bin/bash
base="CarnetsDeVoyage"
filtrage() {
    echo "$(ls $base | grep "^19[7-9][1-9][-_][A-Z].*")"
    
}
identify_rep() {
    rep=""
    s=0
    for i in $*  
    do
	if [ -d $base/$i ]
	then
	    if [ $s -lt $(du -s $base/$i | awk '{print $1}') ]
	    then
		rep="$i"
		s=$(du -s $base/$i | awk '{print $1}')
	    fi
	fi
	
    done
    echo "$base/$rep"
}
find_itineraries() {
    find $1 -type f -name "*Itineraire*"
}


find_signature() {
    for x in $*
    do
	if grep -q "Bilbon" "$x"
	then
	    a=$( cat $x | grep "à" | sort | head -n 3 | sed 's/./& /g' | awk '{print $1}' | tr -d '\n')
	    echo "$a"
	fi
    done
}	       

rep=$( identify_rep $( filtrage ) )
find_signature $( find_itineraries $rep )


