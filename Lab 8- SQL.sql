use sakila;
-- Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
select title, length, rank() over (order by length desc) as length_rank from film where length is not null and length > 0;

-- Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
select title, length, rating, rank() over(partition by rating order by length desc) as length_rank from film where length is not null and length > 0;

-- How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
SELECT 
    c.name, COUNT(f.film_id)
FROM
    sakila.category c
        JOIN
    sakila.film_category f ON c.category_id = f.category_id
GROUP BY c.name;

-- Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
SELECT 
    a.first_name, COUNT(a.first_name) AS count
FROM
    actor a
        JOIN
    film_actor f ON a.actor_id = f.actor_id
GROUP BY a.actor_id , a.first_name
ORDER BY COUNT(a.first_name) DESC
LIMIT 1;

-- Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer
SELECT 
    c.first_name, COUNT(r.rental_id)
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY first_name
ORDER BY COUNT(r.rental_id) DESC
LIMIT 1;

-- Bonus Question: Which is the most rented film? (The answer is Bucket Brotherhood).
SELECT 
    COUNT(r.rental_id), f.title
FROM
    rental r
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film f ON i.film_id = f.film_id
GROUP BY title
ORDER BY COUNT(r.rental_id) DESC
LIMIT 2;




