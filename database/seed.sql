BEGIN;

INSERT INTO sources (
    id,
    source_type,
    title,
    citation,
    author_text,
    publisher,
    publication_year,
    language_code,
    url,
    accessed_on,
    notes_md
) VALUES
    (
        '90000000-0000-0000-0000-000000000001',
        'article',
        'Riva San Vitale',
        'Stefania Bianchi, "Riva San Vitale", Dizionario storico della Svizzera, versione del 30.06.2022.',
        'Stefania Bianchi',
        'Dizionario storico della Svizzera',
        2022,
        'it',
        'https://hls-dhs-dss.ch/it/articles/002242/',
        DATE '2026-03-23',
        'Fonte sintetica principale per cronologia storica, pieve, economia e monumenti.'
    ),
    (
        '90000000-0000-0000-0000-000000000002',
        'website',
        'Cenni storici',
        'Comune di Riva San Vitale, "Cenni storici".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        2026,
        'it',
        'https://www.rivasanvitale.ch/Cenni-storici-a4b3f900',
        DATE '2026-03-23',
        'Usata per il racconto civico locale, la Repubblica del 1798 e don Gottardo Zurini.'
    ),
    (
        '90000000-0000-0000-0000-000000000003',
        'website',
        'Battistero paleocristiano',
        'Comune di Riva San Vitale, "Battistero paleocristiano".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        2026,
        'it',
        'https://www.rivasanvitale.ch/Battistero-paleocristiano-9740be00',
        DATE '2026-03-23',
        'Usata per la descrizione sintetica del Battistero di San Giovanni.'
    ),
    (
        '90000000-0000-0000-0000-000000000004',
        'website',
        'Chiesa parrocchiale di San Vitale',
        'Comune di Riva San Vitale, "Chiesa parrocchiale di San Vitale".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        2026,
        'it',
        'https://www.rivasanvitale.ch/Chiesa-parrocchiale-di-San-Vitale-7e8e8000',
        DATE '2026-03-23',
        'Usata per il profilo della chiesa parrocchiale e per i dati sul rifacimento settecentesco.'
    ),
    (
        '90000000-0000-0000-0000-000000000005',
        'website',
        'Tempio di Santa Croce',
        'Comune di Riva San Vitale, "Tempio di Santa Croce".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        2026,
        'it',
        'https://www.rivasanvitale.ch/Tempio-di-Santa-Croce-a2febd00',
        DATE '2026-03-23',
        'Usata per cronologia, committenza e descrizione del tempio di Santa Croce.'
    ),
    (
        '90000000-0000-0000-0000-000000000006',
        'website',
        'Festa del Beato Manfredo Settala',
        'Ticino Turismo, "Festa del Beato Manfredo Settala".',
        'Ticino Turismo',
        'Ticino Turismo',
        2026,
        'en',
        'https://www.ticino.ch/en/commons/details/Fest-des-Seligen-Manfredo-Settala/29770.html',
        DATE '2026-03-23',
        'Usata per la figura del Beato Manfredo e per la tradizione della distribuzione del pane.'
    ),
    (
        '90000000-0000-0000-0000-000000000007',
        'website',
        'Monte San Giorgio',
        'UNESCO World Heritage Centre, "Monte San Giorgio".',
        'UNESCO World Heritage Centre',
        'UNESCO',
        2026,
        'en',
        'https://whc.unesco.org/en/list/1090',
        DATE '2026-03-23',
        'Usata per il riconoscimento UNESCO del Monte San Giorgio: iscrizione 2003, ampliamento 2010.'
    ),
    (
        '90000000-0000-0000-0000-000000000008',
        'website',
        'Baptistery of Riva San Vitale',
        'Ticino Turismo, "Battistero di Riva San Vitale".',
        'Ticino Turismo',
        'Ticino Turismo',
        2026,
        'en',
        'https://www.ticino.ch/en/commons/details/Baptistery-of-Riva-San-Vitale/2496.html',
        DATE '2026-03-23',
        'Conferma sintetica sul V secolo e sul valore monumentale del Battistero.'
    ),
    (
        '90000000-0000-0000-0000-000000000009',
        'website',
        'Church of Santa Croce',
        'Ticino Turismo, "Church of Santa Croce".',
        'Ticino Turismo',
        'Ticino Turismo',
        2026,
        'en',
        'https://www.ticino.ch/en/commons/details/Church-of-Santa-Croce/2947.html',
        DATE '2026-03-23',
        'Conferma sintetica su committenza e caratteristiche architettoniche di Santa Croce.'
    ),
    (
        '90000000-0000-0000-0000-000000000010',
        'photograph',
        'File:Riva San Vitale Battistero.JPG',
        'Wikimedia Commons, "File:Riva San Vitale Battistero.JPG".',
        'Laurom',
        'Wikimedia Commons',
        2008,
        'en',
        'https://commons.wikimedia.org/wiki/File:Riva_San_Vitale_Battistero.JPG',
        DATE '2026-03-23',
        'Immagine del Battistero rilasciata nel pubblico dominio dal caricatore.'
    ),
    (
        '90000000-0000-0000-0000-000000000011',
        'photograph',
        'File:Santa Croce Riva.jpg',
        'Wikimedia Commons, "File:Santa Croce Riva.jpg".',
        'Adrian Michael',
        'Wikimedia Commons',
        2011,
        'en',
        'https://commons.wikimedia.org/wiki/File:Santa_Croce_Riva.jpg',
        DATE '2026-03-23',
        'Immagine del tempio di Santa Croce con licenza CC BY-SA.'
    )
ON CONFLICT DO NOTHING;

