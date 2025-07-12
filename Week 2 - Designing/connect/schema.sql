CREATE TABLE if not exists  "users"   (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")

);

CREATE TABLE if not exists  "schools"   (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year_foundation" TEXT,
    PRIMARY KEY("id")

);

CREATE TABLE if not exists  "companies"   (
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")

);


CREATE TABLE if not exists  "connections"   (
    "id" INTEGER,
    "users_id" INTEGER,
    "id_school" INTEGER,
    "start_school" TEXT,
    "end_school" TEXT,
    "degree_school" TEXT,
     "id_company" INTEGER,
    "start_company" TEXT,
    "end_company" TEXT,
    "title_company" TEXT,
    PRIMARY KEY("id")
    FOREIGN KEY("users_id")  REFERENCES "users"("id")
    FOREIGN KEY("id_school") REFERENCES "schools"("id")
    FOREIGN KEY( "id_company") REFERENCES "companies"("id")

);
