-- JOINS

-- Which film categories are longest on average? 
select name as category, avg(length) from category
join film_category using(category_id)
join film using(film_id)
group by name order by avg(length) DESC
limit 3; 

 -- Display the most frequently rented movies in descending order.
select count(rental_id) as frequency, title from rental 
join inventory using(inventory_id)
join film using(film_id)
group by title
order by frequency DESC;

-- SUBQUERIES 
# 5 Get name and email from customers from Canada using subqueries. 
# Do the same with joins.

Create view custloc as 
select [columns] from customer
join address using(address_id)
join city using(city_id)
join country using(country_id);


-- Get name and email from customers from Canada using subqueries. 
-- Do the same with joins.

select c.first_name, c.last_name, c.email from sakila.customer c
where c.customer_id in
(
select customer_id from customer
inner join address using(address_id) 
inner join city using(city_id) 
inner join country using(country_id)
where country = 'Canada'
)
;

select c.first_name, c.last_name, c.email, co.country from sakila.customer as c
join sakila.address as a
on c.address_id = a.address_id
join sakila.city as ci
on a.city_id = ci.city_id
join sakila.country as co
on ci.country_id = co.country_id
where country= 'Canada';

#better subquery: 
select c.first_name, c.last_name, c.email, country from customer as c
join sakila.address using(address_id)
join sakila.city using(city_id)
inner join (select * from country where country='Canada') can
using(country_id);

-- 
# Which are films starred by the most prolific actor? 
#Most prolific actor is defined as the actor that has
#  acted in the most number of films.

-- outer query 
#select films if actor IS .. film_ids
#join to film table to get titles
-- inner 
# select actor id from ... 
# select * where window function = 1 
-- inner 
# select actor - if that actor has acted in the most films 
# count(films) - group by actor 
# window function - rank or row number 
# order by no of films, and pick the biggest (limit 1) 

# or join to inner query as table 

select title from film 
join film_actor using(film_id)
join 
(select actor_id, count(film_id)
from film_actor
group by actor_id
order by count(film_id) DESC
LIMIT 1) af
using (actor_id); 

select title from film 
join film_actor using(film_id)
where actor_id 
=(
select actor_id from
(select actor_id, count(film_id)
from film_actor
group by actor_id
order by count(film_id) DESC
LIMIT 1) af
); 


-- Films rented by most profitable customer. 
-- You can use the customer table and payment table 
-- to find the most profitable customer ie the customer
--  that has made the largest sum of payments

select title from film
join inventory using(film_id)
join rental using(inventory_id)
where customer_id =(
select customer_id from
(select customer_id, sum(amount) from payment 
group by customer_id
order by sum(amount) DESC
limit 1) s );


select customer_id, sum(amount) from payment 
group by customer_id
order by sum(amount) DESC
limit 1;

-- 8 Get the client_id and the total_amount_spent of those clients
 -- who spent more than the average of the total_amount spent 
 -- by each client.
 
 select customer_id, sum(amount) 
 from payment
 group by customer_id having sum(amount)>
 (select avg(amnt) from
 (select customer_id, sum(amount) as amnt  from payment
 group by customer_id) s);
 