#!/usr/bin/env bash

cat regex-text 

echo "grep multiple characters via regex"

cat regex-text | grep [aei]
cat regex-text | grep -E "s/[aei]/X/g"

echo "^ for reverse match"
cat regex-text | grep [^aei]

echo "$ is end of line"
cat regex-text | sed -E "s/$/X/g"

echo "? - element before can occur 0-1 times"
echo "* - element before can occur 0-n"
echo "+ - element before can occur 1 - n"

# . je hocijaky znak
# [:digit:] najde vsetky cisla
cat '[[:digit:]]' regex-text

#takto funguje aj alpha - pismena
#alnum - pismena aj cisla
#space - whitespace
# upper/lower 
#punch - interpunkcia
