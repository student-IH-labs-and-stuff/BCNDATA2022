use bank;

# how many clients per district? 

SELECT d.A2 as districtname, d.A3 as regionname, count(distinct c.client_id) as noofclients
FROM district d #left table
LEFT JOIN client c #right table and join type 
ON d.A1 = c.district_id # join clause(s)
-- USING() if the fields are named the same 
group by d.A2, d.A3;

SELECT * from district 
LEFT JOIN client 
ON district.A1 = client.district_id;

#how many loans and avg(amount) per account?
SELECT a.account_id, a.date, count(l.loan_id), avg(l.amount)
FROM loan l # left table
INNER JOIN account a  # right table
USING(account_id) # join clause 
group by a.account_id, a.date; #aggreg process

# Activity - join 2 tables 
-- Get a list of districts ordered by the number of clients (descending order). 
-- Name the columns as: District_name and Number_of_clients respectively.
SELECT d.A2 as District_name, count(c.client_id) as Numberofclients
FROM district d
JOIN client c
ON d.A1 = c.district_id
GROUP BY d.A2
ORDER BY Numberofclients DESC;

SELECT d.A2 as DistrictName, COUNT(distinct c.client_id) as NumberofClients
FROM DISTRICT d
JOIN CLIENT c
ON d.A1=c.district_id
GROUP BY d.A2
order by NumberofClients DESC;

-- Get a list of regions ordered by the number of clients (descending order). 
-- Name the columns as: Region_name and Number_of_clients respectively.
SELECT d.A3 as RegionName, COUNT(c.client_id) as NumberofClients
FROM DISTRICT d
JOIN CLIENT c
ON d.A1=c.district_id
GROUP BY d.A3
order by NumberofClients DESC;

-- Get the number of accounts opened by district and year. 
-- Name the columns as: District_name, Year and Accounts_opened. 
-- Order the results by District_name and Year.
SELECT d.A2 as District_name, date_format(a.date,'%Y') As Year,
count(a.account_id) as Accounts_opened
from district d
join account a
on d.A1=a.district_id
GROUP BY d.A2, date_format(a.date,'%Y') 
ORDER BY d.A2, date_format(a.date,'%Y');

# example where left and right matters
select * from loan
right join account
using(account_id);

# join = inner join in mysql 

# what about joining more than 2 tables loan- account - district 
# how many loans, clients, accounts per region 
SELECT d.A3 as region, 
count(l.loan_id) as noofloans, 
count(dp.account_id) as noofaccounts,
count(c.client_id) as noofclients
FROM loan l
INNER JOIN account a using(account_id)
INNER JOIN disp dp using(account_id)
INNER JOIN client c using(client_id)
INNER JOIN district d ON c.district_id = d.A1
WHERE dp.type='OWNER'
GROUP BY A3;


-- activity 
#Extend the query below and list district_name, client_id, 
# and account_id for those clients who are the owner of the account. 
#Order the results by district_name:
select * from bank.disp as d
join bank.client as c
on d.client_id = c.client_id
join bank.district as da
on da.A1 = c.district_id;

select da.A2 as districtname,c.client_id, d.account_id 
from bank.disp d
join bank.client c USING(client_id)
join bank.district da on c.district_id=da.A1
WHERE d.type='OWNER'
ORDER BY da.A2;









# get the biggest and smallest trans with trans id 



 







SELECT d.A2 as DistrictName, LEFT(a.date,2) as Year,
date_format(date,'%Y') as Year2,
COUNT(distinct a.account_id) as AccountsOpened
FROM DISTRICT d
JOIN account a
ON d.A1=a.district_id
GROUP BY d.A2, LEFT(a.date,2), date_format(date,'%Y')
order by d.A2, LEFT(a.date,2) DESC;

