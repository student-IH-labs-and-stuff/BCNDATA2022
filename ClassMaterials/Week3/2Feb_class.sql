SELECT 
	*
FROM
	bank.trans;
    
USE bank; #this is a comment 

SELECT 
COUNT(DISTINCT type)
FROM
    trans
    LIMIT 10;
    
#The select statement is used as a print command in SQL. Use the select statement to print "Hello World".
select 'hello world'; 

#Use the select statement to perform a simple mathematical calculation to add two numbers.
select 3*4;

#Get a list of all the district names in the bank database. A suggestion is to use the files_for_activities/case_study_extended here to work out which column is required here because we are looking for the names of places, not just the IDs. You should have 77 rows.
SELECT A2 as districtname, A3 as region_name from district as d LIMIT 30;
#Bonus: Revise your query to also show the Region, and limit the results to just 30 rows.

#ALIASING - as - for fields, tables 
SELECT 
    t.trans_id AS Transaction_id,
    t.account_id AS Account_id,
    t.date AS Dateoftrans,
    t.type AS Trans_Type
FROM
    trans as t;
    
# create fields - using queries - SELECT operator FROM
SELECT 
    *, ROUND((amount - payments) / 1000, 2) AS balance_k
FROM
    loan
WHERE
    status IN ('B' , 'D')
        AND payments > 8000
; 


# Calculate the urban population for all districts. Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. Return columns as district_name and urban_population.
SELECT A2 as district_name, round(A4*(A10/100),0) as urbanpopln 
FROM district
WHERE A10>50;

# On the previous query result - rerun it but filter out districts where the rural population is greater than 50%.


# big or bad loans  OR NOT NOT IN() IN() 
SELECT * FROM loan 
where 
amount > 250000
 OR status IN('B', 'D');
 
 #= != <> IN(), NOT IN() > < NOT AND NOT OR 
 # * / - + 

# not and not - order table, return all records not SIPO AMOUNT not UNDER 1000
# max min avg.      floor ceiling round.      log sqrt power 

SELECT MAX(amount), MIN(amount),ROUND(AVG(amount),3) from bank.order; 

# string functions concat upper lower left(,4) right(,4) 
# rtrim ltrim - whitespaces
# LIKE replace length 

select length('sian');

# order id + acc id concat 

SELECT *, CONCAT(order_id,' - ', account_id) as reference
 FROM bank.order;

SELECT  max(length(A2)) from district; # 19 

SELECT *, LEFT(A2,4), RIGHT(A2,4), CONCAT(LEFT(A2,4),RIGHT(A2,4)) from district where length(A2) = 19; # first 4, last 4 characters


#Refine your query from the last activity on loans whose contract finished and not paid back - filtered to loans where they were left with a debt bigger than 1000. Return the debt value together with loan id and account id.
SELECT loan_id, account_id, amount, payments, amount-payments as debt
FROM loan 
where status = 'B' 
and amount-payments>1000;

# Error Code: 1054. Unknown column 'debt' in 'where clause'

#Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).

select max(amount), min(amount) from trans
where amount <>0 ;

#Get account information with an extra column year showing the opening year as 'YYYY'. Eg., 970707 will show as 1997. Hint: Look at the first two characters of the string date in the account table. The output should display the fields: account_id, district_id, frequency, and 'Year' (YYYY format).

SELECT 
    *,
    (CASE 
        WHEN LEFT(date, 2) < 30 THEN CONCAT('20', LEFT(date, 2))
        ELSE CONCAT('19', LEFT(date, 2))
    END )
    AS yearopened
FROM
    account; 

# CONVERT .... DATE_FORMAT() 
# SUBSTRING_INDEX() 

# date is an int YYMMDD
SELECT 
    *,
    DATE_FORMAT(CONVERT( a.date , DATE), '%d/%m/%Y') AS opendate
FROM
    ACCOUNT AS a;
# date is a string with empty time    - card table
SELECT CONVERT(SUBSTRING_INDEX(issued,' ',1),DATE) 
AS issuedate from card;


# case statement to replace ABCD with business label

CREATE OR REPLACE View loan_statuses as 
SELECT loan_id, account_id,
CASE 
when status ='A' then 'good - finished'
when status = 'B' then 'bad - unpaid'
when status = 'C' then 'good - running' 
else 'default - running'
END 
as status_description
 FROM loan
 WHERE amount is not null ; 
 
# 5 BOOKS YOU HAVE READ + AUTHOR, AUTHOR COUNTRY

