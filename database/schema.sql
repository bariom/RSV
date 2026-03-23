CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TYPE entity_type AS ENUM (
    'place',
    'person',
    'organization',
    'event',
    'document',
    'media',
    'narrative',
    'theme'
);

CREATE TYPE publication_status AS ENUM (
    'draft',
    'review',
    'published',
    'archived'
);

CREATE TYPE source_type AS ENUM (
    'archival_record',
    'book',
    'article',
    'periodical',
    'website',
    'oral_history',
    'map',
    'photograph',
    'registry',
    'other'
);

CREATE TYPE place_type AS ENUM (
    'municipality',
    'hamlet',
    'building',
    'religious_site',
    'street',
    'square',
    'landmark',
    'natural_site',
    'archaeological_site',
    'cemetery',
    'other'
);

CREATE TYPE event_type AS ENUM (
    'political',
    'religious',
    'social',
    'economic',
    'cultural',
    'military',
    'architectural',
    'archaeological',
    'administrative',
    'disaster',
    'other'
);

CREATE TYPE document_type AS ENUM (
    'letter',
    'decree',
    'register',
    'report',
    'newspaper_article',
    'manuscript',
    'map',
    'inscription',
    'inventory',
    'photograph',
    'other'
);

CREATE TYPE media_type AS ENUM (
    'image',
    'audio',
    'video',
    'map_scan',
    'illustration',
    'document_scan',
    'model_3d',
    'other'
);

CREATE TYPE narrative_type AS ENUM (
    'article',
    'timeline_entry',
    'exhibition',
    'biography',
    'place_story',
    'theme_story',
    'other'
);

CREATE TYPE relation_type AS ENUM (
    'related_to',
    'part_of',
    'located_in',
    'preceded_by',
    'succeeded_by',
    'same_as',
    'member_of',
    'founded',
    'participated_in',
    'depicts',
    'mentions',
    'authored_by',
    'inspired_by',
    'commemorates',
    'stored_at',
    'discovered_at'
);

CREATE TYPE source_link_role AS ENUM (
    'primary_evidence',
    'secondary_evidence',
    'bibliography',
    'image_credit',
    'transcription_source',
    'further_reading'
);

CREATE TABLE entities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    entity_type entity_type NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    subtitle TEXT,
    summary TEXT,
    description_md TEXT,
    language_code VARCHAR(10) NOT NULL DEFAULT 'it',
    status publication_status NOT NULL DEFAULT 'draft',
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    sort_order INTEGER NOT NULL DEFAULT 0,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE places (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    place_type place_type NOT NULL,
    current_name TEXT,
    historical_name TEXT,
    parent_place_entity_id UUID REFERENCES entities(id) ON DELETE SET NULL,
    latitude NUMERIC(9, 6),
    longitude NUMERIC(9, 6),
    address_text TEXT,
    geo_notes TEXT
);

CREATE TABLE people (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    given_name TEXT,
    family_name TEXT,
    display_name TEXT,
    birth_date_start DATE,
    birth_date_end DATE,
    birth_date_label TEXT,
    death_date_start DATE,
    death_date_end DATE,
    death_date_label TEXT,
    occupations TEXT,
    biography_md TEXT
);

CREATE TABLE organizations (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    organization_kind TEXT,
    founded_date_start DATE,
    founded_date_end DATE,
    founded_date_label TEXT,
    dissolved_date_start DATE,
    dissolved_date_end DATE,
    dissolved_date_label TEXT,
    mission_md TEXT
);

CREATE TABLE events (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    event_type event_type NOT NULL,
    start_date DATE,
    end_date DATE,
    date_label TEXT,
    circa BOOLEAN NOT NULL DEFAULT FALSE,
    significance SMALLINT,
    narrative_md TEXT
);

CREATE TABLE documents (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    document_type document_type NOT NULL,
    date_start DATE,
    date_end DATE,
    date_label TEXT,
    language_code VARCHAR(10),
    archive_reference TEXT,
    transcription_md TEXT,
    original_text_md TEXT,
    editorial_notes_md TEXT
);