INSERT INTO entities (
    id,
    entity_type,
    slug,
    title,
    subtitle,
    summary,
    description_md,
    language_code,
    status,
    is_featured,
    sort_order,
    metadata
) VALUES
    ('10000000-0000-0000-0000-000000000001', 'place', 'riva-san-vitale', 'Riva San Vitale', 'Comune storico del Mendrisiotto', 'Comune sul ramo meridionale del lago di Lugano, ai piedi del Monte San Giorgio.', 'Centro storico del Mendrisiotto con continuita di insediamento dalla preistoria, fase di vicus romano, antica pieve e patrimonio monumentale di primo piano.', 'it', 'published', TRUE, 10, '{"seed":"riva-san-vitale","scope":"municipality"}'::jsonb),
    ('10000000-0000-0000-0000-000000000002', 'place', 'poiana', 'Poiana', 'Frazione di Riva San Vitale', 'Piccola frazione compresa nel territorio comunale di Riva San Vitale.', 'Il DSS indica Poiana come frazione del comune di Riva San Vitale.', 'it', 'published', FALSE, 20, '{"seed":"riva-san-vitale","scope":"hamlet"}'::jsonb),
    ('10000000-0000-0000-0000-000000000003', 'place', 'nucleo-storico-riva-san-vitale', 'Nucleo storico di Riva San Vitale', 'Cuore urbano del borgo', 'Il nucleo storico conserva la stratificazione religiosa, civile e viaria del borgo.', 'Il percorso monumentale del paese ruota attorno alla chiesa di San Vitale, al Battistero e agli edifici storici del centro.', 'it', 'published', TRUE, 30, '{"seed":"riva-san-vitale","scope":"historic-centre"}'::jsonb),
    ('10000000-0000-0000-0000-000000000004', 'place', 'battistero-di-san-giovanni', 'Battistero di San Giovanni', 'Monumento paleocristiano', 'Il piu antico edificio cristiano interamente conservato in Svizzera.', 'Il Battistero di San Giovanni, probabilmente del V secolo e sorto su fondazioni romane, e il simbolo monumentale piu noto di Riva San Vitale.', 'it', 'published', TRUE, 40, '{"seed":"riva-san-vitale","scope":"heritage-site"}'::jsonb),
    ('10000000-0000-0000-0000-000000000005', 'place', 'chiesa-parrocchiale-di-san-vitale', 'Chiesa parrocchiale di San Vitale', 'Chiesa plebana del borgo', 'Edificio tardobarocco che sorge su una piu antica basilica altomedievale.', 'La chiesa di San Vitale e uno dei perni della storia ecclesiastica locale. La tradizione documentaria la fa risalire almeno al X secolo, mentre l edificio attuale appartiene in gran parte al cantiere settecentesco.', 'it', 'published', TRUE, 50, '{"seed":"riva-san-vitale","scope":"parish-church"}'::jsonb),
    ('10000000-0000-0000-0000-000000000006', 'place', 'tempio-di-santa-croce', 'Tempio di Santa Croce', 'Grande architettura tardorinascimentale', 'Edificio sacro sorto tra gli ultimi decenni del XVI secolo e il 1599 per volere di Giovan Andrea Della Croce.', 'Posto in posizione dominante sul borgo, il tempio di Santa Croce e uno dei monumenti religiosi piu significativi del tardo Rinascimento in Svizzera.', 'it', 'published', TRUE, 60, '{"seed":"riva-san-vitale","scope":"heritage-site"}'::jsonb),
    ('10000000-0000-0000-0000-000000000007', 'place', 'monte-san-giorgio', 'Monte San Giorgio', 'Monte fossilifero del sito UNESCO', 'Massiccio noto a livello mondiale per i fossili del Triassico e parte integrante dell identita territoriale di Riva San Vitale.', 'Il territorio di Riva San Vitale si appoggia al Monte San Giorgio, luogo di grande valore naturalistico, paleontologico e identitario.', 'it', 'published', TRUE, 70, '{"seed":"riva-san-vitale","scope":"natural-site"}'::jsonb),
    ('10000000-0000-0000-0000-000000000008', 'place', 'segoma', 'Segoma', 'Localita produttiva storica', 'Localita di Riva San Vitale ricordata per la torcitura della seta avviata nel 1869.', 'Segoma testimonia la fase protoindustriale e industriale del comune, legata in particolare alla lavorazione della seta.', 'it', 'published', FALSE, 80, '{"seed":"riva-san-vitale","scope":"industrial-locality"}'::jsonb),
    ('20000000-0000-0000-0000-000000000001', 'person', 'beato-manfredo-settala', 'Beato Manfredo Settala', 'Eremita venerato sul Monte San Giorgio', 'Figura devozionale legata al Monte San Giorgio e alla comunita di Riva San Vitale.', 'Secondo la tradizione locale, Manfredo Settala visse da eremita sul Monte San Giorgio e dopo la morte, avvenuta il 27 gennaio 1217, fu venerato a Riva San Vitale.', 'it', 'published', TRUE, 110, '{"seed":"riva-san-vitale","scope":"person"}'::jsonb),
    ('20000000-0000-0000-0000-000000000002', 'person', 'giovan-andrea-della-croce', 'Giovan Andrea Della Croce', 'Canonico e committente di Santa Croce', 'Promotore del tempio di Santa Croce alla fine del XVI secolo.', 'Giovan Andrea Della Croce e ricordato come il committente del tempio di Santa Croce, costruito presso la dimora di famiglia e scelto come propria sepoltura.', 'it', 'published', TRUE, 120, '{"seed":"riva-san-vitale","scope":"person"}'::jsonb),
    ('20000000-0000-0000-0000-000000000003', 'person', 'don-gottardo-zurini', 'Don Gottardo Zurini', 'Arciprete di Riva San Vitale', 'Arciprete locale ricordato come primo presidente del Gran Consiglio del Canton Ticino.', 'Le fonti comunali ricordano don Gottardo Zurini, arciprete di Riva San Vitale, come primo presidente del Gran Consiglio del Canton Ticino nel 1803.', 'it', 'published', TRUE, 130, '{"seed":"riva-san-vitale","scope":"person"}'::jsonb),
    ('30000000-0000-0000-0000-000000000001', 'organization', 'pieve-di-riva-san-vitale', 'Pieve di Riva San Vitale', 'Antico centro ecclesiastico del territorio', 'Una delle pievi piu antiche della diocesi di Como.', 'La pieve di Riva San Vitale ebbe un ruolo di primo piano nella cristianizzazione del territorio e nella sua organizzazione ecclesiastica e civile.', 'it', 'published', TRUE, 210, '{"seed":"riva-san-vitale","scope":"organization"}'::jsonb),
    ('30000000-0000-0000-0000-000000000002', 'organization', 'repubblica-di-riva-san-vitale', 'Repubblica di Riva San Vitale', 'Esperienza politica del 1798', 'Breve esperienza repubblicana nata nel contesto rivoluzionario del 1798.', 'La Repubblica di Riva San Vitale venne proclamata il 23 febbraio 1798 dai rappresentanti dei villaggi della pieve e termino il 16 marzo dello stesso anno.', 'it', 'published', TRUE, 220, '{"seed":"riva-san-vitale","scope":"organization"}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO places (
    entity_id,
    place_type,
    current_name,
    historical_name,
    parent_place_entity_id,
    address_text,
    geo_notes
) VALUES
    ('10000000-0000-0000-0000-000000000001', 'municipality', 'Riva San Vitale', 'Primo Sobenno; Ripa Sancti Vitalis', NULL, '6826 Riva San Vitale, Ticino, Svizzera', 'Comune sul golfo meridionale del lago di Lugano, ai piedi del Monte San Giorgio.'),
    ('10000000-0000-0000-0000-000000000002', 'hamlet', 'Poiana', NULL, '10000000-0000-0000-0000-000000000001', 'Riva San Vitale, Ticino, Svizzera', 'Frazione compresa nel territorio comunale.'),
    ('10000000-0000-0000-0000-000000000003', 'landmark', 'Nucleo storico di Riva San Vitale', NULL, '10000000-0000-0000-0000-000000000001', 'Centro storico, Riva San Vitale', 'Ambito urbano storico protetto e cuore della memoria civile e religiosa del borgo.'),
    ('10000000-0000-0000-0000-000000000004', 'religious_site', 'Battistero di San Giovanni', NULL, '10000000-0000-0000-0000-000000000003', 'Via Settala 9, 6826 Riva San Vitale', 'Edificio paleocristiano sorto probabilmente su una costruzione romana.'),
    ('10000000-0000-0000-0000-000000000005', 'religious_site', 'Chiesa parrocchiale di San Vitale', NULL, '10000000-0000-0000-0000-000000000003', 'Via Settala, 6826 Riva San Vitale', 'Chiesa plebana ricostruita tra il 1756 e il 1759 su una basilica piu antica.'),
    ('10000000-0000-0000-0000-000000000006', 'religious_site', 'Tempio di Santa Croce', NULL, '10000000-0000-0000-0000-000000000003', 'Via Santa Croce, 6826 Riva San Vitale', 'Monumento tardorinascimentale posto in posizione elevata sul borgo.'),
    ('10000000-0000-0000-0000-000000000007', 'natural_site', 'Monte San Giorgio', NULL, NULL, 'Area del Monte San Giorgio, Ticino, Svizzera', 'Sito fossilifero del Triassico e parte del Patrimonio Mondiale UNESCO.'),
    ('10000000-0000-0000-0000-000000000008', 'other', 'Segoma', NULL, '10000000-0000-0000-0000-000000000001', 'Localita Segoma, Riva San Vitale', 'Localita ricordata dal DSS per la torcitura della seta attiva dal 1869.')
