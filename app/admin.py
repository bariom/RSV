from __future__ import annotations

import os
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from app.db import get_connection, has_database_config
from app.storage import build_media_storage_path, ensure_upload_root


ENTITY_TYPES = [
    "place",
    "person",
    "organization",
    "event",
    "document",
    "media",
    "narrative",
    "theme",
]

PUBLICATION_STATUSES = ["draft", "review", "published", "archived"]
PLACE_TYPES = [
    "municipality",
    "quarter",
    "hamlet",
    "building",
    "religious_site",
    "street",
    "square",
    "landmark",
    "natural_site",
    "archaeological_site",
    "cemetery",
    "other",
]
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
EVENT_TYPES = [
    "political",
    "religious",
    "social",
    "economic",
    "cultural",
    "military",
    "architectural",
    "archaeological",
    "administrative",
    "disaster",
    "other",
]
DOCUMENT_TYPES = [
    "letter",
    "decree",
    "register",
    "report",
    "newspaper_article",
    "manuscript",
    "map",
    "inscription",
    "inventory",
    "photograph",
    "other",
]
MEDIA_TYPES = [
    "image",
    "audio",
    "video",
    "map_scan",
    "illustration",
    "document_scan",
    "model_3d",
    "other",
]
NARRATIVE_TYPES = [
    "article",
    "timeline_entry",
    "exhibition",
    "biography",
    "place_story",
    "theme_story",
    "other",
]


@dataclass
class AdminConfig:
    password: str | None
    secret_key: str
    upload_dir: Path


def get_admin_config() -> AdminConfig:
    return AdminConfig(
        password=os.getenv("ADMIN_PASSWORD"),
        secret_key=os.getenv("APP_SECRET_KEY", "change-me-in-production"),
        upload_dir=ensure_upload_root(),
    )


def has_admin_password() -> bool:
    return bool(get_admin_config().password)


def verify_admin_password(password: str) -> bool:
    configured = get_admin_config().password
    return bool(configured and password == configured)


def get_admin_choices() -> dict[str, list[str]]:
    return {
        "entity_types": ENTITY_TYPES,
        "publication_statuses": PUBLICATION_STATUSES,
        "place_types": PLACE_TYPES,
        "place_type_labels": PLACE_TYPE_LABELS,
        "event_types": EVENT_TYPES,
        "document_types": DOCUMENT_TYPES,
        "media_types": MEDIA_TYPES,
        "narrative_types": NARRATIVE_TYPES,
    }


def empty_entity_form() -> dict[str, Any]:
    return {
        "id": "",
        "entity_type": "place",
        "slug": "",
        "title": "",
        "subtitle": "",
        "summary": "",
        "description_md": "",
        "language_code": "it",
        "status": "draft",
        "is_featured": False,
        "sort_order": 0,
        "metadata": "{}",
        "details": {},
        "media_links": [],
    }


def list_entities_admin() -> list[dict[str, Any]]:
    if not has_database_config():
        return []
    with get_connection() as connection:
        rows = connection.execute(
            """
            SELECT
                id::text,
                entity_type::text AS entity_type,
                slug,
                title,
                status::text AS status,
                updated_at
            FROM entities
            ORDER BY updated_at DESC, title
            """
        ).fetchall()
    return [dict(row) for row in rows]


def get_entity_admin(entity_id: str) -> dict[str, Any] | None:
    if not has_database_config():
        return None
    with get_connection() as connection:
        entity = connection.execute(
            """
            SELECT
                id::text,
                entity_type::text AS entity_type,
                slug,
                title,
                subtitle,
                summary,
                description_md,
                language_code,
                status::text AS status,
                is_featured,
                sort_order,
                metadata::text AS metadata
            FROM entities
            WHERE id = %s::uuid
            """,
            (entity_id,),
        ).fetchone()
        if not entity:
            return None

        result = dict(entity)
        result["details"] = _load_entity_details(connection, entity_id, result["entity_type"])
        result["media_links"] = [
            dict(row)
            for row in connection.execute(
                """
                SELECT
                    media_entity.slug AS media_slug,
                    media_entity.title AS media_title,
                    em.usage_role,
                    em.caption_override,
                    em.sort_order
                FROM entity_media em
                JOIN entities media_entity ON media_entity.id = em.media_entity_id
                WHERE em.entity_id = %s::uuid
                ORDER BY em.sort_order, media_entity.title
                """,
                (entity_id,),
            ).fetchall()
        ]
        return result


