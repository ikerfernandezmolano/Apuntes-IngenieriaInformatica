#!/bin/bash

# Instalar python3
sudo apt update
sudo apt install python3 python3-venv python3-pip

# Crear venv si no existe
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

# Activar venv
source venv/bin/activate

# Instalar dependencias si existe requirements.txt
if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
fi

echo "Entorno listo y activado"
