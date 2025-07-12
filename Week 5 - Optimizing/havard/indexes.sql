CREATE INDEX "enrollement_index"
ON "enrollments" ("student_id","course_id");

CREATE INDEX "courses_index"
ON "courses" ("department","number","semester", "title");


CREATE INDEX "satisfied"
ON "satisfies" ("requirement_id","course_id");
