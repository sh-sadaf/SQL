use sakila;
-- 1. Create a table rentals_may to store the data from rental table with information for the month of May.
drop table if exists rentals_may;
CREATE TABLE `rentals_may` (
    `rental_id` INT UNIQUE NOT NULL,
    `rental_date` DATETIME DEFAULT NULL,
    `inventory_id` INT DEFAULT NULL,
    `customer_id` INT DEFAULT NULL,
    `return_date` DATETIME DEFAULT NULL,
    `staff_id` INT DEFAULT NULL,
    `last_update` DATETIME DEFAULT NULL,
    CONSTRAINT PRIMARY KEY (`rental_id`)
);
    
-- 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into rentals_may(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
select * from sakila.rental
where date_format(rental_date,'%M')= 'May';

-- 3. Create a table rentals_june to store the data from rental table with information for the month of June.

drop table if exists rentals_june;
CREATE TABLE `rentals_june` (
    `rental_id` INT UNIQUE NOT NULL,
    `rental_date` DATETIME DEFAULT NULL,
    `inventory_id` INT DEFAULT NULL,
    `customer_id` INT DEFAULT NULL,
    `return_date` DATETIME DEFAULT NULL,
    `staff_id` INT DEFAULT NULL,
    `last_update` DATETIME DEFAULT NULL,
    CONSTRAINT PRIMARY KEY (`rental_id`)
);

-- 4.Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into rentals_june(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
select * from sakila.rental
where date_format(rental_date,'%M')= 'June';

-- 5. Check the number of rentals for each customer for May.

SELECT 
    r.customer_id,
    COUNT(r.rental_id) AS no_of_rentals,
    c.first_name,
    c.last_name,
    DATE_FORMAT(r.rental_date, '%M') AS rental_month
FROM
    sakila.rentals_may AS r
        LEFT JOIN
    customer AS c ON c.customer_id = r.customer_id
GROUP BY customer_id
ORDER BY COUNT(r.rental_id) DESC;

-- 6. Check the number of rentals for each customer for June.
SELECT 
    r.customer_id,
    COUNT(r.rental_id) AS no_of_rentals,
    c.first_name,
    c.last_name,
    DATE_FORMAT(r.rental_date, '%M') AS rental_month
FROM
    rentals_june AS r
        LEFT JOIN
    customer c ON r.customer_id = c.customer_id
GROUP BY customer_id
ORDER BY COUNT(r.rental_id) DESC;
 

