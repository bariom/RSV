BEGIN;

-- Seed di estensione costruito a partire dal documento:
-- "La Repubblica di Riva San Vitale nel 1798.docx"
-- Obiettivo: arricchire l evento gia presente nel seed base con
-- persone, luoghi, fonti, un documento collegato e una cronologia piu dettagliata.

-- SECTION: SOURCES
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
        '90000000-0000-0000-0000-000000000045',
        'other',
        'La Repubblica di Riva San Vitale nel 1798',
        'Documento di ricerca fornito dall utente, "La Repubblica di Riva San Vitale nel 1798".',
        'Autore non indicato nel file consegnato',
        'Documento fornito dall utente',
        'it',
        NULL,
        DATE '2026-03-24',
        'Fonte di lavoro principale per preparare questo seed: ricostruzione sintetica con riferimenti a studi, fonti istituzionali e collezioni digitali sul 1798 rivense.',
        '{"source_doc":"La Repubblica di Riva San Vitale nel 1798.docx","scope":"repubblica-riva-1798"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000046',
        'website',
        'Cenni storici',
        'Comune di Riva San Vitale, "Cenni storici".',
        'Comune di Riva San Vitale',
        'Comune di Riva San Vitale',
        'it',
        'https://www.rivasanvitale.ch/Cenni-storici-a4b3f900',
        DATE '2026-03-24',
        'Sintesi comunale usata nel documento per la cronologia locale della Repubblica di Riva e per il richiamo a Gottardo Zurini.',
        '{"seed":"repubblica-riva-1798"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000047',
        'article',
        'Studi sulla nascita del Canton Ticino e sulla crisi del 1798',
        'Studio citato dal documento come quadro storico-archivistico sulla transizione 1798-1803 nel Sottoceneri.',
        'Autore non identificato nel documento utente',
        'Library of Congress / fonte citata nel documento',
        'it',
        'https://tile.loc.gov/storage-services/master/gdc/gdcebookspublic/20/20/71/84/23/2020718423/2020718423.pdf',
        DATE '2026-03-24',
        'Riferimento di secondo livello per la crisi dei baliaggi, il tentativo filocisalpino di Lugano, i volontari luganesi e le dinamiche che coinvolgono Riva, Bissone e Mendrisio.',
        '{"seed":"repubblica-riva-1798","source_role":"context-study"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000048',
        'website',
        'Repubblica elvetica',
        'Dizionario storico della Svizzera, "Repubblica elvetica".',
        'Dizionario storico della Svizzera',
        'Dizionario storico della Svizzera',
        'it',
        'https://hls-dhs-dss.ch/it/articles/009797/',
        DATE '2026-03-24',
        'Quadro generale sul lessico rivoluzionario, i simboli politici e il nuovo ordine elvetico richiamati nel documento.',
        '{"seed":"repubblica-riva-1798"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000049',
        'website',
        'Li volontari su la piazza di Lugano 1798',
        'Lugano Cultura, "Li volontari su la piazza di Lugano 1798".',
        'Lugano Cultura',
        'Citta di Lugano',
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/110133-li-volontari-su-la-piazza-di-lugano-1798',
        DATE '2026-03-24',
        'Oggetto e scheda citati dal documento per il contesto dei volontari luganesi e della reazione filoelvetica.',
        '{"seed":"repubblica-riva-1798"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000050',
        'website',
        'Gottardo Zurini (1746-1815)',
        'Lugano Cultura, "Gottardo Zurini (1746-1815)".',
        'Lugano Cultura',
        'Citta di Lugano',
        'it',
        'https://patrimonio.luganocultura.ch/oggetti/4207-gottardo-zurini-1746-1815',
        DATE '2026-03-24',
        'Scheda usata nel documento per il profilo commemorativo di Zurini e per la continuita tra 1798 e 1803.',
        '{"seed":"repubblica-riva-1798"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000051',
        'article',
        'Archivio Storico Ticinese, 1965: contributo di Edmondo Luigi Vassalli sulla Repubblica di Riva',
        'Indice e riferimento bibliografico al contributo di Edmondo Luigi Vassalli sulla Repubblica di Riva, Archivio Storico Ticinese, 1965.',
        'Edmondo Luigi Vassalli',
        'Archivio Storico Ticinese / Edizioni Casagrande',
        'it',
        'https://edizionicasagrande.com/libri_dett.php?id=2358',
        DATE '2026-03-24',
        'Riferimento storiografico locale richiamato nel documento come base specialistica per la datazione 23 febbraio - 14 marzo 1798.',
        '{"seed":"repubblica-riva-1798","scope":"bibliography"}'::jsonb
    ),
    (
        '90000000-0000-0000-0000-000000000052',
        'registry',
        'Municipalita del Circondario di Riva S. Vitale',
        'Record della Biblioteca digitale del Cantone Ticino su fogli volanti e atti della Municipalita del Circondario di Riva S. Vitale.',
        'Biblioteca digitale del Cantone Ticino',
        'Biblioteca digitale del Cantone Ticino',
        'it',
        'https://bibliotecadigitale.ti.ch/primo-explore/fulldisplay?adaptor=Local+Search+Engine&context=L&docid=41CSI_ALEPHSBT001020696&lang=it_IT&offset=180&query=any%2Ccontains%2C41CSI_BZASTFOGLIRE&search_scope=40CSI_FOGLIREPELV&sortby=title&tab=default_tab&vid=41CSI_BD_V1',
        DATE '2026-03-24',
        'Record archivistico-digitale segnalato nel documento per fogli volanti e atti legati alla Municipalita del Circondario di Riva S. Vitale.',
        '{"seed":"repubblica-riva-1798","scope":"documentary-trace"}'::jsonb
    )