ON CONFLICT DO NOTHING;

INSERT INTO people (
    entity_id,
    given_name,
    family_name,
    display_name,
    death_date_start,
    death_date_end,
    death_date_label,
    occupations,
    biography_md
) VALUES
    ('20000000-0000-0000-0000-000000000001', 'Manfredo', 'Settala', 'Beato Manfredo Settala', DATE '1217-01-27', DATE '1217-01-27', '27 gennaio 1217', 'eremita; figura devozionale', 'Nobile originario di Settala presso Milano, secondo la tradizione visse da eremita sul Monte San Giorgio. Dopo la morte fu venerato a Riva San Vitale.'),
    ('20000000-0000-0000-0000-000000000002', 'Giovan Andrea', 'Della Croce', 'Giovan Andrea Della Croce', NULL, NULL, 'fine XVI secolo', 'canonico; committente', 'Figura locale associata alla costruzione del tempio di Santa Croce, edificato presso la dimora di famiglia.'),
    ('20000000-0000-0000-0000-000000000003', 'Gottardo', 'Zurini', 'Don Gottardo Zurini', NULL, NULL, 'inizio XIX secolo', 'arciprete; uomo pubblico', 'Arciprete di Riva San Vitale ricordato dalle fonti comunali come primo presidente del Gran Consiglio del Canton Ticino.')
ON CONFLICT DO NOTHING;

INSERT INTO organizations (
    entity_id,
    organization_kind,
    founded_date_label,
    dissolved_date_label,
    mission_md
) VALUES
    ('30000000-0000-0000-0000-000000000001', 'pieve ecclesiastica', 'alto medioevo', 'XIX secolo come circoscrizione tradizionale', 'Centro ecclesiastico e di aggregazione della comunita locale, tra i piu antichi della diocesi di Como.'),
    ('30000000-0000-0000-0000-000000000002', 'repubblica locale', '23 febbraio 1798', '16 marzo 1798', 'Esperienza politica effimera nata durante le tensioni rivoluzionarie di fine Settecento.')
