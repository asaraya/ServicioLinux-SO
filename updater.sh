#!/bin/bash
exec > /home/andressalasaraya/Escritorio/ServicioLinux-SO/updater.log 2>&1

RUTA_PROYECTO="/home/andressalasaraya/Escritorio/ServicioLinux-SO"
cd "$RUTA_PROYECTO" || exit 1

git checkout Deployment
git fetch origin Deployment

LOCAL=$(git rev-parse Deployment)
REMOTE=$(git rev-parse origin/Deployment)

if [ "$LOCAL" != "$REMOTE" ]; then
  echo "[$(date)] Hay cambios. Actualizando..."
  git pull origin Deployment
  systemctl restart myapp.service
else
  echo "[$(date)] No hay cambios."
fi

