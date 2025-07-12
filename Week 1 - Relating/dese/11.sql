SELECT DISTINCT s.name AS "school name",
                g.graduated,
                e.pupils
FROM "expenditures" AS "e"
JOIN "schools" AS "s" ON s.district_id = e.district_id
JOIN "graduation_rates" AS "g" ON g.school_id = s.id
ORDER BY e.pupils DESC, e.pupils, s.name;
