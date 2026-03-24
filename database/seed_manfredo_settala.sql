BEGIN;

INSERT INTO sources (
    id,
    source_type,
    title,
    citation,
    author_text,
    publisher,
    language_code,
    accessed_on,
    notes_md,
    metadata
) VALUES
    (
        '90000000-0000-0000-0000-000000000044',
        'other',
        'Vita, Leggenda e Culto del Beato Manfredo Settala',
        'Documento di ricerca fornito dall utente, "Vita, Leggenda e Culto del Beato Manfredo Settala".',
        'Autore non indicato nel file consegnato',
        'Documento fornito dall utente',
        'it',
        DATE '2026-03-24',
        'Fonte di lavoro dedicata alla biografia tradizionale del Beato, al suo culto locale e alle principali leggende devozionali.',
        '{"source_doc":"Vita, Leggenda e Culto del Beato Manfredo Settala.docx","scope":"manfredo-settala"}'::jsonb
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
        '10000000-0000-0000-0000-000000000015',
        'place',
        'cuasso-al-piano',
        'Cuasso al Piano',
        'Luogo del ministero sacerdotale di Manfredo',
        'Secondo la tradizione, Manfredo Settala esercito qui il proprio ministero come primo parroco locale attorno al 1180.',
        'Nel racconto tramandato dal documento, **Cuasso al Piano** e il primo luogo storicamente associato all attivita pastorale di Manfredo Settala prima del ritiro eremitico sul Monte San Giorgio.',
        'it',
        'published',
        FALSE,
        90,
        '{"seed":"manfredo-settala","scope":"place"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000016',
        'place',
        'eremo-del-beato-manfredo',
        'Eremo del Beato Manfredo',
        'Luogo tradizionale del ritiro sul Monte San Giorgio',
        'Sito devozionale associato alla vita eremitica di Manfredo sulle pendici del Monte San Giorgio.',
        'Il luogo di ritiro di **Manfredo Settala** e tramandato dalla devozione locale come una grotta o cella eremitica affacciata sul Ceresio, sul versante del Monte San Giorgio legato alla pieve di Riva San Vitale.',
        'it',
        'published',
        FALSE,
        95,
        '{"seed":"manfredo-settala","scope":"place","confidence":"tradition"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000030',
        'event',
        'ministero-di-manfredo-a-cuasso',
        'Ministero sacerdotale di Manfredo a Cuasso',
        'circa 1180',
        'La tradizione ricorda Manfredo come primo parroco di Cuasso al Piano, attivo tra le chiese di San Pietro e San Giacomo.',
        'Prima del ritiro eremitico, Manfredo Settala viene ricordato come sacerdote attivo a **Cuasso**, in una curazia che comprendeva anche altri centri della Valceresio.',
        'it',
        'published',
        FALSE,
        341,
        '{"seed":"manfredo-settala","confidence":"medium"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000031',
        'event',
        'ritiro-eremitico-di-manfredo-sul-monte-san-giorgio',
        'Ritiro eremitico di Manfredo sul Monte San Giorgio',
        'fine XII - inizio XIII secolo',
        'La memoria locale colloca sulle pendici del Monte San Giorgio la vita ascetica del Beato.',
        'Secondo la tradizione, Manfredo abbandono la cura d anime attiva per ritirarsi in solitudine sul **Monte San Giorgio**, dove visse da eremita e divenne meta di pellegrinaggi.',
        'it',
        'published',
        TRUE,
        342,
        '{"seed":"manfredo-settala","confidence":"tradition"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000032',
        'event',
        'contesa-della-sepoltura-del-beato-manfredo',
        'Contesa della sepoltura del Beato Manfredo',
        '27 gennaio 1217',
        'La leggenda del feretro e dei buoi scioglie il conflitto tra Cuasso e Riva San Vitale sul luogo della sepoltura.',
        'Alla morte di Manfredo, la tradizione racconta una disputa tra **Cuasso** e **Riva San Vitale**. Il carro con i buoi avrebbe indicato Riva come luogo della sepoltura, fissando uno dei nuclei piu duraturi del culto locale.',
        'it',
        'published',
        FALSE,
        343,
        '{"seed":"manfredo-settala","confidence":"legend"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000033',
        'event',
        'sagra-del-beato-manfredo',
        'Sagra del Beato Manfredo',
        'ultima domenica di gennaio',
        'Ricorrenza devozionale annuale con benedizione del pane, pellegrinaggio alla tomba e memoria comunitaria.',
        'La **Sagra del Beato Manfredo** rinnova ogni anno la devozione locale con la benedizione del pane, la visita alle reliquie e il richiamo alla solidarieta comunitaria legata al miracolo del pane.',
        'it',
        'published',
        TRUE,
        344,
        '{"seed":"manfredo-settala","confidence":"high","recurrence":"annual"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000034',
        'event',
        'raffigurazione-quattrocentesca-del-beato-nel-battistero',
        'Raffigurazione quattrocentesca del Beato nel Battistero',
        'XV secolo',
        'Una delle piu antiche immagini note del Beato Manfredo e conservata nel Battistero di San Giovanni.',
        'Il documento ricorda nel **Battistero di San Giovanni** una delle testimonianze figurative piu antiche del culto del Beato Manfredo, datata al Quattrocento.',
        'it',
        'published',
        FALSE,
        346,
        '{"seed":"manfredo-settala","confidence":"medium"}'::jsonb
    ),
    (
        '70000000-0000-0000-0000-000000000007',
        'narrative',
        'beato-manfredo-tra-storia-leggenda-e-culto',
        'Beato Manfredo tra storia, leggenda e culto',
        'Narrazione editoriale dedicata',
        'Racconto di sintesi sulla figura del Beato Manfredo Settala, tra ministero sacerdotale, eremitismo e devozione locale.',
        'Narrazione costruita a partire dal documento fornito dall utente, tenendo distinti gli elementi storicamente attestati dalle componenti leggendarie e devozionali.',
        'it',
        'published',
        FALSE,
        770,
        '{"seed":"manfredo-settala","scope":"narrative"}'::jsonb
    ),
    (
        '80000000-0000-0000-0000-000000000009',
        'theme',
        'culto-e-devozione',
        'Culto e devozione',
        'Tema trasversale',
        'Pratiche devozionali, feste, reliquie, iconografia e tradizioni popolari legate alla memoria del Beato.',
        'Tema pensato per collegare la figura del Beato Manfredo Settala alle forme locali del culto, della festa e della memoria religiosa.',
        'it',
        'published',
        FALSE,
        890,
        '{"seed":"manfredo-settala","scope":"theme"}'::jsonb
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
        '10000000-0000-0000-0000-000000000015',
        'hamlet',
        'Cuasso al Piano',
        NULL,
        NULL,
        'Cuasso al Piano, Lombardia, Italia',
        'Luogo extra-comunale collegato alla biografia tradizionale del Beato Manfredo.'
    ),
    (
        '10000000-0000-0000-0000-000000000016',
        'religious_site',
        'Eremo del Beato Manfredo',
        NULL,
        '10000000-0000-0000-0000-000000000007',
        'Pendici del Monte San Giorgio, area di Riva San Vitale',
        'Luogo devozionale tradizionale associato alla vita eremitica di Manfredo; localizzazione da intendersi come memoriale e non archeologicamente definita.'
    )
