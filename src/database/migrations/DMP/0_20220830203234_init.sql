-- upgrade --
CREATE TABLE IF NOT EXISTS "aerich" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "version" VARCHAR(255) NOT NULL,
    "app" VARCHAR(100) NOT NULL,
    "content" JSONB NOT NULL
);
CREATE TABLE IF NOT EXISTS "users" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "id_token" VARCHAR(2048) NOT NULL,
    "access_token" VARCHAR(255) NOT NULL,
    "refresh_token" VARCHAR(255) NOT NULL,
    "picture" VARCHAR(255) NOT NULL,
    "locale" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP
);