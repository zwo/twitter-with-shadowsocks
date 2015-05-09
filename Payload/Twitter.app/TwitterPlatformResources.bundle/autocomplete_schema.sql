PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "hashtags" (
"id" TEXT,
"priority" INTEGER NOT NULL DEFAULT '0',
"hashtag" TEXT ,
"description" TEXT,
"updated_at" INTEGER);
CREATE UNIQUE INDEX "hashtag_primary" ON "hashtags" ("id","priority");
CREATE INDEX "hashtag_timestamp_index" ON "hashtags" ("updated_at");
COMMIT;