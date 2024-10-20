-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find all the bookings of a customer and also have the lodging name of their booking, and the price
SELECT "lodging"."name",
        "lodging"."region",
        "lodging"."nbr_rooms",
        "booking"."booking_checkin",
        "booking"."booking_checkout",
        "prices"."price",
         "booking"."nbr_people"
FROM "booking"
JOIN "lodging" ON  lodging.id = booking.lodging_id
JOIN "prices" ON prices.id = booking.price_id
WHERE "booking"."customers_id" = (
    SELECT "id" FROM "customers"
    WHERE "first_name" ='Jeff' AND "last_name" = 'Bezos'
    );


-- Find average ratings of a given lodging
SELECT ROUND(AVG("rating"),2) AS 'average'
FROM "ratings"
WHERE "booking_id" IN (
    SELECT "id"
    FROM "booking"
    WHERE "lodging_id" = (
        SELECT "id"
        FROM "lodging"
        WHERE "name" = "Four Seasons"
        )
);

-- Find all the availables date for a given lodging
SELECT "date"
FROM "availables"
WHERE "available" = 'yes' AND "lodging_id" = (
    SELECT "id"
        FROM "lodging"
        WHERE "name" = "Four Seasons"
        );


-- Add a new customer
INSERT INTO "customers" ("first_name", "last_name")
VALUES ('Carter', 'Zenke');

-- Add a new lodging
INSERT INTO "lodging" ("name", "region","nbr_rooms")
VALUES ('Hotel Tulip', 'Switzerland','7');

