SELECT d.name AS "district", s.name AS "schools" , g.dropped FROM "graduation_rates" AS "g"
    JOIN "schools" AS "s"
    ON d.id = g.school_id
    JOIN "districts" AS "d"
    ON d.id = s.district_id
ORDER BY g.dropped DESC, d.name,s.name;
