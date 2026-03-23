BEGIN;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_enum e
        JOIN pg_type t ON t.oid = e.enumtypid
        WHERE t.typname = 'place_type'
          AND e.enumlabel = 'quarter'
    ) THEN
        ALTER TYPE place_type ADD VALUE 'quarter' AFTER 'municipality';
    END IF;
END $$;

UPDATE places
SET place_type = 'quarter'
WHERE entity_id = '10000000-0000-0000-0000-000000000010';

COMMIT;