ON CONFLICT DO NOTHING;

INSERT INTO entities (
    id,
    entity_type,
    slug,
    title,
    subtitle,
    summary,
    description_md,
    language_code,
    status,
    is_featured,
    sort_order,
    metadata
) VALUES
    ('40000000-0000-0000-0000-000000000001', 'event', 'toponimo-primo-sobenno-774', 'Primo toponimo documentato: Primo Sobenno', '774', 'Prima attestazione nota del nome antico del villaggio.', 'Nel 774 le fonti ricordano il toponimo Primo Sobenno, associato alla fase altomedievale dell insediamento.', 'it', 'published', FALSE, 310, '{"seed":"riva-san-vitale","period":"early-medieval"}'::jsonb),
    ('40000000-0000-0000-0000-000000000002', 'event', 'menzione-ripa-sancti-vitalis-1115', 'Menzione di Ripa Sancti Vitalis', '1115', 'L insediamento compare tra i beni dell abbazia di Sant Abbondio di Como.', 'Nel 1115 Riva San Vitale e menzionata con il nome di Ripa Sancti Vitalis, in relazione ai beni dell abbazia benedettina di Sant Abbondio di Como.', 'it', 'published', FALSE, 320, '{"seed":"riva-san-vitale","period":"medieval"}'::jsonb),
    ('40000000-0000-0000-0000-000000000003', 'event', 'costruzione-del-battistero', 'Costruzione del Battistero di San Giovanni', 'circa 500', 'Realizzazione dell edificio paleocristiano simbolo del borgo.', 'Il Battistero di San Giovanni viene datato attorno al V secolo e testimonia l antichita del centro cristiano di Riva San Vitale.', 'it', 'published', TRUE, 330, '{"seed":"riva-san-vitale","period":"late-antiquity"}'::jsonb),
    ('40000000-0000-0000-0000-000000000004', 'event', 'morte-del-beato-manfredo-1217', 'Morte del Beato Manfredo Settala e inizio del culto locale', '27 gennaio 1217', 'Evento devozionale legato al Monte San Giorgio e alla chiesa di Riva.', 'La tradizione locale colloca al 27 gennaio 1217 la morte del Beato Manfredo Settala; da allora la sua memoria religiosa resta viva nel paese.', 'it', 'published', FALSE, 340, '{"seed":"riva-san-vitale","period":"medieval"}'::jsonb),
    ('40000000-0000-0000-0000-000000000005', 'event', 'costruzione-del-tempio-di-santa-croce', 'Costruzione del tempio di Santa Croce', '1582-1599', 'Cantiere tardorinascimentale promosso da Giovan Andrea Della Croce.', 'Il tempio di Santa Croce fu edificato negli ultimi decenni del XVI secolo, tra il 1582 e il 1594, e fu consacrato nel 1599.', 'it', 'published', TRUE, 350, '{"seed":"riva-san-vitale","period":"early-modern"}'::jsonb),
    ('40000000-0000-0000-0000-000000000006', 'event', 'repubblica-di-riva-san-vitale-1798', 'Repubblica di Riva San Vitale', '23 febbraio - 16 marzo 1798', 'Breve esperienza politica nata nel clima rivoluzionario del Mendrisiotto.', 'I villaggi della pieve diedero vita il 23 febbraio 1798 alla Repubblica di Riva San Vitale, conclusa il 16 marzo 1798.', 'it', 'published', TRUE, 360, '{"seed":"riva-san-vitale","period":"modern"}'::jsonb),
    ('40000000-0000-0000-0000-000000000007', 'event', 'fondazione-del-canton-ticino-1803', 'Fondazione del Canton Ticino', '1803', 'Ingresso di Riva San Vitale nel nuovo quadro cantonale.', 'Con la fondazione del Canton Ticino nel 1803, Riva San Vitale entro nel nuovo assetto cantonale; la memoria civica locale lega a questo momento la figura di don Gottardo Zurini.', 'it', 'published', TRUE, 370, '{"seed":"riva-san-vitale","period":"modern"}'::jsonb),
    ('40000000-0000-0000-0000-000000000008', 'event', 'apertura-torcitura-della-seta-a-segoma-1869', 'Avvio della torcitura della seta a Segoma', '1869', 'Segnale della trasformazione economica ottocentesca del comune.', 'Nel 1869 fu avviata a Segoma una torcitura della seta; secondo il DSS l impianto impiegava circa cento operai nel 1889.', 'it', 'published', FALSE, 380, '{"seed":"riva-san-vitale","period":"industrial-age"}'::jsonb),
    ('40000000-0000-0000-0000-000000000009', 'event', 'restauro-del-battistero-1953-1955', 'Restauro del Battistero di San Giovanni', '1953-1955', 'Intervento novecentesco fondamentale per la conservazione del monumento.', 'Tra il 1953 e il 1955 il Battistero fu sottoposto a un importante restauro, ricordato sia dal DSS sia dalla scheda comunale.', 'it', 'published', FALSE, 390, '{"seed":"riva-san-vitale","period":"contemporary"}'::jsonb),
    ('40000000-0000-0000-0000-000000000010', 'event', 'monte-san-giorgio-sito-unesco-2003', 'Monte San Giorgio nella Lista del Patrimonio Mondiale', '2003', 'Riconoscimento internazionale del paesaggio fossilifero condiviso da Riva San Vitale.', 'UNESCO ha iscritto il Monte San Giorgio nella Lista del Patrimonio Mondiale nel 2003; il sito e stato ampliato sul versante italiano nel 2010.', 'it', 'published', TRUE, 400, '{"seed":"riva-san-vitale","period":"contemporary"}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO events (
    entity_id,
    event_type,
    start_date,
    end_date,
    date_label,
    circa,
    significance,
    narrative_md
) VALUES
    ('40000000-0000-0000-0000-000000000001', 'administrative', DATE '0774-01-01', DATE '0774-12-31', '774', FALSE, 3, 'Prima attestazione nota del toponimo Primo Sobenno, legato alle forme piu antiche del nome del villaggio.'),
    ('40000000-0000-0000-0000-000000000002', 'administrative', DATE '1115-01-01', DATE '1115-12-31', '1115', FALSE, 4, 'Attestazione del nome Ripa Sancti Vitalis nei beni dell abbazia di Sant Abbondio di Como.'),
    ('40000000-0000-0000-0000-000000000003', 'religious', DATE '0500-01-01', DATE '0500-12-31', 'circa 500', TRUE, 5, 'Edificazione del Battistero di San Giovanni, simbolo della fase paleocristiana del borgo.'),
    ('40000000-0000-0000-0000-000000000004', 'religious', DATE '1217-01-27', DATE '1217-01-27', '27 gennaio 1217', FALSE, 4, 'Morte del Beato Manfredo Settala e radicamento della sua memoria nel culto locale.'),
    ('40000000-0000-0000-0000-000000000005', 'architectural', DATE '1582-01-01', DATE '1599-12-31', '1582-1599', FALSE, 5, 'Cantiere del tempio di Santa Croce, avviato negli anni 1580 e concluso con la consacrazione del 1599.'),
    ('40000000-0000-0000-0000-000000000006', 'political', DATE '1798-02-23', DATE '1798-03-16', '23 febbraio - 16 marzo 1798', FALSE, 5, 'Breve esperienza repubblicana dei villaggi della pieve di Riva San Vitale.'),
    ('40000000-0000-0000-0000-000000000007', 'administrative', DATE '1803-01-01', DATE '1803-12-31', '1803', FALSE, 4, 'Fondazione del Canton Ticino e inserimento di Riva San Vitale nel nuovo quadro politico cantonale.'),
    ('40000000-0000-0000-0000-000000000008', 'economic', DATE '1869-01-01', DATE '1869-12-31', '1869', FALSE, 3, 'Avvio della torcitura della seta a Segoma, passaggio rilevante nella storia economica locale.'),
    ('40000000-0000-0000-0000-000000000009', 'architectural', DATE '1953-01-01', DATE '1955-12-31', '1953-1955', FALSE, 3, 'Restauro novecentesco del Battistero di San Giovanni.'),
    ('40000000-0000-0000-0000-000000000010', 'archaeological', DATE '2003-01-01', DATE '2003-12-31', '2003, ampliamento 2010', FALSE, 5, 'Il Monte San Giorgio entra nella Lista del Patrimonio Mondiale UNESCO; il sito viene ampliato nel 2010 sul versante italiano.')
