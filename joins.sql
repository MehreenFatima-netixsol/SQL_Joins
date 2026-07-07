--Dispay Customer Name, Email, City, and Country
SELECT 
c.first_name || ' ' || c.last_name AS customer_name,
c.email,
ci.city,
co.country
FROM customer c
JOIN address a
  ON c.address_id = a.address_id
JOIN city ci
  ON a.city_id = ci.city_id
JOIN country co
  ON ci.country_id = co.country_id
ORDER BY customer_name;
--Display every payment with Customer Name, 
--Film Title, and Amount Paid.
SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    f.title,
    p.amount
FROM payment p
JOIN customer c
    ON p.customer_id = c.customer_id
JOIN rental r
    ON p.rental_id = r.rental_id
JOIN inventory i
    ON r.inventory_id = i.inventory_id
JOIN film f
    ON i.film_id = f.film_id
ORDER BY customer_name;
--Find the Top 10 Customers based on Total Amount Spent.
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;
-- Display each Film with its Category and Rental Rate.
SELECT
    f.title,
    cat.name AS category,
    f.rental_rate
FROM film f
JOIN film_category fc
    ON f.film_id = fc.film_id
JOIN category cat
    ON fc.category_id = cat.category_id
ORDER BY f.title;
-- Find all Actors who appeared in each Film.
SELECT
    f.title,
    a.first_name || ' ' || a.last_name AS actor_name
FROM film f
JOIN film_actor fa
    ON f.film_id = fa.film_id
JOIN actor a
    ON fa.actor_id = a.actor_id
ORDER BY f.title, actor_name;
-- Count how many Films belong to each Category.
SELECT
    c.name AS category,
    COUNT(fc.film_id) AS total_films
FROM category c
JOIN film_category fc
    ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY total_films DESC;
-- Which Categories generated the Highest Revenue?
SELECT
    c.name AS category,
    SUM(p.amount) AS total_revenue
FROM category c
JOIN film_category fc
    ON c.category_id = fc.category_id
JOIN film f
    ON fc.film_id = f.film_id
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
JOIN payment p
    ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY total_revenue DESC;
--Find Customers who rented more than 20 Films.
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(r.rental_id) AS rentals
FROM customer c
JOIN rental r
    ON c.customer_id = r.customer_id
GROUP BY c.customer_id, customer_name
HAVING COUNT(r.rental_id) > 20
ORDER BY rentals DESC;
--Which Cities generated the Highest Rental Revenue?
SELECT
    ci.city,
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c
    ON p.customer_id = c.customer_id
JOIN address a
    ON c.address_id = a.address_id
JOIN city ci
    ON a.city_id = ci.city_id
GROUP BY ci.city
ORDER BY total_revenue DESC;
--BONUS CHALLENGE
--WHICH ACTOR GENERATED THE HIGHEST REVENUE?
--ACTOR has no information about the payment so needs connection from other tables
Actor

↓

Film_Actor

↓

Film

↓

Inventory

↓

Rental

↓

Payment
--summing the payment and giving a group by Actor command would let us retrive the payment information
SELECT
    a.actor_id,
    a.first_name || ' ' || a.last_name AS actor_name,
    SUM(p.amount) AS total_revenue
FROM actor a
JOIN film_actor fa
    ON a.actor_id = fa.actor_id
JOIN film f
    ON fa.film_id = f.film_id
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
JOIN payment p
    ON r.rental_id = p.rental_id
GROUP BY a.actor_id, actor_name
ORDER BY total_revenue DESC
LIMIT 1;





