# Query utili

Il file `database/queries.sql` contiene query di supporto per:

- controllare che il seed sia stato caricato bene;
- leggere la timeline storica;
- costruire schede luogo e persona;
- recuperare fonti, temi e media collegati.

## Uso

Esegui il file completo oppure copia una query alla volta in DBeaver.

```sql
\i database/queries.sql
```

## Query principali

- panoramica contenuti caricati;
- timeline degli eventi;
- eventi per luogo;
- eventi per persona;
- fonti collegate a una scheda;
- media collegati a una scheda;
- relazioni storiche tra entita.

## Suggerimento pratico

Per il frontend, la tabella `entities` puo diventare il punto di ingresso generale:

- una pagina usa `slug`;
- in base a `entity_type` carica i dettagli da `places`, `people`, `events` o altre tabelle;
- poi aggiunge fonti, temi, media e relazioni con query dedicate.
