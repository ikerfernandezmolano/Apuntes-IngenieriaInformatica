#!/bin/bash

#Borrar reglas previas
sudo iptables -F

#No permitir trafico entrante si no hay regla
sudo iptables -P INPUT DROP
#Rechazar  paquetes que pasen a traves del servidor
sudo iptables -P FORWARD DROP
#Aceptar trafico saliente
sudo iptables -P OUTPUT ACCEPT

#Permitir loopback
sudo iptables -A INPUT -i lo -j ACCEPT

#Permite SSH desde IPs especificas
sudo iptables -A INPUT -p tcp -s 81.9.211.95 --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp -s IPCOMPAÑERO --dport 22 -j ACCEPT

#Permitir FTP desde ehu.eus
sudo iptables -A INPUT -p tcp -s 158.227.0.65 --dport 21 -j ACCEPT
sudo iptables -A INPUT -p tcp -s 158.227.0.65 --dport 20 -j ACCEPT

#Rechazar conexiones HTTP (Solo HTTPS)
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j DROP

#No salientes Twitter, Facebook y Youtube
sudo iptables -A OUTPUT -p tcp -d 142.250.184.174 -j DROP
sudo iptables -A OUTPUT -p tcp -d 162.159.140.229 -j DROP
sudo iptables -A OUTPUT -p tcp -d 31.13.83.36 -j DROP

# -p protocolo
# --dport puerto del protocolo
# -A INPUT OUTPUT FORWARD
# -i interfaz lo, wifi (ip addr)
# -s ip origen
# -d ip destino
# -j ACCEPT/DROP
