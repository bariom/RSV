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
    notes_md,
    metadata
) VALUES
    (
        '90000000-0000-0000-0000-000000000025',
        'other',
        'ISOS 4087 - Riva San Vitale',
        'Ufficio federale della cultura, ISOS, "Riva San Vitale", scheda 4087, 2a stesura 02.02.',
        'Ufficio per l ISOS; Sibylle Heusser',
        'Ufficio federale della cultura',
        'Zurigo',
        'it',
        'Scheda ISOS sul borgo di Riva San Vitale con sviluppo storico, nuclei urbanistici, valutazioni e raccomandazioni. PDF locale fornito dall utente.',
        '{"local_file":"c:\\Users\\BariOm\\Downloads\\ISOS_4087.pdf","coordinates":"718.899/84.923","inventory":"Inventario degli insediamenti svizzeri da proteggere"}'::jsonb
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
        '10000000-0000-0000-0000-000000000010',
        'place',
        'fornaci',
        'Fornaci',
        'Antico quartiere artigianale e di pescatori',
        'Quartiere storico di Riva San Vitale, nato attorno alla produzione dei laterizi e oggi prevalentemente residenziale.',
        'La scheda ISOS descrive **Fornaci** come antico quartiere artigianale e di pescatori, con testimonianze della produzione di laterizi attiva fin dall epoca romana e protrattasi fino al XX secolo.',
        'it',
        'published',
        TRUE,
        91,
        '{"seed":"isos-4087","isos_code":"P 3"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000011',
        'place',
        'cappella-di-san-rocco',
        'Cappella di San Rocco',
        'Edificio religioso tra XVI e XVII secolo',
        'Cappella che definisce il nucleo lungo strada in accesso al centro storico.',
        'La cappella di **San Rocco**, con facciata inquadrata da un viale di platani, e uno degli elementi chiave del nucleo posto lungo l accesso al borgo.',
        'it',
        'published',
        FALSE,
        92,
        '{"seed":"isos-4087","isos_code":"E 0.2.19"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000012',
        'place',
        'istituto-san-canisio',
        'Istituto San Canisio',
        'Palazzo a corte con parco',
        'Complesso scolastico e residenziale, gia residenza Della Croce, dominante nella silhouette del borgo.',
        'L **Istituto San Canisio**, gia residenza Della Croce e poi Istituto Baragiola, e indicato da ISOS come elemento monumentale di forte rilievo spaziale e paesaggistico.',
        'it',
        'published',
        FALSE,
        93,
        '{"seed":"isos-4087","isos_code":"E 0.1.18"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000013',
        'place',
        'lumaghera',
        'Lumaghera',
        'Edificazione rurale',
        'Piccolo aggregato rurale appartato rispetto al borgo principale.',
        'ISOS descrive **Lumaghera** come edificazione rurale laterale alla strada in arrivo da sud, discreto preannuncio all insediamento.',
        'it',
        'published',
        FALSE,
        94,
        '{"seed":"isos-4087","isos_code":"G 0.3"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000014',
        'place',
        'sviluppo-verso-capolago',
        'Sviluppo verso Capolago',
        'Espansione lungo strada di fine XIX secolo',
        'Crescita abitativa e commerciale sviluppata lungo il collegamento con Capolago.',
        'ISOS identifica come parte distinta dell insediamento lo **sviluppo lungo il collegamento con Capolago**, cresciuto a partire dalla fine del XIX secolo.',
        'it',
        'published',
        FALSE,
        95,
        '{"seed":"isos-4087","isos_code":"P 2"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000018',
        'event',
        'continuita-insediativa-dal-neolitico',
        'Continuita insediativa dal Neolitico',
        'Dalla preistoria alla fase romana e cristiana',
        'ISOS sottolinea una probabile continuita di insediamento a partire dal Neolitico.',
        'La scheda ISOS indica una continuita insediativa del sito di Riva San Vitale probabilmente a partire dal Neolitico.',
        'it',
        'published',
        FALSE,
        480,
        '{"seed":"isos-4087","period":"prehistory"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000019',
        'event',
        'attivita-laterizi-da-epoca-romana',
        'Produzione di laterizi in epoca romana e moderna',
        'Attivita produttiva di lunga durata a Fornaci',
        'La produzione di laterizi e una componente storica di lunga durata dell economia locale.',
        'ISOS ricorda una florida attivita nella fabbricazione di laterizi gia in epoca romana, protrattasi fino al XX secolo e riconoscibile nel quartiere di Fornaci.',
        'it',
        'published',
        TRUE,
        490,
        '{"seed":"isos-4087","period":"longue-duree"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000020',
        'event',
        'bonifica-e-canalizzazione-del-laveggio',
        'Bonifica e canalizzazione del Laveggio',
        'Tra XIX e XX secolo',
        'Trasformazione del piano alluvionale che rese possibile l espansione edilizia verso Capolago.',
        'ISOS lega la bonifica del piano alluvionale del Laveggio e la sua successiva canalizzazione alla crescita urbanistica verso Capolago e alla colonizzazione del piano.',
        'it',
        'published',
        FALSE,
        500,
        '{"seed":"isos-4087","period":"modern-contemporary"}'::jsonb
    ),
    (
        '50000000-0000-0000-0000-000000000006',
        'document',
        'isos-4087-riva-san-vitale',
        'ISOS 4087 - Riva San Vitale',
        'Scheda d inventario federale',
        'Documento di riferimento sulla struttura storica e urbanistica dell insediamento.',
        'La scheda ISOS su Riva San Vitale descrive storia, morfologia, valori spaziali, nuclei edilizi, elementi perturbatori e raccomandazioni di salvaguardia.',
        'it',
        'published',
        TRUE,
        560,
        '{"seed":"isos-4087","scope":"document"}'::jsonb
    ),
    (
        '70000000-0000-0000-0000-000000000004',
        'narrative',
        'magnifico-borgo-e-struttura-insediativa',
        'Il Magnifico Borgo e la sua struttura insediativa',
        'Narrazione urbanistica',
        'Testo editoriale sulla forma del borgo, sui nuclei storici e sulle raccomandazioni di salvaguardia.',
        'Narrazione costruita a partire dalla scheda ISOS, utile per una pagina del sito dedicata all insediamento storico e al paesaggio urbano di Riva San Vitale.',
        'it',
        'published',
        FALSE,
        740,
        '{"seed":"isos-4087","scope":"narrative"}'::jsonb
    ),
    (
        '80000000-0000-0000-0000-000000000005',
        'theme',
        'urbanistica-storica',
        'Urbanistica storica',
        'Tema trasversale',
        'Forma del borgo, nuclei edilizi, relazioni spaziali e salvaguardia.',
        'Tema dedicato alla lettura storica e spaziale dell insediamento.',
        'it',
        'published',
        FALSE,
        850,
        '{"seed":"isos-4087","scope":"theme"}'::jsonb
    ),
    (
        '80000000-0000-0000-0000-000000000006',
        'theme',
        'laterizi-e-fornaci',
        'Laterizi e fornaci',
        'Tema trasversale',
        'Storia produttiva della fabbricazione di laterizi e del quartiere di Fornaci.',
        'Tema dedicato alla produzione di laterizi, alle fornaci storiche e al lavoro artigianale locale.',
        'it',
        'published',
        FALSE,
        860,
        '{"seed":"isos-4087","scope":"theme"}'::jsonb
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
        '10000000-0000-0000-0000-000000000010',
        'hamlet',
        'Fornaci',
        NULL,
        '10000000-0000-0000-0000-000000000001',
        'Riva a lago, Riva San Vitale',
        'Antico quartiere artigianale e di pescatori in diretto rapporto con il lago.'
    ),
    (
        '10000000-0000-0000-0000-000000000011',
        'religious_site',
        'Cappella di San Rocco',
        'S.Rocco',
        '10000000-0000-0000-0000-000000000001',
        'Accesso al centro storico, Riva San Vitale',
        'Facciata inquadrata da un viale di platani; secoli XVI-XVII.'
    ),
    (
        '10000000-0000-0000-0000-000000000012',
        'building',
        'Istituto San Canisio',
        'Residenza Della Croce; Istituto Baragiola',
        '10000000-0000-0000-0000-000000000001',
        'Pendio sopra il borgo, Riva San Vitale',
        'Palazzo a corte con parco e dipendenze, in posizione dominante.'
    ),
    (
        '10000000-0000-0000-0000-000000000013',
        'hamlet',
        'Lumaghera',
        NULL,
        '10000000-0000-0000-0000-000000000001',
        'Ingresso sud di Riva San Vitale',
        'Edificazione rurale appartata rispetto al borgo.'
    ),
    (
        '10000000-0000-0000-0000-000000000014',
        'street',
        'Collegamento con Capolago',
        NULL,
        '10000000-0000-0000-0000-000000000001',
        'Asse viario verso Capolago',
        'Sviluppo abitativo e commerciale formatosi dalla fine del XIX secolo.'
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
        '40000000-0000-0000-0000-000000000018',
        'archaeological',
        NULL,
        NULL,
        'dal Neolitico',
        TRUE,
        4,
        'Continuita insediativa del sito di Riva San Vitale probabilmente a partire dal Neolitico.'
    ),
    (
        '40000000-0000-0000-0000-000000000019',
        'economic',
        NULL,
        NULL,
        'dall epoca romana al XX secolo',
        TRUE,
        5,
        'Produzione di laterizi e presenza di fornaci come tratto di lunga durata della storia locale.'
    ),
    (
        '40000000-0000-0000-0000-000000000020',
        'administrative',
        NULL,
        NULL,
        'XIX-XX secolo',
        TRUE,
        3,
        'Bonifica del piano alluvionale del Laveggio e successiva canalizzazione, decisive per lo sviluppo urbanistico verso Capolago.'
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
        '50000000-0000-0000-0000-000000000006',
        'report',
        '2a stesura 02.02',
        'it',
        'ISOS 4087',
        'Scheda d inventario federale sugli insediamenti svizzeri da proteggere; il seed usa il PDF locale fornito dall utente.'
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
        '70000000-0000-0000-0000-000000000004',
        'article',
        'Il borgo di Riva San Vitale si legge come un sistema di nuclei storici, monumenti e rapporti con lago, monte e piano alluvionale.',
        'La scheda **ISOS 4087** presenta Riva San Vitale come un insediamento di grande valore storico, spaziale e paesaggistico. Il borgo medievale in pendio, il quartiere delle **Fornaci**, il nucleo di **S.Rocco**, il complesso di **S.Croce** e l espansione verso **Capolago** raccontano fasi diverse dello sviluppo dell abitato.\n\nISOS sottolinea la centralita della funzione ecclesiale, il ruolo del battistero paleocristiano, la fioritura rinascimentale dei palazzi e della chiesa di Santa Croce, l importanza produttiva della fabbricazione di laterizi e il pregio delle relazioni spaziali tra assi, vicoli, piazze, pendio e lago.\n\nLe raccomandazioni di salvaguardia insistono sulla tutela delle immediate vicinanze dei nuclei storici, della vista sul lago e verso Santa Croce, della relazione tra il borgo e Fornaci, e delle testimonianze edilizie della produzione di laterizi.',
        TIMESTAMPTZ '2026-03-23 16:15:00+01',
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
        '80000000-0000-0000-0000-000000000005',
        'contenuti',
        '#6F4E37',
        'map'
    ),
    (
        '80000000-0000-0000-0000-000000000006',
        'contenuti',
        '#A35A2A',
        'factory'
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
        'a0000000-0000-0000-0000-000000000025',
        '10000000-0000-0000-0000-000000000010',
        '10000000-0000-0000-0000-000000000001',
        'part_of',
        NULL,
        'Fornaci e parte del territorio storico di Riva San Vitale.',
        '{}'::jsonb
    ),
    (
        'a0000000-0000-0000-0000-000000000026',
        '10000000-0000-0000-0000-000000000011',
        '10000000-0000-0000-0000-000000000001',
        'located_in',
        NULL,
        'La cappella di San Rocco appartiene al sistema storico di accesso al borgo.',
        '{}'::jsonb
    ),
    (
        'a0000000-0000-0000-0000-000000000027',
        '10000000-0000-0000-0000-000000000012',
        '10000000-0000-0000-0000-000000000006',
        'related_to',
        NULL,
        'L Istituto San Canisio e strettamente connesso al nucleo di Santa Croce.',
        '{}'::jsonb
    ),
    (
        'a0000000-0000-0000-0000-000000000028',
        '10000000-0000-0000-0000-000000000014',
        '10000000-0000-0000-0000-000000000001',
        'related_to',
        'fine XIX secolo',
        'Asse di espansione edilizia e commerciale verso Capolago.',
        '{}'::jsonb
    ),
    (
        'a0000000-0000-0000-0000-000000000029',
        '50000000-0000-0000-0000-000000000006',
        '10000000-0000-0000-0000-000000000001',
        'mentions',
        NULL,
        'Il documento ISOS descrive il borgo, i nuclei e le qualita dell insediamento.',
        '{}'::jsonb
    )
