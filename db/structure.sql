CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "recipes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar);
CREATE TABLE "recipe_ingredients" ("ingredient_id" integer NOT NULL, "recipe_id" integer NOT NULL);
CREATE TABLE "ingredients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar);
INSERT INTO schema_migrations (version) VALUES ('20171022003624');

INSERT INTO schema_migrations (version) VALUES ('20171022004024');

INSERT INTO schema_migrations (version) VALUES ('20171022004155');

INSERT INTO schema_migrations (version) VALUES ('20171022004338');

