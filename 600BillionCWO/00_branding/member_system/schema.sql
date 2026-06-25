-- 600B member and avatar system schema.
-- SQLite is the audit trail; public JSON is a projection.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS identity_clusters (
    id TEXT PRIMARY KEY,
    display_name TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('canon', 'candidate', 'archived')),
    public_role TEXT NOT NULL,
    legacy_role TEXT,
    website_listed INTEGER NOT NULL DEFAULT 0 CHECK (website_listed IN (0, 1)),
    website_image TEXT,
    notes TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS aliases (
    id INTEGER PRIMARY KEY,
    identity_id TEXT NOT NULL REFERENCES identity_clusters(id) ON DELETE CASCADE,
    alias TEXT NOT NULL,
    kind TEXT NOT NULL CHECK (kind IN ('handle', 'persona', 'nickname', 'legacy', 'other')),
    is_primary INTEGER NOT NULL DEFAULT 0 CHECK (is_primary IN (0, 1)),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (identity_id, alias)
);

CREATE TABLE IF NOT EXISTS personas (
    id TEXT PRIMARY KEY,
    identity_id TEXT NOT NULL REFERENCES identity_clusters(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    kind TEXT NOT NULL,
    use_when TEXT NOT NULL,
    prompt_cues_json TEXT NOT NULL,
    avoid_drift_json TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS external_accounts (
    id INTEGER PRIMARY KEY,
    identity_id TEXT REFERENCES identity_clusters(id) ON DELETE CASCADE,
    provider TEXT NOT NULL CHECK (
        provider IN (
            'nostr',
            'nip05',
            'github',
            'website',
            'lnbits',
            'lightning_address',
            'lnurl',
            'blossom',
            'other'
        )
    ),
    public_ref TEXT NOT NULL,
    routing_source TEXT,
    secret_ref TEXT,
    consent_status TEXT NOT NULL DEFAULT 'unknown' CHECK (
        consent_status IN ('unknown', 'pending', 'opt_in', 'opt_out')
    ),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (provider, public_ref)
);

CREATE TABLE IF NOT EXISTS image_profiles (
    identity_id TEXT PRIMARY KEY REFERENCES identity_clusters(id) ON DELETE CASCADE,
    source_image TEXT,
    avatar_description TEXT NOT NULL,
    silhouette TEXT NOT NULL,
    key_objects_json TEXT NOT NULL,
    avoid_drift_json TEXT NOT NULL,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS story_profiles (
    identity_id TEXT PRIMARY KEY REFERENCES identity_clusters(id) ON DELETE CASCADE,
    story_function TEXT NOT NULL,
    rpg_role TEXT NOT NULL,
    scene_samples_json TEXT NOT NULL,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS canon_events (
    id TEXT PRIMARY KEY,
    event_date TEXT,
    title TEXT NOT NULL,
    event_type TEXT NOT NULL CHECK (event_type IN ('party', 'conference', 'ritual', 'story', 'release')),
    description TEXT NOT NULL,
    canon_weight INTEGER NOT NULL DEFAULT 1 CHECK (canon_weight BETWEEN 1 AND 5),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS signup_requests (
    id TEXT PRIMARY KEY,
    display_name TEXT NOT NULL,
    description TEXT NOT NULL,
    payload_json TEXT NOT NULL,
    status TEXT NOT NULL CHECK (
        status IN ('PENDING', 'GENERATED', 'REVIEW', 'APPROVED', 'PUBLISHED', 'REJECTED')
    ),
    reason TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS nostr_identities (
    id INTEGER PRIMARY KEY,
    signup_id TEXT REFERENCES signup_requests(id) ON DELETE SET NULL,
    identity_id TEXT REFERENCES identity_clusters(id) ON DELETE SET NULL,
    nip05 TEXT,
    pubkey_ref TEXT,
    secret_ref TEXT,
    status TEXT NOT NULL CHECK (status IN ('pending', 'created', 'linked', 'published', 'revoked')),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (nip05 IS NOT NULL OR pubkey_ref IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS lnbits_accounts (
    id INTEGER PRIMARY KEY,
    signup_id TEXT REFERENCES signup_requests(id) ON DELETE SET NULL,
    identity_id TEXT REFERENCES identity_clusters(id) ON DELETE SET NULL,
    wallet_ref TEXT NOT NULL,
    lightning_address TEXT,
    lnurl_ref TEXT,
    admin_key_secret_ref TEXT,
    invoice_key_secret_ref TEXT,
    status TEXT NOT NULL CHECK (status IN ('pending', 'created', 'linked', 'published', 'revoked')),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (wallet_ref)
);

CREATE TABLE IF NOT EXISTS generator_libraries (
    id TEXT PRIMARY KEY,
    version TEXT NOT NULL,
    source_path TEXT NOT NULL,
    sha256 TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS generation_runs (
    id TEXT PRIMARY KEY,
    signup_id TEXT REFERENCES signup_requests(id) ON DELETE CASCADE,
    library_id TEXT REFERENCES generator_libraries(id),
    prompt_json TEXT NOT NULL,
    output_json TEXT NOT NULL,
    model_ref TEXT,
    status TEXT NOT NULL CHECK (status IN ('GENERATED', 'REVIEW', 'ACCEPTED', 'REJECTED')),
    reason TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS generated_profiles (
    id TEXT PRIMARY KEY,
    signup_id TEXT NOT NULL REFERENCES signup_requests(id) ON DELETE CASCADE,
    generation_run_id TEXT REFERENCES generation_runs(id) ON DELETE SET NULL,
    proposed_identity_id TEXT NOT NULL,
    profile_json TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('candidate', 'approved', 'published', 'rejected')),
    reason TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS avatar_configs (
    id TEXT PRIMARY KEY,
    identity_id TEXT REFERENCES identity_clusters(id) ON DELETE CASCADE,
    generated_profile_id TEXT REFERENCES generated_profiles(id) ON DELETE CASCADE,
    config_json TEXT NOT NULL,
    source_ref TEXT,
    status TEXT NOT NULL CHECK (status IN ('draft', 'approved', 'archived')),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by TEXT NOT NULL,
    CHECK (identity_id IS NOT NULL OR generated_profile_id IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS avatar_jobs (
    id TEXT PRIMARY KEY,
    avatar_config_id TEXT NOT NULL REFERENCES avatar_configs(id) ON DELETE CASCADE,
    input_ref TEXT,
    engine TEXT NOT NULL CHECK (engine IN ('hunyuan3d', 'trellis2', 'manual', 'other')),
    quality TEXT NOT NULL CHECK (quality IN ('draft', 'builder', 'hero')),
    status TEXT NOT NULL CHECK (
        status IN ('PENDING', 'RUNNING', 'VALIDATED', 'DOWNGRADED', 'REJECTED', 'PUBLISHED')
    ),
    report_json TEXT,
    reason TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS avatar_assets (
    id TEXT PRIMARY KEY,
    avatar_job_id TEXT NOT NULL REFERENCES avatar_jobs(id) ON DELETE CASCADE,
    asset_type TEXT NOT NULL CHECK (asset_type IN ('concept', 'glb', 'vrm', 'thumbnail', 'manifest')),
    path_or_uri TEXT NOT NULL,
    sha256 TEXT,
    tris INTEGER,
    materials INTEGER,
    bones INTEGER,
    humanoid_complete INTEGER CHECK (humanoid_complete IN (0, 1)),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS audit_log (
    id INTEGER PRIMARY KEY,
    entity_type TEXT NOT NULL,
    entity_id TEXT NOT NULL,
    action TEXT NOT NULL,
    reason TEXT,
    payload_json TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_aliases_alias ON aliases(alias);
CREATE INDEX IF NOT EXISTS idx_external_accounts_identity ON external_accounts(identity_id);
CREATE INDEX IF NOT EXISTS idx_signup_requests_status ON signup_requests(status);
CREATE INDEX IF NOT EXISTS idx_avatar_jobs_status ON avatar_jobs(status);
