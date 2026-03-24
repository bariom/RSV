# Seed Da Documento Di Ricerca

Questo seed nasce dal documento fornito dall utente:

- `Fonti Storiche Riva San Vitale.docx`

## File

- `database/seed_docx_research.sql`

## Criterio Di Selezione

Il documento contiene una ricerca ampia e utile, ma non tutte le fonti elencate hanno lo stesso livello di affidabilita.

Per questo seed sono stati privilegiati soprattutto:

- fonti istituzionali;
- repertori scientifici;
- studi universitari o archivistici;
- fonti locali chiaramente identificabili.

Sono state invece evitate o non strutturate direttamente:

- fonti secondarie poco controllabili;
- riferimenti enciclopedici deboli o aggregatori;
- parti troppo speculative non facilmente modellabili nel DB.

## Contenuti Aggiunti

- nuove fonti su epigrafia romana, Battistero, archivio di Meride, Fornaci e Patriziato;
- eventi su palafitte preistoriche, porto romano, quadrato del Sator, separazione di Meride, restauro Tallone del 1921;
- documenti dedicati alla stele di Romatius, all ara a Mercurio e al quadrato del Sator;
- una narrazione editoriale di sintesi;
- un tema trasversale su epigrafia e fonti materiali.

## Esecuzione

```sql
\i database/seed_docx_research.sql
```

## Note

- Il seed e pensato come estensione non distruttiva dei seed gia esistenti.
- Alcune affermazioni del documento originale sono state sintetizzate o rese piu caute quando il grado di certezza appariva inferiore.