ON CONFLICT DO NOTHING;

INSERT INTO entities (
    id,
    entity_type,
    slug,
    title,
    subtitle,
    summary,
    description_md,
    language_code,
    status,
    is_featured,
    sort_order,
    metadata
) VALUES
    ('50000000-0000-0000-0000-000000000001', 'document', 'stele-dei-subinates', 'Stele dei Subinates', 'Epigrafe romana anteriore al III secolo d.C.', 'Reperto epigrafico che testimonia il nome degli abitanti del vicus.', 'Una stele romana anteriore al III secolo d.C., ricordata dal DSS, chiama gli abitanti del vicus di Riva "Subinates".', 'it', 'published', TRUE, 510, '{"seed":"riva-san-vitale","scope":"document"}'::jsonb),
    ('50000000-0000-0000-0000-000000000002', 'document', 'atto-del-1115-ripa-sancti-vitalis', 'Attestazione del 1115 di Ripa Sancti Vitalis', 'Documento medievale citato dal DSS', 'Documento che tramanda una delle forme storiche del toponimo di Riva San Vitale.', 'Il DSS segnala per il 1115 la forma "Ripa Sancti Vitalis", collegata ai beni dell abbazia di Sant Abbondio di Como.', 'it', 'published', FALSE, 520, '{"seed":"riva-san-vitale","scope":"document"}'::jsonb),
    ('50000000-0000-0000-0000-000000000003', 'document', 'statuti-di-como-del-1335', 'Statuti di Como del 1335', 'Riva definita borgo', 'Riferimento statutario che conferma il rilievo locale di Riva nel basso medioevo.', 'Secondo il DSS, gli statuti di Como del 1335 definiscono Riva come borgo, attestandone il rango nel quadro comasco.', 'it', 'published', FALSE, 530, '{"seed":"riva-san-vitale","scope":"document"}'::jsonb),
    ('60000000-0000-0000-0000-000000000001', 'media', 'foto-battistero-wikimedia-2008', 'Foto del Battistero di San Giovanni', 'Wikimedia Commons, maggio 2008', 'Immagine del Battistero usabile come media dimostrativo del sito.', 'Fotografia del Battistero di San Giovanni su Wikimedia Commons.', 'it', 'published', TRUE, 610, '{"seed":"riva-san-vitale","scope":"media"}'::jsonb),
    ('60000000-0000-0000-0000-000000000002', 'media', 'foto-santa-croce-wikimedia-2011', 'Foto del tempio di Santa Croce', 'Wikimedia Commons, febbraio 2011', 'Immagine del tempio di Santa Croce usabile come media dimostrativo del sito.', 'Fotografia del tempio di Santa Croce su Wikimedia Commons.', 'it', 'published', TRUE, 620, '{"seed":"riva-san-vitale","scope":"media"}'::jsonb),
    ('70000000-0000-0000-0000-000000000001', 'narrative', 'riva-san-vitale-dalle-origini-al-canton-ticino', 'Riva San Vitale: dalle origini al Canton Ticino', 'Narrazione introduttiva', 'Testo editoriale seed che unisce archeologia, cristianizzazione e vicende politiche del borgo.', 'Narrazione sintetica pensata come contenuto editoriale di partenza.', 'it', 'published', TRUE, 710, '{"seed":"riva-san-vitale","scope":"narrative"}'::jsonb),
    ('70000000-0000-0000-0000-000000000002', 'narrative', 'monumenti-simbolo-di-riva-san-vitale', 'Monumenti simbolo di Riva San Vitale', 'Narrazione sui luoghi', 'Testo editoriale seed dedicato al Battistero, a San Vitale e a Santa Croce.', 'Narrazione sintetica pensata per mostrare come il sito possa intrecciare luoghi, persone, eventi e fonti.', 'it', 'published', FALSE, 720, '{"seed":"riva-san-vitale","scope":"narrative"}'::jsonb),
    ('80000000-0000-0000-0000-000000000001', 'theme', 'archeologia', 'Archeologia', 'Tema trasversale', 'Reperti, scavi e memoria materiale del territorio.', 'Tema dedicato ai reperti e alla lunga durata dell insediamento locale.', 'it', 'published', FALSE, 810, '{"seed":"riva-san-vitale","scope":"theme"}'::jsonb),
    ('80000000-0000-0000-0000-000000000002', 'theme', 'cristianesimo', 'Cristianesimo', 'Tema trasversale', 'Cristianizzazione, pievi, edifici sacri e devozioni locali.', 'Tema che raccoglie il patrimonio religioso di Riva San Vitale.', 'it', 'published', FALSE, 820, '{"seed":"riva-san-vitale","scope":"theme"}'::jsonb),
    ('80000000-0000-0000-0000-000000000003', 'theme', 'politica-e-istituzioni', 'Politica e istituzioni', 'Tema trasversale', 'Pieve, comunita locali, repubblica del 1798 e nascita cantonale.', 'Tema per gli aspetti civici e istituzionali della storia locale.', 'it', 'published', FALSE, 830, '{"seed":"riva-san-vitale","scope":"theme"}'::jsonb),
    ('80000000-0000-0000-0000-000000000004', 'theme', 'paesaggio-e-fossili', 'Paesaggio e fossili', 'Tema trasversale', 'Monte San Giorgio, geologia e riconoscimento UNESCO.', 'Tema dedicato al rapporto tra paesaggio, scienza e identita territoriale.', 'it', 'published', FALSE, 840, '{"seed":"riva-san-vitale","scope":"theme"}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO documents (
    entity_id,
    document_type,
    date_end,
    date_label,
    language_code,
    archive_reference,
    editorial_notes_md
) VALUES
    ('50000000-0000-0000-0000-000000000001', 'inscription', DATE '0229-12-31', 'anteriore al III secolo d.C.', 'la', NULL, 'Epigrafe romana ricordata dal DSS come prova del nome Subinates.'),
    ('50000000-0000-0000-0000-000000000002', 'register', DATE '1115-12-31', '1115', 'la', 'Abbazia di Sant Abbondio di Como, beni citati dal DSS', 'Documento medievale noto tramite la sintesi del DSS.'),
    ('50000000-0000-0000-0000-000000000003', 'other', DATE '1335-12-31', '1335', 'it', 'Statuti di Como, riferimento citato dal DSS', 'Documento storico descrittivo usato per testare collegamenti tra norme e borgo.')
