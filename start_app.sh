#!/bin/bash

# 1. Naviga nella cartella del progetto (modifica il percorso se necessario)
# cd /percorso/della/tua/app

# 2. Attiva il virtual environment
# Assumendo che la cartella .venv sia nella root del progetto
source .venv/bin/activate

# 3. Lancia uvicorn in background con nohup
# - nohup: ignora il segnale di chiusura del terminale (SIGHUP)
# - & : mette il processo in background
# - > output.log 2>&1 : salva log e errori in un file per debugging
nohup uvicorn app.main:app --host 0.0.0.0 --port 8000 > output.log 2>&1 &

echo "Applicazione avviata in background. Puoi chiudere Putty."
echo "Il PID del processo è: $!"