def create_entity_admin(data: dict[str, Any]) -> str:
    with get_connection() as connection:
        entity_id = connection.execute(
            """
            INSERT INTO entities (
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
            ) VALUES (
                %s::entity_type,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s::publication_status,
                %s,
                %s,
                %s::jsonb
            )
            RETURNING id::text
            """,
            (
                data["entity_type"],
                data["slug"],
                data["title"],
                data["subtitle"] or None,
                data["summary"] or None,
                data["description_md"] or None,
                data["language_code"] or "it",
                data["status"],
                data["is_featured"],
                data["sort_order"],
                data["metadata"] or "{}",
            ),
        ).fetchone()["id"]

        _save_entity_details(connection, entity_id, data["entity_type"], data)
        connection.commit()
        return entity_id


def update_entity_admin(entity_id: str, data: dict[str, Any]) -> None:
    with get_connection() as connection:
        connection.execute(
            """
            UPDATE entities
            SET
                slug = %s,
                title = %s,
                subtitle = %s,
                summary = %s,
                description_md = %s,
                language_code = %s,
                status = %s::publication_status,
                is_featured = %s,
                sort_order = %s,
                metadata = %s::jsonb
            WHERE id = %s::uuid
            """,
            (
                data["slug"],
                data["title"],
                data["subtitle"] or None,
                data["summary"] or None,
                data["description_md"] or None,
                data["language_code"] or "it",
                data["status"],
                data["is_featured"],
                data["sort_order"],
                data["metadata"] or "{}",
                entity_id,
            ),
        )
        _save_entity_details(connection, entity_id, data["entity_type"], data)
        connection.commit()


def add_media_link_admin(entity_id: str, media_slug: str, usage_role: str, caption_override: str, sort_order: int) -> None:
    with get_connection() as connection:
        media = connection.execute(
            "SELECT id::text FROM entities WHERE slug = %s AND entity_type = 'media'",
            (media_slug,),
        ).fetchone()
        if not media:
            raise ValueError("Media non trovato")
        connection.execute(
            """
            INSERT INTO entity_media (
                entity_id,
                media_entity_id,
                usage_role,
                caption_override,
                sort_order
            ) VALUES (%s::uuid, %s::uuid, %s, %s, %s)
            ON CONFLICT (entity_id, media_entity_id, usage_role)
            DO UPDATE SET
                caption_override = EXCLUDED.caption_override,
                sort_order = EXCLUDED.sort_order
            """,
            (entity_id, media["id"], usage_role, caption_override or None, sort_order),
        )
        connection.commit()


def remove_media_link_admin(entity_id: str, media_slug: str, usage_role: str) -> None:
    with get_connection() as connection:
        connection.execute(
            """
            DELETE FROM entity_media
            WHERE entity_id = %s::uuid
              AND media_entity_id = (SELECT id FROM entities WHERE slug = %s AND entity_type = 'media')
              AND usage_role = %s
            """,
            (entity_id, media_slug, usage_role),
        )
        connection.commit()


