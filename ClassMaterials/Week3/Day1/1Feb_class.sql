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

CREATE View loan_statuses as 
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