ON CONFLICT DO NOTHING;

UPDATE entities
SET
    subtitle = 'Sacerdote, eremita e figura devozionale del Mendrisiotto',
    summary = 'Figura religiosa tra XII e XIII secolo, venerata a Riva San Vitale e legata al Monte San Giorgio, a Cuasso e alla tradizione del pane del Beato.',
    description_md = 'La figura del **Beato Manfredo Settala** unisce storia locale, tradizione religiosa e leggenda. La memoria devozionale lo presenta prima come sacerdote attivo a **Cuasso**, poi come eremita sul **Monte San Giorgio** e infine come patrono popolare venerato a **Riva San Vitale**, dove il culto resta vivo nella sagra annuale e nella distribuzione del pane benedetto.',
    metadata = metadata || '{"seed_extension":"manfredo-settala"}'::jsonb
WHERE id = '20000000-0000-0000-0000-000000000001';

UPDATE people
SET
    birth_date_label = 'XII secolo',
    occupations = 'sacerdote; eremita; figura devozionale',
    biography_md = 'Secondo la tradizione locale, **Manfredo Settala**, di origine milanese, esercito il ministero sacerdotale a **Cuasso** attorno al 1180 e si ritiro poi sul **Monte San Giorgio** per condurre vita eremitica. La sua morte, collocata al **27 gennaio 1217**, diede origine a un culto durevole a **Riva San Vitale**, dove la memoria del Beato e ancora oggi rinnovata dalla sagra annuale, dalla benedizione del pane e dal pellegrinaggio alla tomba.'
