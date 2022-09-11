-- 1. Write a query to display for each store its store ID, city, and country.
use sakila;

SELECT 
    store_id, country, city
FROM
    country
        JOIN
    city USING (country_id)
        JOIN
    address USING (city_id)
        JOIN
    store USING (address_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT 
    store_id,
    CONCAT('$', FORMAT(SUM(amount), 2)) AS busines_in_dollars
FROM
    payment
        JOIN
    staff USING (staff_id)
GROUP BY store_id;

-- 3. What is the average running time of films by category?
SELECT 
    name, AVG(length) AS average_running_time
FROM
    category
        JOIN
    film_category USING (category_id)
        RIGHT JOIN
    film USING (film_id)
GROUP BY name;

-- 4. Which film categories are longest?
SELECT 
    name, length
FROM
    category
        JOIN
    film_category USING (category_id)
        RIGHT JOIN
    film USING (film_id)
GROUP BY name
ORDER BY length DESC
LIMIT 1;

-- 5. Display the most frequently rented movies in descending order.
SELECT 
    COUNT(rental_id) AS rented_movies, title
FROM
    rental
        JOIN
    inventory USING (inventory_id)
        RIGHT JOIN
    film USING (film_id)
GROUP BY title
ORDER BY rented_movies DESC;

-- 6. List the top five genres in gross revenue in descending order.
SELECT 
    name AS genres, SUM(amount) AS gross_revenue
FROM
    category
        JOIN
    film_category USING (category_id)
        JOIN
    inventory USING (film_id)
        JOIN
    rental USING (inventory_id)
        JOIN
    payment USING (rental_id)
GROUP BY name
ORDER BY SUM(amount) DESC
LIMIT 5;

-- 7. Is "Academy Dinosaur" available for rent from Store 1?
SELECT 
    store_id, title
FROM
    store
        JOIN
    inventory USING (store_id)
        JOIN
    film USING (film_id);
    












