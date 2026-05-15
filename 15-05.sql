-- window function which gives the calculation for each row

-- window function perform a calculation on multiple rows and give you the output 
--  for each row  

-- A window function performs a calculation across a set of rows
-- related to current row ( called the 'window' ) without collapsing rows
-- into a single result

-- every row keeps its identity - no rows are removed or merged.

use shadidb;

select * from employees;

select name, (select avg(salary) from employees) from employees;

-- select name, avg(salary) from employees; -- Error

select name, salary, avg(salary) over() from employees;

select name, salary, max(salary) over(), avg(salary) over() from employees;

select name, salary, avg(salary) over(),
salary-avg(salary) over() from employees;

select name, count(*) over(), 
max(salary) over(), min(salary) over(), avg(salary) over() from employees;

select name, salary, sum(salary) over(),
concat( round ( ( salary/sum(salary) over() )*100 ), '%' ) from employees;

-- Running Sum/Cumulative sum*
select name, salary, sum(salary) over(order by salary) from employees;

-- Order by on non unique 
select emp_id, name,department, salary,
sum(salary) over( order by department ) from employees;









-- learn pivot table in pandas
