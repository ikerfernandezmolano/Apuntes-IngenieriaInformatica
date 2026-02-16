#!/bin/bash

#-sV para saber version del servicio
#-O sistema operativo

#Escaneo puertos abiertos en scanme.nmap.org
nmap -sV scanme.nmap.org

#Escaneo puertos abiertos en el Google
nmap -sV -Pn 34.175.178.246

#Máquinas activas desde local a gc
sudo nmap --traceroute 34.175.178.246

#Vulnerabilidades
https://cve.mitre.org

#Firewall
#-sA ACK
#-sF FIN
#-sN NULL
#-sX XMAS
#-p listar puertos a examinar
