use bank;
SELECT account_id as id, amount as amnt, 
balance as bal # specific cols or *
, amount-balance # arbitrary sum
as difference # give it an alias
FROM trans # the table
ORDER BY amnt DESC #default is ASC - type DESC if wanted
LIMIT 10; #pick top 10

# count the number of records in a table 
SELECT count(*) FROM trans; #countd() count(distinct )

SELECT 
count(distinct account_id) as countofaccts 
FROM trans;

SELECT distinct operation from trans; #unique values 

SELECT count(distinct operation) from trans; #count unique values

#Use an appropriate select statement to retrieve a list of unique card types from the bank database, table card. (Hint: You can use the DISTINCT function here.)
SELECT distinct card.type FROM card;
#Get a list of all the district names in the bank database. A suggestion is to use the files_for_activities/case_study_extended here to work out which column is required here because we are looking for the names of places, not just the IDs. You should have 77 rows
SELECT A2 FROM district;
#Bonus: Revise your query to also show the Region, and limit the results to just 30 rows.
SELECT A2 as districtname,
A3 as regionname 
FROM district
limit 30;

#Get all the types of the card as 
#type_of_card and the issue date 
#as issue_date from card client
# and alias the table bc
select type as type_of_card, 
issued as issue_date 
from card as bc;

# operators and logical clauses 

# + - * /
# =     >= <=       !=  <> 
# WHERE 

# from the bank loan, get loan_id and amount in thousands
SELECT loan_id, amount/1000 as amountk from loan;

# only loans where status is A or B
SELECT * FROM loan
WHERE status in('A','B');# either A or B

SELECT * FROM loan
WHERE status ='A' OR status='B';

SELECT * FROM loan
WHERE status not in('A','B'); # is not either A or B

SELECT * FROM loan
WHERE status <>'B' AND status <>'A'; # is neither B or A

# lets add an AND to our WHERE 
# all loans with status B and amount > 100,000
SELECT * FROM loan
WHERE status ='B' AND amount > 100000 AND duration <=24
ORDER BY amount DESC; #biggest at the top 
# +duration less or equal 24 months

# the biggest + smallest loan amount
SELECT max(amount), min(amount) FROM loan;
# average order amount 
SELECT round(avg(amount),3), ceiling(avg(amount)),
 floor(avg(amount)) from bank.order; 
 
 # useful string functions - LOWER UPPER LENGTH CONCAT LEFT RIGHT LTRIM RTRIM
 SELECT A2, LEFT(A2,5) FROM district;
 
 SELECT LTRIM('   Praha'); #trim all white space from left 
 
 #Select districts and salaries (from the district table) 
 #where salary is greater than 10000. 
 #Return columns as district_name and average_salary.
 
 SELECT A2 AS district_name, A11 as avg_salary
 FROM district 
 WHERE A11 > 10000;

 
 #Select those loans whose contract is finished and not paid back.
 #Return the debt value from the status you identified in the last activity,
 #together with loan id and account id.
 SELECT loan_id, account_id, amount-payments as debt 
 FROM loan where status= 'B';
#Calculate the urban population for all districts. 
#Hint: You are looking for the number of inhabitants 
#and the % of urban inhabitants in each district. 
#Return columns as district_name and urban_population.

SELECT ROUND((A4*A10)/100) AS urbanpop, A2 as districtname from district
where A10 <= 50;

#On the previous query result - 
#rerun it but filter out districts where the rural 
#population is greater than 50%.

# dates CONVERT(int,date), SUBSTRING_INDEX(), DATE_FORMAT(%Y)
SELECT *, convert(account.date,date) as mydate FROM bank.account;
SELECT *, convert(substring_index(card.issued,' ',1),date) as newdate 
FROM bank.card;
SELECT *, 
date_format(convert(loan.date,date),'%Y-%m-%d') as newdate,
date_format(convert(loan.date,date),'%Y-%m') as yearmonth
FROM loan;

# nulls function isnull() and where is not null() or where is null()
SELECT sum(isnull(loan_id)) from loan;
SELECT * FROM loan where loan_id is null;

# case - we have done in tableau - loan table - replace ABCD with definitions
#structure is :
#CASE 
#WHEN 
#THEN 
#ELSE 
#END 

SELECT *,
CASE status
WHEN 'A' THEN 'GOOD-PAID OFF'
WHEN 'B' THEN 'ENDED-Not paid'
WHEN 'C' THEN 'GOOD-RUNNING'
ELSE 'RUNNING-missed payment'
END AS description
from loan;