ON CONFLICT DO NOTHING;

-- SECTION: CORE ENTITIES
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
        '10000000-0000-0000-0000-000000000017',
        'place',
        'lugano',
        'Lugano',
        'Centro politico del Sottoceneri nel 1798',
        'Borgo e baliaggio al centro della crisi rivoluzionaria del febbraio 1798.',
        'Nel racconto del documento, **Lugano** e il punto di svolta immediato della crisi del 1798: qui il tentativo filocisalpino del 14-15 febbraio viene respinto, prendono forma i simboli rivoluzionari e si ridefiniscono gli equilibri che coinvolgono anche Riva San Vitale.',
        'it',
        'published',
        FALSE,
        96,
        '{"seed":"repubblica-riva-1798","scope":"place"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000018',
        'place',
        'bissone',
        'Bissone',
        'Localita coinvolta negli scontri del marzo 1798',
        'Punto toccato dalla controffensiva dei volontari luganesi contro le forze filocisalpine.',
        'Il documento cita **Bissone** come una delle posizioni attaccate dai volontari luganesi il 3 marzo 1798, nella sequenza militare che precede il ripiegamento delle forze filocisalpine anche verso Riva.',
        'it',
        'published',
        FALSE,
        97,
        '{"seed":"repubblica-riva-1798","scope":"place"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000019',
        'place',
        'mendrisio',
        'Mendrisio',
        'Borgo del Mendrisiotto coinvolto nella crisi del 1798',
        'Localita raggiunta dalle operazioni dei volontari luganesi nella fase finale dello scontro.',
        'Nel documento **Mendrisio** compare nella fase della controffensiva del 3-4 marzo 1798 e nel successivo riequilibrio imposto anche dalla presenza francese nel territorio.',
        'it',
        'published',
        FALSE,
        98,
        '{"seed":"repubblica-riva-1798","scope":"place"}'::jsonb
    ),
    (
        '10000000-0000-0000-0000-000000000020',
        'place',
        'campione',
        'Campione',
        'Snodo delle reti filocisalpine',
        'Centro richiamato nel documento come punto di gravitazione di ambienti filocisalpini del 1798.',
        'Il documento colloca **Campione** sullo sfondo delle reti politiche filocisalpine che influenzano il tentativo di adesione cisalpina nell area luganese e rivense.',
        'it',
        'published',
        FALSE,
        99,
        '{"seed":"repubblica-riva-1798","scope":"place"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000008',
        'person',
        'ambrogio-luvini',
        'Ambrogio Luvini',
        'Capo dei volontari luganesi',
        'Figura richiamata nel documento come guida dei volontari del borgo di Lugano nella notte del 14-15 febbraio 1798.',
        'Nel documento **Ambrogio Luvini** emerge come figura chiave della reazione filoelvetica a Lugano, dove i volontari del borgo respingono il tentativo patriottico favorevole all adesione cisalpina.',
        'it',
        'published',
        FALSE,
        180,
        '{"seed":"repubblica-riva-1798","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000009',
        'person',
        'annibale-pellegrini',
        'Annibale Pellegrini',
        'Patriota attivo nella crisi luganese del 1798',
        'Uno dei protagonisti politici richiamati nel documento per la rottura dell ancien regime locale.',
        'Il documento associa **Annibale Pellegrini** alle iniziative politiche immediatamente successive ai fatti di Lugano del febbraio 1798, nel quadro della richiesta di liberta del baliaggio e dei simboli del nuovo ordine.',
        'it',
        'published',
        FALSE,
        181,
        '{"seed":"repubblica-riva-1798","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000010',
        'person',
        'angelo-maria-stoppani',
        'Angelo Maria Stoppani',
        'Attore politico del febbraio 1798',
        'Figura richiamata dal documento nella scena simbolica dell albero della liberta a Lugano.',
        'Nel documento **Angelo Maria Stoppani** compare accanto ad Annibale Pellegrini tra gli attori della rottura politica e simbolica dell ancien regime luganese.',
        'it',
        'published',
        FALSE,
        182,
        '{"seed":"repubblica-riva-1798","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000011',
        'person',
        'giulio-pocobelli',
        'Giulio Pocobelli',
        'Guida operativa dei volontari luganesi',
        'Figura ricordata nel documento nella fase militare del marzo 1798.',
        'Il documento attribuisce a **Giulio Pocobelli** un ruolo di guida operativa nelle azioni dei volontari luganesi contro le forze filocisalpine schierate tra Bissone, Riva e Mendrisio.',
        'it',
        'published',
        FALSE,
        183,
        '{"seed":"repubblica-riva-1798","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000012',
        'person',
        'abbondio-bernasconi',
        'Abbondio Bernasconi',
        'Cancelliere della pieve e delegato del 1798',
        'Figura amministrativa richiamata dal documento tra i protagonisti locali della vicenda rivense.',
        'Il documento segnala **Abbondio Bernasconi** come cancelliere della pieve e delegato nel febbraio 1798, rinviando a repertori biografici e alla storiografia locale per un approfondimento puntuale.',
        'it',
        'published',
        FALSE,
        184,
        '{"seed":"repubblica-riva-1798","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000013',
        'person',
        'giovanni-reali',
        'Giovanni Reali',
        'Firmatario e attore politico del 1798',
        'Figura richiamata nel documento tra i protagonisti della fase rivoluzionaria ticinese.',
        'Nel documento **Giovanni Reali** e presentato tra le figure che firmano testi e orientano scelte nel quadro politico piu ampio della transizione tra baliaggi, filocisalpini e nuovo assetto elvetico.',
        'it',
        'published',
        FALSE,
        185,
        '{"seed":"repubblica-riva-1798","scope":"person"}'::jsonb
    ),
    (
        '20000000-0000-0000-0000-000000000014',
        'person',
        'giovanni-battista-quadri',
        'Giovanni Battista Quadri',
        'Attore politico della transizione 1798-1803',
        'Figura richiamata nel documento nel quadro piu ampio delle correnti che influenzano l area rivense.',
        'Il documento include **Giovanni Battista Quadri** tra i leader e i firmatari che incidono sul passaggio politico del 1798 nel Ticino meridionale.',
        'it',
        'published',
        FALSE,
        186,
        '{"seed":"repubblica-riva-1798","scope":"person"}'::jsonb
    ),
    (
        '30000000-0000-0000-0000-000000000003',
        'organization',
        'municipalita-del-circondario-di-riva-san-vitale',
        'Municipalita del Circondario di Riva S. Vitale',
        'Struttura civica documentata nel 1798',
        'Ente ricordato dal documento tramite fogli volanti e atti conservati nella Biblioteca digitale del Cantone Ticino.',
        'La **Municipalita del Circondario di Riva S. Vitale** compare nel documento come traccia istituzionale concreta della riorganizzazione politica successiva alla crisi del 1798, attestata da fogli volanti e atti oggi rintracciabili almeno a livello di record bibliografico.',
        'it',
        'published',
        FALSE,
        230,
        '{"seed":"repubblica-riva-1798","scope":"organization"}'::jsonb
    ),
    (
        '30000000-0000-0000-0000-000000000004',
        'organization',
        'corpo-dei-volontari-luganesi',
        'Corpo dei Volontari Luganesi',
        'Milizia filoelvetica del 1798',
        'Corpo volontario che il documento colloca al centro della controffensiva contro le forze filocisalpine.',
        'Nel documento il **Corpo dei Volontari Luganesi** rappresenta il braccio militare della reazione filoelvetica nella crisi del febbraio-marzo 1798, attivo tra Lugano, Bissone, Riva e Mendrisio.',
        'it',
        'published',
        FALSE,
        231,
        '{"seed":"repubblica-riva-1798","scope":"organization"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000035',
        'event',
        'tentativo-filocisalpino-a-lugano',
        'Tentativo filocisalpino a Lugano',
        '14-15 febbraio 1798',
        'Lo scontro di Lugano apre la fase piu acuta della crisi che porta anche alla Repubblica di Riva.',
        'Nella notte tra il **14 e il 15 febbraio 1798**, secondo il documento, il tentativo dei patrioti favorevoli all adesione cisalpina a **Lugano** viene respinto dai volontari del borgo guidati da Ambrogio Luvini. La crisi luganese costituisce il precedente immediato della successiva accelerazione politica nella pieve di Riva.',
        'it',
        'published',
        FALSE,
        361,
        '{"seed":"repubblica-riva-1798","scope":"event","confidence":"high"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000036',
        'event',
        'costituzione-della-repubblica-di-riva-san-vitale',
        'Costituzione della Repubblica di Riva San Vitale',
        '23 febbraio 1798',
        'La pieve si costituisce in repubblica indipendente nel quadro rivoluzionario del 1798.',
        'Il **23 febbraio 1798** i rappresentanti della pieve attorno a **Riva San Vitale** danno vita alla **Repubblica indipendente di Riva San Vitale**, con un orientamento filocisalpino piu marcato rispetto ad altre aree del Sottoceneri e con il proposito di distaccarsi dal baliaggio di Lugano.',
        'it',
        'published',
        TRUE,
        362,
        '{"seed":"repubblica-riva-1798","scope":"event","confidence":"high"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000037',
        'event',
        'controffensiva-dei-volontari-luganesi',
        'Controffensiva dei Volontari Luganesi',
        '3-4 marzo 1798',
        'Le forze filoelvetiche colpiscono Bissone, Riva e Mendrisio nel tentativo di spegnere il fronte filocisalpino.',
        'Secondo il documento, tra il **3 e il 4 marzo 1798** il Corpo dei Volontari Luganesi attacca posizioni a **Bissone**, poi a **Riva** e infine verso **Mendrisio**, sbaragliando le forze filocisalpine prima di un riassestamento imposto anche dalla presenza di una colonna francese.',
        'it',
        'published',
        FALSE,
        363,
        '{"seed":"repubblica-riva-1798","scope":"event","confidence":"medium-high"}'::jsonb
    ),
    (
        '40000000-0000-0000-0000-000000000038',
        'event',
        'fine-proclamata-della-repubblica-di-riva',
        'Fine proclamata della Repubblica di Riva',
        '16 marzo 1798',
        'Il Comune colloca al 16 marzo la proclamazione conclusiva della breve esperienza repubblicana.',
        'Il documento segnala una doppia tradizione cronologica sulla conclusione dell esperienza: **14 marzo 1798** nella storiografia locale legata a Vassalli e **16 marzo 1798** come fine proclamata nella memoria comunale. Questo evento registra la data finale proclamata.',
        'it',
        'published',
        FALSE,
        364,
        '{"seed":"repubblica-riva-1798","scope":"event","confidence":"high","alternate_end_date":"1798-03-14"}'::jsonb
    ),
    (
        '50000000-0000-0000-0000-000000000011',
        'document',
        'fogli-volanti-della-municipalita-di-riva-1798',
        'Fogli volanti della Municipalita del Circondario di Riva S. Vitale',
        'Traccia documentaria del 1798',
        'Record archivistico-digitale relativo a fogli volanti e atti della Municipalita del Circondario di Riva S. Vitale.',
        'Il documento segnala l esistenza di **fogli volanti** e atti riferiti alla Municipalita del Circondario di Riva S. Vitale, oggi rintracciabili almeno tramite il record della Biblioteca digitale del Cantone Ticino.',
        'it',
        'published',
        FALSE,
        574,
        '{"seed":"repubblica-riva-1798","scope":"document"}'::jsonb
    ),
    (
        '70000000-0000-0000-0000-000000000008',
        'narrative',
        'la-repubblica-di-riva-tra-crisi-dei-baliaggi-e-sovranita-locale',
        'La Repubblica di Riva tra crisi dei baliaggi e sovranita locale',
        'Narrazione storica dedicata',
        'Testo editoriale di sintesi sulla vicenda rivense del 1798, tra opzione filocisalpina, milizie locali e instabilita istituzionale.',
        'Narrazione costruita a partire dal documento fornito dall utente, con particolare attenzione alle date, alle divergenze interpretative sulla fine dell esperienza e al rapporto tra scala locale e quadro ticinese.',
        'it',
        'published',
        FALSE,
        771,
        '{"seed":"repubblica-riva-1798","scope":"narrative"}'::jsonb
    )