ON CONFLICT DO NOTHING;

INSERT INTO media_items (
    entity_id,
    media_type,
    source_url,
    mime_type,
    alt_text,
    caption,
    credit_line,
    rights_statement,
    date_start,
    date_end,
    date_label,
    width_px,
    height_px
) VALUES
    ('60000000-0000-0000-0000-000000000001', 'image', 'https://commons.wikimedia.org/wiki/File:Riva_San_Vitale_Battistero.JPG', 'image/jpeg', 'Vista esterna del Battistero di San Giovanni a Riva San Vitale.', 'Fotografia del Battistero di San Giovanni.', 'Laurom / Wikimedia Commons', 'Public domain', DATE '2008-05-01', DATE '2008-05-31', 'maggio 2008', 1536, 2048),
    ('60000000-0000-0000-0000-000000000002', 'image', 'https://commons.wikimedia.org/wiki/File:Santa_Croce_Riva.jpg', 'image/jpeg', 'Vista del tempio di Santa Croce a Riva San Vitale.', 'Fotografia del tempio di Santa Croce.', 'Adrian Michael / Wikimedia Commons', 'CC BY-SA', DATE '2011-02-01', DATE '2011-02-28', 'febbraio 2011', 1536, 2048)
ON CONFLICT DO NOTHING;

INSERT INTO narratives (
    entity_id,
    narrative_type,
    lead,
    body_md,
    published_at,
    reading_time_minutes
) VALUES
    ('70000000-0000-0000-0000-000000000001', 'article', 'Dalle tracce archeologiche al Canton Ticino, Riva San Vitale mostra una storia lunga e stratificata.', 'Riva San Vitale emerge come insediamento di lunga durata, con testimonianze che risalgono alla preistoria e con una forte continuita in epoca romana e cristiana. Le forme storiche del nome, da **Primo Sobenno** a **Ripa Sancti Vitalis**, mostrano il passaggio da un antico villaggio a un centro con una identita religiosa e civile ben definita.\n\nNel Medioevo la pieve di Riva San Vitale occupo un posto importante nel quadro ecclesiastico della regione. Nel tardo Settecento il borgo fu anche teatro della breve **Repubblica di Riva San Vitale** del 1798. Nel 1803 entro poi nel nuovo Canton Ticino, conservando una forte memoria locale dei propri protagonisti e dei propri luoghi simbolo.', TIMESTAMPTZ '2026-03-23 10:00:00+01', 3),
    ('70000000-0000-0000-0000-000000000002', 'place_story', 'Battistero, chiesa plebana e tempio di Santa Croce raccontano tre stagioni diverse della storia di Riva San Vitale.', 'Il **Battistero di San Giovanni** testimonia la fase paleocristiana del borgo e il suo legame con un precedente insediamento romano. La **chiesa parrocchiale di San Vitale**, ricostruita nel Settecento ma radicata in una tradizione piu antica, custodisce anche la memoria del Beato Manfredo Settala. Il **tempio di Santa Croce**, infine, traduce nel linguaggio del tardo Rinascimento la committenza locale di Giovan Andrea Della Croce e la volonta di monumentalizzare il profilo del paese.', TIMESTAMPTZ '2026-03-23 10:05:00+01', 3)
