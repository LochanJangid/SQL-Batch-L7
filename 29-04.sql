use sakila;

select * from employees;

select first_name, salary
from employees
order by salary;

select distinct(salary), first_name from employees;
select first_name, distinct(salary) from employees;

-- calculate on our data => aggregate function

select count(department) from employees;

select count(distinct district) from address;

select salary, count(salary) from employees;
-- you can't use directly column if you use any aggregate function

INSERT INTO employees VALUES
(999, 'lochan', 'Smith', 'alice.dd@gmail.com', 'IT', 'Software Engineer', 85000.00, '2019-03-15', '1990-06-20', '555-1001', 'New York', 'USA', 'Y');
select max(salary), sum(distinct salary), sum(salary), min(salary), avg(salary) from employees;


