-- SELECT "district_id", AVG("per_pupil_expenditure") AS 'Average District Per-Pupil Expenditure' FROM "expenditures" GROUP BY "district_id";

--SELECT"districts"."id",  "name" FROM "districts" RIGHT JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id";

--SELECT "district_id", AVG("per_pupil_expenditure") AS 'Average District Per-Pupil Expenditure' FROM "expenditures" GROUP BY "district_id"
       -- LEFT JOIN (SELECT"districts"."id",  "name" FROM "districts" RIGHT JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id")
           -- ON "expenditures"."district_id"="districts"."id";
