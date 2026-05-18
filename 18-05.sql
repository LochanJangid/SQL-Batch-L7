drop database windowsdb;
create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      72000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2021),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);

select * from employees;
select *, sum(salary) over() from employees;
select *, sum(salary) over(order by salary) from employees;

-- partition by -> grouping similar values
select *, sum(salary) over(partition by department),
sum(salary) over() from employees;

select *, sum(salary) over(partition by name) from employees;

select *, sum(salary) over(partition by manager_id) from employees;

-- Running sum on departments
select *, sum(salary) over(partition by department order by salary) from employees;

select name, dept, salary, sum(salary) over(partition by dept),
salary - sum(salary) over(partition by dept)
from employees;

-- Directly filter is not applied properly
select name, dept, salary, sum(salary) over(partition by dept),
salary - sum(salary) over(partition by dept)
from employees where name='Diana';

select *, sum(salary) over(partition by hire_year order by salary) from employees;

select *, max(salary) over(partition by dept ) from employees;

select *, max(salary) over(partition by dept order by hire_year) from employees;

select *, avg(salary) over(order by dept) from employees; -- running avg based on dept

select *, max(salary) over(partition by dept, hire_year) from employees;

select *, avg(salary) over(partition by dept) as avg_salary_in_dept, 
case
	when salary > avg(salary) over(partition by dept) then 'above avg salary'
    else 'less than avg salary'
end as salary_status
from employees;


-- Windows own functions
-- 1. row_number -> Generate a unique for every row
select *, row_number() over() from employees;
select *, row_number() over(order by salary) from employees; -- mereko farq nhi padta
select *, row_number() over(order by dept) from employees; -- keval sorting hoti h that's it

-- har ek dept ke liye row_numbers starting from 1 for every dept
select *, row_number() over(partition by dept) from employees; 


-- rank -> ranking based on values
-- if there are same values it will print 1, 1, 1 and skip number and start with 4 

select *, rank() over() from employees; -- he don't know ranking kis basis pr karna h
select *, rank() over(partition by dept) from employees;

select *, rank() over(order by salary) from employees;

select *, rank() over(partition by dept order by salary) from employees;


select *, row_number() over(partition by dept order by salary),
rank() over(partition by dept order by salary) from employees;


-- Learning assignments -> 1. difference between windows function and group by 
-- 						   2. difference between row_number, rank, dense_rank
-- 						   3. difference between where and having clause
--                         4. types of join in sql 
--                         5. natural join and cartesien join (cross join)
--                         6. what is super key, primary key, unique key, foreign key 