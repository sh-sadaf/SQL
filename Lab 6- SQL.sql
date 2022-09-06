use sakila;
-- 1. Add the new films to the database.
drop table if exists films_2020;
CREATE TABLE `films_2020` (
    `film_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `release_year` YEAR(4) DEFAULT NULL,
    `language_id` TINYINT(3) UNSIGNED NOT NULL,
    `original_language_id` TINYINT(3) UNSIGNED DEFAULT NULL,
    `rental_duration` INT(6),
    `rental_rate` DECIMAL(4 , 2 ),
    `length` SMALLINT(5) UNSIGNED DEFAULT NULL,
    `replacement_cost` DECIMAL(5 , 2 ) DEFAULT NULL,
    `rating` ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') DEFAULT NULL,
    PRIMARY KEY (`film_id`),
    CONSTRAINT FOREIGN KEY (`original_language_id`)
        REFERENCES `language` (`language_id`)
        ON DELETE RESTRICT ON UPDATE CASCADE
)  ENGINE=INNODB AUTO_INCREMENT=1003 DEFAULT CHARSET=UTF8;
show variables like 'local_infile';
set global local_infile = 1;
SELECT 
    *
FROM
    films_2020;
-- 2. Update information on rental_duration, rental_rate, and replacement_cost.
UPDATE films_2020 
SET 
    rental_duration = 3,
    rental_rate = 2.99,
    replacement_cost = 8.99;
