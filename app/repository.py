from __future__ import annotations

import json
import re
from functools import lru_cache
from pathlib import Path
from typing import Any

from app.db import get_connection, has_database_config
from app.storage import build_upload_url

DATA_PATH = Path(__file__).parent / "data" / "site.json"

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


def _resolve_media_url(row: dict[str, Any]) -> dict[str, Any]:
    source_url = row.get("source_url") or ""
    row["url"] = source_url or build_upload_url(row.get("file_path"))
    return row


def _localize_place_type(value: str | None) -> str:
    if not value:
        return ""
    return PLACE_TYPE_LABELS.get(value, value.replace("_", " "))


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
    return _sort_events(load_site_data()["events"])


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
    return next((place for place in load_site_data()["places"] if place["slug"] == slug), None)


def get_person(slug: str) -> dict[str, Any] | None:
    if has_database_config():
        return _get_person_from_db(slug)
    return next((person for person in load_site_data()["people"] if person["slug"] == slug), None)


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
                e.summary,
                e.sort_order
            FROM events ev
            JOIN entities e ON e.id = ev.entity_id
            WHERE e.status = 'published'
            """
        ).fetchall()
        return _sort_events([dict(row) for row in rows])
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