# DEFINE THE DATABASE AND 2 TABLES 
DROP DATABASE IF EXISTS books;
CREATE DATABASE books; 
USE books;
DROP TABLE IF EXISTS authors;
CREATE TABLE authors 
(author_id INT AUTO_INCREMENT NOT NULL,
 name VARCHAR(30), 
 country VARCHAR(20),
 PRIMARY KEY(author_id)
 );
 DROP TABLE IF EXISTS books;
 CREATE TABLE books
 (book_id INT AUTO_INCREMENT NOT NULL,
 author_id INT,
 book_name VARCHAR(50),
 category VARCHAR(20),
 PRIMARY KEY(book_id)
 );
  
# INSERT SOME DATA INTO FIRST TABLE 
INSERT INTO authors(name, country)
VALUES('HANS ROSLING','SWEDEN'), 
('C CRAIDO PEREZ','UK'),
('M GLADWELL', 'USA'),
('TIM HARTFORD', 'UK'),
('D MCCANDLESS', 'UK');


# continuing to query a single table 
use bank;
SELECT * FROM trans
order by amount ASC, date DESC;

# LIKE %  REGEX
select * from district 
where A3 LIKE '%Bohem%';

# top 3 - order by + limit 
select * from district 
order by A4 DESC limit 3;

select status_description, 
count(distinct loan_id) as noofloans, 
count(distinct account_id) as noofaccounts 
from 
loan_statuses 
group by status_description;

SELECT type, operation, date, count(*)
FROM bank.trans
group by type, operation, date ;

SELECT bank_to, account_id,
ceiling(avg(amount)) as avg_amnt,
count(*) as nooforders, 
ceiling(sum(amount)) as total_amnt,
max(amount) as biggest
FROM bank.order 
group by bank_to, account_id
order by biggest DESC
;


SET sql_mode = 'ONLY_FULL_GROUP_BY';
SELECT @@GLOBAL.sql_mode;

# Get the total rental revenue by customer_id sorted by total revenue in descending order.
SELECT customer_id, sum(amount) as revenue,
dense_rank() over( order by sum(amount) DESC) ranked_sales
FROM sakila.payment
where customer_id <> '144'
group by customer_id
having revenue > 100
#order by revenue DESC
limit 100 ;


# Error Code: 1054. Unknown column 'revenue' in 'where clause'
# Error Code: 1111. Invalid use of group function

# window functions 

#OVER() 
#PARTITION BY 
SELECT loan_id, duration,amount, status, 
avg(amount) over(partition by duration,status order by status) avg_amnt,
amount-(avg(amount) over(partition by duration,status)) as diff,
row_number() over(partition by status,duration order by status DESC) as row_no 
FROM loan 
order by diff DESC;


SELECT t.account_id, 
convert(t.date,date) as dateoftrans,
amount,
round(sum(amount) over(partition by account_id order by date),0) as cumbalance
 FROM bank.trans as t where account_id < 10;
 
 
Select
has_discount,
round(sum(order_amount) / sum(sum(order_amount) ) over(),2)  as gms_share,
round( sum(order_amount*fees_percentage) / sum(sum(order_amount*fees_percentage) ) over (), 2) as ar_share,
round( sum(order_amount-((order_amount*payment_cost_percentage)+shipping_cost_euro)) /
sum(sum(order_amount-((order_amount*payment_cost_percentage)+shipping_cost_euro))) over(),  2) as agm_share
from DATA
group by has_discount;


# Get the mean movie-length by rating in descending order of Mean_length.
-- 1.
select rating, round(avg(length),2) as 'Mean_length' from sakila.film
group by rating
order by Mean_length desc;
#Get the rating, title, length, Mean_rating_length and the film ranking partitioned by rating ordered in descending order of length.
-- 2.
use sakila;
select rating,
       title,
       length,
       avg(length) over(partition by rating) as 'Mean_rating_length',
       dense_rank() over(partition by rating order by length desc) as 'Ranking'
from sakila.film
order by rating, length ;

#REGEX for fuzzy matching  REGEXP_LIKE | REGEXP 
select distinct title from film
#where REGEXP_LIKE(title,'^P')  #- at beginning
# where REGEXP_LIKE(title,'er$') # - at end
# where REGEXP_LIKE(title,'phobia') # somewhere in the middle 
# where title REGEXP 'er$'  #- also at the end
# where title REGEXP 'hea|per' # OR clause 
# where title REGEXP '[x-z]' # any letters between x and z 
;






