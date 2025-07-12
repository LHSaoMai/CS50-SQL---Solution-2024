SELECT "first_name", "last_name"
FROM "players"
WHERE "id" IN (
    SELECT p.id
    FROM "players" AS "p"
    JOIN "salaries" AS "s" ON  p.id = s.player_id
    JOIN "performances" AS "perf" ON perf.player_id = p.id
    WHERE perf.H > 0
        AND s.year = 2001
        AND s.year = perf.year
    ORDER BY s.salary/perf.H
    LIMIT 10
    )
AND "id" IN (
    SELECT p.id
    FROM "players" AS "p"
    JOIN "salaries" AS "s" ON  p.id = s.player_id
    JOIN "performances" AS "perf" ON perf.player_id = p.id
    WHERE perf.RBI > 0
        AND s.year = 2001
        AND s.year = perf.year
    ORDER BY s.salary/perf.RBI
    LIMIT 10
    )
ORDER BY "id"
