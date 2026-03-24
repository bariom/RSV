BEGIN;

INSERT INTO sources (
    id,
    source_type,
    title,
    citation,
    author_text,
    publisher,
    publication_place,
    language_code,
    url,
    accessed_on,
    notes_md,
    metadata
) VALUES
    (
        '90000000-0000-0000-0000-000000000032',
        'website',
        'Il tempio di Santa Croce',
        'Comune di Riva San Vitale, "Il tempio di Santa Croce", brochure PDF ufficiale.',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        'Riva San Vitale',
        'it',
        'https://www.rivasanvitale.ch/Tempio-di-Santa-Croce-14aa0500',
        DATE '2026-03-24',
        'Brochure ufficiale del Comune con cronologia, descrizione architettonica, decorazione interna e restauro del tempio.',
        '{"pages":"8","format":"pdf"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000033',
        'website',
        'Tempio di Santa Croce',
        'Resta di Stucco, "Tempio di Santa Croce".',
        'Resta di Stucco',
        'Resta di Stucco',
        NULL,
        'it',
        'https://restadistucco.ch/it/opere/tempio-di-santa-croce.desc',
        DATE '2026-03-24',
        'Scheda specialistica sulle decorazioni in stucco, sulle maestranze e sulla cronologia del cantiere decorativo.',
        '{"scope":"stucco-and-decoration"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000034',
        'book',
        'Santa Croce a Riva San Vitale: l architettura',
        'Stefano Della Torre, "Santa Croce a Riva San Vitale: l architettura", in D. Cassinelli, P. Vanoli (a cura di), Camillo Procaccini (1561-1629). Le sperimentazioni giovanili tra Emilia, Lombardia e Canton Ticino, Cinisello Balsamo, 2007, pp. 104-113.',
        'Stefano Della Torre',
        'Silvana Editoriale',
        'Cinisello Balsamo',
        'it',
        NULL,
        DATE '2026-03-24',
        'Riferimento bibliografico specialistico sull architettura del tempio, citato dalla scheda Resta di Stucco.',
        '{}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000035',
        'article',
        'L apparato decorativo di Santa Croce a Riva San Vitale',
        'Laura Damiani Cabrini, "L apparato decorativo di Santa Croce a Riva San Vitale", in D. Cassinelli, P. Vanoli (a cura di), Camillo Procaccini (1561-1629). Le sperimentazioni giovanili tra Emilia, Lombardia e Canton Ticino, Cinisello Balsamo, 2007, pp. 115-127.',
        'Laura Damiani Cabrini',
        'Silvana Editoriale',
        'Cinisello Balsamo',
        'it',
        NULL,
        DATE '2026-03-24',
        'Riferimento bibliografico specialistico sulla decorazione pittorica e in stucco del tempio.',
        '{}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000036',
        'photograph',
        'File:Tempio Santa Croce. Riva San Vitale. 2021-02-20 17-22-47.jpg',
        'Wikimedia Commons, "File:Tempio Santa Croce. Riva San Vitale. 2021-02-20 17-22-47.jpg".',
        'Shesmax',
        'Wikimedia Commons',
        NULL,
        'en',
        'https://commons.wikimedia.org/wiki/File:Tempio_Santa_Croce._Riva_San_Vitale._2021-02-20_17-22-47.jpg',
        DATE '2026-03-24',
        'Fotografia recente dell esterno del tempio. Licenza CC BY-SA.',
        '{"license":"CC BY-SA 4.0"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000037',
        'photograph',
        'File:Tempio Santa Croce. Riva San Vitale. 2005-10-09 11-36-11.jpg',
        'Wikimedia Commons, "File:Tempio Santa Croce. Riva San Vitale. 2005-10-09 11-36-11.jpg".',
        'Shesmax',
        'Wikimedia Commons',
        NULL,
        'en',
        'https://commons.wikimedia.org/wiki/File:Tempio_Santa_Croce._Riva_San_Vitale._2005-10-09_11-36-11.jpg',
        DATE '2026-03-24',
        'Fotografia dell esterno del tempio con coordinate geografiche e licenza CC BY-SA.',
        '{"license":"CC BY-SA 4.0"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000038',
        'photograph',
        'File:Zentralbibliothek Zurich - S. Croce i Riva S. Vitale - 991132000899705501.jpg',
        'Wikimedia Commons, "File:Zentralbibliothek Zurich - S. Croce i Riva S. Vitale - 991132000899705501.jpg".',
        'Johann Rudolf Rahn',
        'Zentralbibliothek Zurich / Wikimedia Commons',
        'Zurich',
        'de',
        'https://commons.wikimedia.org/wiki/File:Zentralbibliothek_Z%C3%BCrich_-_S._Croce_i_Riva_S._Vitale_-_991132000899705501.jpg',
        DATE '2026-03-24',
        'Riproduzione fotografica di un immagine del 1885 dell interno del tempio, pubblicata in pubblico dominio.',
        '{"license":"Public Domain Mark 1.0","doi":"10.7891/e-manuscripta-26863"}'::jsonb
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
    (
        '20000000-0000-0000-0000-000000000004',
        'person',
        'giovanni-antonio-piotti',
        'Giovanni Antonio Piotti',
        'Architetto di Vacallo',
        'Architetto ticinese cui la critica recente riconduce il progetto del tempio di Santa Croce.',
        'Per lungo tempo il tempio fu attribuito a Pellegrino Tibaldi; le letture piu recenti e la comparazione con altre opere riconducono invece il progetto a **Giovanni Antonio Piotti**, detto Vacallo.',
        'it',
        'published',
        FALSE,
        140,
        '{"seed":"santa-croce","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000005',
        'person',
        'camillo-procaccini',
        'Camillo Procaccini',
        'Pittore bolognese attivo a Milano',
        'Autore delle tele del tempio di Santa Croce, eseguite tra il 1591 e il 1592.',
        'La decorazione pittorica di Santa Croce chiama in causa **Camillo Procaccini**, protagonista della cultura figurativa di area lombarda tra Cinquecento e Seicento.',
        'it',
        'published',
        FALSE,
        150,
        '{"seed":"santa-croce","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000006',
        'person',
        'domenico-fontana-di-muggio',
        'Domenico Fontana di Muggio',
        'Stuccatore documentato tra 1582 e 1630',
        'Tra gli stuccatori impegnati nella decorazione di Santa Croce.',
        'La scheda specialistica di Resta di Stucco ricorda **Domenico Fontana di Muggio** tra le maestranze coinvolte negli ornati delle volte del tempio.',
        'it',
        'published',
        FALSE,
        160,
        '{"seed":"santa-croce","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000007',
        'person',
        'pietro-mazzetti-di-rovio',
        'Pietro Mazzetti di Rovio',
        'Stuccatore documentato tra 1592 e 1632',
        'Tra gli stuccatori impegnati nella decorazione di Santa Croce.',
        'La decorazione in stucco di Santa Croce chiama in causa anche **Pietro Mazzetti di Rovio**, ricordato nei contratti per l apparato ornamentale.',
        'it',
        'published',
        FALSE,
        170,
        '{"seed":"santa-croce","scope":"person"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000021',
        'event',
        'avvio-del-cantiere-di-santa-croce',
        'Avvio del cantiere del tempio di Santa Croce',
        'verosimilmente dal 1588',
        'La costruzione del tempio prende forma presso la dimora della famiglia Della Croce.',
        'La scheda Resta di Stucco colloca l avvio del cantiere del tempio **verosimilmente a partire dal 1588**, su disegni di Giovanni Antonio Piotti e per volere di Giovan Andrea Della Croce.',
        'it',
        'published',
        FALSE,
        351,
        '{"seed":"santa-croce","period":"early-modern"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000022',
        'event',
        'decorazione-interna-di-santa-croce',
        'Decorazione interna del tempio di Santa Croce',
        '1591-1592',
        'Pitture e stucchi realizzati in tempi rapidi da maestranze specializzate.',
        'Tra il **1591 e il 1592** il tempio viene dotato di un apparato decorativo unitario che coinvolge Camillo Procaccini, i fratelli Pozzi e gli stuccatori Domenico Fontana e Pietro Mazzetti.',
        'it',
        'published',
        TRUE,
        352,
        '{"seed":"santa-croce","period":"early-modern"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000023',
        'event',
        'consacrazione-del-tempio-di-santa-croce',
        'Consacrazione del tempio di Santa Croce',
        '30 maggio 1599',
        'La chiesa viene consacrata dal vescovo di Como Filippo Archinti.',
        'La brochure ufficiale del Comune ricorda la **consacrazione del 30 maggio 1599**, lunedi di Pentecoste, ad opera del vescovo di Como Filippo Archinti.',
        'it',
        'published',
        TRUE,
        353,
        '{"seed":"santa-croce","period":"early-modern"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000024',
        'event',
        'restauri-del-tempio-di-santa-croce',
        'Restauri del tempio di Santa Croce',
        '1973-1987',
        'Ultima grande stagione di restauro complessivo del monumento.',
        'Secondo la brochure comunale, gli ultimi complessivi interventi di restauro del tempio si sono svolti tra il **1973 e il 1987**.',
        'it',
        'published',
        FALSE,
        354,
        '{"seed":"santa-croce","period":"contemporary"}'::jsonb
    ),
    (
        '50000000-0000-0000-0000-000000000007',
        'document',
        'brochure-il-tempio-di-santa-croce',
        'Il tempio di Santa Croce',
        'Brochure ufficiale del Comune di Riva San Vitale',
        'Pubblicazione sintetica dedicata al monumento, alla sua architettura e al suo apparato decorativo.',
        'Brochure istituzionale dedicata al tempio, utile come fonte di sintesi storico-artistica e descrittiva.',
        'it',
        'published',
        FALSE,
        570,
        '{"seed":"santa-croce","scope":"document"}'::jsonb
    ),
    (
        '60000000-0000-0000-0000-000000000009',
        'media',
        'foto-tempio-santa-croce-wikimedia-2021',
        'Tempio di Santa Croce, veduta esterna',
        'Wikimedia Commons, febbraio 2021',
        'Veduta recente dell esterno del tempio di Santa Croce.',
        'Fotografia recente dell esterno del tempio con buona leggibilita della cupola e della facciata.',
        'it',
        'published',
        TRUE,
        630,
        '{"seed":"santa-croce","scope":"media"}'::jsonb
    ),
    (
        '60000000-0000-0000-0000-000000000010',
        'media',
        'foto-tempio-santa-croce-wikimedia-2005',
        'Tempio di Santa Croce, facciata e volume esterno',
        'Wikimedia Commons, ottobre 2005',
        'Fotografia dell esterno del tempio con vista frontale sul volume architettonico.',
        'Immagine utile per mostrare la facciata e la cupola del monumento in rapporto allo spazio circostante.',
        'it',
        'published',
        FALSE,
        631,
        '{"seed":"santa-croce","scope":"media"}'::jsonb
    ),
    (
        '60000000-0000-0000-0000-000000000011',
        'media',
        'interno-tempio-santa-croce-1885',
        'Interno del tempio di Santa Croce',
        'Riproduzione storica del 1885',
        'Immagine storica dell interno con cupola e colonne colossali.',
        'Riproduzione storica pubblicata da Wikimedia Commons a partire da un immagine del 1885 conservata presso la Zentralbibliothek Zurich.',
        'it',
        'published',
        FALSE,
        632,
        '{"seed":"santa-croce","scope":"media"}'::jsonb
    ),
    (
        '70000000-0000-0000-0000-000000000005',
        'narrative',
        'santa-croce-mausoleo-familiare-e-capolavoro-tardorinascimentale',
        'Santa Croce tra mausoleo familiare e capolavoro tardorinascimentale',
        'Narrazione storico-artistica',
        'Testo editoriale dedicato al significato architettonico, devozionale e decorativo del monumento.',
        'Narrazione di supporto a una futura pagina di approfondimento sul tempio di Santa Croce.',
        'it',
        'published',
        FALSE,
        750,
        '{"seed":"santa-croce","scope":"narrative"}'::jsonb
    ),
    (
        '80000000-0000-0000-0000-000000000007',
        'theme',
        'arte-e-decorazione',
        'Arte e decorazione',
        'Tema trasversale',
        'Architettura, pittura, stucchi e programmi decorativi del patrimonio locale.',
        'Tema pensato per collegare edifici, artisti, documenti e immagini relativi alla storia dell arte a Riva San Vitale.',
        'it',
        'published',
        FALSE,
        870,
        '{"seed":"santa-croce","scope":"theme"}'::jsonb
    )
ON CONFLICT DO NOTHING;

INSERT INTO people (
    entity_id,
    given_name,
    family_name,
    display_name,
    birth_date_label,
    death_date_label,
    occupations,
    biography_md
) VALUES
    (
        '20000000-0000-0000-0000-000000000004',
        'Giovanni Antonio',
        'Piotti',
        'Giovanni Antonio Piotti',
        '1529',
        '1596',
        'architetto',
        'Architetto di Vacallo, attivo nell area comasca e ticinese, cui la critica recente riconduce il progetto del tempio di Santa Croce.'
    ),
    (
        '20000000-0000-0000-0000-000000000005',
        'Camillo',
        'Procaccini',
        'Camillo Procaccini',
        '1561',
        '1629',
        'pittore',
        'Pittore bolognese attivo a Milano, responsabile delle tele del tempio di Santa Croce tra il 1591 e il 1592.'
    ),
    (
        '20000000-0000-0000-0000-000000000006',
        'Domenico',
        'Fontana',
        'Domenico Fontana di Muggio',
        'documentato dal 1582',
        'documentato fino al 1630',
        'stuccatore',
        'Stuccatore ricordato tra le maestranze impegnate negli ornati delle volte del tempio di Santa Croce.'
    ),
    (
        '20000000-0000-0000-0000-000000000007',
        'Pietro',
        'Mazzetti',
        'Pietro Mazzetti di Rovio',
        'documentato dal 1592',
        'documentato fino al 1632',
        'stuccatore',
        'Stuccatore attivo nel cantiere decorativo di Santa Croce insieme a Domenico Fontana.'
    )
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
    (
        '40000000-0000-0000-0000-000000000021',
        'architectural',
        DATE '1588-01-01',
        NULL,
        'verosimilmente dal 1588',
        TRUE,
        4,
        'Avvio del cantiere del tempio su disegni attribuiti a Giovanni Antonio Piotti e per volere di Giovan Andrea Della Croce.'
    ),
    (
        '40000000-0000-0000-0000-000000000022',
        'cultural',
        DATE '1591-01-01',
        DATE '1592-12-31',
        '1591-1592',
        FALSE,
        5,
        'Realizzazione del programma decorativo interno con pitture, stucchi, mascheroni, festoni e figure di rilievo.'
    ),
    (
        '40000000-0000-0000-0000-000000000023',
        'religious',
        DATE '1599-05-30',
        DATE '1599-05-30',
        '30 maggio 1599',
        FALSE,
        5,
        'Consacrazione del tempio da parte del vescovo di Como Filippo Archinti.'
    ),
    (
        '40000000-0000-0000-0000-000000000024',
        'architectural',
        DATE '1973-01-01',
        DATE '1987-12-31',
        '1973-1987',
        FALSE,
        3,
        'Ultima grande stagione di restauro complessivo del monumento.'
    )
ON CONFLICT DO NOTHING;

INSERT INTO documents (
    entity_id,
    document_type,
    date_label,
    language_code,
    archive_reference,
    editorial_notes_md
) VALUES
    (
        '50000000-0000-0000-0000-000000000007',
        'report',
        'pubblicazione consultata nel 2026',
        'it',
        'Comune di Riva San Vitale, brochure PDF ufficiale',
        'Documento istituzionale usato come fonte di sintesi per la scheda del monumento.'
    )
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
    (
        '60000000-0000-0000-0000-000000000009',
        'image',
        'https://commons.wikimedia.org/wiki/File:Tempio_Santa_Croce._Riva_San_Vitale._2021-02-20_17-22-47.jpg',
        'image/jpeg',
        'Veduta esterna del tempio di Santa Croce a Riva San Vitale.',
        'Veduta recente dell esterno del tempio di Santa Croce.',
        'Shesmax / Wikimedia Commons',
        'CC BY-SA 4.0',
        DATE '2021-02-20',
        DATE '2021-02-20',
        '20 febbraio 2021',
        3840,
        5760
    ),
    (
        '60000000-0000-0000-0000-000000000010',
        'image',
        'https://commons.wikimedia.org/wiki/File:Tempio_Santa_Croce._Riva_San_Vitale._2005-10-09_11-36-11.jpg',
        'image/jpeg',
        'Veduta della facciata e del volume esterno del tempio di Santa Croce.',
        'Fotografia dell esterno del tempio con evidenza di facciata e cupola.',
        'Shesmax / Wikimedia Commons',
        'CC BY-SA 4.0',
        DATE '2005-10-09',
        DATE '2005-10-09',
        '9 ottobre 2005',
        2448,
        3264
    ),
    (
        '60000000-0000-0000-0000-000000000011',
        'image',
        'https://commons.wikimedia.org/wiki/File:Zentralbibliothek_Z%C3%BCrich_-_S._Croce_i_Riva_S._Vitale_-_991132000899705501.jpg',
        'image/jpeg',
        'Interno del tempio di Santa Croce con cupola a tamburo e colonne colossali.',
        'Riproduzione storica del 1885 dell interno del tempio di Santa Croce.',
        'Johann Rudolf Rahn / Zentralbibliothek Zurich / Wikimedia Commons',
        'Public Domain Mark 1.0',
        DATE '1885-01-01',
        DATE '1885-12-31',
        '1885',
        4012,
        4961
    )
ON CONFLICT DO NOTHING;

INSERT INTO narratives (
    entity_id,
    narrative_type,
    lead,
    body_md,
    published_at,
    reading_time_minutes
) VALUES
    (
        '70000000-0000-0000-0000-000000000005',
        'place_story',
        'Santa Croce unisce committenza privata, architettura tardorinascimentale e un programma decorativo di eccezionale coerenza.',
        'Il **Tempio di Santa Croce** e uno dei monumenti religiosi piu notevoli del tardo Rinascimento in Svizzera. Sorto accanto al palazzo della famiglia **Della Croce**, il complesso si presenta come edificio a pianta centrale con cupola in rame, cappelle laterali e una forte componente simbolica, anche funeraria: il fondatore **Giovan Andrea Della Croce** vi volle infatti il proprio sepolcro.\n\nLe fonti specialistiche riconducono oggi il progetto a **Giovanni Antonio Piotti** di Vacallo, mentre il programma decorativo coinvolge maestranze di primo piano: **Camillo Procaccini** per le tele e **Domenico Fontana** e **Pietro Mazzetti** per gli stucchi. Tra il **1591 e il 1592** pitture e apparato ornamentale concorrono a un insieme di rara coerenza, nel quale il tema della **Croce** struttura lo spazio, la simbologia e il percorso visivo dell edificio.\n\nLa consacrazione del **30 maggio 1599** e i restauri del **1973-1987** segnano due momenti decisivi della storia successiva del monumento. La documentazione odierna, insieme alle immagini storiche e contemporanee, permette di leggere Santa Croce non solo come chiesa, ma come manifesto artistico e familiare della stagione tardo-cinquecentesca del borgo.',
        TIMESTAMPTZ '2026-03-24 10:00:00+01',
        4
    )
ON CONFLICT DO NOTHING;

INSERT INTO themes (
    entity_id,
    theme_group,
    color_hex,
    icon_name
) VALUES
    (
        '80000000-0000-0000-0000-000000000007',
        'contenuti',
        '#915C3A',
        'palette'
    )
ON CONFLICT DO NOTHING;

INSERT INTO event_participants (
    event_entity_id,
    participant_entity_id,
    role_label,
    notes_md
) VALUES
    ('40000000-0000-0000-0000-000000000021', '20000000-0000-0000-0000-000000000002', 'committente', 'Giovan Andrea Della Croce promuove l impresa del tempio.'),
    ('40000000-0000-0000-0000-000000000021', '20000000-0000-0000-0000-000000000004', 'architetto attribuito', 'La critica recente riconduce il progetto a Giovanni Antonio Piotti.'),
    ('40000000-0000-0000-0000-000000000022', '20000000-0000-0000-0000-000000000005', 'pittore', 'Camillo Procaccini realizza le tele principali del tempio.'),
    ('40000000-0000-0000-0000-000000000022', '20000000-0000-0000-0000-000000000006', 'stuccatore', 'Coinvolto negli ornati delle volte.'),
    ('40000000-0000-0000-0000-000000000022', '20000000-0000-0000-0000-000000000007', 'stuccatore', 'Coinvolto nella decorazione a stucco del cantiere.')
ON CONFLICT DO NOTHING;

INSERT INTO event_places (
    event_entity_id,
    place_entity_id,
    role_label
) VALUES
    ('40000000-0000-0000-0000-000000000021', '10000000-0000-0000-0000-000000000006', 'cantiere'),
    ('40000000-0000-0000-0000-000000000022', '10000000-0000-0000-0000-000000000006', 'apparato decorativo'),
    ('40000000-0000-0000-0000-000000000023', '10000000-0000-0000-0000-000000000006', 'consacrazione'),
    ('40000000-0000-0000-0000-000000000024', '10000000-0000-0000-0000-000000000006', 'restauro')
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
    ('a0000000-0000-0000-0000-000000000030', '20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000006', 'related_to', 'fine XVI secolo', 'Architetto cui viene oggi ricondotto il progetto del tempio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000031', '20000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000006', 'related_to', '1591-1592', 'Autore delle tele del tempio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000032', '20000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000006', 'related_to', '1591-1592', 'Stuccatore coinvolto nell apparato decorativo.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000033', '20000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000006', 'related_to', '1591-1592', 'Stuccatore coinvolto nell apparato decorativo.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000034', '50000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000006', 'mentions', NULL, 'La brochure ufficiale descrive il tempio, la sua architettura e il suo apparato decorativo.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000035', '60000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000006', 'depicts', '2021', 'Veduta recente del tempio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000036', '60000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000006', 'depicts', '2005', 'Veduta esterna del tempio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000037', '60000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000006', 'depicts', '1885', 'Immagine storica dell interno del tempio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000038', '70000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000006', 'related_to', NULL, 'Narrazione dedicata al tempio di Santa Croce.', '{}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO entity_themes (
    entity_id,
    theme_entity_id
) VALUES
    ('10000000-0000-0000-0000-000000000006', '80000000-0000-0000-0000-000000000007'),
    ('20000000-0000-0000-0000-000000000004', '80000000-0000-0000-0000-000000000007'),
    ('20000000-0000-0000-0000-000000000005', '80000000-0000-0000-0000-000000000007'),
    ('20000000-0000-0000-0000-000000000006', '80000000-0000-0000-0000-000000000007'),
    ('20000000-0000-0000-0000-000000000007', '80000000-0000-0000-0000-000000000007'),
    ('40000000-0000-0000-0000-000000000022', '80000000-0000-0000-0000-000000000007'),
    ('50000000-0000-0000-0000-000000000007', '80000000-0000-0000-0000-000000000007'),
    ('70000000-0000-0000-0000-000000000005', '80000000-0000-0000-0000-000000000007')
ON CONFLICT DO NOTHING;

INSERT INTO entity_media (
    entity_id,
    media_entity_id,
    usage_role,
    caption_override,
    sort_order
) VALUES
    ('10000000-0000-0000-0000-000000000006', '60000000-0000-0000-0000-000000000009', 'gallery', 'Veduta esterna del tempio di Santa Croce, 2021.', 2),
    ('10000000-0000-0000-0000-000000000006', '60000000-0000-0000-0000-000000000010', 'gallery', 'Veduta esterna del tempio di Santa Croce, 2005.', 3),
    ('10000000-0000-0000-0000-000000000006', '60000000-0000-0000-0000-000000000011', 'gallery', 'Interno del tempio di Santa Croce in una riproduzione storica del 1885.', 4),
    ('70000000-0000-0000-0000-000000000005', '60000000-0000-0000-0000-000000000009', 'gallery', 'Immagine di apertura per la narrazione su Santa Croce.', 1),
    ('70000000-0000-0000-0000-000000000005', '60000000-0000-0000-0000-000000000011', 'gallery', 'Immagine storica dell interno del tempio.', 2)
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('10000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000032', 'secondary_evidence', 'pp. 1-3', 'Brochure ufficiale con cronologia, architettura, interno e restauro.'),
    ('10000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000033', 'secondary_evidence', NULL, 'Scheda specialistica sulla decorazione in stucco e sulle maestranze.'),
    ('10000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000034', 'bibliography', 'pp. 104-113', 'Riferimento specialistico sull architettura del tempio.'),
    ('10000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000035', 'bibliography', 'pp. 115-127', 'Riferimento specialistico sull apparato decorativo.'),
    ('20000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000033', 'secondary_evidence', NULL, 'Attribuzione progettuale a Giovanni Antonio Piotti.'),
    ('20000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000033', 'secondary_evidence', NULL, 'Procaccini e il programma pittorico del tempio.'),
    ('20000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000033', 'secondary_evidence', NULL, 'Domenico Fontana tra gli stuccatori del cantiere.'),
    ('20000000-0000-0000-0000-000000000007', '90000000-0000-0000-0000-000000000033', 'secondary_evidence', NULL, 'Pietro Mazzetti tra gli stuccatori del cantiere.'),
    ('40000000-0000-0000-0000-000000000021', '90000000-0000-0000-0000-000000000033', 'secondary_evidence', NULL, 'Avvio del cantiere verosimilmente dal 1588.'),
    ('40000000-0000-0000-0000-000000000022', '90000000-0000-0000-0000-000000000033', 'secondary_evidence', '1591-1592', 'Cronologia del programma decorativo interno.'),
    ('40000000-0000-0000-0000-000000000023', '90000000-0000-0000-0000-000000000032', 'secondary_evidence', 'p. 1', 'Consacrazione del 30 maggio 1599.'),
    ('40000000-0000-0000-0000-000000000024', '90000000-0000-0000-0000-000000000032', 'secondary_evidence', 'p. 1', 'Restauri complessivi 1973-1987.'),
    ('50000000-0000-0000-0000-000000000007', '90000000-0000-0000-0000-000000000032', 'bibliography', NULL, 'La brochure e la fonte primaria del documento descritto.'),
    ('60000000-0000-0000-0000-000000000009', '90000000-0000-0000-0000-000000000036', 'image_credit', NULL, 'Credito e licenza dell immagine esterna del 2021.'),
    ('60000000-0000-0000-0000-000000000010', '90000000-0000-0000-0000-000000000037', 'image_credit', NULL, 'Credito e licenza dell immagine esterna del 2005.'),
    ('60000000-0000-0000-0000-000000000011', '90000000-0000-0000-0000-000000000038', 'image_credit', NULL, 'Credito e licenza dell immagine storica dell interno.'),
    ('70000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000032', 'bibliography', 'pp. 1-3', 'Base istituzionale per la narrazione.'),
    ('70000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000033', 'bibliography', NULL, 'Approfondimento specialistico su decorazione e maestranze.')
ON CONFLICT DO NOTHING;

COMMIT;
