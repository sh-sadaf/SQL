-- 1. List the number of films per category.
use sakila;
select c.name, count(f.title) as number_of_films
from category as c left join
film_category as fc on
c.category_id = fc.category_id
join film as f on
f.film_id = fc.film_id group by name;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address from staff as s
left join address as a 
using(address_id);

-- 3. Display the total amount rung up by each staff member in August 2005.
select staff_id, first_name, last_name, sum(amount) as total_amount, date_format(payment_date, "%Y") as year
from staff join payment 
using (staff_id) where date_format(payment_date, "%Y") = "2005" group by staff_id;

-- 4. List all films and the number of actors who are listed for each film.
select * from film; -- film_id
select * from film_actor; -- actor_id, film_id

select title, count(actor_id) as number_of_actors, count(film_id) as no_of_films 
from film join film_actor using (film_id) group by title;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select * from payment; -- customer_id
select * from customer; -- customer_id

select sum(amount) as amount_paid, last_name from customer
join payment using (customer_id) group by last_name order by last_name asc;




