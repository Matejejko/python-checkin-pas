#!/usr/bin/env bash
 
# rozdelim slovo na polovicu, druhu otocim, a porovnam
 
#input 2 sposoby
#1. sposob (pochopitelnejsi)
read -p "Zadaj slovo: " slovo
 
#2. sposob (menej CPU)
#slovo="$1"
 
pocet_pismen="$(echo -n "$slovo" | wc --chars)"
#pocet_pismen_MENEJCPU="${#slovo}"
 
#parny pocet 2 sposoby
#1. sposob (pochopitelnejsi)
if [ $(( "$pocet_pismen" % 2 == 0 )) ]
then
   parny_pocet=true
else
   parny_pocet=false
fi
 
#2. sposob
#predelenie_dvomi=$"(echo "scale=2; 9 / 2" | bc | awk -F '.' '{print$2}')"
#test "predelenie_dvomi -gt 0 && parny_pocet=true
 
if [ "$parny_pocet" == "true"  ]
then
   polovica_znakov=$(( $pocet_pismen / 2 ))
   prva_polovica=${slovo::polovica_znakov}
   druha_polovica=${slovo::-polovica_znakov}
 
   echo "Tvoje slovo je : $prva_polovica - $druha_polovica"
else
   :
fi
 
#vypise 1 znak -> echo -n ${var::1}
#odkroji 1 znak -> ${var::-1}
#vypise jeden posledny znak