def save_media_upload_admin(entity_id: str, filename: str, content_type: str | None, content: bytes) -> None:
    if not content:
        raise ValueError("File vuoto")

    with get_connection() as connection:
        entity = connection.execute(
            """
            SELECT e.slug, mi.file_path
            FROM entities e
            LEFT JOIN media_items mi ON mi.entity_id = e.id
            WHERE e.id = %s::uuid
              AND e.entity_type = 'media'
            """,
            (entity_id,),
        ).fetchone()
        if not entity:
            raise ValueError("L upload e disponibile solo per entita di tipo media")

        relative_path, mime_type = build_media_storage_path(entity["slug"], filename, content_type)
        destination = get_admin_config().upload_dir / relative_path
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(content)

        previous_path = entity.get("file_path")
        if previous_path:
            previous_file = get_admin_config().upload_dir / previous_path
            if previous_file.exists() and previous_file != destination:
                previous_file.unlink()

        connection.execute(
            """
            INSERT INTO media_items (entity_id, media_type, file_path, mime_type)
            VALUES (%s::uuid, 'image', %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                file_path = EXCLUDED.file_path,
                mime_type = EXCLUDED.mime_type
            """,
            (entity_id, relative_path, mime_type),
        )
        connection.commit()


def _load_entity_details(connection: Any, entity_id: str, entity_type: str) -> dict[str, Any]:
    queries = {
        "place": """
            SELECT place_type::text AS place_type, current_name, historical_name, address_text, geo_notes
            FROM places WHERE entity_id = %s::uuid
        """,
        "person": """
            SELECT given_name, family_name, display_name, birth_date_label, death_date_label, occupations, biography_md
            FROM people WHERE entity_id = %s::uuid
        """,
        "event": """
            SELECT event_type::text AS event_type, date_label, narrative_md
            FROM events WHERE entity_id = %s::uuid
        """,
        "document": """
            SELECT document_type::text AS document_type, date_label, archive_reference, editorial_notes_md
            FROM documents WHERE entity_id = %s::uuid
        """,
        "media": """
            SELECT media_type::text AS media_type, file_path, source_url, mime_type, alt_text, caption, credit_line, rights_statement, date_label
            FROM media_items WHERE entity_id = %s::uuid
        """,
        "narrative": """
            SELECT narrative_type::text AS narrative_type, lead, body_md
            FROM narratives WHERE entity_id = %s::uuid
        """,
        "organization": """
            SELECT organization_kind, founded_date_label, dissolved_date_label, mission_md
            FROM organizations WHERE entity_id = %s::uuid
        """,
        "theme": """
            SELECT theme_group, color_hex, icon_name
            FROM themes WHERE entity_id = %s::uuid
        """,
    }
    query = queries.get(entity_type)
    if not query:
        return {}
    row = connection.execute(query, (entity_id,)).fetchone()
    return dict(row) if row else {}


