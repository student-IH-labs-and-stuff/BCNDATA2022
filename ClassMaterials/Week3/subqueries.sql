## subqueries 

# compare the loan amount against the average loan amount 
# inner query : 
select * from loan where amount >
(select avg(amount) from loan);
# which loan status has a mean loan 
# amount bigger than the overall mean loan amount?
select status, avg(amount) as avgloans
from loan 
group by status 
having avgloans>
(select avg(amount) from loan); 

#Find out the average of the number of transactions by account.
select ceil(avg(Transactions)) as Average from (
  select account_id, count(*) as Transactions from bank.trans
  group by account_id
) as s;

# whats the avg of (no of trans per account)
select round(avg(sub.nooftrans)) as avgof from 
(select account_id, count(trans_id) as nooftrans from trans
group by account_id) as sub;

select account_id, count(trans_id) as nooftrans from trans
group by account_id;

# 1) first i need to find out how many trans per account - 
# group by - account level
# 2) find the average of those 
# 3) could do it without subquery 

#example of nested - 3 + levels 
select account_id,frequency from account
join (select account_id, count(trans_id) as nooftrans from trans
group by account_id) as sub2
using(account_id)
 where
 sub2.nooftrans > (
select round(avg(sub.nooftrans)) as avgof from 
(select account_id, count(trans_id) as nooftrans from trans
group by account_id) as sub);


# all accounts, with status that has higher than average amount 
select account_id from account 
join loan using (account_id) 
where status in('C','D');
# the loans with statuses where we have higher than avg balance 
#1 get avg loan amount by status 
# 2 filter to statuses with higher avg 
# 3 get the status from that result 
# 4 get loans in those status 
select * from loan 
where status in 
(select status
from
(select status, avg(amount) as avgloans
from loan 
group by status 
having avgloans>
(select avg(amount) from loan)
 )
as s);


# Get a list of accounts from Central Bohemia using a subquery.
# account to district link 
select account_id from account where district_id in(
select A1 from district where A3='central Bohemia') 



