#! /bin/bash
while :
do
echo "
Que Voulez vous savoir ?

[0] Nom de la machine
[1] Configuration IP général
[2] Adresses DNS
[3] Adresse DHCP
[4] Modèle de la machine
[5] Version du BIOS
[6] Infos CPU
[7] Infos RAM
[8] Liste cartes PCI
[9] Infos Disques Dur
[10] Liste des Modules chargés
[exit] Quitter
"
read -p "Que voulez vous savoir ? : " choix
case "${choix}" in
0)    echo "Voici le nom de la machine"
    hostname
    ;;
	
1)    echo "Voici la Configuration IP général"
    ip a
    ;;
	
2)    echo "Voici les Adresses DNS"
    cat /etc/resolv.conf
    ;;
	
3)    echo "Voici l'adresse du DHCP"
    cat /var/lib/dhcp/dhclient.* | grep dhcp-server-identifier | tail -1
    ;;
	
4)    echo "Voici le Modèle de la machine"
    dmidecode | grep "System Information" -A 2
    ;;
	
5)    echo "Voici la version du BIOS"
    biosdecode | more
    ;;

6)    echo "Voici les Infos CPU"
	cat /proc/cpuinfo | more
    ;;
	
7)    echo "Voici les Infos RAM"
    free -m
	cat /proc/meminfo | more
    ;;
8)    echo "Voici la Liste des cartes PCI"
     lspci -v | more
    ;;
	
9)    echo "Voici les Infos Disques Dur"
     /sbin/fdisk -l | more
    ;;

10)    echo "Voici la Liste des Modules chargés"
    /sbin/lsmod | more
    ;;



exit)    
    break
    ;;
*)    echo "Incorrect, saisissez un chiffre entre 0 et 10 ou exit pour quitter le programme."
    continue
    ;;
esac
done