from __future__ import annotations

import mimetypes
import os
from pathlib import Path
from uuid import uuid4


def get_upload_root() -> Path:
    configured = os.getenv("UPLOAD_DIR", "uploads")
    path = Path(configured)
    if not path.is_absolute():
        path = (Path(__file__).resolve().parent.parent / path).resolve()
    return path


def ensure_upload_root() -> Path:
    root = get_upload_root()
    root.mkdir(parents=True, exist_ok=True)
    return root


def build_upload_url(file_path: str | None) -> str:
    if not file_path:
        return ""
    return f"/uploads/{file_path.lstrip('/')}"


def build_media_storage_path(slug: str, filename: str, content_type: str | None) -> tuple[str, str | None]:
    extension = Path(filename or "").suffix.lower()
    if not extension and content_type:
        extension = mimetypes.guess_extension(content_type) or ""
    safe_slug = "".join(char if char.isalnum() or char in {"-", "_"} else "-" for char in slug.lower()).strip("-")
    safe_slug = safe_slug or "media"
    relative_path = f"media/{safe_slug}-{uuid4().hex[:8]}{extension}"
    return relative_path, content_type
