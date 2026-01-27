#!/bin/bash
#set -x

mypath="($realpath "$0")"	//realna cesta
mydir="$(dirname "4mypath")"
echo "$mypath"
echo "$mydir"
cd "$mydir"

test -z "$1" && {
  echo "first argument connot be empty"
  echo "exiting..."
  exit 0
}

if [ -n "$1"] ; then
  echo "no first argument entered"
  exit 0
fi

text=$1 

echo "$text" | sed 's/ / ' 
echo "$text" | wc -m 

touch "$text"

date > "$mydir/$text"


