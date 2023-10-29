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
    cle=""
    for x in $*
    do
	if grep -q "Bilbon" "$x"
	then
	    a=$( cat $x | grep "à" | sort | head -n 3 | sed 's/./& /g' | awk '{print $1}' | tr -d '\n')
	    cle=$x
	fi
    done
}	       

rep=$( identify_rep $( filtrage ) )
find_signature $( find_itineraries $rep )

cles=$(sort -k 3,3 $cle)
grep . <<< "$cles" > Itineraire_trie.txt
cat Itineraire_trie.txt | head -n 2 > Itineraire_trie_compact.txt
cat Itineraire_trie.txt | tail -n 2 >> Itineraire_trie_compact.txt
mots=$(cat Itineraire_trie_compact.txt | awk '{print $3}')
rm Itineraire_trie_compact.txt ; rm Itineraire_trie.txt
tresor=$(echo $mots | tr ' ' '/')
cat $base/$tresor
