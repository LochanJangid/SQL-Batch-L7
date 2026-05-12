use shadidb;

-- Create Table
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);

-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

-- find avg salary of employees
select avg(salary) from employees;

-- find employees whose salary is greater than avg salary
select * from employees
where salary>(select avg(salary) from employees);

-- find maximum salary
select max(salary) from employees;

-- find employees whose salary is heighest between all employees
select * from employees
where salary=(select max(salary) from employees);

-- find who earn more than alice
-- 1. find salary of alice emp_id = 101
select salary from employees where emp_id=101;

-- 2. find employee who earn more than alice
select * from employees 
where salary>(select salary from employees where emp_id=101);

-- find the department of the lowest paid employee
-- 1. find lowest paid salary
select min(salary) from employees;

-- 2. find the department of lowest paid salary
select department from employees
where salary=(select min(salary) from employees);

-- Multi Row Subquery - isme multiple rows return hoti h but one col

-- ex.
select department from employees where name='Alice' or name='Bob';

select * from employees 
where department in (select department from employees where name='Alice' or name='Bob');

-- find out employees whose salary is not same as emp_id 103 or 105 ke eqal n ho
-- 1. find salary of emp_id 103 and 107
select salary from employees where emp_id=103 or emp_id=107;

-- 2. find employees whose salary is not same as emp_id=103,107
select * from employees
where salary not in (select salary from employees where emp_id=103 or emp_id=107);

-- any operator -> Kisi se bhi
select * from employees
where salary >any (select salary from employees where emp_id=103 or emp_id=107);

-- find employee whose salary greater than at least one hr employee
--  1. find salaries of hr employees
select salary from employees where department='hr';

-- 2. find employee whose salary greater than at least one hr employee
select * from employees 
where salary > any (select salary from employees where department='hr');

-- all operator -> sabhi se hi
select * from employees 
where salary > all (select salary from employees where department='hr');

-- Ex.
select salary from employees where department='IT';

select * From employees
where salary > all (select salary from employees where department='IT');

-- q. find the  employee detail  who work  in  it dept. and have the  salary greater than  the  salary  of  emp_id 101
-- 1. find the salary of  emp_id=101
select salary from  employees where emp_id=101;

-- 2. find  answer
select  * from  employees
where department='IT'
and   salary > (select salary from  employees where emp_id=101);

-- q. find the  name of  the employee whose salary is greater than all the salaries of hr or it dept.
-- 1.  find  salaries of hr, it department
select salary from  employees where department='hr' or department='it';

-- 2.  find  result
select name from employees
where salary >  all (select salary from  employees where department='hr' or department='it');

-- q. find  the  emp_id , emp name of the users whose salary is  greater than the salary of any employee working under the manager_id 101
-- 1. find salary of employee who is  working  under manager 101
select * from  employees where manager_id=101;

-- 2. find result
select emp_id, name from employees
where salary > all (select salary from  employees where manager_id=101);

-- q. find out the second  heighest salary from  this table
-- 1. find max salary
select max(salary) from employees;

-- 2. find result
select max(salary) from employees where salary<(select max(salary) from employees);