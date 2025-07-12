CREATE TABLE if not exists  "ingredients"   (
    "id" INTEGER,
    "ingredients" TEXT,
    "price" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE if not exists  "donuts"   (
    "id" INTEGER,
    "name" TEXT,
    "gluten" TEXT CHECK( "gluten" IN ('yes','no')),
    "id_ingredient" INTEGER,
    "ingredients" TEXT,
    FOREIGN KEY("id_ingredient") REFERENCES "ingredients"("id"),
    PRIMARY KEY("id")
);


CREATE TABLE if not exists  "orders"   (
    "order_number" TEXT,
    "donuts_id" INTEGER,
    "custumer_id" INTEGER,
    FOREIGN KEY("donuts_id") REFERENCES "donuts"("id")
    FOREIGN KEY("custumer_id") REFERENCES "custumer"("id")
);

CREATE TABLE if not exists  "customers"   (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "order_history" TEXT,
    FOREIGN KEY("order_history") REFERENCES "orders"("order_number")
);
