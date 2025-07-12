SELECT "districts"."name", "pupils" FROM "expenditures" LEFT JOIN "districts" ON "expenditures"."district_id" = "districts"."id";
