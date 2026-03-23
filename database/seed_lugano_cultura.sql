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
        '90000000-0000-0000-0000-000000000018',
        'website',
        'Riva San Vitale',
        'Lugano Storia, "Riva San Vitale".',
        'Citta di Lugano, Cultura',
        'Lugano Storia',
        2026,
        'it',
        'https://patrimonio.luganocultura.ch/luoghi/8269-riva-san-vitale',
        DATE '2026-03-23',
        'Scheda luogo sintetica del portale Lugano Storia, utile come punto di accesso agli oggetti collegati.'
    ),
    (
        '90000000-0000-0000-0000-000000000019',
        'photograph',
        'Battistero di S. Giovanni Battista a Riva San Vitale',
        'Lugano Storia, "Battistero di S. Giovanni Battista a Riva San Vitale", 1938-1939, segnatura MS 100.',
        'Vincenzo Vicari',
        'Lugano Storia',
        1939,
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/35663-battistero-di-s-giovanni-battista-a-riva-san-vitale',
        DATE '2026-03-23',
        'Fotografia dell interno del Battistero, prima del restauro.'
    ),
    (
        '90000000-0000-0000-0000-000000000020',
        'photograph',
        'Battistero di S. Giovanni Battista a Riva San Vitale',
        'Lugano Storia, "Battistero di S. Giovanni Battista a Riva San Vitale", settembre 1955, segnatura MS 331.',
        'Vincenzo Vicari',
        'Lugano Storia',
        1955,
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/35925-battistero-di-s-giovanni-battista-a-riva-san-vitale',
        DATE '2026-03-23',
        'Fotografia della facciata ovest del Battistero.'
    ),
    (
        '90000000-0000-0000-0000-000000000021',
        'photograph',
        'Interno della chiesa di S. Vitale a Riva San Vitale',
        'Lugano Storia, "Interno della chiesa di S. Vitale a Riva San Vitale", 1940, segnatura MS 125.',
        'Vincenzo Vicari',
        'Lugano Storia',
        1940,
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/35688-interno-della-chiesa-di-s-vitale-a-riva-san-vitale',
        DATE '2026-03-23',
        'Fotografia storica dell interno della chiesa di San Vitale.'
    ),
    (
        '90000000-0000-0000-0000-000000000022',
        'archival_record',
        'Petizione della Municipalita di Riva San Vitale al cittadino Commissario',
        'Lugano Storia, "La Mun. di Riva San Vitale, al cittadino Commissario...", 8 novembre 1803, segnatura 321/28.',
        'Municipalita di Riva San Vitale',
        'Lugano Storia',
        1803,
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/98440-la-mun-di-riva-san-vitale-al-cittadino-commissario-petizione-con-la-quale-si-chiede-sia-riattata-la-strada-ai-prati-maggi-appartenente-ai-comuni-di-meride-besazio-arzo-e-rancate',
        DATE '2026-03-23',
        'Documento relativo alla viabilita dei Prati Maggi e alla rete dei comuni della regione.'
    ),
    (
        '90000000-0000-0000-0000-000000000023',
        'periodical',
        '"Rassegne Varie". Periodico illustrato dell Istituto Internazionale Baragiola',
        'Lugano Storia, "\"Rassegne Varie\". Periodico illustr. dell Istituto Internazionale BARAGIOLA. Riva San Vitale, n. 3, agosto-settembre 1910.", segnatura II Cotti 6/14.',
        'Istituto Internazionale Baragiola',
        'Lugano Storia',
        1910,
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/76677-rassegne-varie-periodico-illustr-dell-istituto-internazionale-baragiola-riva-san-vitale-n-3-agosto-settembre-1910',
        DATE '2026-03-23',
        'Periodico legato a Riva San Vitale, utile per il contesto culturale del primo Novecento.'
    ),
    (
        '90000000-0000-0000-0000-000000000024',
        'photograph',
        'Gottardo Zurini (1746-1815)',
        'Lugano Storia, "Gottardo Zurini (1746-1815)", 1903.',
        'Ignoto, da riproduzione a stampa di un dipinto',
        'Lugano Storia',
        1903,
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/4207-gottardo-zurini-1746-1815',
        DATE '2026-03-23',
        'Stampa commemorativa del centenario dell autonomia ticinese con dati biografici su Gottardo Zurini.'
    )
ON CONFLICT DO NOTHING;

UPDATE people
SET
    birth_date_start = DATE '1746-04-05',
    birth_date_end = DATE '1746-04-05',
    birth_date_label = '5 aprile 1746',
    death_date_start = DATE '1815-03-06',
    death_date_end = DATE '1815-03-06',
    death_date_label = '6 marzo 1815'
