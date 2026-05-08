show databases;

use sakila; -- to access database

show tables;

select * from customer;

select first_name, customer_id from customer;

-- where cluase => to filter
select first_name, customer_id from customer where customer_id <= 5;

select first_name, last_name, customer_id from customer where first_name = 'lisa';

SELECT * FROM customer WHERE customer_id BETWEEN 5 AND 1000;

SELECT * FROM customer WHERE customer_id BETWEEN -2 AND 2;

-- no output
SELECT * FROM customer WHERE customer_id BETWEEN 5 AND 2;

-- in = > specific values
SELECT * FROM customer WHERE customer_id in (2, 5);

select * from customer where first_name in ('LISA', 'PATRiCIA');


select * from customer where first_name between 'LISA' and 'PATRiCIA';

select * from customer where first_name in ('LISA', 10);

select * from customer where address_id between 1 and 6;

select * from customer where customer_id= 2 or customer_id >= 7;

select * from customer where first_name = 'marion' or store_id = 2;

select * from customer where first_name = 'marion' and store_id = 2;
select * from customer where first_name = 'marion' and store_id = 2;


-- precedence AND -> OR
select * from customer where
first_name = 'marion' or store_id=2 and store_id=54337;