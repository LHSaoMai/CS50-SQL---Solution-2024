-- SELECT AVG("per_pupil_expenditure") FROM "expenditures";
-- SELECT AVG("exemplary") FROM "staff_evaluations";
SELECT "districts"."name",
    "expenditures"."per_pupil_expenditure","staff_evaluations"."exemplary"
FROM "expenditures"
JOIN "districts" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "expenditures"."district_id"
WHERE "expenditures"."per_pupil_expenditure" >= (SELECT AVG("per_pupil_expenditure") FROM "expenditures")
    AND "staff_evaluations"."exemplary" >=(SELECT AVG("exemplary") FROM "staff_evaluations");