WHERE entity_id = '20000000-0000-0000-0000-000000000003'
  AND (birth_date_start IS NULL OR death_date_start IS NULL);

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
        '50000000-0000-0000-0000-000000000004',
        'document',
        'petizione-prati-maggi-1803',
        'Petizione ai Prati Maggi',
        '8 novembre 1803',
        'Petizione della Municipalita di Riva San Vitale per il ripristino della strada ai Prati Maggi.',
        'Documento amministrativo datato 8 novembre 1803, indirizzato al cittadino Commissario, con richiesta di riattare la strada ai Prati Maggi insieme ai comuni di Meride, Besazio, Arzo e Rancate.',
        'it',
        'published',
        FALSE,
        540,
        '{"seed":"riva-san-vitale","scope":"document"}'::jsonb
    ),
    (
        '50000000-0000-0000-0000-000000000005',
        'document',
        'rassegne-varie-baragiola-1910',
        'Rassegne Varie, n. 3',
        'agosto-settembre 1910',
        'Numero del periodico illustrato dell Istituto Internazionale Baragiola pubblicato a Riva San Vitale.',
        'Pubblicazione periodica del 1910 collegata all Istituto Internazionale Baragiola e al contesto culturale di Riva San Vitale nel primo Novecento.',
        'it',
        'published',
        FALSE,
        550,
        '{"seed":"riva-san-vitale","scope":"document"}'::jsonb
    ),
    (
        '60000000-0000-0000-0000-000000000003',
        'media',
        'lugano-storia-battistero-interno-1938-1939',
        'Interno del Battistero di San Giovanni',
        '1938-1939, prima del restauro',
        'Fotografia storica dell interno del Battistero di Riva San Vitale.',
        'Scatto di Vincenzo Vicari che mostra l interno del Battistero paleocristiano prima del restauro del dopoguerra.',
        'it',
        'published',
        FALSE,
        630,
        '{"seed":"riva-san-vitale","scope":"media"}'::jsonb
    ),
    (
        '60000000-0000-0000-0000-000000000004',
        'media',
        'lugano-storia-battistero-esterno-1955',
        'Battistero di San Giovanni, facciata ovest',
        'settembre 1955',
        'Fotografia storica dell esterno del Battistero di Riva San Vitale.',
        'Scatto di Vincenzo Vicari della facciata ovest del Battistero.',
        'it',
        'published',
        FALSE,
        640,
        '{"seed":"riva-san-vitale","scope":"media"}'::jsonb
    ),
    (
        '60000000-0000-0000-0000-000000000005',
        'media',
        'lugano-storia-san-vitale-interno-1940',
        'Interno della chiesa di San Vitale',
        '1940',
        'Fotografia storica dell interno della chiesa parrocchiale di San Vitale.',
        'Scatto di Vincenzo Vicari dell interno della chiesa di San Vitale.',
        'it',
        'published',
        FALSE,
        650,
        '{"seed":"riva-san-vitale","scope":"media"}'::jsonb
    ),
    (
        '60000000-0000-0000-0000-000000000006',
        'media',
        'lugano-storia-gottardo-zurini-1903',
        'Gottardo Zurini (1746-1815)',
        'stampa commemorativa, 1903',
        'Riproduzione a stampa di un dipinto con dati biografici di Gottardo Zurini.',
        'Stampa pubblicata per il primo centenario dell autonomia ticinese con riferimento a Gottardo Zurini, arciprete di Riva e primo presidente del Gran Consiglio.',
        'it',
        'published',
        FALSE,
        660,
        '{"seed":"riva-san-vitale","scope":"media"}'::jsonb
    )
ON CONFLICT DO NOTHING;

