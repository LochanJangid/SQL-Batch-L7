-- Self join

create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);



/*

Amit
 ├── Neha
 │    ├── Rohit
 │    │     └── Meera
 │    └── Anjali
 │
 ├── Raj
 │    ├── Karan
 │    │     ├── Arjun
 │    │     └── Pooja
 │    └── Priya
 │           └── Nitin
 │
 └── Simran
      ├── Vikas
      │     └── Dev
      └── Sneha

*/

select * from employees;

-- galti jo gaurantee se karenge ( Basic Mistakes jo Ho sakti h )
-- 1. emp_id ko manager_id se compare karte h ❌
-- 2. emp ka manager_id ko manager ke manager_id se compare karte h ❌

select empl.emp_id, empl.emp_name, empl.manager_id, mngr.emp_id, mngr.emp_name from employees as empl
join employees as mngr where empl.manager_id=mngr.emp_id;

select empl.emp_id, empl.emp_name, empl.manager_id, empl.department, mngr.emp_id, mngr.emp_name, mngr.department from employees as empl
join employees as mngr where empl.manager_id=mngr.emp_id and empl.department=mngr.department;

-- q. u need to find the employee name and its salary if it is greater than the salary of its manager
select emp.emp_name, emp.salary, mngr.emp_name, mngr.salary
from employees as emp join employees as mngr where emp.manager_id=mngr.emp_id  and emp.salary>mngr.salary;

-- q. show all the employee name with its manager name
select empl.emp_name, mngr.emp_name from employees as empl
left join employees as mngr on empl.manager_id=mngr.emp_id;

-- q. show employee and its grand manager
select emp.emp_id, mngr.emp_id, grandmngr.emp_id

-- q. find employees who are also the managers
select distinct mngr.emp_name
from employees as mngr
join employees as emp
where mngr.emp_id=emp.manager_id;

-- Use Notebook LLM it's very easy or usefull 