WHERE entity_id = '20000000-0000-0000-0000-000000000001';

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
        '40000000-0000-0000-0000-000000000030',
        'religious',
        DATE '1180-01-01',
        DATE '1189-12-31',
        'circa 1180',
        TRUE,
        3,
        'Manfredo e ricordato come sacerdote attivo a Cuasso al Piano, in una curazia estesa anche ad altre localita della Valceresio.'
    ),
    (
        '40000000-0000-0000-0000-000000000031',
        'religious',
        DATE '1190-01-01',
        DATE '1217-01-27',
        'fine XII - 1217',
        TRUE,
        4,
        'Il ritiro eremitico di Manfredo sul Monte San Giorgio costituisce il fulcro della tradizione spirituale che ne ha alimentato il culto.'
    ),
    (
        '40000000-0000-0000-0000-000000000032',
        'religious',
        DATE '1217-01-27',
        DATE '1217-01-27',
        '27 gennaio 1217',
        FALSE,
        4,
        'La leggenda dei buoi e della contesa per la sepoltura spiega perche il culto del Beato si sia radicato a Riva San Vitale.'
    ),
    (
        '40000000-0000-0000-0000-000000000033',
        'cultural',
        NULL,
        NULL,
        'ultima domenica di gennaio',
        FALSE,
        4,
        'La sagra annuale rinnova la memoria del Beato attraverso il pane benedetto, il pellegrinaggio e le pratiche devozionali comunitarie.'
    ),
    (
        '40000000-0000-0000-0000-000000000034',
        'cultural',
        DATE '1400-01-01',
        DATE '1499-12-31',
        'XV secolo',
        TRUE,
        2,
        'Una delle immagini piu antiche del Beato Manfredo e ricordata nel Battistero di San Giovanni, segno della diffusione iconografica del culto.'
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
        '70000000-0000-0000-0000-000000000007',
        'biography',
        'La vicenda del Beato Manfredo Settala vive sul confine tra memoria storica, leggenda e devozione popolare.',
        'Il profilo del **Beato Manfredo Settala** e centrale per comprendere la dimensione religiosa di **Riva San Vitale** e del **Monte San Giorgio**. La tradizione lo presenta dapprima come sacerdote attivo a **Cuasso**, poi come eremita sulle alture del Ceresio, dove la sua fama di santita avrebbe attirato fedeli e pellegrini.\n\nAttorno alla sua morte, fissata dalla memoria locale al **27 gennaio 1217**, si addensano gli episodi che hanno maggiormente segnato l immaginario collettivo: il **miracolo del pane**, il suono spontaneo delle campane, la contesa per il luogo della sepoltura e il carro con i buoi che scende verso **Riva San Vitale**. Questi racconti non vanno letti tutti sullo stesso piano documentario, ma spiegano in modo efficace il radicamento del culto nella comunita.\n\nAncora oggi la **Sagra del Beato Manfredo**, celebrata alla fine di gennaio, lega reliquie, pane benedetto, pellegrinaggio e memoria comunitaria. In questo senso il Beato non e solo una figura del passato: e un elemento vivo della cultura religiosa locale.',
        TIMESTAMPTZ '2026-03-24 15:00:00+01',
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
        '80000000-0000-0000-0000-000000000009',
        'contenuti',
        '#8A6A3E',
        'candles'
    )
ON CONFLICT DO NOTHING;

INSERT INTO event_participants (
    event_entity_id,
    participant_entity_id,
    role_label,
    notes_md
) VALUES
    ('40000000-0000-0000-0000-000000000030', '20000000-0000-0000-0000-000000000001', 'sacerdote', 'Manfredo e ricordato come parroco o curato di Cuasso.'),
    ('40000000-0000-0000-0000-000000000031', '20000000-0000-0000-0000-000000000001', 'eremita', 'La tradizione lo colloca in ritiro sul Monte San Giorgio.'),
    ('40000000-0000-0000-0000-000000000032', '20000000-0000-0000-0000-000000000001', 'beato venerato', 'La sua morte genera il racconto del trasporto della salma a Riva.'),
    ('40000000-0000-0000-0000-000000000033', '20000000-0000-0000-0000-000000000001', 'figura commemorata', 'La sagra annuale e dedicata al Beato.'),
    ('40000000-0000-0000-0000-000000000034', '20000000-0000-0000-0000-000000000001', 'soggetto raffigurato', 'Il Beato compare in una testimonianza figurativa quattrocentesca del Battistero.')