INSERT INTO documents (
    entity_id,
    document_type,
    date_start,
    date_end,
    date_label,
    language_code,
    archive_reference,
    editorial_notes_md
) VALUES
    (
        '50000000-0000-0000-0000-000000000004',
        'letter',
        DATE '1803-11-08',
        DATE '1803-11-08',
        '8 novembre 1803',
        'it',
        'Lugano Storia, segnatura 321/28',
        'Il portale la descrive come petizione della Municipalita di Riva San Vitale al cittadino Commissario.'
    ),
    (
        '50000000-0000-0000-0000-000000000005',
        'newspaper_article',
        DATE '1910-08-01',
        DATE '1910-09-30',
        'agosto-settembre 1910',
        'it',
        'Lugano Storia, segnatura II Cotti 6/14',
        'Il portale registra il numero 3 di "Rassegne Varie" come pubblicazione collegata a Riva San Vitale.'
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
    date_label
) VALUES
    (
        '60000000-0000-0000-0000-000000000003',
        'image',
        'https://patrimonio.luganocultura.ch/oggetti/35663-battistero-di-s-giovanni-battista-a-riva-san-vitale',
        'text/html',
        'Interno del Battistero di San Giovanni a Riva San Vitale, prima del restauro.',
        'Interno del Battistero, 1938-1939.',
        'Vincenzo Vicari / Lugano Storia',
        'Consultazione libera secondo regolamento interno ASL',
        DATE '1938-01-01',
        DATE '1939-12-31',
        '1938-1939'
    ),
    (
        '60000000-0000-0000-0000-000000000004',
        'image',
        'https://patrimonio.luganocultura.ch/oggetti/35925-battistero-di-s-giovanni-battista-a-riva-san-vitale',
        'text/html',
        'Facciata ovest del Battistero di San Giovanni a Riva San Vitale.',
        'Battistero, esterno ovest, settembre 1955.',
        'Vincenzo Vicari / Lugano Storia',
        'Consultazione libera secondo regolamento interno ASL',
        DATE '1955-09-01',
        DATE '1955-09-30',
        'settembre 1955'
    ),
    (
        '60000000-0000-0000-0000-000000000005',
        'image',
        'https://patrimonio.luganocultura.ch/oggetti/35688-interno-della-chiesa-di-s-vitale-a-riva-san-vitale',
        'text/html',
        'Interno della chiesa di San Vitale a Riva San Vitale.',
        'Interno della chiesa di San Vitale, 1940.',
        'Vincenzo Vicari / Lugano Storia',
        'Consultazione libera secondo regolamento interno ASL',
        DATE '1940-01-01',
        DATE '1940-12-31',
        '1940'
    ),
    (
        '60000000-0000-0000-0000-000000000006',
        'image',
        'https://patrimonio.luganocultura.ch/oggetti/4207-gottardo-zurini-1746-1815',
        'text/html',
        'Stampa commemorativa dedicata a Gottardo Zurini.',
        'Gottardo Zurini (1746-1815), stampa commemorativa del 1903.',
        'Lugano Storia',
        'Consultazione libera secondo regolamento interno ASL',
        DATE '1903-01-01',
        DATE '1903-12-31',
        '1903'
    )
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
    (
        'a0000000-0000-0000-0000-000000000022',
        '50000000-0000-0000-0000-000000000004',
        '10000000-0000-0000-0000-000000000001',
        'mentions',
        '1803',
        'La petizione riguarda la Municipalita di Riva San Vitale.',
        '{}'::jsonb
    ),
    (
        'a0000000-0000-0000-0000-000000000023',
        '50000000-0000-0000-0000-000000000005',
        '10000000-0000-0000-0000-000000000001',
        'mentions',
        '1910',
        'Il periodico e riferito a Riva San Vitale.',
        '{}'::jsonb
    ),
    (
        'a0000000-0000-0000-0000-000000000024',
        '60000000-0000-0000-0000-000000000006',
        '20000000-0000-0000-0000-000000000003',
        'depicts',
        '1903',
        'La stampa commemorativa riguarda Gottardo Zurini.',
        '{}'::jsonb
    )
ON CONFLICT DO NOTHING;

INSERT INTO entity_media (
    entity_id,
    media_entity_id,
    usage_role,
    caption_override,
    sort_order
) VALUES
    (
        '10000000-0000-0000-0000-000000000004',
        '60000000-0000-0000-0000-000000000003',
        'gallery',
        'Interno del Battistero prima del restauro, fotografia storica di Vincenzo Vicari.',
        3
    ),
    (
        '10000000-0000-0000-0000-000000000004',
        '60000000-0000-0000-0000-000000000004',
        'gallery',
        'Facciata ovest del Battistero, settembre 1955.',
        4
    ),
    (
        '10000000-0000-0000-0000-000000000005',
        '60000000-0000-0000-0000-000000000005',
        'gallery',
        'Interno della chiesa di San Vitale, fotografia del 1940.',
        2
    ),
    (
        '20000000-0000-0000-0000-000000000003',
        '60000000-0000-0000-0000-000000000006',
        'portrait',
        'Stampa commemorativa dedicata a Gottardo Zurini.',
        1
    )
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('10000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000018', 'secondary_evidence', NULL, 'Scheda luogo del portale Lugano Storia.'),
    ('20000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000024', 'secondary_evidence', NULL, 'La stampa del 1903 fornisce date e note biografiche su Gottardo Zurini.'),
    ('50000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000022', 'primary_evidence', NULL, 'Documento del 1803 sulla viabilita ai Prati Maggi.'),
    ('50000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000023', 'primary_evidence', NULL, 'Periodico collegato a Riva San Vitale.'),
    ('60000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000019', 'image_credit', NULL, 'Fotografia dell interno del Battistero.'),
    ('60000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000020', 'image_credit', NULL, 'Fotografia dell esterno del Battistero.'),
    ('60000000-0000-0000-0000-000000000005', '90000000-0000-0000-0000-000000000021', 'image_credit', NULL, 'Fotografia dell interno della chiesa di San Vitale.'),
    ('60000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000024', 'image_credit', NULL, 'Stampa commemorativa di Gottardo Zurini.')
ON CONFLICT DO NOTHING;

COMMIT;
