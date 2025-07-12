SELECT "city", COUNT("city") AS "number of cities" FROM "schools" WHERE "type" = 'Public School' GROUP BY "city" ORDER BY "number of cities" DESC, "city" LIMIT 10;
