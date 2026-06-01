-- Views in sQL
create database if not exists viewdb;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
use viewdb;


CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');

SELECT * FROM departments;

CREATE VIEW dept_view AS
SELECT * FROM departments
 WHERE dept_id<3;
 
SELECT * FROM dept_view;

SELECT * FROM employees;

CREATE VIEW city_sum AS
SELECT city, SUM(salary) 
  FROM employees
GROUP BY city;

SELECT * FROM city_sum;

DROP VIEW city_sum;
CREATE VIEW city_sum AS
SELECT city, SUM(salary) AS salary_sum
  FROM employees
GROUP BY city;

SELECT * FROM  city_sum;

CREATE VIEW emp_2_col AS
SELECT name, salary
  FROM employees;
  
SELECT * FROM emp_2_col;
SELECT emp_id FROM emp_2_col; -- : We restricted number of columns

DROP VIEW emp_2_col;
CREATE VIEW emp_2_col AS
SELECT emp_id, name
  FROM employees;
-- if we do any dml operation and changes will happen in original table 
INSERT INTO emp_2_col VALUES(173, 'yash');
SELECT * FROM emp_2_col;
SELECT * FROM employees;

DELETE FROM emp_2_col
 WHERE emp_id=105;
 
SELECT * FROM emp_2_col;
SELECT * FROM employees;

UPDATE emp_2_col
   SET name='Elizabeth'
 WHERE emp_id=104;
 
SELECT * FROM emp_2_col;
SELECT * FROM employees;
-- These are simple view (updatable view)

/*
a view generally becomes non-updatable (read-only) 
if its definition contains any of the following
aggregate function
GROUP BY or HAVING clauses
DISTINCT 
SET operations - UNION, INTERESECT, EXCEPT/MINUS
JOINS (many dbms allowed update on one side but many not)
subquery in the select list
window functions
computed/derived columns -- eg. salary * 12 AS annual
view built on top of other non-updatable views
*/
CREATE VIEW dept_sum AS
SELECT dept_id, SUM(salary) AS salary_sum
  FROM employees
GROUP BY dept_id;

SELECT * FROM dept_sum;
INSERT INTO dept_sum VALUES(2, 4454545); -- not insertable
UPDATE dept_sum
   SET salary_sum = 3000
 WHERE dept_id=100; -- not updatable
 
CREATE VIEW emp_dept AS
SELECT emp_id, name, dept_name
  FROM employees e
  JOIN departments d ON e.dept_id=d.dept_id; 
  
SELECT * FROM emp_dept;
INSERT INTO emp_dept VALUES(150, 'Ganga', 'IT'); -- can not insert into join view
UPDATE emp_dept
   SET name='Ganga'
 WHERE emp_id=101;

UPDATE emp_dept
   SET dept_name='HR'
 WHERE emp_id=101;

UPDATE emp_dept
   SET name='John', dept_name='IT'
 WHERE emp_id=102; -- Can not modify more than one base table through a join view

DELETE FROM emp_dept
 WHERE emp_id=102; -- Can not delete from join view

CREATE VIEW emp_dept_view AS
SELECT * FROM emp_dept;

UPDATE emp_dept_view
   SET name='John'
 WHERE emp_id=102;

SELECT * FROM emp_dept_view;
SELECT * FROM emp_dept;
SELECT * FROM employees;
SELECT * FROM departments;

UPDATE employees
   SET name='Peter'
 WHERE emp_id=101;
 
