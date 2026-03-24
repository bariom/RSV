BEGIN;

INSERT INTO sources (
    id,
    source_type,
    title,
    citation,
    author_text,
    publisher,
    language_code,
    url,
    accessed_on,
    notes_md,
    metadata
) VALUES
    (
        '90000000-0000-0000-0000-000000000039',
        'book',
        'Le iscrizioni romane del Canton Ticino',
        'Romeo Dell Era, Le iscrizioni romane del Canton Ticino, OAPEN Library.',
        'Romeo Dell Era',
        'OAPEN Library',
        'it',
        'https://library.oapen.org/bitstream/handle/20.500.12657/92020/209562.pdf?sequence=1&isAllowed=y',
        DATE '2026-03-24',
        'Fonte scientifica principale per le evidenze epigrafiche romane di Riva San Vitale: stele di Romatius, ara a Mercurio e repertorio delle iscrizioni.',
        '{"source_doc":"Fonti Storiche Riva San Vitale.docx"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000040',
        'article',
        'Il Battistero di San Giovanni a Riva San Vitale',
        'USI / Accademia di Architettura, "Il Battistero di San Giovanni a Riva San Vitale".',
        'USI, Accademia di Architettura di Mendrisio',
        'USI',
        'it',
        'https://www.share.usi.ch/arc/bettini_dinallo_battistero_riva_san_vitale.pdf',
        DATE '2026-03-24',
        'Fonte tecnica sui restauri, sulle fasi costruttive e sulle ipotesi architettoniche del Battistero.',
        '{"source_doc":"Fonti Storiche Riva San Vitale.docx"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000041',
        'registry',
        'Archivio parrocchiale di Meride',
        'Museo di Arte Sacra di Meride, "Archivio parrocchiale di Meride".',
        'Museo di Arte Sacra di Meride',
        'Museo di Arte Sacra di Meride',
        'it',
        'https://museoartesacrameride.ch/site/wp-content/uploads/2015/05/ARCHIVIO-PARROCCHIALE.pdf',
        DATE '2026-03-24',
        'Guida archivistica utile per i rapporti tra Meride e la pieve di Riva San Vitale, compresa la separazione parrocchiale del 1483.',
        '{"source_doc":"Fonti Storiche Riva San Vitale.docx"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000042',
        'website',
        'Archivio storico - Le Fornaci',
        'Le Fornaci, "Archivio storico".',
        'Le Fornaci',
        'Le Fornaci',
        'it',
        'https://www.lefornaci.ch/Archivio-storico-43c1f900',
        DATE '2026-03-24',
        'Fonte locale sull archeologia industriale e sul recupero del comparto delle Fornaci.',
        '{"source_doc":"Fonti Storiche Riva San Vitale.docx"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000043',
        'website',
        'Patriziato di Riva San Vitale',
        'Patriziato di Riva San Vitale, sito ufficiale.',
        'Patriziato di Riva San Vitale',
        'Patriziato di Riva San Vitale',
        'it',
        'http://www.patriziatorivasanvitale.ch/',
        DATE '2026-03-24',
        'Riferimento istituzionale per il patrimonio comune, la continuita dei casati patrizi e la memoria civica del borgo.',
        '{"source_doc":"Fonti Storiche Riva San Vitale.docx"}'::jsonb
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
        '40000000-0000-0000-0000-000000000025',
        'event',
        'insediamenti-palafitticoli-preistorici-sul-ceresio',
        'Insediamenti palafitticoli preistorici sul Ceresio',
        'Preistoria',
        'Le rive presso Riva San Vitale restituiscono indizi di antiche strutture palafitticole e di una lunga continuita insediativa.',
        'Il documento di ricerca segnala testimonianze riconducibili a insediamenti palafitticoli in prossimita dello specchio lacustre, come fondamento remoto della storia di Riva San Vitale.',
        'it',
        'published',
        FALSE,
        300,
        '{"seed":"docx-research","confidence":"medium"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000026',
        'event',
        'riva-porto-commerciale-romano-di-como',
        'Riva come porto commerciale romano di Como',
        'Eta imperiale',
        'Il borgo agisce come scalo commerciale sul Ceresio per i traffici diretti verso i valichi alpini.',
        'Nel periodo romano Riva San Vitale si consolida come porto commerciale di Como sul Ceresio e punto di transito verso i passi del San Gottardo, del Lucomagno e del San Bernardino.',
        'it',
        'published',
        TRUE,
        305,
        '{"seed":"docx-research","confidence":"high"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000027',
        'event',
        'quadrato-del-sator-nel-battistero',
        'Quadrato del Sator nell area del Battistero',
        'IV-V secolo d.C.',
        'Uno dei piu antichi esempi ticinesi di trasformazione del quadrato del Sator in chiave cristiana.',
        'Il quadrato del Sator rinvenuto nell area del Battistero e indicato dal documento come testimonianza della transizione simbolica tra tarda antichita e cristianesimo.',
        'it',
        'published',
        TRUE,
        335,
        '{"seed":"docx-research","confidence":"medium-high"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000028',
        'event',
        'separazione-della-parrocchia-di-meride-1483',
        'Separazione della parrocchia di Meride dalla pieve di Riva',
        '1483',
        'La documentazione archivistica testimonia il progressivo distacco di Meride dalla giurisdizione plebana di Riva San Vitale.',
        'La guida all archivio parrocchiale di Meride ricorda la separazione formale della parrocchia di Meride dalla pieve di Riva San Vitale nel 1483.',
        'it',
        'published',
        FALSE,
        345,
        '{"seed":"docx-research","confidence":"high"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000029',
        'event',
        'restauro-del-battistero-con-enea-tallone-1921',
        'Restauro del Battistero guidato da Enea Tallone',
        '1921',
        'Campagna di restauro orientata all isolamento del monumento e alla rimozione delle aggiunte piu tarde.',
        'Il documento e lo studio USI ricordano la campagna del 1921 diretta da Enea Tallone come momento decisivo nella ridefinizione moderna del Battistero.',
        'it',
        'published',
        FALSE,
        385,
        '{"seed":"docx-research","confidence":"high"}'::jsonb
    ),
    (
        '50000000-0000-0000-0000-000000000008',
        'document',
        'stele-di-romatius',
        'Stele di Romatius',
        'Epigrafe funeraria romana',
        'Stele funeraria di eta romana ricordata tra i reperti piu rilevanti provenienti da Riva San Vitale.',
        'La stele di Romatius e citata nel documento di ricerca come una delle testimonianze epigrafiche piu significative del borgo romano.',
        'it',
        'published',
        FALSE,
        571,
        '{"seed":"docx-research","scope":"inscription"}'::jsonb
    ),
    (
        '50000000-0000-0000-0000-000000000009',
        'document',
        'ara-votiva-a-mercurio-di-riva',
        'Ara votiva a Mercurio',
        'Epigrafe votiva romana',
        'Altare dedicato al dio Mercurio, indizio della funzione commerciale e viaria del borgo.',
        'L ara a Mercurio e usata nel documento di ricerca come prova della centralita mercantile di Riva San Vitale in epoca romana.',
        'it',
        'published',
        FALSE,
        572,
        '{"seed":"docx-research","scope":"inscription"}'::jsonb
    ),
    (
        '50000000-0000-0000-0000-000000000010',
        'document',
        'quadrato-del-sator-di-riva-san-vitale',
        'Quadrato del Sator di Riva San Vitale',
        'Iscrizione lapidea tardoantica',
        'Testimonianza simbolica e paleocristiana proveniente dall area del Battistero.',
        'Il quadrato del Sator di Riva San Vitale e descritto come uno dei piu antichi esempi ticinesi di rilettura cristiana del celebre palindromo.',
        'it',
        'published',
        FALSE,
        573,
        '{"seed":"docx-research","scope":"inscription"}'::jsonb
    ),
    (
        '70000000-0000-0000-0000-000000000006',
        'narrative',
        'riva-tra-porto-pieve-e-patrimonio-materiale',
        'Riva tra porto, pieve e patrimonio materiale',
        'Narrazione storica di sintesi',
        'Testo editoriale che intreccia funzione portuale romana, ruolo plebano medievale e patrimonio documentario del borgo.',
        'Narrazione costruita a partire dal documento fornito dall utente, selezionando soprattutto gli elementi meglio sostenuti da fonti istituzionali o scientifiche.',
        'it',
        'published',
        FALSE,
        760,
        '{"seed":"docx-research","scope":"narrative"}'::jsonb
    ),
    (
        '80000000-0000-0000-0000-000000000008',
        'theme',
        'epigrafia-e-fonti-materiali',
        'Epigrafia e fonti materiali',
        'Tema trasversale',
        'Iscrizioni romane, reperti lapidei e testimonianze archeologiche per leggere la lunga durata del borgo.',
        'Tema pensato per collegare documenti, eventi e luoghi che emergono dalle fonti materiali di Riva San Vitale.',
        'it',
        'published',
        FALSE,
        880,
        '{"seed":"docx-research","scope":"theme"}'::jsonb
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
        '40000000-0000-0000-0000-000000000025',
        'archaeological',
        NULL,
        NULL,
        'dal Neolitico',
        TRUE,
        3,
        'Testimonianze di strutture palafitticole e di una lunga frequentazione delle rive del Ceresio presso Riva San Vitale.'
    ),
    (
        '40000000-0000-0000-0000-000000000026',
        'economic',
        DATE '0001-01-01',
        DATE '0400-12-31',
        'eta romana',
        TRUE,
        5,
        'Riva San Vitale opera come scalo commerciale sul lago per i traffici collegati a Como e ai valichi alpini.'
    ),
    (
        '40000000-0000-0000-0000-000000000027',
        'archaeological',
        DATE '0350-01-01',
        DATE '0500-12-31',
        'IV-V secolo d.C.',
        TRUE,
        4,
        'La presenza del quadrato del Sator nell area del Battistero suggerisce una transizione simbolica tra tarda antichita e cristianesimo.'
    ),
    (
        '40000000-0000-0000-0000-000000000028',
        'administrative',
        DATE '1483-01-01',
        DATE '1483-12-31',
        '1483',
        FALSE,
        3,
        'Separazione della parrocchia di Meride dalla giurisdizione della pieve di Riva San Vitale.'
    ),
    (
        '40000000-0000-0000-0000-000000000029',
        'architectural',
        DATE '1921-01-01',
        DATE '1921-12-31',
        '1921',
        FALSE,
        3,
        'Campagna di restauro del Battistero guidata da Enea Tallone, orientata all isolamento delle strutture antiche.'
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
        '50000000-0000-0000-0000-000000000008',
        'inscription',
        'II-III secolo d.C.',
        'la',
        'Le iscrizioni romane del Canton Ticino',
        'La stele e citata nel repertorio epigrafico cantonale come testimonianza di famiglie di rango attive nel borgo romano.'
    ),
    (
        '50000000-0000-0000-0000-000000000009',
        'inscription',
        'I-II secolo d.C.',
        'la',
        'Le iscrizioni romane del Canton Ticino',
        'Ara votiva dedicata a Mercurio, particolarmente significativa per un centro di traffici e passaggi.'
    ),
    (
        '50000000-0000-0000-0000-000000000010',
        'inscription',
        'IV-V secolo d.C.',
        'la',
        'Battistero di San Giovanni / tradizione degli studi sul Sator',
        'Iscrizione lapidea proveniente dall area del Battistero e riletta in chiave paleocristiana.'
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
        '70000000-0000-0000-0000-000000000006',
        'article',
        'Riva San Vitale si lascia leggere come porto, pieve e archivio materiale di lunga durata.',
        'La storia di **Riva San Vitale** emerge dall intreccio di fonti molto diverse: evidenze archeologiche, iscrizioni romane, documenti ecclesiastici, archivi locali e restauri moderni dei monumenti. Il borgo appare gia nella lunga durata come nodo di transito e approdo sul Ceresio, poi come centro plebano capace di irradiare la propria influenza su gran parte del territorio circostante.\n\nLe iscrizioni romane, come la **stele di Romatius** e l **ara a Mercurio**, suggeriscono la presenza di una comunita ben inserita nei circuiti commerciali e culturali della regione. Il **Battistero di San Giovanni**, sorto su un contesto piu antico e piu volte restaurato, concentra invece il passaggio alla centralita cristiana del borgo. La separazione di **Meride** nel 1483 e la memoria dei casati patrizi mostrano infine come la storia religiosa e quella istituzionale siano rimaste a lungo strettamente connesse.',
        TIMESTAMPTZ '2026-03-24 14:00:00+01',
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
        '80000000-0000-0000-0000-000000000008',
        'contenuti',
        '#7B5A3A',
        'inscription'
    )
