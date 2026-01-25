#!/bin/bash

FILE="zmeny.txt"

echo "casova stopa: $(date)" > "$FILE"
echo "Random hash: $(echo $RANDOM)" >> "$FILE"

echo "subor $FILE bol vytvoreny/aktualizovany"