ON CONFLICT DO NOTHING;

-- SECTION: TYPE TABLES AND UPDATES
INSERT INTO places (
    entity_id,
    place_type,
    current_name,
    historical_name,
    address_text,
    geo_notes
) VALUES
    ('10000000-0000-0000-0000-000000000017', 'municipality', 'Lugano', NULL, 'Lugano, Ticino, Svizzera', 'Centro principale del baliaggio e del fronte politico richiamato nel documento.'),
    ('10000000-0000-0000-0000-000000000018', 'municipality', 'Bissone', NULL, 'Bissone, Ticino, Svizzera', 'Localita menzionata nella sequenza militare del 3 marzo 1798.'),
    ('10000000-0000-0000-0000-000000000019', 'municipality', 'Mendrisio', NULL, 'Mendrisio, Ticino, Svizzera', 'Borgo citato nel documento nella fase conclusiva della controffensiva dei volontari luganesi.'),
    ('10000000-0000-0000-0000-000000000020', 'municipality', 'Campione', NULL, 'Campione d Italia, Lombardia, Italia', 'Contesto politico richiamato nel documento per le reti filocisalpine attive nell area.')
ON CONFLICT DO NOTHING;

INSERT INTO people (
    entity_id,
    given_name,
    family_name,
    display_name,
    occupations,
    biography_md
) VALUES
    ('20000000-0000-0000-0000-000000000008', 'Ambrogio', 'Luvini', 'Ambrogio Luvini', 'capo dei volontari; attore politico locale', 'Ricordato nel documento come guida dei volontari del borgo di Lugano nella notte tra il 14 e il 15 febbraio 1798, quando viene respinto il tentativo filocisalpino.'),
    ('20000000-0000-0000-0000-000000000009', 'Annibale', 'Pellegrini', 'Annibale Pellegrini', 'patriota; attore politico', 'Figura richiamata nel documento tra i protagonisti della rottura simbolica e politica dell ancien regime locale nelle ore successive ai fatti di Lugano.'),
    ('20000000-0000-0000-0000-000000000010', 'Angelo Maria', 'Stoppani', 'Angelo Maria Stoppani', 'attore politico locale', 'Nel documento compare accanto ad Annibale Pellegrini tra i protagonisti della scena dell albero della liberta e della richiesta di liberta del baliaggio.'),
    ('20000000-0000-0000-0000-000000000011', 'Giulio', 'Pocobelli', 'Giulio Pocobelli', 'capo militare; guida operativa', 'Figura richiamata nel documento nella controffensiva dei volontari luganesi del 3-4 marzo 1798.'),
    ('20000000-0000-0000-0000-000000000012', 'Abbondio', 'Bernasconi', 'Abbondio Bernasconi', 'cancelliere della pieve; delegato', 'Il documento lo ricorda come cancelliere della pieve e delegato attivo nel febbraio 1798.'),
    ('20000000-0000-0000-0000-000000000013', 'Giovanni', 'Reali', 'Giovanni Reali', 'firmatario; attore politico', 'Figura richiamata nel documento tra coloro che orientano testi e scelte nel quadro rivoluzionario ticinese del 1798.'),
    ('20000000-0000-0000-0000-000000000014', 'Giovanni Battista', 'Quadri', 'Giovanni Battista Quadri', 'attore politico', 'Il documento lo colloca tra i leader che influenzano direttamente l area rivense nella transizione 1798-1803.')
