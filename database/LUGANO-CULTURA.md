# Lugano Storia

Il file `database/seed_lugano_cultura.sql` aggiunge contenuti estratti dal portale Lugano Storia.

## Cosa aggiunge

- fotografie storiche del Battistero e della chiesa di San Vitale;
- una stampa commemorativa di Gottardo Zurini;
- una petizione del 1803;
- un periodico del 1910 collegato a Riva San Vitale;
- aggiornamento delle date biografiche di Gottardo Zurini se ancora mancanti.

## Ordine di esecuzione

```sql
\i database/schema.sql
\i database/seed.sql
\i database/seed_extension.sql
\i database/seed_lugano_cultura.sql
```

## Nota

La scheda luogo `Riva San Vitale` del portale e molto sintetica, ma gli oggetti collegati sono utili per arricchire il database con documenti e media storici puntuali.
