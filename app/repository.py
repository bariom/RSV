from __future__ import annotations

import json
import re
from datetime import datetime
from functools import lru_cache
from pathlib import Path
from typing import Any

from app.db import get_connection, has_database_config
from app.storage import build_upload_url

DATA_PATH = Path(__file__).parent / "data" / "site.json"
CURRENT_YEAR = datetime.now().year

PLACE_TYPE_LABELS = {
    "municipality": "comune",
    "quarter": "quartiere",
    "hamlet": "frazione",
    "building": "edificio",
    "religious_site": "luogo religioso",
    "street": "strada",
    "square": "piazza",
    "landmark": "luogo notevole",
    "natural_site": "luogo naturale",
    "archaeological_site": "sito archeologico",
    "cemetery": "cimitero",
    "other": "altro",
}

EVENT_TYPE_LABELS = {
    "political": "politica",
    "religious": "religione",
    "social": "società",
    "economic": "economia",
    "cultural": "cultura",
    "military": "conflitto",
    "architectural": "architettura",
    "archaeological": "archeologia",
    "administrative": "istituzioni",
    "disaster": "evento critico",
    "other": "altro",
}

EVENT_TYPE_ICONS = {
    "political": "PO",
    "religious": "RE",
    "social": "SO",
    "economic": "EC",
    "cultural": "CU",
    "military": "MI",
    "architectural": "AR",
    "archaeological": "SC",
    "administrative": "IS",
    "disaster": "CR",
    "other": "RS",
}

TIMELINE_ERAS = (
    ("preistoria", "Preistoria", -5000, -1, "Dalle prime frequentazioni del territorio fino all'età preromana."),
    ("romana", "Età romana", 1, 499, "Riva come approdo, spazio di scambi e luogo di testimonianze epigrafiche."),
    ("medievale", "Medioevo", 500, 1499, "Pieve, culto, paesaggio religioso e consolidamento del borgo."),
    ("moderna", "Età moderna", 1500, 1799, "Cantieri monumentali, committenze e trasformazioni del centro storico."),
    ("ottocento", "Ottocento e primo Novecento", 1800, 1945, "Cambiamenti politici, industriali e nuove letture del patrimonio."),
    ("contemporanea", "Età contemporanea", 1946, 9999, "Restauri, musealizzazione e riconoscimenti internazionali."),
)


def _resolve_media_url(row: dict[str, Any]) -> dict[str, Any]:
    source_url = row.get("source_url") or ""
    row["url"] = source_url or build_upload_url(row.get("file_path"))
    return row


def _localize_place_type(value: str | None) -> str:
    if not value:
        return ""
    return PLACE_TYPE_LABELS.get(value, value.replace("_", " "))


def _localize_event_type(value: str | None) -> str:
    if not value:
        return ""
    return EVENT_TYPE_LABELS.get(value, value.replace("_", " "))


def _event_icon(value: str | None) -> str:
    if not value:
        return "RS"
    return EVENT_TYPE_ICONS.get(value, "RS")


def _normalize_roman_century(value: str) -> int | None:
    roman = value.upper()
    numerals = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100}
    total = 0
    previous = 0
    for char in reversed(roman):
        current = numerals.get(char)
        if current is None:
            return None
        if current < previous:
            total -= current
        else:
            total += current
            previous = current
    return total


def _infer_year_from_label(date_label: str | None) -> int:
    if not date_label:
        return 9999

    label = date_label.strip().lower()
    if "neolitic" in label:
        return -4000
    if "preistori" in label:
        return -4000
    if "epoca romana" in label:
        return 1

    year_match = re.search(r"(?<!\d)(-?\d{1,4})(?!\d)", label)
    if year_match:
        return int(year_match.group(1))

    century_match = re.search(r"\b([ivxlcdm]+)(?:-([ivxlcdm]+))?\s+secolo\b", label)
    if century_match:
        first_century = _normalize_roman_century(century_match.group(1))
        if first_century is not None:
            return (first_century - 1) * 100

    return 9999


def _extract_year(value: Any) -> int | None:
    if value is None:
        return None
    year = getattr(value, "year", None)
    if isinstance(year, int):
        return year
    return None


