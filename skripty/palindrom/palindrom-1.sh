#!/usr/bin/env bash
 
# vytvorim kopiu slova, otocim ju a porovnam
 
#input 2 sposoby
#1. sposob (pochopitelnejsi)
read -p "zadaj slovo " slovo
 
#2. sposob (menej CPU)
#slovo="$1"
 
#obratene slovo v novej premennej
obratene_slovo=$(echo "$slovo" | rev)
 
if [ "$slovo" == "$obratene_slovo" ]
then
   echo "slovo $slovo je palindróm"
else
   echo "slovo $slovo  nie je palindróm"
fi
