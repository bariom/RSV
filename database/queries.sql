-- Query utili per verificare il database e alimentare il sito.
-- Assumono che siano gia stati eseguiti:
--   \i database/schema.sql
--   \i database/seed.sql

-- 1. Panoramica rapida dei contenuti caricati.
SELECT entity_type, COUNT(*) AS total
FROM entities
GROUP BY entity_type
ORDER BY entity_type;

-- 2. Timeline storica principale di Riva San Vitale.
SELECT
    e.slug,
    e.title,
    ev.date_label,
    ev.start_date,
    ev.end_date,
    ev.event_type,
    e.summary
FROM events ev
JOIN entities e ON e.id = ev.entity_id
WHERE e.status = 'published'
ORDER BY ev.start_date NULLS LAST, ev.end_date NULLS LAST, e.sort_order;

-- 3. Eventi con luoghi collegati.
SELECT
    event_entity.title AS event_title,
    ev.date_label,
    place_entity.title AS place_title,
    ep.role_label
FROM event_places ep
JOIN entities event_entity ON event_entity.id = ep.event_entity_id
JOIN events ev ON ev.entity_id = ep.event_entity_id
JOIN entities place_entity ON place_entity.id = ep.place_entity_id
ORDER BY ev.start_date NULLS LAST, event_entity.title, place_entity.title;

-- 4. Scheda luogo: Battistero di San Giovanni.
SELECT
    e.title,
    e.subtitle,
    e.summary,
    e.description_md,
    p.place_type,
    p.current_name,
    p.address_text,
    p.geo_notes
FROM entities e
JOIN places p ON p.entity_id = e.id
WHERE e.slug = 'battistero-di-san-giovanni';

-- 5. Eventi collegati a un luogo specifico.
SELECT
    place_entity.title AS place_title,
    event_entity.title AS event_title,
    ev.date_label,
    ep.role_label,
    event_entity.summary
FROM event_places ep
JOIN entities place_entity ON place_entity.id = ep.place_entity_id
JOIN entities event_entity ON event_entity.id = ep.event_entity_id
JOIN events ev ON ev.entity_id = ep.event_entity_id
WHERE place_entity.slug = 'battistero-di-san-giovanni'
ORDER BY ev.start_date NULLS LAST;

-- 6. Scheda persona: Beato Manfredo Settala.
SELECT
    e.title,
    e.subtitle,
    e.summary,
    p.display_name,
    p.death_date_label,
    p.occupations,
    p.biography_md
FROM entities e
JOIN people p ON p.entity_id = e.id
WHERE e.slug = 'beato-manfredo-settala';

-- 7. Eventi collegati a una persona.
SELECT
    person_entity.title AS person_title,
    event_entity.title AS event_title,
    ev.date_label,
    ep.role_label,
    event_entity.summary
FROM event_participants ep
JOIN entities person_entity ON person_entity.id = ep.participant_entity_id
JOIN entities event_entity ON event_entity.id = ep.event_entity_id
JOIN events ev ON ev.entity_id = ep.event_entity_id
WHERE person_entity.slug = 'beato-manfredo-settala'
ORDER BY ev.start_date NULLS LAST;

-- 8. Fonti collegate a una scheda.
SELECT
    entity.title AS entity_title,
    s.title AS source_title,
    es.role,
    s.citation,
    s.url
FROM entity_sources es
JOIN entities entity ON entity.id = es.entity_id
JOIN sources s ON s.id = es.source_id
WHERE entity.slug = 'tempio-di-santa-croce'
ORDER BY es.role, s.title;

-- 9. Media collegati a una scheda.
SELECT
    entity.title AS entity_title,
    media_entity.title AS media_title,
    em.usage_role,
    COALESCE(em.caption_override, mi.caption) AS caption,
    mi.source_url,
    mi.credit_line,
    mi.rights_statement
FROM entity_media em
JOIN entities entity ON entity.id = em.entity_id
JOIN entities media_entity ON media_entity.id = em.media_entity_id
JOIN media_items mi ON mi.entity_id = em.media_entity_id
WHERE entity.slug = 'monumenti-simbolo-di-riva-san-vitale'
ORDER BY em.sort_order, media_entity.title;

-- 10. Temi con i contenuti collegati.
SELECT
    theme_entity.title AS theme_title,
    linked_entity.entity_type,
    linked_entity.title AS linked_title
FROM entity_themes et
JOIN entities theme_entity ON theme_entity.id = et.theme_entity_id
JOIN entities linked_entity ON linked_entity.id = et.entity_id
ORDER BY theme_entity.title, linked_entity.entity_type, linked_entity.title;

-- 11. Relazioni generiche tra entita.
SELECT
    from_entity.title AS from_title,
    er.relation_type,
    to_entity.title AS to_title,
    er.date_label,
    er.notes_md
FROM entity_relations er
JOIN entities from_entity ON from_entity.id = er.from_entity_id
JOIN entities to_entity ON to_entity.id = er.to_entity_id
ORDER BY from_entity.title, er.relation_type, to_entity.title;

-- 12. Query base per pagina contenuto generica con fonti e media.
-- Sostituisci il valore dello slug per riutilizzarla.
SELECT
    e.id,
    e.entity_type,
    e.slug,
    e.title,
    e.subtitle,
    e.summary,
    e.description_md,
    e.metadata
FROM entities e
WHERE e.slug = 'riva-san-vitale';
