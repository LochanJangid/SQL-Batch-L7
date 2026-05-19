use windowsdb;

select *, row_number() over(order by salary),
rank() over(order by salary),
dense_rank() over(order by salary) from employees;

select *, rank() over(partition by dept order by salary) from employees;

select *, dense_rank() over(partition by dept order by salary) from employees;

select *, dense_rank() over(partition by dept order by hire_year) from employees;

-- WE can't use window function in where clause
-- because where clause execute first and we can only filter existing columns in table


-- Use subquery as table
-- we store this table for only this query
select * from 
(select *, max(salary) over(partition by dept) as deptSalary from employees ) as trh
where salary=deptSalary;

select *, rank() over(partition by dept order by salary) from employees;

-- we can not use function name as variable like -> rank, row_number
-- else use `rank` for use function name as a variable
select * from 
(select *, rank() over(partition by dept order by salary desc) as `rank` from employees) as tr
where `rank` = 1;

-- person with the second heighest salary

select *, dense_rank() over(order by salary desc) as `rank` from employees; 

select * from 
(select *, dense_rank() over(order by salary desc) as drank from employees) as tr
where drank = 2;

select * from employees where salary=(
select max(salary) from employees 
where salary < (select max(salary) from employees));

-- if in interview they ask for find 2nd heighest or lowest salary
-- Don't use order by or limit clause use SubQuery, Windows Function
 -- Wrong Example:
select salary from employees order by salary limit 1, 1; -- Never Do this

select *, dense_rank() over(order by salary desc) as drank from employees;


-- find 4th heighest salary
-- by using window function
select * from 
(select *, dense_rank() over(order by salary desc) as drank from employees) tr
where drank = 4;

-- by using subquery
select * from employees
where salary = (
select max(salary) from employees 
where salary < 
(select max(salary) from employees 
where salary < 
(select max(salary) from employees where salary < 
(select max(salary) from employees))));

-- Learning Assignment -> rows between 