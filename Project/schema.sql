--n this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represent lodging supply
CREATE TABLE if not exists "lodging" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "region" TEXT NOT NULL,
    "nbr_rooms" NUMERIC NOT NULL,
    "enter_data" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "exit_data" TEXT,
    PRIMARY KEY("id")
);

-- Represent customers first_name etc. and if they create some accounts
CREATE TABLE if not exists "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT, -- if the client create an account
    "enter_data" TEXT, -- if the client create an account
    "password" TEXT, -- if the client create an account
    PRIMARY KEY("id")
);

-- Represent the price of the lodging at a date T
CREATE TABLE if not exists "prices" (
    "id" INTEGER,
    "lodging_id" INTEGER NOT NULL,
    "price" NUMERIC,
    "date" TEXT,
    PRIMARY KEY("id")
);


-- Represent the booking
CREATE TABLE if not exists "booking" (
    "id" INTEGER,
    "customers_id" INTEGER NOT NULL,
    "lodging_id" INTEGER NOT NULL,
    "booking_checkin" TEXT NOT NULL,
    "booking_checkout" TEXT,
    "price_id" INTEGER NOT NULL,
    "nbr_people" INTEGER NOT NULL,
    "delete" INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY("id"),
    FOREIGN KEY("customers_id") REFERENCES "customers"("id"),
    FOREIGN KEY("lodging_id")  REFERENCES "lodging"("id"),
    FOREIGN KEY("price_id") REFERENCES "prices"("id")


);

-- Represent the rating of each booking
CREATE TABLE if not exists "ratings" (
    "id" INTEGER,
    "booking_id" INTEGER NOT NULL,
    "customers_id" INTEGER NOT NULL,
    "rating" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("customers_id") REFERENCES "customers"("id")
    FOREIGN KEY("booking_id") REFERENCES "booking"("id")
);

-- Represent the availablity for each lodging
CREATE TABLE if not exists "availables" (
    "id" INTEGER,
    "lodging_id" INTEGER NOT NULL,
    "date" INTEGER NOT NULL,
    "available" TEXT NOT NULL CHECK("available" IN ('yes','no')),
    PRIMARY KEY("id"),
    FOREIGN KEY("lodging_id") REFERENCES "lodging"("id")
);


-- Create indexes to speed common searches
CREATE INDEX "booking_seach" ON "booking" ("customer_id");
CREATE INDEX "customers_search" ON "customers" ("first_name","last_name");
CREATE INDEX "lodging_name" ON "lodging" ("name");
CREATE INDEX "rating_search" ON "ratings" ("booking_id","lodging_id");
CREATE INDEX "availables_search" ON "availables" ("lodging_id");

