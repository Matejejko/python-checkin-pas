#!/usr/bin/env bash 

#zistite vsetky lokalnych userov na tomto stroji a ulozte ich do pola users
#/etc passd /etc/shadow - zdroj

#vytvorte subor s 2 stlpcami kde prvy stlpec je meno uzivatela a druhy stlpec je jeho ID
# ip meno

users=($(cut -d: -f1 /etc/passwd))
cut -d: -f1,3 /etc/passwd | tr ':' ' ' > users_list.txt