ON CONFLICT DO NOTHING;

INSERT INTO organizations (
    entity_id,
    organization_kind,
    founded_date_label,
    dissolved_date_label,
    mission_md
) VALUES
    ('30000000-0000-0000-0000-000000000003', 'municipalita rivoluzionaria', '1798', NULL, 'Struttura civica attestata da fogli volanti e atti collegati al riassetto politico del circondario di Riva San Vitale nel 1798.'),
    ('30000000-0000-0000-0000-000000000004', 'milizia civica', 'febbraio 1798', NULL, 'Corpo volontario filoelvetico attivo nella difesa di Lugano e nella controffensiva contro il fronte filocisalpino nel Sottoceneri.')
ON CONFLICT DO NOTHING;

UPDATE entities
SET
    summary = 'Breve esperienza politica sorta il 23 febbraio 1798 nella pieve di Riva, con orientamento filocisalpino e conclusione controversa tra il 14 e il 16 marzo.',
    description_md = 'La **Repubblica di Riva San Vitale** va letta come un esperimento di sovranita locale nato nella crisi finale dei baliaggi italiani. Secondo il documento di lavoro, la pieve di Riva fu tra le aree piu inclini all opzione **filocisalpina**, fino alla costituzione del 23 febbraio 1798. La vicenda si svolse pero in un quadro fluidissimo, segnato da governi provvisori, milizie locali, pressione francese e da una cronologia finale non del tutto univoca tra **14 marzo** e **16 marzo 1798**.',
    metadata = metadata || '{"seed_extension":"repubblica-riva-1798","end_date_note":"14_or_16_march"}'::jsonb
