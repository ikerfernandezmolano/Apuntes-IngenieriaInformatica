#!/bin/bash

#Sincroniza dir 1 con dir 2
#-a mantiene permisos, fechas, etc.
#-v muestra
#si /home/$USER/Seguridad/ lo de dentro
rsync -av /home/$USER/Seguridad /var/tmp/Backups

#link-dest es para hard links
rsync -av --link-dest=/var/tmp/Backups/fechaayer . /var/tmp/Backups/fechahoy

#Remoto
rsync -av -e ssh --link-dest=/var/tmp/Backups/fechaayer/Seguridad/ . userikerr@34.175.178.246:/home/userikerr/Seguridad/fechahoy
