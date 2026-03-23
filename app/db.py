from __future__ import annotations

import os
from contextlib import contextmanager
from typing import Iterator

try:
    import psycopg
    from psycopg.rows import dict_row
except ImportError:  # pragma: no cover
    psycopg = None
    dict_row = None


def get_database_url() -> str | None:
    return os.getenv("DATABASE_URL")


def has_database_config() -> bool:
    return bool(get_database_url())


@contextmanager
def get_connection() -> Iterator["psycopg.Connection"]:
    database_url = get_database_url()
    if not database_url:
        raise RuntimeError("DATABASE_URL non configurata")
    if psycopg is None:
        raise RuntimeError("psycopg non installato")

    with psycopg.connect(database_url, row_factory=dict_row) as connection:
        yield connection
