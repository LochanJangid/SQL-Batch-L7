use regexjoin;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Insert data into employees
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 30),
(4, 'Diana', 10),
(5, 'Edward', NULL);

-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert data into departments
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(40, 'Finance');

-- Add manager_id column
ALTER TABLE employees
ADD manager_id INT;

-- Insert manager_id values
UPDATE employees
SET manager_id = 4
WHERE emp_id = 1;

UPDATE employees
SET manager_id = 4
WHERE emp_id = 2;

UPDATE employees
SET manager_id = 2
WHERE emp_id = 3;

UPDATE employees
SET manager_id = NULL
WHERE emp_id = 4;

UPDATE employees
SET manager_id = 1
WHERE emp_id = 5;

-- Q1. List the names of all employees along with their department names. Show only employees who belong to a department.
	select employees.emp_name, departments.dept_name from employees
    join departments on employees.dept_id=departments.dept_id;
    
-- Q2: List ALL employees with their department names. If an employee has no department, show NULL for department name.
	select employees.emp_name, departments.dept_name from employees
    left join departments on employees.dept_id=departments.dept_id;
    
-- Q3: Show all departments and the number of employees in each. Include departments with ZERO employees.
	select departments.dept_name, count(employees.emp_id) from departments
    left join employees on departments.dept_id=employees.dept_id
    group by departments.dept_name;

-- Q4: Display each employee's name along with their manager's name. Employees with no manager should show 'No Manager'.
	select e.emp_name, if (m.emp_name is null, 'No Manager', m.emp_name) from employees as e 
    left join employees as m on e.manager_id=m.emp_id;