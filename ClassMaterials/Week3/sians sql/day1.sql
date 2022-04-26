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








