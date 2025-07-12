SELECT p.first_name, p.last_name, s.salary/perf.H as 'dollars per hit'
FROM "players" AS "p"
JOIN "salaries" AS "s" ON  p.id = s.player_id
JOIN "performances" AS "perf" ON perf.player_id = p.id
WHERE perf.H > 0
    AND s.year = 2001
    AND s.year = perf.year
ORDER BY "dollars per hit", p.first_name, p.last_name
LIMIT 10;
