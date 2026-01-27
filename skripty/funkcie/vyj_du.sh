#!/usr/bin/env bash
echo "zalomeny \
riadok"

echo "----- seriozna funkcia ----"
# funkcia, ktora urcuje vaznost suboru

function vaznost_suboru() {
  local skore_vaznosti=0
  local nazov_suboru="$1"
  local obsah_suboru="$(cat "$nazov_suboru")"

  # internal / confidential → +2
  echo "$obsah_suboru" | grep -i -e internal -e confidential >/dev/null 2>/dev/null && {
    skore_vaznosti=$(( skore_vaznosti + 2 ))
  }

  # +1 bod za kazdych 10 riadkov
  local pocet_riadkov_suboru="$(echo "$obsah_suboru" | wc -l)"
  skore_vaznosti=$(( skore_vaznosti + (pocet_riadkov_suboru / 10) ))

  # pristupove prava
  local prava=$(stat -c "%A" "$nazov_suboru")

  # owner
  [[ ${prava:1:1} == "r" ]] && skore_vaznosti=$(( skore_vaznosti + 1 ))
  [[ ${prava:2:1} == "w" ]] && skore_vaznosti=$(( skore_vaznosti + 10 ))
  [[ ${prava:3:1} == "x" ]] && skore_vaznosti=$(( skore_vaznosti + 5 ))

  # group
  [[ ${prava:4:1} == "r" ]] && skore_vaznosti=$(( skore_vaznosti + 1 ))
  [[ ${prava:5:1} == "w" ]] && skore_vaznosti=$(( skore_vaznosti + 10 ))
  [[ ${prava:6:1} == "x" ]] && skore_vaznosti=$(( skore_vaznosti + 5 ))

  # others
  [[ ${prava:7:1} == "r" ]] && skore_vaznosti=$(( skore_vaznosti + 1 ))
  [[ ${prava:8:1} == "w" ]] && skore_vaznosti=$(( skore_vaznosti + 10 ))
  [[ ${prava:9:1} == "x" ]] && skore_vaznosti=$(( skore_vaznosti + 5 ))

  # typ suboru
  local typ=$(file -b "$nazov_suboru")
  if echo "$typ" | grep -qi "ASCII text"; then
    skore_vaznosti=$(( skore_vaznosti - 10 ))
  elif echo "$typ" | grep -qi "binary"; then
    local velkost=$(stat -c "%s" "$nazov_suboru")
    skore_vaznosti=$(( skore_vaznosti + (velkost / 10) ))
  fi

  # vystup
  echo "Subor: $nazov_suboru"
  echo "Vaznost: $skore_vaznosti"
}

echo "spustam vaznost suboru s prvym argumentom skriptu"
vaznost_suboru "$1"

