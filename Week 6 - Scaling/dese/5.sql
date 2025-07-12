SELECT "city" , COUNT("city") AS "number of cities" FROM "schools" GROUP BY "city"
    HAVING "type" = 'Public School' AND "number of cities" <= 3 ORDER BY "number of cities" DESC, "city";
