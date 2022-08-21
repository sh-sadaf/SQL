use sakila;
-- 1. How many distinct (different) actors' last names are there?
SELECT 
    COUNT(DISTINCT last_name)
FROM
    actor; -- there are total 121 distinct actors last_names
    
-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT 
    COUNT(DISTINCT language_id)
FROM
    film; -- only in one language.
    
-- 3. How many movies were released with "PG-13" rating?

SELECT 
    COUNT(DISTINCT title)
FROM
    film
WHERE
    rating = 'PG-13'; -- 223 movies were released with PG-13 rating.
    
-- 4. Get 10 the longest movies from 2006.

SELECT 
    release_year, title, length
FROM
    film
WHERE
    length = (SELECT 
            MAX(length)
        FROM
            film)
        AND release_year = 2006
LIMIT 10; -- length of longest movies is 185.

-- 5. How many days has been the company operating (check DATEDIFF() function)?

SELECT 
    rental_date, DATEDIFF(MAX(rental_date), MIN(rental_date))
FROM
    rental; -- company operated for 266 days
    
-- 6. Show rental info with additional columns month and weekday. Get 20.

SELECT 
    DAYNAME(rental_date) AS week_day_rental,
    MONTH(rental_date) AS month_rental
FROM
    rental
LIMIT 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT 
    *,
    CASE
        WHEN DAYNAME(rental_date) = 'Saturday' THEN 'weekend'
        WHEN DAYNAME(rental_date) = 'Sunday' THEN 'weekend'
        ELSE 'workday'
    END AS day_type,
    DAYNAME(rental_date)
FROM
    rental;
    
-- 8.How many rentals were in the last month of activity?

SELECT 
    COUNT(rental_id)
FROM
    rental
WHERE
    EXTRACT(YEAR_MONTH FROM rental_date) = (SELECT 
            MAX(EXTRACT(YEAR_MONTH FROM rental_date))
        FROM
            rental); -- in last month 182 rentals were made. 

