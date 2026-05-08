-- Date functions

use sakila;

select * from customer;	

-- YYYY-MM-DD
select current_date();
select current_time();

select current_timestamp(), now();

select payment_id, payment_date, now() from payment;

select payment_id, payment_date, adddate(payment_date, -10) 
from payment;

-- use adddate(col, interval NUM hour/minute/second/month/year/day)
select payment_id, payment_date, adddate(payment_date, interval 2 minute) 
from payment;

-- difference between 2 days -> datediff(first_date, second_date)
select payment_id, datediff( now() , payment_date) from payment;

-- Extact
-- month function
select payment_id, payment_date, month(payment_date)
from payment;

-- date function
select payment_id, payment_date, date(payment_date)
from payment;

-- year function
select payment_id, payment_date, year(payment_date)
from payment;

SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');

-- filter
select payment_id, payment_date, second(payment_date)
from payment
where year(payment_date) <= 2005;

select payment_id, payment_date, month(payment_date)
from payment
where month(payment_date) = 7;

-- Extract method
select payment_date, extract( month from payment_date)
from payment;

select payment_date, extract( year from payment_date)
from payment;

select payment_date, extract( day from payment_date)
from payment;

select payment_date, extract( hour from payment_date)
from payment;

select payment_date, extract( minute from payment_date) 
from payment;

-- date_format