CREATE TABLE media_items (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    media_type media_type NOT NULL,
    file_path TEXT,
    source_url TEXT,
    mime_type TEXT,
    alt_text TEXT,
    caption TEXT,
    credit_line TEXT,
    rights_statement TEXT,
    date_start DATE,
    date_end DATE,
    date_label TEXT,
    width_px INTEGER,
    height_px INTEGER,
    duration_seconds INTEGER,
    checksum_sha256 TEXT
);

CREATE TABLE narratives (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    narrative_type narrative_type NOT NULL DEFAULT 'article',
    lead TEXT,
    body_md TEXT NOT NULL,
    published_at TIMESTAMPTZ,
    reading_time_minutes SMALLINT
);

CREATE TABLE themes (
    entity_id UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
    theme_group TEXT,
    color_hex CHAR(7),
    icon_name TEXT
);

CREATE TABLE sources (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source_type source_type NOT NULL,
    title TEXT NOT NULL,
    citation TEXT NOT NULL,
    author_text TEXT,
    publisher TEXT,
    publication_place TEXT,
    publication_year SMALLINT,
    archive_name TEXT,
    collection_name TEXT,
    shelfmark TEXT,
    language_code VARCHAR(10),
    url TEXT,
    accessed_on DATE,
    notes_md TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE entity_sources (
    entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    source_id UUID NOT NULL REFERENCES sources(id) ON DELETE CASCADE,
    role source_link_role NOT NULL DEFAULT 'secondary_evidence',
    page_locator TEXT,
    quotation_excerpt TEXT,
    notes_md TEXT,
    PRIMARY KEY (entity_id, source_id, role)
);

CREATE TABLE entity_themes (
    entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    theme_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    PRIMARY KEY (entity_id, theme_entity_id)
);

CREATE TABLE entity_media (
    entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    media_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    usage_role TEXT NOT NULL DEFAULT 'gallery',
    caption_override TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (entity_id, media_entity_id, usage_role)
);

CREATE TABLE entity_relations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    from_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    to_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    relation_type relation_type NOT NULL,
    start_date DATE,
    end_date DATE,
    date_label TEXT,
    notes_md TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    CONSTRAINT entity_relations_no_self_reference CHECK (from_entity_id <> to_entity_id)
);

CREATE TABLE event_participants (
    event_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    participant_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    role_label TEXT NOT NULL,
    notes_md TEXT,
    PRIMARY KEY (event_entity_id, participant_entity_id, role_label)
);

CREATE TABLE event_places (
    event_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    place_entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
    role_label TEXT NOT NULL DEFAULT 'location',
    PRIMARY KEY (event_entity_id, place_entity_id, role_label)
);

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION enforce_entity_type()
RETURNS TRIGGER AS $$
DECLARE
    expected entity_type := TG_ARGV[0]::entity_type;
    actual entity_type;
BEGIN
    SELECT entity_type INTO actual
    FROM entities
    WHERE id = NEW.entity_id;

    IF actual IS NULL THEN
        RAISE EXCEPTION 'Entity % does not exist', NEW.entity_id;
    END IF;

    IF actual <> expected THEN
        RAISE EXCEPTION 'Entity % has type %, expected %', NEW.entity_id, actual, expected;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION enforce_linked_entity_type()
RETURNS TRIGGER AS $$
DECLARE
    actual entity_type;
    target_column TEXT := TG_ARGV[0];
    expected entity_type := TG_ARGV[1]::entity_type;
    target_id UUID;
BEGIN
    target_id := (to_jsonb(NEW) ->> target_column)::UUID;

    SELECT entity_type INTO actual
    FROM entities
    WHERE id = target_id;

    IF actual IS NULL THEN
        RAISE EXCEPTION 'Entity % does not exist', target_id;
    END IF;

    IF actual <> expected THEN
        RAISE EXCEPTION 'Entity % has type %, expected %', target_id, actual, expected;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER entities_set_updated_at
