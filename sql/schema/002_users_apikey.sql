-- +goose Up

ALTER TABLE users ADD COLUMN api_key VARCHAR(64) UNIQUE NOT NULL DEFAULT (
  -- this is a random API key for to be unique and fullfill the previouse users
  encode(sha256(random()::text::bytea), 'hex')
);
-- +goose Down
-- down migration is must the undo the things that i did in the up migration
ALTER TABLE users DROP COLUMN api_key;