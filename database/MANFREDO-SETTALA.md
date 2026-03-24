# Seed Beato Manfredo Settala

Questo seed aggiunge un nucleo dedicato al **Beato Manfredo Settala** a partire dal documento fornito dall utente:

- `Vita, Leggenda e Culto del Beato Manfredo Settala.docx`

## File

- `database/seed_manfredo_settala.sql`

## Cosa Aggiunge

- arricchimento della scheda gia esistente del Beato Manfredo;
- nuova fonte di lavoro collegata al documento allegato;
- due luoghi pertinenti:
  - `Cuasso al Piano`
  - `Eremo del Beato Manfredo`
- nuovi eventi su:
  - ministero a Cuasso;
  - ritiro eremitico sul Monte San Giorgio;
  - contesa della sepoltura del 1217;
  - sagra annuale del Beato;
  - testimonianza figurativa quattrocentesca nel Battistero;
- una `narrative` dedicata;
- un `theme` su culto e devozione.

## Criterio Storico

Il documento mescola elementi:

- storici o plausibili;
- devozionali;
- apertamente leggendari.

Nel seed questi livelli non vengono fusi senza distinzione:

- gli aspetti piu tradizionali sono segnalati nelle note e nei metadata;
- le componenti leggendarie sono mantenute come parte della memoria culturale locale, non come fatti rigidamente documentari.

## Esecuzione

```sql
\i database/seed_manfredo_settala.sql
```

## Prerequisiti

Il seed presuppone che siano gia caricati almeno:

- `database/schema.sql`
- `database/seed.sql`

## Note

- Il seed e pensato come estensione non distruttiva.
- Non aggiunge media con URL pubblici, perche il documento allegato non fornisce collegamenti stabili a immagini riusabili.
- Se vuoi, il passo successivo naturale e un secondo seed con iconografia e media del Beato Manfredo, cercando fonti visive verificabili.
