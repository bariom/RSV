# Riva San Vitale

Prima base applicativa per il sito narrativo dedicato alla storia di Riva San Vitale.

## Struttura

- `database/`: schema, seed e query SQL;
- `web/`: demo statica iniziale;
- `app/`: applicazione `FastAPI + Jinja2` con dati locali in JSON.

## Perche questa struttura

L applicazione in `app/` non dipende da un database locale. Di default i contenuti arrivano da `app/data/site.json`, cosi puoi sviluppare il sito anche se non hai PostgreSQL installato sulla tua macchina.

Se imposti `DATABASE_URL`, l applicazione prova invece a leggere i contenuti dal database remoto tramite PostgreSQL.

## Avvio

Installa le dipendenze:

```bash
pip install -r requirements.txt
```

Avvia il server:

```bash
uvicorn app.main:app --reload
```

Poi apri:

- `http://127.0.0.1:8000/`
- `http://127.0.0.1:8000/timeline`
- `http://127.0.0.1:8000/luoghi/battistero-di-san-giovanni`
- `http://127.0.0.1:8000/persone/beato-manfredo-settala`

## Collegamento al database remoto

Puoi configurare il database in due modi:

### 1. Variabile d ambiente

```bash
DATABASE_URL=postgresql://utente:password@host:5432/dbname
```

Esempio PowerShell:

```powershell
$env:DATABASE_URL="postgresql://utente:password@host:5432/dbname"
uvicorn app.main:app --reload
```

### 2. File `.env`

Crea un file `.env` nella root del progetto:

```env
DATABASE_URL=postgresql://utente:password@host:5432/dbname
```

L applicazione lo legge automaticamente all avvio.

Con `DATABASE_URL` assente:

- l app usa `app/data/site.json`

Con `DATABASE_URL` presente:

- l app prova a leggere homepage, timeline, luoghi e persone dal database remoto

## Area admin

L app include una prima area amministrativa protetta da password:

- `/admin/login`
- `/admin`

Configura nel file `.env`:

```env
ADMIN_PASSWORD=una-password-lunga
APP_SECRET_KEY=una-chiave-segreta-per-le-sessioni
UPLOAD_DIR=uploads
```

Funzioni attuali:

- login protetto da password;
- elenco entita presenti nel DB;
- creazione e modifica di entita principali;
- gestione dettagli base per `place`, `person`, `event`, `document`, `media`, `narrative`, `organization`, `theme`;
- collegamento manuale di media a una scheda tramite slug;
- upload immagini su filesystem con path salvato nel DB.

## Passo successivo

Il passo successivo naturale e ampliare le query del repository per includere anche eventi collegati, fonti e media reali nelle singole pagine.
