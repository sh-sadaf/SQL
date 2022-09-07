use sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated? 
SELECT 
    *
FROM
    actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once?
SELECT 
    *
FROM
    actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT 
    staff_id, COUNT(DISTINCT rental_id)
FROM
    rental
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year.

SELECT 
    release_year, COUNT(DISTINCT title)
FROM
    film
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there.

SELECT 
    rating, COUNT(DISTINCT title)
FROM
    film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT 
    rating, ROUND(AVG(length), 2), COUNT(DISTINCT title)
FROM
    film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT 
    rating, ROUND(AVG(length), 2)
FROM
    film
GROUP BY rating
HAVING ROUND(AVG(length), 2) > 120;