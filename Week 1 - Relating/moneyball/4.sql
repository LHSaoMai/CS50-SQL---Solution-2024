SELECT p.first_name,
        p.last_name, s.salary
FROM "players" as "p"
JOIN "salaries" as "s" ON s.player_id = p.id
WHERE s.year = 2001
ORDER BY s.salary, p.first_name, p.last_name
LIMIT 50;