WHERE id = '30000000-0000-0000-0000-000000000002';

UPDATE organizations
SET
    organization_kind = 'repubblica locale filocisalpina',
    founded_date_start = DATE '1798-02-23',
    founded_date_end = DATE '1798-02-23',
    founded_date_label = '23 febbraio 1798',
    dissolved_date_start = DATE '1798-03-16',
    dissolved_date_end = DATE '1798-03-16',
    dissolved_date_label = '16 marzo 1798 (con tradizione alternativa al 14 marzo)',
    mission_md = 'Esperimento politico di sovranita locale nato nella pieve di Riva San Vitale durante la crisi dei baliaggi italiani, con forte orientamento filocisalpino.'
WHERE entity_id = '30000000-0000-0000-0000-000000000002';

UPDATE entities
SET
    subtitle = 'Arciprete di Riva e protagonista della continuita istituzionale tra 1798 e 1803',
    summary = 'Figura ecclesiastica e civica ricordata nel documento come tramite tra la crisi rivoluzionaria locale e il nuovo Canton Ticino.',
    description_md = 'Il documento collega **Don Gottardo Zurini** alla memoria politica della comunita rivense: arciprete di Riva San Vitale, viene ricordato come primo presidente del Gran Consiglio ticinese nel 1803 e come figura di continuita tra la crisi del 1798 e la successiva costruzione istituzionale cantonale.',
    metadata = metadata || '{"seed_extension":"repubblica-riva-1798"}'::jsonb
WHERE id = '20000000-0000-0000-0000-000000000003';

UPDATE people
SET
    birth_date_label = COALESCE(birth_date_label, '5 aprile 1746'),
    death_date_label = '6 marzo 1815',
    occupations = 'arciprete; uomo politico; presidente del Gran Consiglio',
    biography_md = 'Secondo il documento di lavoro e le fonti richiamate, **Gottardo Zurini** fu arciprete di **Riva San Vitale** e svolse un ruolo di raccordo tra la fase rivoluzionaria del 1798 e il nuovo assetto cantonale del 1803, nel quale e ricordato come primo presidente del Gran Consiglio.'
WHERE entity_id = '20000000-0000-0000-0000-000000000003';

UPDATE entities
SET
    summary = 'Esperienza politica brevissima nata il 23 febbraio 1798 nella pieve di Riva, tra opzione filocisalpina, crisi dei baliaggi e rapido collasso militare.',
    description_md = 'L evento della **Repubblica di Riva San Vitale** si colloca nel contesto rivoluzionario del 1798 che porta allo smantellamento del sistema dei baliaggi italiani. Il documento di lavoro insiste su quattro punti: il clima di malcontento di fine Settecento; la forte spinta **filocisalpina** della pieve di Riva; la data del **23 febbraio 1798** come momento fondativo; e una fine dell esperienza collocata entro marzo 1798, con differenza tra il **14 marzo** proposto dalla storiografia locale e il **16 marzo** ricordato come fine proclamata dalla memoria comunale.',
    metadata = metadata || '{"seed_extension":"repubblica-riva-1798","detailed_timeline":"enabled"}'::jsonb
WHERE id = '40000000-0000-0000-0000-000000000006';

UPDATE events
SET
    event_type = 'political',
    start_date = DATE '1798-02-23',
    end_date = DATE '1798-03-16',
    date_label = '23 febbraio - 16 marzo 1798',
    circa = FALSE,
    significance = 5,
    narrative_md = 'Esperimento repubblicano locale maturato nella pieve di Riva San Vitale durante la crisi dei baliaggi italiani, con orientamento filocisalpino e cronologia finale controversa tra 14 e 16 marzo 1798.'
