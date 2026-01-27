#!/usr/bin/env bash

set -e
set -u


argument=${1:-default_value}

test "$argument" == "hodnota1" && {
	echo "zadal si argument 'hodnota1'"
	command_kt_neexistuje || true
	"hodnota1" || true
} || {
	echo "zadany argument bol $argument"
}

echo "posledny riadok skriptu"
