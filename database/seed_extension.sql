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
        '90000000-0000-0000-0000-000000000012',
        'website',
        'Per le vie del nucleo',
        'Comune di Riva San Vitale, "Per le vie del nucleo".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        2026,
        'it',
        'https://www.rivasanvitale.ch/Per-le-vie-del-nucleo-9f9d1e00',
        DATE '2026-03-23',
        'Usata per il nucleo storico, l iscrizione ISOS e il percorso monumentale del borgo.'
    ),
    (
        '90000000-0000-0000-0000-000000000013',
        'website',
        'Chiesa parrocchiale di San Vitale',
        'Comune di Riva San Vitale, "Chiesa parrocchiale di San Vitale".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        2026,
        'it',
        'https://www.rivasanvitale.ch/Chiesa-parrocchiale-di-San-Vitale-7e8e8000',
        DATE '2026-03-23',
        'Dettagli su Giuseppe Caresana, campanile del 1754, facciata del 1865 e restauro del 1992.'
    ),
    (
        '90000000-0000-0000-0000-000000000014',
        'website',
        'Tempio di Santa Croce',
        'Comune di Riva San Vitale, "Tempio di Santa Croce".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        2026,
        'it',
        'https://www.rivasanvitale.ch/Tempio-di-Santa-Croce-a2febd00',
        DATE '2026-03-23',
        'Fonte per la cronologia 1580-1594, consacrazione del 1599 e forma architettonica del tempio.'
    ),
    (
        '90000000-0000-0000-0000-000000000015',
        'website',
        'Monte San Giorgio',
        'Fondazione Monte San Giorgio, "Monte San Giorgio".',
        'Fondazione Monte San Giorgio',
        'Fondazione Monte San Giorgio',
        2025,
        'en',
        'https://www.montesangiorgio.org/en/',
        DATE '2026-03-23',
        'Usata per la lunga storia degli scavi dal 1850 e per il valore paleontologico del monte.'
    ),
    (
        '90000000-0000-0000-0000-000000000016',
        'website',
        'Museo dei fossili di Meride',
        'Fondazione Monte San Giorgio, "Museo dei fossili di Meride".',
        'Fondazione Monte San Giorgio',
        'Fondazione Monte San Giorgio',
        2025,
        'it',
        'https://www.montesangiorgio.org/Musei/Museo-dei-Fossili-di-Meride.html',
        DATE '2026-03-23',
        'Usata per l inaugurazione del museo nel 2012 e per il ruolo di interpretazione del sito UNESCO.'
    ),
    (
        '90000000-0000-0000-0000-000000000017',
        'website',
        'Val Mara visitor platform',
        'Fondazione Monte San Giorgio, "Val Mara visitor platform".',
        'Fondazione Monte San Giorgio',
        'Fondazione Monte San Giorgio',
        2025,
        'en',
        'https://www.montesangiorgio.org/en/Territorio/Val-Mara.html',
        DATE '2026-03-23',
        'Usata per il dato sugli scavi del 1936 nella Kalkschieferzone.'
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
        '10000000-0000-0000-0000-000000000009',
        'place',
        'museo-dei-fossili-di-meride',
        'Museo dei fossili di Meride',
        'Luogo di interpretazione del Monte San Giorgio',
        'Museo inaugurato nel 2012 e dedicato ai fossili del sito UNESCO del Monte San Giorgio.',
        'Il museo di Meride rende accessibile al pubblico la ricchezza paleontologica del Monte San Giorgio e aiuta a contestualizzare il rapporto tra territorio, ricerca e patrimonio.',
        'it',
        'published',
        FALSE,
        90,
        '{"seed":"riva-san-vitale","scope":"regional-context"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000011',
        'event',
        'costruzione-del-campanile-di-san-vitale-1754',
        'Costruzione del campanile di San Vitale',
        '1754',
        'Il campanile della chiesa parrocchiale anticipa il cantiere della nuova chiesa.',
        'La scheda comunale colloca al 1754 la costruzione del campanile della chiesa di San Vitale, con lanterna ispirata a quella di Santa Croce.',
        'it',
        'published',
        FALSE,
        410,
        '{"seed":"riva-san-vitale","period":"early-modern"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000012',
        'event',
        'costruzione-della-chiesa-parrocchiale-1756-1759',
        'Costruzione della chiesa parrocchiale di San Vitale',
        '1756-1759',
        'La costruzione tardobarocca sostituisce la precedente basilica altomedievale.',
        'La chiesa attuale di San Vitale fu edificata tra il 1756 e il 1759 su progetto di Giuseppe Caresana, sopra i resti della basilica precedente.',
        'it',
        'published',
        TRUE,
        420,
        '{"seed":"riva-san-vitale","period":"early-modern"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000013',
        'event',
        'realizzazione-della-facciata-di-san-vitale-1865',
        'Realizzazione della facciata neoclassica di San Vitale',
        '1865',
        'La facciata attuale completa in epoca tarda l immagine della chiesa.',
        'La facciata neoclassica della chiesa di San Vitale, attribuita all ingegnere Antonio Vassalli, fu realizzata nel 1865.',
        'it',
        'published',
        FALSE,
        430,
        '{"seed":"riva-san-vitale","period":"industrial-age"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000014',
        'event',
        'restauro-integrale-della-chiesa-di-san-vitale-1992',
        'Restauro integrale della chiesa di San Vitale',
        '1992',
        'Intervento di restauro curato dagli architetti Giancarlo e Pia Durisch.',
        'La scheda comunale ricorda un restauro integrale della chiesa di San Vitale nel 1992.',
        'it',
        'published',
        FALSE,
        440,
        '{"seed":"riva-san-vitale","period":"contemporary"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000015',
        'event',
        'inizio-degli-scavi-paleontologici-moderni-dal-1850',
        'Avvio degli scavi paleontologici moderni al Monte San Giorgio',
        'dal 1850',
        'Lungo percorso di ricerca scientifica sui fossili del monte.',
        'Secondo la Fondazione Monte San Giorgio, i fossili della montagna sono oggetto di scavi e studi da parte di paleontologi svizzeri e italiani fin dal 1850.',
        'it',
        'published',
        TRUE,
        450,
        '{"seed":"riva-san-vitale","period":"industrial-age"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000016',
        'event',
        'scavi-di-val-mara-dal-1936',
        'Scavi di Val Mara',
        'dal 1936',
        'Le ricerche nella Kalkschieferzone rivelano alcuni dei fossili piu tardi del sito.',
        'La piattaforma visitatori di Val Mara ricorda che dal 1936 furono scoperti qui importanti fossili di vertebrati del Triassico medio.',
        'it',
        'published',
        FALSE,
        460,
        '{"seed":"riva-san-vitale","period":"contemporary"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000017',
        'event',
        'inaugurazione-del-museo-dei-fossili-di-meride-2012',
        'Inaugurazione del Museo dei fossili di Meride',
        '13 ottobre 2012',
        'Nuovo polo di interpretazione del patrimonio paleontologico del Monte San Giorgio.',
        'Il museo di Meride, ristrutturato e ampliato da Mario Botta, e stato inaugurato il 13 ottobre 2012.',
        'it',
        'published',
        FALSE,
        470,
        '{"seed":"riva-san-vitale","period":"contemporary"}'::jsonb
    ),
    (
        '70000000-0000-0000-0000-000000000003',
        'narrative',
        'san-vitale-e-il-cuore-del-borgo',
        'San Vitale e il cuore del borgo',
        'Narrazione sul centro storico',
        'Testo editoriale dedicato alla chiesa, al nucleo storico e alla loro stratificazione architettonica.',
        'Narrazione sintetica per mostrare come un luogo possa essere raccontato insieme ai suoi cantieri storici, alle devozioni e alle fonti.',
        'it',
        'published',
        FALSE,
        730,
        '{"seed":"riva-san-vitale","scope":"narrative"}'::jsonb
    )
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
    (
        '10000000-0000-0000-0000-000000000009',
        'building',
        'Museo dei fossili di Meride',
        NULL,
        '10000000-0000-0000-0000-000000000007',
        'Via Bernardo Peyer 9, 6866 Meride',
        'Museo di riferimento per la presentazione pubblica dei fossili del Monte San Giorgio.'
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
    ('40000000-0000-0000-0000-000000000011', 'architectural', DATE '1754-01-01', DATE '1754-12-31', '1754', FALSE, 3, 'Costruzione del campanile della chiesa parrocchiale di San Vitale.'),
    ('40000000-0000-0000-0000-000000000012', 'architectural', DATE '1756-01-01', DATE '1759-12-31', '1756-1759', FALSE, 5, 'Edificazione della chiesa tardobarocca di San Vitale su una precedente basilica altomedievale.'),
    ('40000000-0000-0000-0000-000000000013', 'architectural', DATE '1865-01-01', DATE '1865-12-31', '1865', FALSE, 2, 'Realizzazione della facciata neoclassica della chiesa di San Vitale.'),
    ('40000000-0000-0000-0000-000000000014', 'architectural', DATE '1992-01-01', DATE '1992-12-31', '1992', FALSE, 3, 'Restauro integrale della chiesa di San Vitale.'),
    ('40000000-0000-0000-0000-000000000015', 'archaeological', DATE '1850-01-01', NULL, 'dal 1850', FALSE, 4, 'Inizio degli scavi e degli studi paleontologici moderni sul Monte San Giorgio.'),
    ('40000000-0000-0000-0000-000000000016', 'archaeological', DATE '1936-01-01', NULL, 'dal 1936', FALSE, 3, 'Scavi nella zona di Val Mara, con ritrovamenti di importanti vertebrati del Triassico medio.'),
    ('40000000-0000-0000-0000-000000000017', 'cultural', DATE '2012-10-13', DATE '2012-10-13', '13 ottobre 2012', FALSE, 3, 'Inaugurazione del Museo dei fossili di Meride, ampliato e ristrutturato da Mario Botta.')
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
        '70000000-0000-0000-0000-000000000003',
        'place_story',
        'Il nucleo storico di Riva San Vitale si legge attraverso i suoi monumenti e i suoi cantieri.',
        'La chiesa di **San Vitale** e il Battistero organizzano ancora oggi la percezione del nucleo storico di Riva San Vitale. Il cantiere del campanile del **1754**, la costruzione della nuova chiesa tra **1756 e 1759**, la facciata del **1865** e il restauro del **1992** mostrano come il borgo abbia continuato a riscrivere i propri spazi senza interrompere il legame con la tradizione piu antica.\n\nIl percorso nel centro storico, ricordato dal Comune anche per la sua iscrizione nell inventario **ISOS**, consente di leggere insieme storia religiosa, vita civile e memoria urbana.',
        TIMESTAMPTZ '2026-03-23 11:00:00+01',
        3
    )
