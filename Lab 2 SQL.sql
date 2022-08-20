use sakila;
select * from actor;
-- select all the actors with the first name "Scarlett"
select * from actor where first_name = "Scarlett";  -- 2 actors have this first_name.alter
-- Select all the actors with the last name ‘Johansson’
select * from actor where last_name = 'Johansson'; -- 3 actors have this as last_name
-- How many films (movies) are available for rent?
select * from rental;
select count(rental_id) from rental; -- 16044 movies are available for rent
-- How many films have been rented?
select count(rental_date) from rental; -- 16044 movies are rented
-- What is the shortest and longest rental period?
-- there are 2 ways to do it. one from film table and another from rental table.
select min(rental_duration) from film; -- smallest rental period is 3 days. 
select max(rental_duration) from film; -- longest rental period is 7 days. 
select min(datediff(return_date,rental_date)) as rental_period from rental; -- minimum of rental period is 0 or same day
select max(datediff(return_date,rental_date)) as rental_period from rental; -- maximum of rental period are 2 days.
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select * from film;
select min(length) as min_duration from film;  -- min_duration is 46
select max(length) as max_duration from film;  -- max_duration is 185
-- What's the average movie duration?
select avg(length) as avg_duration from film; -- average duration is 115.27
-- What's the average movie duration expressed in format (hours, minutes)?
select sec_to_time(avg(length*60)) as duration from film; -- avg duration in hours, minutes and seconds is 01:55:16.
-- How many movies longer than 3 hours?
 select count(length) from film where length > 180; --  39 movies have duration longer than 3 hours.
 -- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
 select * from customer;
 select first_name, left(first_name,1) + lower(substring(first_name,2, length(first_name))) from customer;
 select lower(email), upper(last_name) from customer;
 -- What's the length of the longest film title?
 select *from film;
 select title, length, length(title) from film where length(title) = (select max(length(title)) from film); -- length of longest film title is 147. title is ARACHNOPHOBIA ROLLerCoaster.
 