WHERE entity_id = '40000000-0000-0000-0000-000000000006';

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
    ('40000000-0000-0000-0000-000000000035', 'political', DATE '1798-02-14', DATE '1798-02-15', '14-15 febbraio 1798', FALSE, 4, 'Il fallimento del tentativo filocisalpino a Lugano accelera la crisi dell ancien regime nel Sottoceneri e costituisce il precedente diretto della scelta rivense del 23 febbraio.'),
    ('40000000-0000-0000-0000-000000000036', 'political', DATE '1798-02-23', DATE '1798-02-23', '23 febbraio 1798', FALSE, 5, 'Data fondativa della Repubblica di Riva San Vitale, costituita dai rappresentanti della pieve in un quadro di forte orientamento filocisalpino.'),
    ('40000000-0000-0000-0000-000000000037', 'military', DATE '1798-03-03', DATE '1798-03-04', '3-4 marzo 1798', FALSE, 4, 'Sequenza militare che colpisce Bissone, Riva e Mendrisio e riduce drasticamente lo spazio politico e militare del fronte filocisalpino.'),
    ('40000000-0000-0000-0000-000000000038', 'administrative', DATE '1798-03-16', DATE '1798-03-16', '16 marzo 1798', FALSE, 4, 'Registrazione della fine proclamata della Repubblica di Riva, mantenendo in metadata la tradizione storiografica alternativa che usa il 14 marzo come estremo finale.')
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
    ('50000000-0000-0000-0000-000000000011', 'decree', DATE '1798-01-01', DATE '1798-12-31', '1798', 'it', 'Biblioteca digitale del Cantone Ticino, record "Municipalita del Circondario di Riva S. Vitale"', 'Record bibliografico-digitale usato nel documento come indizio dell esistenza di fogli volanti e atti prodotti dalla Municipalita del Circondario di Riva S. Vitale.')
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
        '70000000-0000-0000-0000-000000000008',
        'article',
        'Nel 1798 Riva San Vitale tenta per poche settimane una sovranita locale sospesa tra opzione filocisalpina, crisi dei baliaggi e pressione militare.',
        'La cosiddetta **Repubblica di Riva San Vitale** nasce nel pieno della crisi del 1798 che travolge i **baliaggi italiani**. Il documento di lavoro mostra come la pieve di Riva fosse tra le aree piu inclini all opzione **filocisalpina**, nel tentativo di distaccarsi dal baliaggio di **Lugano** e ridefinire la propria collocazione politica.\n\nIl precedente immediato e la notte tra il **14 e il 15 febbraio 1798** a **Lugano**, quando il tentativo dei patrioti favorevoli alla Cisalpina viene respinto dai volontari del borgo. Pochi giorni dopo, il **23 febbraio**, la pieve di Riva si costituisce in repubblica indipendente. La vicenda non resta pero solo dichiarativa: gli scontri di **Bissone**, **Riva** e **Mendrisio** del **3-4 marzo** mostrano che il conflitto ha anche una dimensione militare concreta.\n\nLa fine dell esperienza e breve e discussa nelle fonti. Il documento distingue tra una cronologia storiografica che usa il **14 marzo 1798** e la memoria comunale che colloca al **16 marzo 1798** la fine proclamata della repubblica. In questo scarto di date si legge bene la natura instabile del passaggio, collocato tra vecchi assetti balivali in dissoluzione, governi provvisori, iniziative locali e presenze francesi che rendono ogni equilibrio temporaneo.',
        TIMESTAMPTZ '2026-03-24 16:30:00+01',
        5
    )
ON CONFLICT DO NOTHING;

-- SECTION: RELATIONS
INSERT INTO event_participants (
    event_entity_id,
    participant_entity_id,
    role_label,
    notes_md
) VALUES
    ('40000000-0000-0000-0000-000000000006', '30000000-0000-0000-0000-000000000002', 'entita politica', 'La repubblica locale e il soggetto politico dell evento generale.'),
    ('40000000-0000-0000-0000-000000000006', '20000000-0000-0000-0000-000000000012', 'delegato locale', 'Il documento richiama Abbondio Bernasconi come cancelliere della pieve e delegato nel febbraio 1798.'),
    ('40000000-0000-0000-0000-000000000006', '20000000-0000-0000-0000-000000000003', 'continuita istituzionale successiva', 'Zurini e figura di continuita tra la crisi locale del 1798 e il nuovo quadro cantonale del 1803.'),
    ('40000000-0000-0000-0000-000000000035', '20000000-0000-0000-0000-000000000008', 'capo dei volontari', 'Ambrogio Luvini guida i volontari del borgo di Lugano nella reazione del 14-15 febbraio.'),
    ('40000000-0000-0000-0000-000000000035', '20000000-0000-0000-0000-000000000009', 'attore politico', 'Pellegrini compare nella fase politica immediatamente successiva ai fatti di Lugano.'),
    ('40000000-0000-0000-0000-000000000035', '20000000-0000-0000-0000-000000000010', 'attore politico', 'Stoppani compare nella scena politica e simbolica dell albero della liberta.'),
    ('40000000-0000-0000-0000-000000000036', '30000000-0000-0000-0000-000000000002', 'repubblica costituita', 'L organizzazione repubblicana prende forma il 23 febbraio 1798.'),
    ('40000000-0000-0000-0000-000000000036', '20000000-0000-0000-0000-000000000012', 'delegato della pieve', 'Bernasconi e uno dei riferimenti locali richiamati dal documento.'),
    ('40000000-0000-0000-0000-000000000037', '30000000-0000-0000-0000-000000000004', 'milizia attaccante', 'Il Corpo dei Volontari Luganesi conduce la controffensiva del 3-4 marzo.'),
    ('40000000-0000-0000-0000-000000000037', '20000000-0000-0000-0000-000000000008', 'responsabile politico-militare', 'Luvini e associato alle responsabilita dei volontari luganesi nel documento.'),
    ('40000000-0000-0000-0000-000000000037', '20000000-0000-0000-0000-000000000011', 'guida operativa', 'Pocobelli e indicato come guida operativa dei volontari luganesi.'),
    ('40000000-0000-0000-0000-000000000038', '30000000-0000-0000-0000-000000000002', 'esperienza conclusa', 'La fine proclamata del 16 marzo viene riferita alla Repubblica di Riva.')
