# 1. Which actor has appeared in the most films?
# Hint:  group by actor_id

USE sakila;
SELECT * from actor;
SELECT * from film_actor;
Select first_name, last_name, count(film_id) as count_of_films_per_actor FROM actor
LEFT JOIN film_actor
USING(actor_id)
GROUP BY actor_id
ORDER BY count_of_films_per_actor
DESC
LIMIT 1;

# 2. Most active customer (the customer that has rented the most number of films)

Select first_name, last_name, count(rental_id) as count_of_rent_movies_per_customer FROM customer
LEFT JOIN rental
USING(customer_id)
GROUP BY customer_id
ORDER BY count_of_rent_movies_per_customer
DESC
LIMIT 1;

# 3. List number of films per category.
Select * from category;
Select * from film_category;
Select name, count(category_id) as counts_of_films_per_category from category
Left join film_category
USING(category_id)
GROUP BY name;

# 4. Display the first and last names, as well as the address, of each staff member.
Select * from staff;
Select * from address;
SELECT first_name, last_name, address.address from staff
Left join address
USING (address_id)
GROUP BY address_id;

# 5. get films titles where the film language is either English or italian, and whose titles starts with 
# letter "M" , sorted by title descending.
Select * from language;
Select * from film;
Select title, language.name from film
INNER JOIN language
USING (language_id)
WHERE title LIKE "M%" AND language.name = 'English' OR language.name='Italian'
ORDER BY name;

# 6. Display the total amount rung up by each staff member in August of 2005.
Select * from staff;
Select * from payment;
SELECT first_name, last_name, SUM(payment.amount) as rung from staff
LEFT JOIN payment
USING(staff_id)
WHERE payment_date LIKE '2005-08%'
GROUP BY staff_id
ORDER BY rung
DESC;

# 7. List each film and the number of actors who are listed for that film.
SELECT * from film;
SELECT * from film_actor;
SELECT title, COUNT(actor_id) as count_of_actors from film
INNER JOIN film_actor
USING (film_id)
GROUP BY film_id
ORDER BY count_of_actors
DESC
LIMIT 10;

# 8. Using the tables payment and customer and the JOIN command, list the total paid by each customer.
# List the customers alphabetically by last name.
SELECT * from payment;
SELECT * from customer;
SELECT first_name, last_name, SUM(amount) as total_paid from customer
INNER JOIN payment
USING (customer_id)
GROUP BY (customer_id)
ORDER BY last_name;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT * from actor;
SELECT * from film_actor;
Select first_name, last_name, count(film_id) as count_of_films_per_actor FROM actor
LEFT JOIN film_actor
USING(actor_id)
GROUP BY actor_id
ORDER BY count_of_films_per_actor;

# 10. get the addresses that have NO customers, and ends with the letter "e"
SELECT * from customer;
SELECT * from address;
SELECT address.address from address
LEFT JOIN customer
USING (address_id)
WHERE customer_id is null AND address.address like '%e'
GROUP BY address;

