#! /bin/bash

set -eu


# AK existuje 3-ty argument a je "--debug" spusti set -x
if [[ ${3:-} == "--debug" ]]; then
    set -x
fi


# overenie argumentov proste kontrolujeme ci tam je minimalne 2 argumenty
if [ $# -lt 2 ]; then
	echo "zly sintax, min. 2 argumenty cesta a typ (asi teda neni to take ze ti tu rozkazujem)"
	exit 2
fi

file="$1"
type="$2"

if [[ ! -f "$file" ]]; then
    echo "Súbor '$file' neexistuje. gone :<"
    exit 2
fi

case "$type" in 
	--type=log) 
		echo "spracovanie suboru :> $file...."
	
		# spusti command a ulozy odpoved do ...	true = sa ujisti ze ak je error napr v grep ze nenajde "error" tak ze skript bude pokracovat
		# -c == count
		pocet_riadkov=$(wc -l < $file || true)
		error_pocet=$(grep -c "ERROR" $file || true)
		warning_pocet=$(grep -c "WARNING" $file || true)
		info_pocet=$(grep -c "INFO" $file || true)

		# aritmetika chyby + warnings
        total_errors=$((error_pocet + warning_pocet))
		
		#odpoved v terminaly
		echo ""
		echo "= = = = = = = = = = = = = = = = = = = ="
		echo "skript: $0"
		echo "subor: $1"
			# ">" vytvori novy subor s nazvom log_report.txt a zapise don, ">>" zapise na koniec file-u 
		echo "Počet riadkov je - $pocet_riadkov" | tee log_report.txt
		echo "Počet error-ov je - $error_pocet" | tee -a log_report.txt
		echo "Počet warning-ov je - $warning_pocet" | tee -a log_report.txt
		echo "Počet info je - $info_pocet" | tee -a log_report.txt
		echo "Celkové chyby (ERROR + WARNING): $total_errors" >> log_report.txt

		echo "======================"
		echo "Prvých 5 riadkov:"
		echo ""
		head -n 5 "$file"
		echo ""
		echo "Posledných 5 riadko:"
		echo ""
		tail -n 5 "$file"
 		echo ""
		# ak je error_pocet vacsi ako 1 tak da chyba najdena ak neni da bez chyb
		[[ $error_pocet -gt 0 ]] && echo "Chyby nájdené :<" || echo "Bez chýb :>"	
		echo "= = = = = = = = = = = = = = = = = = = ="	
		echo""
		exit 0
	;;
	--type=csv)
		echo "spracovanie suboru :>..."
		echo ""
		echo "= = = = = = = = = = = = = = = = = = = ="
		#odstranenie prazdnych riadkov
		sed '/^$/d' "$file" > csv_clean.txt
		#spocitanie riadkov
		pocet_riadkov_CSV=$(wc -l < csv_clean.txt)
		echo "pocet riadkov v subore je: $pocet_riadkov_CSV" | tee csv_report.txt

		IFS=,
		#vypis konkretneho stlpca
		# odstrani prvy riadok zoberie 3 stlpec, nasledne berie do hodnoti iba casti kde su cislo tz nebude priemerovat veci co su text ps tie su automaticky za hodnotu 0, scita to 
		# a ak je cislo viac ako jedna vypise ho ak neni da N/A
		avg=$(awk -F, '
            NR>1 && $3 ~ /^[0-9]+$/ { sum += $3; count++ }
            END { if (count > 0) print sum / count; else print "N/A" }
        ' csv_clean.txt)

        echo "Priemerná hodnota v treťom stĺpci: $avg" | tee -a csv_report.txt

        echo "Spracovaný a uložený do csv_report.txt"
		echo ""
		echo "= = = = = = = = = = = = = = = = = = = ="	
		echo""

        exit 0
	;;
	*)
		echo "error"
		exit 1
	;;

esac
