#!/usr/bin/env bash
 
# vytvorim kopiu slova, otocim ju a porovnam
 
#input 2 sposoby
#1. sposob (pochopitelnejsi)
read -p "zadaj slovo" slovo
 
#2. sposob (menej CPU)
#slovo="$1"
 
pocet_pismen="$(echo -n "$slovo" | wc --chars)"
#pocet_pismen_MENEJCPU="${#slovo}"
 
#parny pocet 2 sposoby
 
if [ "$pocet_pismne" % 2 == 0]
then
   parny_pocet = true
else
   parny_pocet =
test "$pocet_pismen" % 2 == 0 && parny_pocet=true
 
 
#predelenie_dvomi=$"(echo "scale=2; 9 / 2" | bc | awk -F '.' '{print$2}')"
#test "predelenie_dvomi -gt 0 && parny_pocet=true
