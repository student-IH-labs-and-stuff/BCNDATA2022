# order by 
use bank;
select * from trans
WHERE k_symbol='UROK' 
and operation <>''
order by date DESC,amount DESC; # create a partition 

# LIKE '%' string match - wildcard 
select * from district where 
A2 LIKE '%u%' or A2 LIKE 'U%';

select * from district where 
A2 LIKE '_____'; # 5 underscores -- 5 characters

-- Get transactions in the first 15 days of 1993.
select * from trans 
where 
#left(date,2) = '93' and
date <= '930115'
order by date; 

-- where REGEXP '' 

select A2 from district 
where A2 REGEXP '[uxy]';# looking for u x or y anywhere 
select A2 from district 
where A2 REGEXP 'pra?'; # these characters in order anywhere 
select A2 from district 
where A2 REGEXP '[:digit:]'; #check for numbers 


# group by - aggregate the data by .... something 
# count count distinct sum min max avg 
select min(amount), duration, status from loan 
group by duration, status;

#summarise orders by account
SELECT account_id, count(order_id) as noorders, 
round(sum(amount),2) as total
FROM bank.order
WHERE account_id in(173,96,97) # can use where for others
Group by account_id
HAVING count(order_id) >1 # with groupby use having on aggs
order by count(order_id) DESC;

# activity use sakila 
-- 1) Get the total rental revenue using the column amount 
-- from table payment. Display it as Total_revenue.
-- 2) Get the total rental revenue by customer_id 
-- sorted by total revenue in descending order. 
use sakila;
select *,customer_id,sum(amount) as total_revenue from payment
group by customer_id
order by total_revenue DESC;

# less flexible - more like SQL 
SET GLOBAL sql_mode = 'ONLY_FULL_GROUP_BY';
#SELECT @@GLOBAL.sql_mode;






