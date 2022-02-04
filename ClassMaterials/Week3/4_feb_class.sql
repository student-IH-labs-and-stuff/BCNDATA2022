# VIEW - for each transaction, and account, the year and month - user_activity 
# VIEW - then for each month, unique account holders who did something - monthly-active-users
# VIEW use our lag to add to the VIEW - monthly active users with prev
# modify to include % change MoM 

create or replace view user_activity as 
select account_id,
date_format(convert(date,date),'%m') as activitymonth,
date_format(convert(date,date),'%y') as activityyear
from trans;

create or replace view monthly_active_users as 
select activitymonth, activityyear, count(distinct account_id)as active_users
from user_activity
group by activitymonth,activityyear
order by activityyear, activitymonth ;

create or replace view monthly_users_prev as
select *, lag(active_users,1) OVER() as prev_month
from monthly_active_users;
#+ perc change MoM column

select *, round(((active_users-prev_month)/prev_month)*100,2) as pctdiff, 
active_users-prev_month as diff
from monthly_users_prev
where prev_month is not null ;







