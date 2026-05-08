-- Flow Control Functions

use sakila;

-- if( condition, True Statment, False statment)
select first_name, department, salary, if( department = 'it', True, False) from employees;

select first_name, department, salary, if( department = 'it', salary*1.1, salary*1.05) as new_salary 
from employees;

select first_name, department, salary, if( department = 'it', salary*1.1, salary*1.05) as new_salary 
from employees;

select first_name, department, salary, 
 if( department = 'it', salary*1.1, if ( department = 'hr', salary*1.05, salary)) as new_salary 
from employees;

-- case statment
/*
select col1, col2
case
	when conditon then statment
end
from table_name
*/

select first_name, department, salary,
case
	when department = 'IT' or department='HR' then 'A category'
    else 'B category'
end
from employees;

select first_name, department, salary,
case
	when department= 'IT' then salary*1.1
    when department= 'HR' then salary*1.05
    else salary
end as new_salary
from employees;

-- q. if the hiring date of an employee is before 2020 then print job_title as senior if year is 2021 then print associate else same job_title
select first_name, last_name, hire_date,
case
	when year(hire_date) <= 2020 then concat_ws(' ', 'Senior', job_title)
    when year(hire_date) = 2021 then concat_ws(' ', 'Associate', job_title)
    else job_title
end as job_title
from employees;

-- q. if salary > 70000 create a category as 'average salary' if salary > 85000 then 'High Salary' if salary > 100000 then 'Extreme high salary' 
-- 		other wise print category name as low salary

select first_name, last_name, salary,
case
	when salary > 100000 then 'Extreme High Salary'
    when salary > 85000 then 'High Salary'
    when salary > 70000 then 'Average Salary'
    else 'Low Salary'
end as category
from employees;

-- q. select the job title and print the column value based on the following condition 
-- 		job_title have (count()) persons
select job_title, concat(job_title, ' Position have ', count(*), if (count(*) > 1, ' persons.', ' person.')) as counting from employees
group by job_title;

-- Learning Assignment
-- what is super key what is primary key and what is foreign key
-- what is normalization and what is 1nf