ON CONFLICT DO NOTHING;

INSERT INTO event_places (
    event_entity_id,
    place_entity_id,
    role_label
) VALUES
    ('40000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000001', 'pieve protagonista'),
    ('40000000-0000-0000-0000-000000000035', '10000000-0000-0000-0000-000000000017', 'luogo dello scontro iniziale'),
    ('40000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000001', 'luogo di costituzione'),
    ('40000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000017', 'luogo da cui Riva tenta di distaccarsi'),
    ('40000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000018', 'posizione attaccata'),
    ('40000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000001', 'fronte rivense'),
    ('40000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000019', 'teatro della fase finale'),
    ('40000000-0000-0000-0000-000000000038', '10000000-0000-0000-0000-000000000001', 'luogo della fine proclamata')
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
    ('a0000000-0000-0000-0000-000000000047', '30000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001', 'related_to', '1798', 'La Repubblica di Riva San Vitale nasce nella pieve e prende il nome dal centro di Riva.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000048', '30000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000002', 'related_to', '1798', 'La Municipalita del Circondario costituisce una traccia amministrativa legata al nuovo ordine politico locale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000049', '30000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000017', 'related_to', 'febbraio-marzo 1798', 'Il Corpo dei Volontari Luganesi opera da Lugano verso il resto del Sottoceneri.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000050', '20000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000002', 'related_to', '1798-1803', 'Zurini rappresenta una continuita tra la crisi rivoluzionaria rivense e il nuovo ordinamento cantonale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000051', '50000000-0000-0000-0000-000000000011', '30000000-0000-0000-0000-000000000003', 'mentions', '1798', 'Il record documenta fogli volanti e atti riferiti alla Municipalita del Circondario di Riva S. Vitale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000052', '70000000-0000-0000-0000-000000000008', '30000000-0000-0000-0000-000000000002', 'related_to', NULL, 'Narrazione dedicata alla Repubblica di Riva San Vitale.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000053', '20000000-0000-0000-0000-000000000008', '30000000-0000-0000-0000-000000000004', 'member_of', '1798', 'Ambrogio Luvini e richiamato come guida dei volontari luganesi.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000054', '20000000-0000-0000-0000-000000000011', '30000000-0000-0000-0000-000000000004', 'member_of', '1798', 'Giulio Pocobelli e associato alla guida operativa del corpo volontario.', '{}'::jsonb),
    ('a0000000-0000-0000-0000-000000000055', '20000000-0000-0000-0000-000000000012', '30000000-0000-0000-0000-000000000002', 'participated_in', 'febbraio 1798', 'Abbondio Bernasconi compare nel documento come cancelliere della pieve e delegato del passaggio politico rivense.', '{}'::jsonb)
ON CONFLICT DO NOTHING;

INSERT INTO entity_themes (
    entity_id,
    theme_entity_id
) VALUES
    ('10000000-0000-0000-0000-000000000017', '80000000-0000-0000-0000-000000000003'),
    ('20000000-0000-0000-0000-000000000008', '80000000-0000-0000-0000-000000000003'),
    ('20000000-0000-0000-0000-000000000009', '80000000-0000-0000-0000-000000000003'),
    ('20000000-0000-0000-0000-000000000010', '80000000-0000-0000-0000-000000000003'),
    ('20000000-0000-0000-0000-000000000011', '80000000-0000-0000-0000-000000000003'),
    ('20000000-0000-0000-0000-000000000012', '80000000-0000-0000-0000-000000000003'),
    ('20000000-0000-0000-0000-000000000013', '80000000-0000-0000-0000-000000000003'),
    ('20000000-0000-0000-0000-000000000014', '80000000-0000-0000-0000-000000000003'),
    ('30000000-0000-0000-0000-000000000002', '80000000-0000-0000-0000-000000000003'),
    ('30000000-0000-0000-0000-000000000003', '80000000-0000-0000-0000-000000000003'),
    ('30000000-0000-0000-0000-000000000004', '80000000-0000-0000-0000-000000000003'),
    ('40000000-0000-0000-0000-000000000006', '80000000-0000-0000-0000-000000000003'),
    ('40000000-0000-0000-0000-000000000035', '80000000-0000-0000-0000-000000000003'),
    ('40000000-0000-0000-0000-000000000036', '80000000-0000-0000-0000-000000000003'),
    ('40000000-0000-0000-0000-000000000037', '80000000-0000-0000-0000-000000000003'),
    ('40000000-0000-0000-0000-000000000038', '80000000-0000-0000-0000-000000000003'),
    ('50000000-0000-0000-0000-000000000011', '80000000-0000-0000-0000-000000000003'),
    ('70000000-0000-0000-0000-000000000008', '80000000-0000-0000-0000-000000000003')
ON CONFLICT DO NOTHING;

