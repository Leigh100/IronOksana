USE sakila;
# 1. Write a query to display for each store its store ID, city, and country.
SELECT * from store; #store_id, address_id
SELECT * from address; # address_id, city_id
SELECT * from city; #city_id, country_id
SELECT * from country; #country_id
SELECT store_id, city, country from store
INNER JOIN address
USING (address_id)
INNER JOIN city
USING (city_id)
INNER JOIN country
USING (country_id)
GROUP BY store_id;

# 2. Write a query to display how much business, in dollars, each store brought in.
SELECT * from store; #store_id
SELECT * from staff; # store_id, address_id, staff_id
SELECT * from payment; # staff_id
SELECT sum(amount) as business from store
INNER JOIN staff
USING(store_id)
INNER JOIN payment
USING(staff_id)
GROUP BY (store_id);

# 3. What is the average running time(length) of films by category?
Select * from category; #category_id
Select * from film_category; #category_id, film_id
Select * from film; #film_id
SELECT category.name, AVG(length) from category
INNER JOIN film_category
USING (category_id)
INNER JOIN  film
USING (film_id)
GROUP BY category.name;

# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
SELECT category.name, AVG(length) from category
INNER JOIN film_category
USING (category_id)
INNER JOIN  film
USING (film_id)
GROUP BY category.name
ORDER BY AVG(length)
DESC;

# 5. Display the top 5 most frequently(number of times) rented movies in descending order.
Select * from film; #film_id
Select * from inventory; # film_id, inventory_id
Select * from rental; #inventory_id
SELECT title, count(rental_date) from film
INNER JOIN inventory
USING(film_id)
INNER JOIN rental
USING(inventory_id)
GROUP BY title
ORDER BY count(rental_date)
DESC
LIMIT 5;

#6. List the top five genres in gross revenue in descending order.
Select * from category; #category_id
Select * from film_category; #category_id, film_id
Select * from film; #film_id
Select * from inventory; # film_id, inventory_id
Select * from rental; # inventory_id, customer_id
Select * from payment; #customer_id

SELECT category.name, sum(amount) from category
INNER JOIN film_category
USING(category_id)
INNER JOIN inventory
USING(film_id)
INNER JOIN rental 
USING (inventory_id)
INNER JOIN payment
USING(customer_id)
GROUP BY category.name
ORDER BY sum(amount)
DESC