ON CONFLICT DO NOTHING;

INSERT INTO themes (
    entity_id,
    theme_group,
    color_hex,
    icon_name
) VALUES
    ('80000000-0000-0000-0000-000000000001', 'contenuti', '#8A5A44', 'landmark'),
    ('80000000-0000-0000-0000-000000000002', 'contenuti', '#3B6B4B', 'church'),
    ('80000000-0000-0000-0000-000000000003', 'contenuti', '#7A2F2F', 'scroll'),
    ('80000000-0000-0000-0000-000000000004', 'contenuti', '#345D7E', 'mountain')
ON CONFLICT DO NOTHING;

INSERT INTO event_participants (
    event_entity_id,
    participant_entity_id,
    role_label,
    notes_md
) VALUES
    ('40000000-0000-0000-0000-000000000004', '20000000-0000-0000-0000-000000000001', 'eremita venerato', 'Figura centrale del culto locale.'),
    ('40000000-0000-0000-0000-000000000005', '20000000-0000-0000-0000-000000000002', 'committente', 'Committente ricordato dalle fonti comunali e turistiche.'),
    ('40000000-0000-0000-0000-000000000006', '30000000-0000-0000-0000-000000000002', 'entita politica', 'La repubblica locale nasce e si esaurisce entro poche settimane.'),
    ('40000000-0000-0000-0000-000000000007', '20000000-0000-0000-0000-000000000003', 'figura civica ricordata dalla memoria comunale', 'Le fonti comunali lo associano al nuovo Cantone.')
ON CONFLICT DO NOTHING;