ON CONFLICT DO NOTHING;

INSERT INTO event_places (
    event_entity_id,
    place_entity_id,
    role_label
) VALUES
    ('40000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000005', 'torre campanaria'),
    ('40000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000005', 'luogo di costruzione'),
    ('40000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000005', 'facciata del monumento'),
    ('40000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000005', 'edificio restaurato'),
    ('40000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000007', 'area di ricerca'),
    ('40000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000007', 'settore di scavo'),
    ('40000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000009', 'luogo inaugurato')
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
    ('a0000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000005', 'related_to', NULL, 'Il percorso nel nucleo storico si sviluppa attorno alla chiesa di San Vitale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000004', 'related_to', NULL, 'Il Battistero e il secondo polo monumentale del nucleo storico.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000007', 'related_to', '2012', 'Il museo interpreta il patrimonio del Monte San Giorgio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000020', '70000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000003', 'related_to', NULL, 'Narrazione dedicata al nucleo storico.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000021', '70000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000005', 'related_to', NULL, 'Narrazione dedicata alla chiesa di San Vitale.', '{}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO entity_themes (
    entity_id,
    theme_entity_id
) VALUES
    ('10000000-0000-0000-0000-000000000009', '80000000-0000-0000-0000-000000000004'),
    ('40000000-0000-0000-0000-000000000011', '80000000-0000-0000-0000-000000000002'),
    ('40000000-0000-0000-0000-000000000012', '80000000-0000-0000-0000-000000000002'),
    ('40000000-0000-0000-0000-000000000013', '80000000-0000-0000-0000-000000000002'),
    ('40000000-0000-0000-0000-000000000014', '80000000-0000-0000-0000-000000000002'),
    ('40000000-0000-0000-0000-000000000015', '80000000-0000-0000-0000-000000000004'),
    ('40000000-0000-0000-0000-000000000016', '80000000-0000-0000-0000-000000000004'),
    ('40000000-0000-0000-0000-000000000017', '80000000-0000-0000-0000-000000000004'),
    ('70000000-0000-0000-0000-000000000003', '80000000-0000-0000-0000-000000000002')
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('10000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000012', 'secondary_evidence', NULL, 'Fonte sul nucleo storico e sull iscrizione ISOS.'),
    ('10000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000013', 'secondary_evidence', NULL, 'Fonte dettagliata sulla chiesa di San Vitale.'),
    ('10000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000014', 'secondary_evidence', NULL, 'Fonte dettagliata sul tempio di Santa Croce.'),
    ('10000000-0000-0000-0000-000000000007', '90000000-0000-0000-0000-000000000015', 'secondary_evidence', NULL, 'Fonte aggiuntiva sulla storia degli scavi e sull interpretazione del monte.'),
    ('10000000-0000-0000-0000-000000000009', '90000000-0000-0000-0000-000000000016', 'secondary_evidence', NULL, 'Fonte sul museo di Meride.'),
    ('40000000-0000-0000-0000-000000000011', '90000000-0000-0000-0000-000000000013', 'secondary_evidence', NULL, 'La scheda comunale indica il campanile al 1754.'),
    ('40000000-0000-0000-0000-000000000012', '90000000-0000-0000-0000-000000000013', 'secondary_evidence', NULL, 'La scheda comunale indica il cantiere 1756-1759.'),
    ('40000000-0000-0000-0000-000000000013', '90000000-0000-0000-0000-000000000013', 'secondary_evidence', NULL, 'La scheda comunale data la facciata al 1865.'),
    ('40000000-0000-0000-0000-000000000014', '90000000-0000-0000-0000-000000000013', 'secondary_evidence', NULL, 'La scheda comunale ricorda il restauro del 1992.'),
    ('40000000-0000-0000-0000-000000000015', '90000000-0000-0000-0000-000000000015', 'secondary_evidence', NULL, 'Scavi e studi sul Monte San Giorgio dal 1850.'),
    ('40000000-0000-0000-0000-000000000016', '90000000-0000-0000-0000-000000000017', 'secondary_evidence', NULL, 'Scavi di Val Mara dal 1936.'),
    ('40000000-0000-0000-0000-000000000017', '90000000-0000-0000-0000-000000000016', 'secondary_evidence', NULL, 'Inaugurazione del museo nel 2012.'),
    ('70000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000012', 'bibliography', NULL, 'Nucleo storico e percorso monumentale.'),
    ('70000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000013', 'bibliography', NULL, 'Chiesa e cantieri storici di San Vitale.')
ON CONFLICT DO NOTHING;

COMMIT;