ON CONFLICT DO NOTHING;

INSERT INTO event_places (
    event_entity_id,
    place_entity_id,
    role_label
) VALUES
    ('40000000-0000-0000-0000-000000000030', '10000000-0000-0000-0000-000000000015', 'ministero pastorale'),
    ('40000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000016', 'luogo del ritiro'),
    ('40000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000007', 'contesto montano'),
    ('40000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000015', 'comunita contendente'),
    ('40000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000005', 'luogo della sepoltura venerata'),
    ('40000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000005', 'luogo della festa'),
    ('40000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000001', 'comunita celebrante'),
    ('40000000-0000-0000-0000-000000000034', '10000000-0000-0000-0000-000000000004', 'luogo della testimonianza figurativa')
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
    ('a0000000-0000-0000-0000-000000000043', '20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000015', 'related_to', 'circa 1180', 'La tradizione ricorda Cuasso come primo centro del ministero di Manfredo.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000044', '20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000016', 'related_to', 'fine XII - inizio XIII secolo', 'Il Beato e associato all eremo sul Monte San Giorgio.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000045', '20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000005', 'commemorates', NULL, 'La tomba venerata del Beato e custodita nella chiesa parrocchiale di Riva San Vitale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000046', '70000000-0000-0000-0000-000000000007', '20000000-0000-0000-0000-000000000001', 'related_to', NULL, 'Narrazione editoriale dedicata al Beato Manfredo.', '{}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO entity_themes (
    entity_id,
    theme_entity_id
) VALUES
    ('20000000-0000-0000-0000-000000000001', '80000000-0000-0000-0000-000000000009'),
    ('10000000-0000-0000-0000-000000000016', '80000000-0000-0000-0000-000000000009'),
    ('40000000-0000-0000-0000-000000000031', '80000000-0000-0000-0000-000000000009'),
    ('40000000-0000-0000-0000-000000000032', '80000000-0000-0000-0000-000000000009'),
    ('40000000-0000-0000-0000-000000000033', '80000000-0000-0000-0000-000000000009'),
    ('40000000-0000-0000-0000-000000000034', '80000000-0000-0000-0000-000000000009'),
    ('70000000-0000-0000-0000-000000000007', '80000000-0000-0000-0000-000000000009')
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('20000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000044', 'secondary_evidence', NULL, 'Base di lavoro per biografia, leggenda e culto del Beato Manfredo.'),
    ('20000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000006', 'further_reading', NULL, 'Riferimento turistico e contemporaneo alla festa annuale del Beato.'),
    ('10000000-0000-0000-0000-000000000016', '90000000-0000-0000-0000-000000000044', 'secondary_evidence', NULL, 'Tradizione locale dell eremo sul Monte San Giorgio.'),
    ('40000000-0000-0000-0000-000000000030', '90000000-0000-0000-0000-000000000044', 'secondary_evidence', NULL, 'Ministero sacerdotale di Manfredo a Cuasso.'),
    ('40000000-0000-0000-0000-000000000031', '90000000-0000-0000-0000-000000000044', 'secondary_evidence', NULL, 'Ritiro eremitico e fama di santita sul Monte San Giorgio.'),
    ('40000000-0000-0000-0000-000000000032', '90000000-0000-0000-0000-000000000044', 'secondary_evidence', NULL, 'Leggenda del carro e dei buoi per la sepoltura del Beato.'),
    ('40000000-0000-0000-0000-000000000033', '90000000-0000-0000-0000-000000000044', 'secondary_evidence', NULL, 'Descrizione della sagra, del pane benedetto e del pellegrinaggio.'),
    ('40000000-0000-0000-0000-000000000033', '90000000-0000-0000-0000-000000000006', 'secondary_evidence', NULL, 'Conferma contemporanea della festa del Beato Manfredo.'),
    ('40000000-0000-0000-0000-000000000034', '90000000-0000-0000-0000-000000000044', 'secondary_evidence', NULL, 'Riferimento alla piu antica immagine del Beato nel Battistero.'),
    ('70000000-0000-0000-0000-000000000007', '90000000-0000-0000-0000-000000000044', 'bibliography', NULL, 'Fonte di base per la narrazione dedicata al Beato Manfredo.')
ON CONFLICT DO NOTHING;

COMMIT;