INSERT INTO event_places (
    event_entity_id,
    place_entity_id,
    role_label
) VALUES
    ('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 'territorio citato'),
    ('40000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001', 'territorio citato'),
    ('40000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000004', 'luogo di costruzione'),
    ('40000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000007', 'luogo di vita eremitica'),
    ('40000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000005', 'luogo del culto locale'),
    ('40000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000006', 'luogo di costruzione'),
    ('40000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000001', 'territorio politico'),
    ('40000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000001', 'comune coinvolto'),
    ('40000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000008', 'sito produttivo'),
    ('40000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000004', 'monumento restaurato'),
    ('40000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000007', 'sito UNESCO')
ON CONFLICT DO NOTHING;

INSERT INTO entity_relations (
    id,
    from_entity_id,
    to_entity_id,
    relation_type,
    date_label,
    notes_md,
    metadata
) VALUES
    ('a0000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001', 'part_of', NULL, 'Poiana e una frazione del comune.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000001', 'part_of', NULL, 'Il nucleo storico appartiene al comune di Riva San Vitale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000003', 'located_in', NULL, 'Il Battistero si trova nel nucleo storico.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000003', 'located_in', NULL, 'La chiesa plebana si trova nel nucleo storico.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000003', 'located_in', NULL, 'Il tempio di Santa Croce domina il borgo storico.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000001', 'located_in', NULL, 'Segoma e una localita del comune.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000007', '30000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 'related_to', NULL, 'La pieve ha il proprio centro a Riva San Vitale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000008', '30000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001', 'related_to', '1798', 'La repubblica prende il nome dal borgo.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000009', '20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000006', 'founded', 'fine XVI secolo', 'Giovan Andrea Della Croce e ricordato come committente del tempio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000010', '20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000007', 'related_to', 'XIII secolo', 'La tradizione lo colloca come eremita del Monte San Giorgio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000011', '20000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', 'member_of', 'inizio XIX secolo', 'Arciprete di Riva San Vitale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000012', '50000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 'mentions', NULL, 'La stele cita gli abitanti del vicus come Subinates.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000013', '50000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001', 'mentions', '1115', 'Documento che tramanda la forma Ripa Sancti Vitalis.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000014', '50000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000001', 'mentions', '1335', 'Riva appare come borgo negli statuti citati dal DSS.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000015', '60000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000004', 'depicts', '2008', 'La fotografia ritrae il Battistero.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000016', '60000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000006', 'depicts', '2011', 'La fotografia ritrae Santa Croce.', '{}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO entity_themes (
    entity_id,
    theme_entity_id
) VALUES
    ('10000000-0000-0000-0000-000000000004', '80000000-0000-0000-0000-000000000001'),
    ('10000000-0000-0000-0000-000000000004', '80000000-0000-0000-0000-000000000002'),
    ('10000000-0000-0000-0000-000000000005', '80000000-0000-0000-0000-000000000002'),
    ('10000000-0000-0000-0000-000000000006', '80000000-0000-0000-0000-000000000002'),
    ('10000000-0000-0000-0000-000000000007', '80000000-0000-0000-0000-000000000004'),
    ('20000000-0000-0000-0000-000000000001', '80000000-0000-0000-0000-000000000002'),
    ('30000000-0000-0000-0000-000000000001', '80000000-0000-0000-0000-000000000002'),
    ('30000000-0000-0000-0000-000000000002', '80000000-0000-0000-0000-000000000003'),
    ('40000000-0000-0000-0000-000000000006', '80000000-0000-0000-0000-000000000003'),
    ('40000000-0000-0000-0000-000000000010', '80000000-0000-0000-0000-000000000004'),
    ('50000000-0000-0000-0000-000000000001', '80000000-0000-0000-0000-000000000001'),
    ('70000000-0000-0000-0000-000000000001', '80000000-0000-0000-0000-000000000003'),
    ('70000000-0000-0000-0000-000000000001', '80000000-0000-0000-0000-000000000001'),
    ('70000000-0000-0000-0000-000000000002', '80000000-0000-0000-0000-000000000002')
ON CONFLICT DO NOTHING;

INSERT INTO entity_media (
    entity_id,
    media_entity_id,
    usage_role,
    caption_override,
    sort_order
) VALUES
    ('10000000-0000-0000-0000-000000000004', '60000000-0000-0000-0000-000000000001', 'hero', 'Battistero di San Giovanni, foto Wikimedia Commons.', 1),
    ('10000000-0000-0000-0000-000000000006', '60000000-0000-0000-0000-000000000002', 'hero', 'Tempio di Santa Croce, foto Wikimedia Commons.', 1),
    ('70000000-0000-0000-0000-000000000002', '60000000-0000-0000-0000-000000000001', 'gallery', 'Il Battistero come apertura del racconto sui monumenti.', 1),
    ('70000000-0000-0000-0000-000000000002', '60000000-0000-0000-0000-000000000002', 'gallery', 'Santa Croce nel racconto sui monumenti.', 2)
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('10000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Profilo storico generale del comune.'),
    ('10000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000002', 'secondary_evidence', NULL, 'Sintesi civica locale del Comune.'),
    ('10000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Poiana e citata come frazione nel DSS.'),
    ('10000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000003', 'secondary_evidence', NULL, 'Scheda comunale del Battistero.'),
    ('10000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000008', 'secondary_evidence', NULL, 'Scheda turistica del Battistero.'),
    ('10000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000004', 'secondary_evidence', NULL, 'Scheda comunale della chiesa parrocchiale.'),
    ('10000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Conferma di datazione e ruolo storico nel DSS.'),
    ('10000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000005', 'secondary_evidence', NULL, 'Scheda comunale di Santa Croce.'),
    ('10000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000009', 'secondary_evidence', NULL, 'Scheda turistica di Santa Croce.'),
    ('10000000-0000-0000-0000-000000000007', '90000000-0000-0000-0000-000000000007', 'secondary_evidence', NULL, 'Pagina UNESCO del Monte San Giorgio.'),
    ('10000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'La torcitura di Segoma e ricordata nel DSS.'),
    ('20000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000006', 'secondary_evidence', NULL, 'Fonte turistica sulla tradizione del Beato Manfredo.'),
    ('20000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000005', 'secondary_evidence', NULL, 'Committenza di Santa Croce.'),
    ('20000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000002', 'secondary_evidence', NULL, 'Memoria civica comunale su Gottardo Zurini.'),
    ('30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Ruolo della pieve nel DSS.'),
    ('30000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000002', 'secondary_evidence', NULL, 'Riferimento comunale alla Repubblica del 1798.'),
    ('40000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Toponimo antico dal DSS.'),
    ('40000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Menzione medievale dal DSS.'),
    ('40000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000003', 'secondary_evidence', NULL, 'Battistero paleocristiano.'),
    ('40000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000008', 'secondary_evidence', NULL, 'Datazione al V secolo e tipologia.'),
    ('40000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000006', 'secondary_evidence', NULL, 'Tradizione del Beato Manfredo.'),
    ('40000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000005', 'secondary_evidence', NULL, 'Scheda comunale di Santa Croce.'),
    ('40000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000002', 'secondary_evidence', NULL, 'Repubblica del 1798 nella memoria comunale.'),
    ('40000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Quadro storico del DSS.'),
    ('40000000-0000-0000-0000-000000000007', '90000000-0000-0000-0000-000000000002', 'secondary_evidence', NULL, 'Fondazione del Canton Ticino e Zurini.'),
    ('40000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'DSS sulla torcitura della seta a Segoma.'),
    ('40000000-0000-0000-0000-000000000009', '90000000-0000-0000-0000-000000000003', 'secondary_evidence', NULL, 'Scheda comunale del restauro.'),
    ('40000000-0000-0000-0000-000000000009', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Restauri 1953-1955 nel DSS.'),
    ('40000000-0000-0000-0000-000000000010', '90000000-0000-0000-0000-000000000007', 'secondary_evidence', NULL, 'UNESCO 2003 e ampliamento 2010.'),
    ('50000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Stele dei Subinates dal DSS.'),
    ('50000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Menzione del 1115 dal DSS.'),
    ('50000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000001', 'secondary_evidence', NULL, 'Riva borgo negli statuti del 1335 secondo il DSS.'),
    ('60000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000010', 'image_credit', NULL, 'Credito e licenza dell immagine del Battistero.'),
    ('60000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000011', 'image_credit', NULL, 'Credito e licenza dell immagine di Santa Croce.'),
    ('70000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', 'bibliography', NULL, 'Base storica per la narrazione introduttiva.'),
    ('70000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000002', 'bibliography', NULL, 'Integrazione con la memoria civica comunale.'),
    ('70000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000003', 'bibliography', NULL, 'Narrazione sui monumenti: Battistero.'),
    ('70000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000004', 'bibliography', NULL, 'Narrazione sui monumenti: San Vitale.'),
    ('70000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000005', 'bibliography', NULL, 'Narrazione sui monumenti: Santa Croce.')
ON CONFLICT DO NOTHING;

COMMIT;
