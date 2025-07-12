SELECT p.first_name,
        p.last_name,
        s.salary,
        perf.HR,
        perf.year
FROM "players" as "p"
JOIN "salaries" AS "s" ON s.player_id = p.id
JOIN "performances" AS "perf" ON perf.player_id = p.id
WHERE s.year = perf.year
ORDER BY p.id, s.year DESC, perf.HR DESC;
