# start with a simple join 2 tables 
# how many clients per district, compared to population
SELECT 
    COUNT(c.client_id) as noofclients, d.A2 AS districtname,
    d.A4 as population, round(COUNT(c.client_id)/d.A4,4)*100 as proportion
FROM
    district d
        JOIN # inner by default 
    client c ON d.A1 = c.district_id
GROUP BY A2,A4
order by proportion DESC;


# loans and accounts 
SELECT account_id, loan_id, duration, amount, frequency FROM loan
JOIN account 
USING(account_id); # shorthand when fk field name matches

# how many loans and the total amount of loans per district
SELECT d.A2 as districtname, 
count(a.account_id) as noofaccounts, 
count(l.loan_id) as noofloans, 
sum(l.amount) as totalloanamount
FROM loan l
JOIN account a
USING(account_id)
JOIN district d
ON d.A1 = a.district_id
group by d.A2;

# which accounts dont have loans?
select * from loan 
join account # prioritises account table 
using(account_id)
where loan_id is null;

# Get the number of accounts opened by district and year. 
#Name the columns as: District_name, Year and Accounts_opened. 
#Order the results by District_name and Year.
SELECT d.A2 as District_name, count(a.account_id) as Accounts_opened, 
concat('19',left(a.date,2)) as Year
FROM account a
join district d 
on a.district_id = d.A1
group by d.A2, Year
order by d.A2, Year;

# working with a bridge table- applying filter on OWNER
# no of people who own loans,per loan status 
SELECT count(c.client_id), l.status FROM client c
JOIN disp d
USING(client_id)
#JOIN account a
#USING(account_id)
JOIN loan l 
USING (account_id)
WHERE  d.type='OWNER'
GROUP BY l.status;
 
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
 PRIMARY KEY(book_id),
 KEY idx_fk_author(author_id),
 CONSTRAINT fk_author_id FOREIGN KEY(author_id)
 REFERENCES authors(author_id) ON DELETE RESTRICT ON UPDATE CASCADE
 );
  
# INSERT SOME DATA INTO FIRST TABLE 
INSERT INTO authors(name, country)
VALUES('HANS ROSLING','SWEDEN'), 
('C CRAIDO PEREZ','UK'),
('M GLADWELL', 'USA'),
('TIM HARTFORD', 'UK'),
('D MCCANDLESS', 'UK');

INSERT INTO books(author_id, book_name, category) 
VALUES (1,'factfulness','data'),
(2,'invisible women','data'),
(3,'blink','data'),
(3,'outliers','data'),
(4,'the data detective','data'),
(5,'information is beautiful','visualisation'),
(5,'data is beautiful','visualisation');

# update 
update books set book_name = 'Invisible Women' 
where book_id = 2; 

# example - changing author id is possible as fk, not pk
#update books set author_id = '1' 
#where book_id = 2; 

#simple join 
Select b.category, count(b.book_name) as no_books, 
count( distinct a.author_id) as no_authors 
from books b join authors a
using(author_id)
group by b.category;
#create denormalised view 
CREATE OR REPLACE VIEW authorsandbooks AS
select * from books join authors using(author_id); 







