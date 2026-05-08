show databases;

use sakila;

select concat(first_name, ' ', last_name) from customer;

select concat_ws('-', first_name, last_name) from customer;

select upper(first_name) from customer;

select lower(first_name) from customer;

select first_name, length(first_name), char_length(first_name) from customer;

select * from customer;

select create_date, length(create_date), char_length(create_date) from customer;

-- substr ( col, startIndex, character)
select email, substr(email, 3, 2) from customer;

select email, instr(email, '@') from customer;

select email, substr(email, instr(email, '@')) from customer;

select email, replace(email, '@', '$') from customer;


select length('🏃‍ Raja'), char_length('  Raja');

select char_length( trim(' Raja      ') ); -- trim white space on statring and ending

select lpad(first_name, 10, '#'), rpad(last_name, 10, '#') from customer;

select rpad(lpad(CONCAT_ws(' ', first_name, last_name), 20, '-'), 25, '-') from customer;