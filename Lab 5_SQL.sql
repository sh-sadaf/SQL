use sakila;
-- 1.Drop column picture from staff.
alter table staff
drop column picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT 
    *
FROM
    customer
WHERE
    first_name REGEXP 'tammy';
insert into staff values(3, "Tammy", "Sander",79, "TAMMY.SANDERS@sakilacustomer.org",2,1,"Tammy", " ","2006-02-15 04:57:20");

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
SELECT 
    customer_id
FROM
    sakila.customer
WHERE
    first_name = 'CHARLOTTE'
        AND last_name = 'HUNTER';-- to get customer_id
SELECT 
    film_id
FROM
    film
WHERE
    title = 'Academy Dinosaur';-- to get film_id
SELECT 
    staff_id
FROM
    staff
WHERE
    first_name = 'Mike';-- to get staff_id
SELECT 
    *
FROM
    inventory
WHERE
    film_id = 1 AND store_id = 1; -- to get inventory_id
-- finally inserting all data into rental table, 
insert ignore into rental values(null, current_timestamp(), 1, 130, "2022-08-26 04:57:20" ,1, current_timestamp());
-- inert ignore has been used for incremental rental_id.
 
-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. 
-- Follow these steps:
-- 4.1 Check if there are any non-active users
-- I assume that customers having active status as 0 are inactive users. 
SELECT 
    COUNT(*)
FROM
    customer
WHERE
    active = 0;-- 15 users are non-active users.
    
-- 4.2 Create a table backup table as suggested
CREATE TABLE deleted_users (
    customer_id INT UNIQUE NOT NULL,
    email VARCHAR(55) DEFAULT NULL,
    date DATE DEFAULT NULL,
    CONSTRAINT PRIMARY KEY (customer_id)
);

alter table deleted_users 
modify column email varchar(255), modify column date datetime; -- columns datatypes have been altered as it was getting error with previously set datatype.

--  4.3 Insert the non active users in the table backup table
insert into deleted_users(customer_id, email, date)
select customer_id,email,create_date from customer where active = 0;-- it is not clear in question that which date we have to transfer, but I just choose create_date.
SELECT 
    *
FROM
    deleted_users; -- 15 non-active users have been moved in deleted_users table.
    
-- 4.4 Delete the non active users from the table customer
set foreign_key_checks = off;-- it is required as forign-key_constraint is not letting any kind of deletion from customer table. 
DELETE FROM customer 
WHERE
    active = 0;
set foreign_key_checks=on;

