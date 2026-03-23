# Seed ISOS 4087

Il file `database/seed_isos_4087.sql` aggiunge contenuti derivati dal PDF ISOS fornito dall utente:

- fonte bibliografica del documento ISOS;
- documento descritto come entita del database;
- nuovi luoghi: `Fornaci`, `Cappella di San Rocco`, `Istituto San Canisio`, `Lumaghera`, `Sviluppo verso Capolago`;
- eventi di lunga durata su continuita insediativa, produzione di laterizi e trasformazioni del Laveggio;
- una narrazione dedicata alla struttura insediativa del borgo;
- nuovi temi: `Urbanistica storica` e `Laterizi e fornaci`.

## Ordine di esecuzione

```sql
\i database/schema.sql
\i database/seed.sql
\i database/seed_extension.sql
\i database/seed_lugano_cultura.sql
\i database/seed_isos_4087.sql
```

## Nota

Il PDF contiene molte parti grafiche e cartografiche che non sono state trasformate in seed. Questo script usa solo le informazioni testuali chiaramente leggibili e pertinenti al modello dati.
