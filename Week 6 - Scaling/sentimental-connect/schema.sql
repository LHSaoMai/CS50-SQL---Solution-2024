CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(64),
    `last_name` VARCHAR(64),
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64),
    `type` ENUM('Primary', 'Secondary','Higher Education') NOT NULL,
    `location` VARCHAR(64),
    `year` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64),
    `industry` VARCHAR(64),
    `location` VARCHAR(64),
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `user_connection` INT,
    `school_id` INT,
    `school_start` DATE,
    `school_end` DATE,
    `degree` VARCHAR(10),
    `company_id` INT ,
    `start_company` DATE,
    `end_company` DATE,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
