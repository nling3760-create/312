CREATE TABLE IF NOT EXISTS life_profiles (owner_id TEXT NOT NULL,nickname_key TEXT NOT NULL,nickname TEXT NOT NULL,verifier TEXT NOT NULL,data TEXT NOT NULL,revision INTEGER NOT NULL DEFAULT 0,updated_at TEXT NOT NULL,PRIMARY KEY(owner_id,nickname_key));
CREATE TABLE IF NOT EXISTS life_photos (photo_key TEXT PRIMARY KEY NOT NULL,image TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS life_rate_limits (key TEXT PRIMARY KEY NOT NULL,count INTEGER NOT NULL,expires_at INTEGER NOT NULL);
CREATE INDEX IF NOT EXISTS rate_expiry_idx ON life_rate_limits(expires_at);
