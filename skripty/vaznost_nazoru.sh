#!/usr/bin/env bash

echo "----- seriozna funkcia -----"
#funkcia ktora urcuje vaznost suboru

function vaznost_suboru() {
    local skore_vaznosti=0
    local nazov_suboru="$1"
    local obsah_suboru="$(cat "$nazov_suboru")"
    echo "$subor" | grep -i -e internal -e confidential >/dev/null 2>dev/null && {
		skore_vaznosti$(( $skore_vaznosti + 2 ))
    }
	local pocet_riadkov_suboru=$"(echo "$obsah_suboru" | wc -l)"
	skore_vaznosti=$(( $skore_vaznosti + ($pocet_riadkov_suboru / 10) ))

	# output funkcie
	echo "subor: $nazov_suboru"
	echo "Vaznost: $skore_vaznosti"
}

echo "spustam vaznost suboru s prvym argumentom skriptu"
vaznost_suboru "$1"
