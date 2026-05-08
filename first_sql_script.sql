
select current_user();
show databases;		-- will show kon konse databases hai?

use sakila;

show tables;	-- tables in the database

select * from customer;

-- 1 column access
select customer_id, first_name from customer;

select first_name, customer_id, first_name from customer;

select * from payment;
select payment_id, amount from payment; -- 2 column access

select customer_id, first_name, customer_id+10 from customer;  -- not seen changes in original
-- when we use select statment that will not effect to original table

select customer_id, CUSTOMER_ID+Customer_id/2-0.5 from customer; -- case insensitive

SELect customer_ID FROM CusToMer;


-- filter
select first_name, last_name from customer where customer_id=4;
select customer_id, email from customer where store_id=2;
select * from customer where last_name = 'WILLIS';


-- Today Leanings

-- show databases;
-- -- use database_name
-- show tables;

-- select * from table_name;
-- select col1, col2 from table_name;
	
-- select col1, col2 from table_name where col=condition;


