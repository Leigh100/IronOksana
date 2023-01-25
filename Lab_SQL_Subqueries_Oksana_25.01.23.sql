use Sakila;

# 1. List all films whose length is longer than the average of all the films.
SELECT title FROM film
WHERE length >(SELECT avg(length) from film);

# 2. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT count(inventory_id) FROM inventory
WHERE film_id in (SELECT film_id FROM film
					WHERE title = 'Hunchback Impossible' );

# Old way
SELECT count(inventory_id) FROM inventory
JOIN film
USING (film_id)
WHERE title='Hunchback Impossible'
GROUP BY film_id;

# 3. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name FROM actor
WHERE actor_id in (SELECT actor_id from film_actor
				   WHERE film_id = (SELECT film_id from film
									WHERE title = 'Alone Trip'));
                                    
# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion.
# Identify all movies categorized as family films.
SELECT title from film
WHERE film_id in (SELECT film_id from film_category
				   WHERE category_id = (SELECT category_id from category
										WHERE category.name = 'Family'));
                                        
# 5. Get name and email from customers from Canada using subqueries.
# Do the same with joins. Note that to create a join, you will have to identify the correct tables 
# with their primary keys and foreign keys, that will help you get the relevant information.
SELECT first_name, last_name, email from customer
WHERE address_id in (SELECT address_id from address
					 WHERE city_id in (SELECT city_id from city
										WHERE country_id in (SELECT country_id from country
															 WHERE country = 'Canada')));

# Get name and email from customers from Canada using joins
SELECT first_name, last_name, email from customer
JOIN address
USING (address_id)
JOIN city
USING (city_id)
JOIN country
USING (country_id)
WHERE country= 'Canada'
GROUP BY first_name;

SELECT* from country;
                                       
# 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor
# that has acted in the most number of films. First you will have to find the most prolific actor 
# and then use that actor_id to find the different films that he/she starred.

Select first_name, last_name, count(film_id) as count_of_films_per_actor FROM actor
INNER JOIN film_actor
USING(actor_id)
GROUP BY actor_id
ORDER BY count_of_films_per_actor
DESC
LIMIT 1;

select title FROM film
WHERE film_id in (SELECT film_id FROM film_actor
WHERE actor_id LIKE (
select actor_id from actor
join film_actor
using(actor_id)
group by actor.actor_id
order by count(actor.actor_id) desc limit 1));
										