ON CONFLICT DO NOTHING;

INSERT INTO event_places (
    event_entity_id,
    place_entity_id,
    role_label
) VALUES
    ('40000000-0000-0000-0000-000000000025', '10000000-0000-0000-0000-000000000001', 'fascia lacustre'),
    ('40000000-0000-0000-0000-000000000026', '10000000-0000-0000-0000-000000000001', 'porto commerciale'),
    ('40000000-0000-0000-0000-000000000027', '10000000-0000-0000-0000-000000000004', 'area del ritrovamento'),
    ('40000000-0000-0000-0000-000000000028', '10000000-0000-0000-0000-000000000001', 'pieve di riferimento'),
    ('40000000-0000-0000-0000-000000000029', '10000000-0000-0000-0000-000000000004', 'monumento restaurato')
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
    ('a0000000-0000-0000-0000-000000000039', '50000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000001', 'mentions', NULL, 'La stele di Romatius e una delle principali testimonianze del borgo romano.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000040', '50000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000001', 'mentions', NULL, 'L ara a Mercurio richiama la vocazione commerciale e viaria del sito.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000041', '50000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000004', 'mentions', 'IV-V secolo d.C.', 'Il quadrato del Sator e associato all area del Battistero.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000042', '70000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000001', 'related_to', NULL, 'Narrazione generale sul ruolo storico di Riva San Vitale.', '{}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO entity_themes (
    entity_id,
    theme_entity_id
) VALUES
    ('10000000-0000-0000-0000-000000000001', '80000000-0000-0000-0000-000000000008'),
    ('10000000-0000-0000-0000-000000000004', '80000000-0000-0000-0000-000000000008'),
    ('40000000-0000-0000-0000-000000000026', '80000000-0000-0000-0000-000000000008'),
    ('40000000-0000-0000-0000-000000000027', '80000000-0000-0000-0000-000000000008'),
    ('50000000-0000-0000-0000-000000000008', '80000000-0000-0000-0000-000000000008'),
    ('50000000-0000-0000-0000-000000000009', '80000000-0000-0000-0000-000000000008'),
    ('50000000-0000-0000-0000-000000000010', '80000000-0000-0000-0000-000000000008'),
    ('70000000-0000-0000-0000-000000000006', '80000000-0000-0000-0000-000000000008')
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('10000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000039', 'secondary_evidence', NULL, 'Epigrafia romana e funzione commerciale del borgo.'),
    ('10000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000043', 'secondary_evidence', NULL, 'Continuita dei casati patrizi e memoria civica locale.'),
    ('10000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000040', 'secondary_evidence', NULL, 'Fasi costruttive e restauri del Battistero.'),
    ('10000000-0000-0000-0000-000000000010', '90000000-0000-0000-0000-000000000042', 'secondary_evidence', NULL, 'Storia e recupero del comparto delle Fornaci.'),
    ('40000000-0000-0000-0000-000000000025', '90000000-0000-0000-0000-000000000040', 'secondary_evidence', NULL, 'Il documento cita continuita insediative preistoriche presso la riva.'),
    ('40000000-0000-0000-0000-000000000026', '90000000-0000-0000-0000-000000000039', 'secondary_evidence', NULL, 'Funzione di porto commerciale romano di Como sul Ceresio.'),
    ('40000000-0000-0000-0000-000000000027', '90000000-0000-0000-0000-000000000040', 'secondary_evidence', NULL, 'Contesto del Battistero e lettura simbolica del Sator.'),
    ('40000000-0000-0000-0000-000000000028', '90000000-0000-0000-0000-000000000041', 'secondary_evidence', NULL, 'Separazione di Meride dalla pieve di Riva nel 1483.'),
    ('40000000-0000-0000-0000-000000000029', '90000000-0000-0000-0000-000000000040', 'secondary_evidence', NULL, 'Restauro del 1921 sotto Enea Tallone.'),
    ('50000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000039', 'secondary_evidence', NULL, 'Repertorio epigrafico della stele di Romatius.'),
    ('50000000-0000-0000-0000-000000000009', '90000000-0000-0000-0000-000000000039', 'secondary_evidence', NULL, 'Repertorio epigrafico dell ara dedicata a Mercurio.'),
    ('50000000-0000-0000-0000-000000000010', '90000000-0000-0000-0000-000000000040', 'secondary_evidence', NULL, 'Tradizione degli studi sul quadrato del Sator a Riva.'),
    ('70000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000039', 'bibliography', NULL, 'Base per la parte romana ed epigrafica.'),
    ('70000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000040', 'bibliography', NULL, 'Base per Battistero, restauri e lunga durata del sito.'),
    ('70000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000041', 'bibliography', NULL, 'Base per la dimensione plebana e i rapporti con Meride.')
ON CONFLICT DO NOTHING;

COMMIT;
