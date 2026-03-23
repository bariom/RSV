from __future__ import annotations

import json
from functools import lru_cache
from pathlib import Path
from typing import Any

from app.db import get_connection, has_database_config

DATA_PATH = Path(__file__).parent / "data" / "site.json"


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
    return load_site_data()["events"]


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
                COALESCE(NULLIF(p.historical_name, ''), p.current_name, e.title) AS period
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
                COALESCE(NULLIF(p.historical_name, ''), p.current_name, e.title) AS period
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
        "featured_place": dict(featured_place) if featured_place else {},
        "places": [dict(row) for row in places],
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
                e.summary
            FROM events ev
            JOIN entities e ON e.id = ev.entity_id
            WHERE e.status = 'published'
            ORDER BY ev.start_date NULLS LAST, ev.end_date NULLS LAST, e.sort_order
            """
        ).fetchall()
        return [dict(row) for row in rows]
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
                COALESCE(p.geo_notes, p.address_text, '') AS period
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
            SELECT s.title
            FROM entity_sources es
            JOIN sources s ON s.id = es.source_id
            JOIN entities e ON e.id = es.entity_id
            WHERE e.slug = %s
            ORDER BY s.title
            """,
            (slug,),
        ).fetchall()

    result = dict(place)
    result["themes"] = [row["title"] for row in themes]
    result["sources"] = [row["title"] for row in sources]
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

    return dict(person) if person else None