ON CONFLICT DO NOTHING;

INSERT INTO event_places (
    event_entity_id,
    place_entity_id,
    role_label
) VALUES
    ('40000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000001', 'sito di lunga durata'),
    ('40000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000010', 'quartiere produttivo'),
    ('40000000-0000-0000-0000-000000000020', '10000000-0000-0000-0000-000000000014', 'asse di espansione')
ON CONFLICT DO NOTHING;

INSERT INTO entity_themes (
    entity_id,
    theme_entity_id
) VALUES
    ('10000000-0000-0000-0000-000000000010', '80000000-0000-0000-0000-000000000006'),
    ('10000000-0000-0000-0000-000000000011', '80000000-0000-0000-0000-000000000002'),
    ('10000000-0000-0000-0000-000000000012', '80000000-0000-0000-0000-000000000005'),
    ('10000000-0000-0000-0000-000000000013', '80000000-0000-0000-0000-000000000005'),
    ('10000000-0000-0000-0000-000000000014', '80000000-0000-0000-0000-000000000005'),
    ('40000000-0000-0000-0000-000000000019', '80000000-0000-0000-0000-000000000006'),
    ('40000000-0000-0000-0000-000000000020', '80000000-0000-0000-0000-000000000005'),
    ('50000000-0000-0000-0000-000000000006', '80000000-0000-0000-0000-000000000005'),
    ('70000000-0000-0000-0000-000000000004', '80000000-0000-0000-0000-000000000005'),
    ('70000000-0000-0000-0000-000000000004', '80000000-0000-0000-0000-000000000006')
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('10000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'pp. 13-18', 'Storia, struttura dell insediamento, raccomandazioni e valutazioni.'),
    ('10000000-0000-0000-0000-000000000010', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'pp. 11-17', 'Quartiere Fornaci, produzione dei laterizi e rapporti spaziali col borgo.'),
    ('10000000-0000-0000-0000-000000000011', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'pp. 12, 15-16', 'Cappella di San Rocco e nucleo lungo strada.'),
    ('10000000-0000-0000-0000-000000000012', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'pp. 12, 16', 'Istituto San Canisio e ruolo nella silhouette del borgo.'),
    ('10000000-0000-0000-0000-000000000013', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'p. 11', 'Lumaghera come edificazione rurale.'),
    ('10000000-0000-0000-0000-000000000014', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'pp. 11, 14-17', 'Sviluppo verso Capolago e relazioni col borgo.'),
    ('40000000-0000-0000-0000-000000000018', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'p. 13', 'Continuita insediativa dal Neolitico.'),
    ('40000000-0000-0000-0000-000000000019', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'pp. 14, 16-17', 'Produzione di laterizi e storia di Fornaci.'),
    ('40000000-0000-0000-0000-000000000020', '90000000-0000-0000-0000-000000000025', 'secondary_evidence', 'pp. 14-15', 'Bonifica e canalizzazione del Laveggio.'),
    ('50000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000025', 'bibliography', NULL, 'Documento base del seed ISOS.'),
    ('70000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000025', 'bibliography', 'pp. 13-18', 'Narrazione urbanistica costruita sulla scheda ISOS.')
ON CONFLICT DO NOTHING;

COMMIT;
