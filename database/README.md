# Database storico per Riva San Vitale

Questa base dati e progettata per un sito narrativo e documentale sulla storia di Riva San Vitale. Il modello non tratta soltanto contenuti editoriali, ma anche relazioni storiche tra persone, luoghi, eventi, documenti, immagini e fonti.

## Scelta tecnica

Il file `database/schema.sql` assume PostgreSQL.

Motivi principali:

- gestisce bene relazioni complesse e metadati strutturati;
- consente di partire semplice e aggiungere funzioni di ricerca avanzata in seguito;
- e adatto a un archivio storico in cui una stessa entita puo comparire in molti contesti diversi.

## Struttura del modello

La tabella `entities` e il nucleo del sistema. Ogni contenuto pubblicabile del sito nasce li con:

- tipo (`place`, `person`, `organization`, `event`, `document`, `media`, `narrative`, `theme`);
- metadati editoriali (`slug`, `title`, `summary`, `status`);
- descrizione generale e campi liberi in `metadata`.

Le informazioni specifiche stanno poi nelle tabelle specializzate:

- `places`: luoghi storici e geografici;
- `people`: persone;
- `organizations`: enti, parrocchie, istituzioni, associazioni;
- `events`: fatti storici e cronologia;
- `documents`: fonti documentarie descritte e trascritte;
- `media_items`: immagini, scansioni, audio, video;
- `narratives`: testi editoriali del sito;
- `themes`: categorie trasversali come religione, archeologia, urbanistica.

Le relazioni trasversali si gestiscono con:

- `entity_sources`: collega qualsiasi entita alle fonti bibliografiche o archivistiche;
- `entity_media`: collega immagini o altri media alle entita;
- `entity_themes`: assegna temi;
- `entity_relations`: memorizza relazioni storiche generiche;
- `event_participants` e `event_places`: rendono piu semplici le query su eventi, persone e luoghi.

## Perche questo schema funziona bene per un comune storico

- Un evento puo coinvolgere piu persone e piu luoghi.
- Una persona puo comparire in documenti, immagini, narrazioni e fatti storici.
- Un documento puo essere collegato a una o piu fonti, avere una trascrizione e una scansione.
- Un testo editoriale puo raccontare una vicenda e linkare gli oggetti storici reali sottostanti.
- Le date incerte sono gestite con coppie `start/end` e un campo `date_label` per formule come `fine XV secolo` o `circa 1870`.

## Esempi di contenuti caricabili

- La storia del Battistero come `place`, con immagini in `media_items`, eventi di restauro in `events` e bibliografia in `sources`.
- Una figura locale come `person`, collegata a documenti, eventi pubblici e luoghi.
- Un atto notarile o un registro parrocchiale come `document`, con trascrizione e riferimento archivistico.
- Un articolo del sito come `narrative`, che sintetizza una fase storica e rimanda alle entita collegate.

## Estensioni consigliate piu avanti

- full-text search su testi e trascrizioni;
- gestione utenti/redazione e workflow editoriale;
- versionamento dei contenuti;
- importazione da fogli Excel o CSV;
- tassonomie piu dettagliate per periodi storici e collezioni archivistiche.

## Avvio

Per creare il database:

```sql
\i database/schema.sql
```

Per caricare anche un primo dataset storico:

```sql
\i database/seed.sql
```

Il file `database/seed.sql` contiene dati iniziali basati su fonti reali relative a Riva San Vitale. Le fonti usate vengono registrate anche nella tabella `sources`, cosi potrai mostrarle nel sito insieme ai contenuti storici.

Se preferisci, nel prossimo passo posso fare una delle due cose:

1. trasformare questo schema in migration per il framework che userai nel sito;
2. preparare alcune query utili per timeline, schede luogo e pagine persona.
