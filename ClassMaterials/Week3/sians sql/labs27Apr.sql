SELECT avg(length)/60 FROM sakila.film;


-- 4
select floor(avg(length) / 60) as hours, round(avg(length) % 60) as minutes
from sakila.film;
select MOD(4000,60);
Select 115%60;

-- 8
select *, case 
when date_format(rental_date, '%W') 
in ('Saturday', 'Sunday')
          then 'weekend'
          else 'workday' end as day_type
from rental;

-- 6

select datediff(max(rental_date), min(rental_date)) as active_days
from rental;




-- Andy Coupe  12:32 PM
#selecting specific data
select * from actor;
select * from film;
select * from customer;
#extracting film titles:
select title from film;
#getting unique values  for language.name
select distinct language.name as language from language;
#count how many stores
select count(distinct store_id) from store;
#how many employees does the store have
select count(distinct staff_id) from staff;
#return a list of employees first name only:
select first_name from staff;


-- 9 
select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date))
from rental;

select count(*)
from rental
where date(rental_date) between date('2006-01-15') and date('2006-02-14');

select count(*) 
from rental where rental_date
>=( select max(rental_date)- INTERVAL 30 DAY
from rental);

select date_sub( max(rental_date), interval 30 DAY) from rental;

-- 2 How many films (movies) are 
-- available for rent and how many films have been rented?
Select count(distinct(inventory_id)) from rental
where return_date is not null and return_date <> ' ';
select count(distinct inventory_id) from rental;

select count(*) from film;
select count(*) from rental; 




