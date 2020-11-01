#!/bin/bash

PS3='Que voulez-vous savoir ? '
options=("Configuration IP" "Modèle de la machine" "La version du BIOS" "La Mémoire utilisé" "Les cartes PCI" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Configuration IP")
            ip a
            ;;
        "Modèle de la machine")
            dmidecode | grep "System Information" -A 2
            ;;
        "La version du BIOS")
            biosdecode
            ;;
	"La Mémoire utilisé")
            free -m
            ;;
	"Les cartes PCI")
            lspci
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

