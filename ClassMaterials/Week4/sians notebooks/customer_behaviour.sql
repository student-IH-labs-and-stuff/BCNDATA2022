Drop View trans_status_date;

CREATE VIEW trans_status_date AS 
SELECT d.account_id, d.client_id, trans_id, t.amount, l.status,
convert(t.date,date) as date
from trans t
join loan l using(account_id)
join disp d using(account_id)
where d.type = 'OWNER'; 

select status, date, sum(amount), count(distinct trans_id), 
count(distinct client_id) 
from trans_status_date
group by status, date;

SELECT status,
(CASE WHEN status IN('A','C') THEN 'good' ELSE 'bad' END) AS statusgroup, date, SUM(amount), COUNT(distinct trans_id), count(client_id)
FROM trans_status_date
GROUP BY status, statusgroup, date;






