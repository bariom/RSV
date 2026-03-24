# Seed Tempio Di Santa Croce

Questo seed arricchisce il luogo gia presente `tempio-di-santa-croce` con:

- fonti ufficiali e specialistiche;
- persone collegate al progetto e alla decorazione;
- eventi piu dettagliati del cantiere, della decorazione, della consacrazione e del restauro;
- un documento dedicato alla brochure ufficiale;
- una narrazione editoriale dedicata;
- tre media referenziati con metadati e diritti.

## File

- `database/seed_santa_croce.sql`

## Prerequisiti

Il seed presuppone che siano gia stati caricati almeno:

- `database/schema.sql`
- `database/seed.sql`

Puo convivere con:

- `database/seed_extension.sql`
- `database/seed_lugano_cultura.sql`
- `database/seed_isos_4087.sql`

## Esecuzione

In DBeaver o `psql` esegui:

```sql
\i database/seed_santa_croce.sql
```

## Fonti usate

- Comune di Riva San Vitale, brochure PDF: `https://www.rivasanvitale.ch/Tempio-di-Santa-Croce-14aa0500`
- Resta di Stucco: `https://restadistucco.ch/it/opere/tempio-di-santa-croce.desc`
- Fonte gia presente nel seed base: Comune di Riva San Vitale, pagina Santa Croce
- Fonte gia presente nel seed base: Ticino Turismo, scheda Santa Croce
- Wikimedia Commons, foto 2021: `https://commons.wikimedia.org/wiki/File:Tempio_Santa_Croce._Riva_San_Vitale._2021-02-20_17-22-47.jpg`
- Wikimedia Commons, foto 2005: `https://commons.wikimedia.org/wiki/File:Tempio_Santa_Croce._Riva_San_Vitale._2005-10-09_11-36-11.jpg`
- Wikimedia Commons, immagine storica del 1885: `https://commons.wikimedia.org/wiki/File:Zentralbibliothek_Z%C3%BCrich_-_S._Croce_i_Riva_S._Vitale_-_991132000899705501.jpg`

## Note

- I media sono inseriti come riferimenti remoti tramite `source_url`, non come file locali.
- Le informazioni bibliografiche su Della Torre e Damiani Cabrini sono inserite come fonti senza URL diretto.
- Il seed non sovrascrive la scheda esistente del tempio; aggiunge relazioni, fonti, eventi, persone e media.
