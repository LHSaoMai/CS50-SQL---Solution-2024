CREATE TABLE if not exists "temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" NUMERIC,
    "mass" TEXT,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC
);

CREATE TABLE if not exists "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" NUMERIC,
    "mass" TEXT,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

.import --csv --skip 1 meteorites.csv temp


UPDATE "temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "temp" SET "year" = NULL WHERE "year" = '';
UPDATE "temp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "temp" SET "long" = NULL WHERE "long" = '';

UPDATE "temp" SET "mass" = ROUND("mass",2);
UPDATE "temp" SET "lat" = ROUND("lat",2);
UPDATE "temp" SET "long" = ROUND("long",2);

DELETE FROM "temp" WHERE "nametype" = 'Relict';

INSERT INTO "meteorites" ("id", "name","class","mass","discovery","year","lat","long")
    SELECT row_number() over (order by "year", "name"),
        "name","class","mass","discovery","year","lat","long" FROM "temp";

drop table "temp";