def _sort_events(rows: list[dict[str, Any]]) -> list[dict[str, Any]]:
    def sort_key(row: dict[str, Any]) -> tuple[int, int, int, str]:
        start_year = _extract_year(row.get("start_date"))
        end_year = _extract_year(row.get("end_date"))
        inferred_year = start_year if start_year is not None else _infer_year_from_label(row.get("date_label"))
        trailing_year = end_year if end_year is not None else inferred_year
        return (
            inferred_year,
            trailing_year,
            int(row.get("sort_order") or 0),
            row.get("title") or "",
        )

    return sorted(rows, key=sort_key)


def _format_sort_year_label(year: int) -> str:
    if year < 0:
        return f"{abs(year)} a.C."
    if year == 0:
        return "0"
    return str(year)


def _build_timeline_ticks(min_year: int, max_year: int, count: int = 9) -> list[dict[str, Any]]:
    del count
    span_years = max(max_year - min_year, 1)
    if span_years <= 40:
        base_step = 5
    elif span_years <= 120:
        base_step = 10
    elif span_years <= 240:
        base_step = 20
    elif span_years <= 500:
        base_step = 25
    elif span_years <= 900:
        base_step = 50
    elif span_years <= 1600:
        base_step = 100
    elif span_years <= 2600:
        base_step = 200
    else:
        base_step = 250

    tick_years: set[int] = {min_year, max_year}

    first_tick = ((min_year + base_step - 1) // base_step) * base_step
    year = first_tick
    while year < max_year:
        tick_years.add(year)
        year += base_step

    if max_year >= 1750:
        modern_start = max(min_year, 1750)
        modern_step = 25 if span_years <= 900 else 50
        first_modern_tick = ((modern_start + modern_step - 1) // modern_step) * modern_step
        year = first_modern_tick
        while year < max_year:
            tick_years.add(year)
            year += modern_step

    ticks: list[dict[str, Any]] = []
    label_row = 0
    for year in sorted(tick_years):
        if year >= 1750:
            is_major = year % 50 == 0 or year in {min_year, max_year}
        elif year <= 0:
            is_major = year % 100 == 0
        else:
            is_major = year % (base_step * 2) == 0 or year in {min_year, max_year}
        ticks.append(
            {
                "year": year,
                "label": _format_sort_year_label(year),
                "position_pct": round(((year - min_year) / span_years) * 100, 3),
                "is_major": is_major,
                "label_row": label_row,
            }
        )
        label_row = 1 - label_row

    return ticks


def _get_timeline_era(year: int) -> dict[str, str]:
    for key, title, start, end, summary in TIMELINE_ERAS:
        if start <= year <= end:
            return {"key": key, "title": title, "summary": summary}
    return {"key": "senza-periodo", "title": "Senza periodo", "summary": "Eventi non ancora collocati con sufficiente precisione."}


def _enrich_timeline_event(row: dict[str, Any]) -> dict[str, Any]:
    start_year = _extract_year(row.get("start_date"))
    end_year = _extract_year(row.get("end_date"))
    sort_year = start_year if start_year is not None else _infer_year_from_label(row.get("date_label"))
    end_sort_year = end_year if end_year is not None else sort_year
    timeline_sort_year = CURRENT_YEAR if sort_year == 9999 else min(sort_year, CURRENT_YEAR)
    timeline_end_year = CURRENT_YEAR if end_sort_year == 9999 else min(end_sort_year, CURRENT_YEAR)
    era = _get_timeline_era(sort_year)
    return {
        **row,
        "event_type_label": _localize_event_type(row.get("event_type")),
        "event_icon": _event_icon(row.get("event_type")),
        "sort_year": sort_year,
        "sort_year_label": _format_sort_year_label(sort_year),
        "end_sort_year": end_sort_year,
        "timeline_sort_year": timeline_sort_year,
        "timeline_end_year": timeline_end_year,
        "is_span": end_sort_year != sort_year,
        "era_key": era["key"],
        "era_title": era["title"],
        "era_summary": era["summary"],
        "graphic_offset": max(sort_year + 4000, 0),
        "graphic_width": max(end_sort_year - sort_year, 0),
    }


def _attach_event_slugs(rows: list[dict[str, Any]], all_events: list[dict[str, Any]]) -> list[dict[str, Any]]:
    event_slug_by_title = {event.get("title"): event.get("slug") for event in all_events}
    return [{**row, "slug": row.get("slug") or event_slug_by_title.get(row.get("title"), "")} for row in rows]


def get_timeline_views() -> dict[str, Any]:
    events = get_timeline()
    eras: list[dict[str, Any]] = []
    for key, title, _start, _end, summary in TIMELINE_ERAS:
        era_events = [event for event in events if event.get("era_key") == key]
        if not era_events:
            continue
        eras.append(
            {
                "key": key,
                "title": title,
                "summary": summary,
                "events": era_events,
            }
        )

    if events:
        min_year = min(event["timeline_sort_year"] for event in events)
        max_year = min(max(event["timeline_end_year"] for event in events), CURRENT_YEAR)
    else:
        min_year = 0
        max_year = CURRENT_YEAR

    span_years = max(max_year - min_year, 1)
    lane_count = 4
    lane_positions = [float("-inf")] * lane_count
    graphic_events: list[dict[str, Any]] = []
    for event in events:
        position_pct = ((event["timeline_sort_year"] - min_year) / span_years) * 100
        span_pct = max(((event["timeline_end_year"] - event["timeline_sort_year"]) / span_years) * 100, 1.25 if event["is_span"] else 0)
        lane = min(range(lane_count), key=lambda idx: lane_positions[idx])
        lane_positions[lane] = position_pct + max(span_pct, 4.5)
        graphic_events.append(
            {
                **event,
                "graphic_position_pct": round(position_pct, 3),
                "graphic_span_pct": round(span_pct, 3),
                "graphic_lane": lane,
                "graphic_pole_height": 34 + (lane % 2) * 16 + (lane // 2) * 18,
            }
        )

    return {
        "events": events,
        "graphic_events": graphic_events,
        "graphic_ticks": _build_timeline_ticks(min_year, max_year),
        "eras": eras,
        "range_start": _format_sort_year_label(min_year),
        "range_end": _format_sort_year_label(max_year),
        "range_years": span_years,
        "graphic_base_width": max(2200, len(events) * 165),
    }


@lru_cache(maxsize=1)
def load_site_data() -> dict[str, Any]:
    with DATA_PATH.open("r", encoding="utf-8") as handle:
        return json.load(handle)


def get_homepage_context() -> dict[str, Any]:
    if has_database_config():
        return _get_homepage_context_from_db()

    data = load_site_data()
    featured_slug = data["site"]["featured_place_slug"]
    featured_place = next(place for place in data["places"] if place["slug"] == featured_slug)

    return {
        "site": data["site"],
        "featured_place": featured_place,
        "places": data["places"],
        "people": data["people"],
        "events": data["events"],
        "sources": data["sources"],
    }


def get_timeline() -> list[dict[str, Any]]:
    if has_database_config():
        return _get_timeline_from_db()
    rows = _sort_events(load_site_data()["events"])
    return [_enrich_timeline_event(row) for row in rows]


def get_places() -> list[dict[str, Any]]:
    if has_database_config():
        with get_connection() as connection:
            rows = connection.execute(
                """
                SELECT
                    e.slug,
                    e.title,
                    e.subtitle,
                    e.summary,
                    e.description_md AS description,
                    CAST(p.place_type AS text) AS category,
                    COALESCE(p.historical_name, '') AS historical_name
                FROM entities e
                JOIN places p ON p.entity_id = e.id
                WHERE e.status = 'published'
                ORDER BY e.sort_order, e.title
                """
            ).fetchall()
        return [{**dict(row), "category": _localize_place_type(row["category"])} for row in rows]
    return load_site_data()["places"]


def get_people() -> list[dict[str, Any]]:
    if has_database_config():
        with get_connection() as connection:
            rows = connection.execute(
                """
                SELECT
                    e.slug,
                    e.title,
                    e.subtitle,
                    e.summary,
                    COALESCE(p.biography_md, e.description_md, e.summary) AS description,
                    COALESCE(
                        NULLIF(CONCAT_WS(' - ', p.birth_date_label, p.death_date_label), ' - '),
                        p.death_date_label,
                        p.birth_date_label,
                        ''
                    ) AS dates
                FROM entities e
                JOIN people p ON p.entity_id = e.id
                WHERE e.status = 'published'
                ORDER BY e.sort_order, e.title
                """
            ).fetchall()
        return [dict(row) for row in rows]
    return load_site_data()["people"]


def get_place(slug: str) -> dict[str, Any] | None:
    if has_database_config():
        return _get_place_from_db(slug)
    data = load_site_data()
    place = next((place for place in data["places"] if place["slug"] == slug), None)
    if not place:
        return None
    return {**place, "events": _attach_event_slugs(place.get("events", []), data["events"])}


def get_person(slug: str) -> dict[str, Any] | None:
    if has_database_config():
        return _get_person_from_db(slug)
    data = load_site_data()
    person = next((person for person in data["people"] if person["slug"] == slug), None)
    if not person:
        return None
    return {**person, "events": _attach_event_slugs(person.get("events", []), data["events"])}


def get_event(slug: str) -> dict[str, Any] | None:
    if has_database_config():
        return _get_event_from_db(slug)
    return _get_event_from_json(slug)


def _get_homepage_context_from_db() -> dict[str, Any]:
    with get_connection() as connection:
        featured_place = connection.execute(
            """
            SELECT
                e.slug,
                e.title,
                e.subtitle,
                e.summary,
                e.description_md AS description,
                CAST(p.place_type AS text) AS category
            FROM entities e
            JOIN places p ON p.entity_id = e.id
            WHERE e.slug = 'battistero-di-san-giovanni'
            """
        ).fetchone()

        places = connection.execute(
            """
            SELECT
                e.slug,
                e.title,
                e.subtitle,
                e.summary,
                e.description_md AS description,
                CAST(p.place_type AS text) AS category
            FROM entities e
            JOIN places p ON p.entity_id = e.id
            WHERE e.status = 'published'
            ORDER BY e.sort_order, e.title
            LIMIT 6
            """
        ).fetchall()

        people = connection.execute(
            """
            SELECT
                e.slug,
                e.title,
                e.subtitle,
                e.summary,
                COALESCE(p.biography_md, e.description_md, e.summary) AS description,
                COALESCE(
                    NULLIF(CONCAT_WS(' - ', p.birth_date_label, p.death_date_label), ' - '),
                    p.death_date_label,
                    p.birth_date_label,
                    ''
                ) AS dates
            FROM entities e
            JOIN people p ON p.entity_id = e.id
            WHERE e.status = 'published'
            ORDER BY e.sort_order, e.title
            LIMIT 6
            """
        ).fetchall()

        events = _get_timeline_from_db(connection)

        sources = connection.execute(
            """
            SELECT DISTINCT
                s.title,
                COALESCE(s.notes_md, s.citation) AS text,
                s.url
            FROM sources s
            ORDER BY s.title
            LIMIT 6
            """
        ).fetchall()

    site = {
        "title": "Archivio Storico di Riva San Vitale",
        "tagline": "Storie, luoghi, persone e fonti del comune",
        "hero_title": "Riva San Vitale raccontata attraverso luoghi, eventi e fonti.",
        "hero_lead": "Questa applicazione legge i dati direttamente dal database remoto quando DATABASE_URL e configurata.",
        "featured_place_slug": "battistero-di-san-giovanni",
    }

    return {
        "site": site,
        "featured_place": {**dict(featured_place), "category": _localize_place_type(featured_place["category"])} if featured_place else {},
        "places": [{**dict(row), "category": _localize_place_type(row["category"])} for row in places],
        "people": [dict(row) for row in people],
        "events": events,
        "sources": [dict(row) for row in sources],
    }


def _get_timeline_from_db(connection: Any | None = None) -> list[dict[str, Any]]:
    owns_connection = connection is None
    if owns_connection:
        context = get_connection()
        connection = context.__enter__()

    try:
        rows = connection.execute(
            """
            SELECT
                e.slug,
                e.title,
                ev.date_label,
                ev.start_date,
                ev.end_date,
                CAST(ev.event_type AS text) AS event_type,
                e.summary,
                e.sort_order
            FROM events ev
            JOIN entities e ON e.id = ev.entity_id
            WHERE e.status = 'published'
            """
        ).fetchall()
        return [_enrich_timeline_event(row) for row in _sort_events([dict(row) for row in rows])]
    finally:
        if owns_connection:
            context.__exit__(None, None, None)


def _get_place_from_db(slug: str) -> dict[str, Any] | None:
    with get_connection() as connection:
        place = connection.execute(
            """
            SELECT
                e.slug,
                e.title,
                e.subtitle,
                e.summary,
                e.description_md AS description,
                CAST(p.place_type AS text) AS category,
                COALESCE(p.historical_name, '') AS historical_name
            FROM entities e
            JOIN places p ON p.entity_id = e.id
            WHERE e.slug = %s
            """,
            (slug,),
        ).fetchone()
        if not place:
            return None

        themes = connection.execute(
            """
            SELECT theme.title
            FROM entity_themes et
            JOIN entities theme ON theme.id = et.theme_entity_id
            JOIN entities entity ON entity.id = et.entity_id
            WHERE entity.slug = %s
            ORDER BY theme.title
            """,
            (slug,),
        ).fetchall()

        sources = connection.execute(
            """
            SELECT s.title, s.url
            FROM entity_sources es
            JOIN sources s ON s.id = es.source_id
            JOIN entities e ON e.id = es.entity_id
            WHERE e.slug = %s
            ORDER BY s.title
            """,
            (slug,),
        ).fetchall()

        events = connection.execute(
            """
            SELECT
                event_entity.slug,
                event_entity.title,
                ev.date_label,
                ev.start_date,
                ev.end_date,
                event_entity.summary,
                event_entity.sort_order
            FROM event_places ep
            JOIN entities place_entity ON place_entity.id = ep.place_entity_id
            JOIN entities event_entity ON event_entity.id = ep.event_entity_id
            JOIN events ev ON ev.entity_id = ep.event_entity_id
            WHERE place_entity.slug = %s
            """,
            (slug,),
        ).fetchall()

        media = connection.execute(
            """
            SELECT
                media_entity.title,
                COALESCE(em.caption_override, mi.caption, media_entity.summary) AS caption,
                mi.file_path,
                mi.source_url
            FROM entity_media em
            JOIN entities entity ON entity.id = em.entity_id
            JOIN entities media_entity ON media_entity.id = em.media_entity_id
            JOIN media_items mi ON mi.entity_id = em.media_entity_id
            WHERE entity.slug = %s
            ORDER BY em.sort_order, media_entity.title
            """,
            (slug,),
        ).fetchall()

    result = dict(place)
    result["category"] = _localize_place_type(result.get("category"))
    result["themes"] = [row["title"] for row in themes]
    result["sources"] = [dict(row) for row in sources]
    result["events"] = _sort_events([dict(row) for row in events])
    result["media"] = [_resolve_media_url(dict(row)) for row in media]
    return result


def _get_person_from_db(slug: str) -> dict[str, Any] | None:
    with get_connection() as connection:
        person = connection.execute(
            """
            SELECT
                e.slug,
                e.title,
                e.subtitle,
                e.summary,
                COALESCE(p.biography_md, e.description_md, e.summary) AS description,
                COALESCE(
                    NULLIF(CONCAT_WS(' - ', p.birth_date_label, p.death_date_label), ' - '),
                    p.death_date_label,
                    p.birth_date_label,
                    ''
                ) AS dates
            FROM entities e
            JOIN people p ON p.entity_id = e.id
            WHERE e.slug = %s
            """,
            (slug,),
        ).fetchone()
        if not person:
            return None

        events = connection.execute(
            """
            SELECT
                event_entity.slug,
                event_entity.title,
                ev.date_label,
                ev.start_date,
                ev.end_date,
                event_entity.summary,
                event_entity.sort_order
            FROM event_participants ep
            JOIN entities person_entity ON person_entity.id = ep.participant_entity_id
            JOIN entities event_entity ON event_entity.id = ep.event_entity_id
            JOIN events ev ON ev.entity_id = ep.event_entity_id
            WHERE person_entity.slug = %s
            """,
            (slug,),
        ).fetchall()

        media = connection.execute(
            """
            SELECT
                media_entity.title,
                COALESCE(em.caption_override, mi.caption, media_entity.summary) AS caption,
                mi.file_path,
                mi.source_url
            FROM entity_media em
            JOIN entities entity ON entity.id = em.entity_id
            JOIN entities media_entity ON media_entity.id = em.media_entity_id
            JOIN media_items mi ON mi.entity_id = em.media_entity_id
            WHERE entity.slug = %s
            ORDER BY em.sort_order, media_entity.title
            """,
            (slug,),
        ).fetchall()

        sources = connection.execute(
            """
            SELECT s.title, s.url
            FROM entity_sources es
            JOIN sources s ON s.id = es.source_id
            JOIN entities e ON e.id = es.entity_id
            WHERE e.slug = %s
            ORDER BY s.title
            """,
            (slug,),
        ).fetchall()

    result = dict(person)
    result["events"] = _sort_events([dict(row) for row in events])
    result["media"] = [_resolve_media_url(dict(row)) for row in media]
    result["sources"] = [dict(row) for row in sources]
    return result


def _get_event_from_json(slug: str) -> dict[str, Any] | None:
    data = load_site_data()
    base_event = next((event for event in data["events"] if event["slug"] == slug), None)
    if not base_event:
        return None

    related_places: list[dict[str, Any]] = []
    for place in data["places"]:
        place_events = place.get("events", [])
        if any(event.get("title") == base_event["title"] for event in place_events):
            related_places.append(
                {
                    "slug": place["slug"],
                    "title": place["title"],
                    "summary": place["summary"],
                }
            )

    related_people: list[dict[str, Any]] = []
    for person in data["people"]:
        person_events = person.get("events", [])
        if any(event.get("title") == base_event["title"] for event in person_events):
            related_people.append(
                {
                    "slug": person["slug"],
                    "title": person["title"],
                    "summary": person["summary"],
                }
            )

    event = _enrich_timeline_event(dict(base_event))
    event["description"] = base_event.get("description") or base_event.get("summary", "")
    event["places"] = related_places
    event["people"] = related_people
    event["media"] = []
    event["sources"] = []
    return event


def _get_event_from_db(slug: str) -> dict[str, Any] | None:
    with get_connection() as connection:
        event = connection.execute(
            """
            SELECT
                e.slug,
                e.title,
                e.subtitle,
                e.summary,
                COALESCE(ev.narrative_md, e.description_md, e.summary) AS description,
                ev.date_label,
                ev.start_date,
                ev.end_date,
                CAST(ev.event_type AS text) AS event_type,
                e.sort_order
            FROM entities e
            JOIN events ev ON ev.entity_id = e.id
            WHERE e.slug = %s
            """,
            (slug,),
        ).fetchone()
        if not event:
            return None

        places = connection.execute(
            """
            SELECT
                place_entity.slug,
                place_entity.title,
                place_entity.summary,
                ep.role_label
            FROM event_places ep
            JOIN entities event_entity ON event_entity.id = ep.event_entity_id
            JOIN entities place_entity ON place_entity.id = ep.place_entity_id
            WHERE event_entity.slug = %s
            ORDER BY place_entity.sort_order, place_entity.title
            """,
            (slug,),
        ).fetchall()

        people = connection.execute(
            """
            SELECT
                participant_entity.slug,
                participant_entity.title,
                participant_entity.summary,
                ep.role_label
            FROM event_participants ep
            JOIN entities event_entity ON event_entity.id = ep.event_entity_id
            JOIN entities participant_entity ON participant_entity.id = ep.participant_entity_id
            WHERE event_entity.slug = %s
            ORDER BY participant_entity.sort_order, participant_entity.title
            """,
            (slug,),
        ).fetchall()

        media = connection.execute(
            """
            SELECT
                media_entity.title,
                COALESCE(em.caption_override, mi.caption, media_entity.summary) AS caption,
                mi.file_path,
                mi.source_url
            FROM entity_media em
            JOIN entities entity ON entity.id = em.entity_id
            JOIN entities media_entity ON media_entity.id = em.media_entity_id
            JOIN media_items mi ON mi.entity_id = em.media_entity_id
            WHERE entity.slug = %s
            ORDER BY em.sort_order, media_entity.title
            """,
            (slug,),
        ).fetchall()

        sources = connection.execute(
            """
            SELECT s.title, s.url
            FROM entity_sources es
            JOIN sources s ON s.id = es.source_id
            JOIN entities e ON e.id = es.entity_id
            WHERE e.slug = %s
            ORDER BY s.title
            """,
            (slug,),
        ).fetchall()

    result = _enrich_timeline_event(dict(event))
    result["places"] = [dict(row) for row in places]
    result["people"] = [dict(row) for row in people]
    result["media"] = [_resolve_media_url(dict(row)) for row in media]
    result["sources"] = [dict(row) for row in sources]
    return result
