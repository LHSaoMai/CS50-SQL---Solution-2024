CREATE TABLE if not exists "code" (
    "phrase" INTEGER,
    "begin" INTEGER,
    "finish" INTEGER
    );

INSERT INTO "code" ("phrase", "begin", "finish")
VALUES (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);


CREATE VIEW "message" AS
SELECT substr("sentence",code.begin,code.finish) AS "phrase" FROM "sentences"
INNER JOIN "code" on sentences.id = code.phrase
WHERE "id" = code.phrase;