INSERT INTO entity_sources (
    entity_id,
    source_id,
    role,
    page_locator,
    notes_md
) VALUES
    ('30000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000045', 'secondary_evidence', NULL, 'Documento di lavoro generale sulla Repubblica di Riva.'),
    ('30000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000046', 'secondary_evidence', NULL, 'Fonte comunale per la costituzione del 23 febbraio e la fine proclamata del 16 marzo.'),
    ('30000000-0000-0000-0000-000000000002', '90000000-0000-0000-0000-000000000051', 'bibliography', NULL, 'Riferimento storiografico locale sul perimetro 23 febbraio - 14 marzo 1798.'),
    ('20000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000046', 'secondary_evidence', NULL, 'Richiamo comunale alla figura di Zurini nel quadro politico locale.'),
    ('20000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000050', 'secondary_evidence', NULL, 'Scheda commemorativa su Gottardo Zurini.'),
    ('20000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000047', 'secondary_evidence', NULL, 'Ruolo di Luvini nella reazione dei volontari luganesi.'),
    ('20000000-0000-0000-0000-000000000009', '90000000-0000-0000-0000-000000000047', 'secondary_evidence', NULL, 'Pellegrini tra gli attori della rottura politica locale.'),
    ('20000000-0000-0000-0000-000000000010', '90000000-0000-0000-0000-000000000047', 'secondary_evidence', NULL, 'Stoppani nella fase simbolica e politica del febbraio 1798.'),
    ('20000000-0000-0000-0000-000000000011', '90000000-0000-0000-0000-000000000047', 'secondary_evidence', NULL, 'Pocobelli come guida operativa dei volontari luganesi.'),
    ('20000000-0000-0000-0000-000000000012', '90000000-0000-0000-0000-000000000045', 'secondary_evidence', NULL, 'Richiamo ad Abbondio Bernasconi quale cancelliere della pieve e delegato.'),
    ('20000000-0000-0000-0000-000000000013', '90000000-0000-0000-0000-000000000045', 'secondary_evidence', NULL, 'Giovanni Reali nel quadro politico allargato descritto nel documento.'),
    ('20000000-0000-0000-0000-000000000014', '90000000-0000-0000-0000-000000000045', 'secondary_evidence', NULL, 'Giovanni Battista Quadri nel quadro politico allargato descritto nel documento.'),
    ('30000000-0000-0000-0000-000000000003', '90000000-0000-0000-0000-000000000052', 'primary_evidence', NULL, 'Record archivistico-digitale su fogli volanti e atti della Municipalita del Circondario di Riva S. Vitale.'),
    ('30000000-0000-0000-0000-000000000004', '90000000-0000-0000-0000-000000000049', 'secondary_evidence', NULL, 'Scheda iconografica e storica sui volontari luganesi.'),
    ('40000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000045', 'secondary_evidence', NULL, 'Ricostruzione generale della Repubblica di Riva.'),
    ('40000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000046', 'secondary_evidence', NULL, 'Data fondativa e fine proclamata nella memoria comunale.'),
    ('40000000-0000-0000-0000-000000000006', '90000000-0000-0000-0000-000000000051', 'bibliography', NULL, 'Riferimento locale alla cronologia 23 febbraio - 14 marzo 1798.'),
    ('40000000-0000-0000-0000-000000000035', '90000000-0000-0000-0000-000000000047', 'secondary_evidence', NULL, 'Studio di contesto per i fatti di Lugano del 14-15 febbraio.'),
    ('40000000-0000-0000-0000-000000000036', '90000000-0000-0000-0000-000000000046', 'secondary_evidence', NULL, 'Costituzione della Repubblica di Riva il 23 febbraio 1798.'),
    ('40000000-0000-0000-0000-000000000036', '90000000-0000-0000-0000-000000000045', 'secondary_evidence', NULL, 'Documento utente sulla scelta filocisalpina della pieve di Riva.'),
    ('40000000-0000-0000-0000-000000000037', '90000000-0000-0000-0000-000000000047', 'secondary_evidence', NULL, 'Controffensiva dei volontari luganesi tra Bissone, Riva e Mendrisio.'),
    ('40000000-0000-0000-0000-000000000037', '90000000-0000-0000-0000-000000000049', 'further_reading', NULL, 'Contesto iconografico e memoriale dei volontari luganesi.'),
    ('40000000-0000-0000-0000-000000000038', '90000000-0000-0000-0000-000000000046', 'secondary_evidence', NULL, 'Fine proclamata al 16 marzo secondo la fonte comunale.'),
    ('40000000-0000-0000-0000-000000000038', '90000000-0000-0000-0000-000000000051', 'bibliography', NULL, 'Tradizione alternativa che chiude l esperienza al 14 marzo 1798.'),
    ('50000000-0000-0000-0000-000000000011', '90000000-0000-0000-0000-000000000052', 'primary_evidence', NULL, 'Traccia digitale dei fogli volanti della Municipalita di Riva.'),
    ('70000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000045', 'bibliography', NULL, 'Fonte di lavoro principale per la narrazione.'),
    ('70000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000046', 'bibliography', NULL, 'Integrazione con la memoria civica comunale.'),
    ('70000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000047', 'bibliography', NULL, 'Quadro storico-archivistico del 1798 nel Sottoceneri.'),
    ('70000000-0000-0000-0000-000000000008', '90000000-0000-0000-0000-000000000051', 'bibliography', NULL, 'Riferimento storiografico locale dedicato alla Repubblica di Riva.')
ON CONFLICT DO NOTHING;

COMMIT;
