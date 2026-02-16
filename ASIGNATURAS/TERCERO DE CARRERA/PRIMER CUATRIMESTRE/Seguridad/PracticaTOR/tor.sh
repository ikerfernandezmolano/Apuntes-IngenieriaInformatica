#!/bin/bash

#Index.html
sudo nano /var/www/web-onion/index.html
#Permisos
sudo chown www-data:www-data /var/www/web-onion
#Configurar apache2
sudo nano /etc/apache2/sites-available/web-onion.conf
#Activar y recargas
sudo a2ensite web-onion.conf
sudo systemctl reload apache2

#Configurar servicio Tor Onion
sudo nano /etc/tor/torrc

#Reiniciar TOR
sudo systemctl reload tor
sudo systemctl status tor

#Saber url
sudo cat /var/lib/tor/web-onion/hostname
