
#!/usr/bin/env bash

echo menu

clear

volba=0
while [ "$volba" -ne 5 ]
do
    echo " "
    echo "===== MENU ====="
    echo "1 - meno a aktualna cesta"
    echo "2 - vypis IPv4 adrie"
    echo "3 - vypis nazov linuxu"
    echo "4 - vykonaj prikaz"
    echo "5 - exit"
    echo "================"

    read -p "zadaj volbu: " volba
case "$volba" in
    1)
        whoami
		pwd
        #echo "$(whoami) $(pwd)"
        ;;
    2)
        ip a | grep -w "inet" | awk -F' ' '{print $2}'
        exit
        ;;
    3)
        cat /etc/os-release | awk NR==1 | awk -F'=' '{print $2}' | tr -d \"
        read -p "press enter to continue..."
        ;;
    4)
        prikaz=0
        read -p "zadaj command: " prikaz
        $prikaz
		read -p "press enter to continue..."
        ;;
	5)
		#exit 0
		break
		;;
	*)
		echo "unknown choice."
		read -p "press enter to continue..."
esac

done











