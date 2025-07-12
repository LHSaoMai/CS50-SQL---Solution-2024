
-- *** The Lost Letter ***
-- The id for 900 Sommerville Avenenue is 432 '900 Somerville Avenue'
-- SELECT * FROM "addresses" WHERE "address" LIKE '900 Somerville Avenue';

-- the congratulation letter was send to the address id 854, the id of the package 384
--SELECT "id" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" LIKE '900 Somerville Avenue') AND "contents" = 'Congratulatory letter';

-- What happen to the package - where the package was dropped ?
--SELECT * FROM "scans" WHERE "package_id" = (SELECT "to_address_id" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" LIKE '900 Somerville Avenue') AND "contents" = 'Congratulatory letter');
-- *** The Forgotten Gift ***

-- The whole code
SELECT * FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages"
        WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" LIKE '900 Somerville Avenue')
        AND "contents" = 'Congratulatory letter')
        AND "action" = "Drop");


-- *** The Devious Delivery***

--SELECT * FROM "packages" LEFT JOIN "addresses" ON "packages"."from_address_id" = "addresses"."id" WHERE "packages"."contents"='Undisclosed';
-- Which package don't have a from address - contain t Duck debugger - id of the package 5098
--SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL;
-- Where it ends up ? adress_id = 348 the deliver trop the package there
--SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL) AND "action" = 'Drop';
-- what is the address ?
SELECT * from "addresses" WHERE "id" =
            (SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL) AND "action" = 'Drop');


-- *** The Forgotten Gift***
-- The id code address from the granddaughter is 4983 and 9873 for the grandman
--SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street';
-- find the package id 9523 - the contents is Flowers
-- SELECT "id" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street');
-- Find what happen with the packages - so deliver to the wrong address and the deliver pick it up again to deliver it to the right address - now id address - 7432
--SELECT "driver_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')) AND "id" = '12432';

--OPTIONAL : Show the address - it is at the wharehouse
--SELECT * from "addresses" WHERE "id" = (SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')) AND "id" = '12432');
--Who has the package ? Dirver 17
SELECT * FROM "drivers" WHERE "id" =
        (SELECT "driver_id" FROM "scans"
            WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'))
             AND "id" = '12432');