BEFORE UPDATE ON entities
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER sources_set_updated_at
BEFORE UPDATE ON sources
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER places_type_check
BEFORE INSERT OR UPDATE ON places
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('place');

CREATE TRIGGER people_type_check
BEFORE INSERT OR UPDATE ON people
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('person');

CREATE TRIGGER organizations_type_check
BEFORE INSERT OR UPDATE ON organizations
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('organization');

CREATE TRIGGER events_type_check
BEFORE INSERT OR UPDATE ON events
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('event');

CREATE TRIGGER documents_type_check
BEFORE INSERT OR UPDATE ON documents
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('document');

CREATE TRIGGER media_items_type_check
BEFORE INSERT OR UPDATE ON media_items
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('media');

CREATE TRIGGER narratives_type_check
BEFORE INSERT OR UPDATE ON narratives
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('narrative');

CREATE TRIGGER themes_type_check
BEFORE INSERT OR UPDATE ON themes
FOR EACH ROW
EXECUTE FUNCTION enforce_entity_type('theme');

CREATE TRIGGER places_parent_type_check
BEFORE INSERT OR UPDATE ON places
FOR EACH ROW
WHEN (NEW.parent_place_entity_id IS NOT NULL)
EXECUTE FUNCTION enforce_linked_entity_type('parent_place_entity_id', 'place');

CREATE TRIGGER entity_themes_theme_type_check
BEFORE INSERT OR UPDATE ON entity_themes
FOR EACH ROW
EXECUTE FUNCTION enforce_linked_entity_type('theme_entity_id', 'theme');

CREATE TRIGGER entity_media_media_type_check
BEFORE INSERT OR UPDATE ON entity_media
FOR EACH ROW
EXECUTE FUNCTION enforce_linked_entity_type('media_entity_id', 'media');

CREATE TRIGGER event_participants_event_type_check
BEFORE INSERT OR UPDATE ON event_participants
FOR EACH ROW
EXECUTE FUNCTION enforce_linked_entity_type('event_entity_id', 'event');

CREATE TRIGGER event_places_event_type_check
BEFORE INSERT OR UPDATE ON event_places
FOR EACH ROW
EXECUTE FUNCTION enforce_linked_entity_type('event_entity_id', 'event');

CREATE TRIGGER event_places_place_type_check
BEFORE INSERT OR UPDATE ON event_places
FOR EACH ROW
EXECUTE FUNCTION enforce_linked_entity_type('place_entity_id', 'place');

CREATE INDEX idx_entities_type_status ON entities (entity_type, status);
CREATE INDEX idx_entities_featured ON entities (is_featured) WHERE is_featured = TRUE;
CREATE INDEX idx_places_parent ON places (parent_place_entity_id);
CREATE INDEX idx_people_display_name ON people (display_name);
CREATE INDEX idx_events_dates ON events (start_date, end_date);
CREATE INDEX idx_documents_dates ON documents (date_start, date_end);
CREATE INDEX idx_sources_type_year ON sources (source_type, publication_year);
CREATE INDEX idx_entity_sources_source ON entity_sources (source_id);
CREATE INDEX idx_entity_media_media ON entity_media (media_entity_id);
CREATE INDEX idx_entity_relations_from ON entity_relations (from_entity_id);
CREATE INDEX idx_entity_relations_to ON entity_relations (to_entity_id);
CREATE INDEX idx_entity_relations_type ON entity_relations (relation_type);
CREATE INDEX idx_event_participants_participant ON event_participants (participant_entity_id);
CREATE INDEX idx_event_places_place ON event_places (place_entity_id);
CREATE INDEX idx_entities_metadata ON entities USING GIN (metadata);
CREATE INDEX idx_sources_metadata ON sources USING GIN (metadata);
