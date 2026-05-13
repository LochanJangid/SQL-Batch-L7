use shadidb;

create table departments( 
dept_id int , 
dept_name varchar(20), 
location varchar(20)
);

insert into departments values(10, 'HR', 'Mumbai'),
(20, 'IT', 'Banglore'),
(30, 'Finance', 'Delhi');

select * from departments;
select * from employees;

-- find departments name which is in mumbai, banglore
select dept_name from departments where location='mumbai' or location='banglore';

-- find employee who's department located in mumbai or banglore
select * from employees
where department in 
(select dept_name from departments where location='mumbai' or location='banglore');

-- by [= any] operator
select * from employees
where department = any (select dept_name from departments where location in ('mumbai', 'banglore'));

-- Correlated subquery (most important for interviews)
-- 1. correlated subquery is a type of subquery where inner query executed for
-- 	  each value of the outer query
-- 2. inner query also reffer to the column of outer query



select * from employees as e
where salary> (select avg(salary) from employees where department=e.department);

-- find who have heighest salary of its deaprtemnt
select max(salary) from employees where department='HR';

select * from employees as e
where salary = (select max(salary) from employees where department=e.department);

-- find depatments where all employees earn above 70k
-- > all 
select distinct department from employees as e
where 70000 < all (select salary from employees where department=e.department);

