# Seed Extension

Il file `database/seed_extension.sql` aggiunge un secondo livello di contenuti storici e di contesto.

## Cosa aggiunge

- nuove fonti ufficiali del Comune di Riva San Vitale e della Fondazione Monte San Giorgio;
- un nuovo luogo di contesto: il Museo dei fossili di Meride;
- nuovi eventi relativi alla chiesa di San Vitale e alla storia degli scavi sul Monte San Giorgio;
- una nuova narrazione editoriale sul nucleo storico.

## Ordine di esecuzione

```sql
\i database/schema.sql
\i database/seed.sql
\i database/seed_extension.sql
```

## Nota

Questo script e separato dal seed principale per permettere un arricchimento progressivo del database senza modificare il primo caricamento gia testato.