def _save_entity_details(connection: Any, entity_id: str, entity_type: str, data: dict[str, Any]) -> None:
    if entity_type == "place":
        connection.execute(
            """
            INSERT INTO places (entity_id, place_type, current_name, historical_name, address_text, geo_notes)
            VALUES (%s::uuid, %s::place_type, %s, %s, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                place_type = EXCLUDED.place_type,
                current_name = EXCLUDED.current_name,
                historical_name = EXCLUDED.historical_name,
                address_text = EXCLUDED.address_text,
                geo_notes = EXCLUDED.geo_notes
            """,
            (
                entity_id,
                data.get("place_type") or "other",
                data.get("current_name") or None,
                data.get("historical_name") or None,
                data.get("address_text") or None,
                data.get("geo_notes") or None,
            ),
        )
    elif entity_type == "person":
        connection.execute(
            """
            INSERT INTO people (
                entity_id, given_name, family_name, display_name, birth_date_label, death_date_label, occupations, biography_md
            ) VALUES (%s::uuid, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                given_name = EXCLUDED.given_name,
                family_name = EXCLUDED.family_name,
                display_name = EXCLUDED.display_name,
                birth_date_label = EXCLUDED.birth_date_label,
                death_date_label = EXCLUDED.death_date_label,
                occupations = EXCLUDED.occupations,
                biography_md = EXCLUDED.biography_md
            """,
            (
                entity_id,
                data.get("given_name") or None,
                data.get("family_name") or None,
                data.get("display_name") or None,
                data.get("birth_date_label") or None,
                data.get("death_date_label") or None,
                data.get("occupations") or None,
                data.get("biography_md") or None,
            ),
        )
    elif entity_type == "event":
        connection.execute(
            """
            INSERT INTO events (entity_id, event_type, date_label, narrative_md)
            VALUES (%s::uuid, %s::event_type, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                event_type = EXCLUDED.event_type,
                date_label = EXCLUDED.date_label,
                narrative_md = EXCLUDED.narrative_md
            """,
            (
                entity_id,
                data.get("event_type") or "other",
                data.get("date_label") or None,
                data.get("narrative_md") or None,
            ),
        )
    elif entity_type == "document":
        connection.execute(
            """
            INSERT INTO documents (entity_id, document_type, date_label, archive_reference, editorial_notes_md)
            VALUES (%s::uuid, %s::document_type, %s, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                document_type = EXCLUDED.document_type,
                date_label = EXCLUDED.date_label,
                archive_reference = EXCLUDED.archive_reference,
                editorial_notes_md = EXCLUDED.editorial_notes_md
            """,
            (
                entity_id,
                data.get("document_type") or "other",
                data.get("date_label") or None,
                data.get("archive_reference") or None,
                data.get("editorial_notes_md") or None,
            ),
        )
    elif entity_type == "media":
        connection.execute(
            """
            INSERT INTO media_items (
                entity_id, media_type, file_path, source_url, mime_type, alt_text, caption, credit_line, rights_statement, date_label
            )
            VALUES (%s::uuid, %s::media_type, %s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                media_type = EXCLUDED.media_type,
                file_path = EXCLUDED.file_path,
                source_url = EXCLUDED.source_url,
                mime_type = EXCLUDED.mime_type,
                alt_text = EXCLUDED.alt_text,
                caption = EXCLUDED.caption,
                credit_line = EXCLUDED.credit_line,
                rights_statement = EXCLUDED.rights_statement,
                date_label = EXCLUDED.date_label
            """,
            (
                entity_id,
                data.get("media_type") or "image",
                data.get("file_path") or None,
                data.get("source_url") or None,
                data.get("mime_type") or None,
                data.get("alt_text") or None,
                data.get("caption") or None,
                data.get("credit_line") or None,
                data.get("rights_statement") or None,
                data.get("date_label") or None,
            ),
        )
    elif entity_type == "narrative":
        connection.execute(
            """
            INSERT INTO narratives (entity_id, narrative_type, lead, body_md)
            VALUES (%s::uuid, %s::narrative_type, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                narrative_type = EXCLUDED.narrative_type,
                lead = EXCLUDED.lead,
                body_md = EXCLUDED.body_md
            """,
            (
                entity_id,
                data.get("narrative_type") or "article",
                data.get("lead") or None,
                data.get("body_md") or "",
            ),
        )
    elif entity_type == "organization":
        connection.execute(
            """
            INSERT INTO organizations (entity_id, organization_kind, founded_date_label, dissolved_date_label, mission_md)
            VALUES (%s::uuid, %s, %s, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                organization_kind = EXCLUDED.organization_kind,
                founded_date_label = EXCLUDED.founded_date_label,
                dissolved_date_label = EXCLUDED.dissolved_date_label,
                mission_md = EXCLUDED.mission_md
            """,
            (
                entity_id,
                data.get("organization_kind") or None,
                data.get("founded_date_label") or None,
                data.get("dissolved_date_label") or None,
                data.get("mission_md") or None,
            ),
        )
    elif entity_type == "theme":
        connection.execute(
            """
            INSERT INTO themes (entity_id, theme_group, color_hex, icon_name)
            VALUES (%s::uuid, %s, %s, %s)
            ON CONFLICT (entity_id) DO UPDATE SET
                theme_group = EXCLUDED.theme_group,
                color_hex = EXCLUDED.color_hex,
                icon_name = EXCLUDED.icon_name
            """,
            (
                entity_id,
                data.get("theme_group") or None,
                data.get("color_hex") or None,
                data.get("icon_name") or None,
            ),
        )
