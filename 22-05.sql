drop database rjdb;
create database rjdb;

use rjdb;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 200),
(5, '2026-01-05', 500);


SELECT * FROM sales;
-- LAG
SELECT *, LAG(sale_date, 1) OVER() FROM sales;
SELECT *, LAG(sale_date, 2) OVER() FROM sales;
-- LEAD
SELECT *, LEAD(sale_date, 1) OVER() FROM sales;
SELECT *, LEAD(sale_date, 2) OVER() FROM sales;
SELECT *, LEAD(sale_date, 1) OVER(ORDER BY amount DESC) FROM sales;

-- default value for NULL
SELECT *, LEAD(sale_date, 1, 0) OVER(ORDER BY amount DESC) 
  FROM sales;
  
-- UNBOUNDED PRECEDING -> The first row
-- CURRENT ROW -> My current row
-- UNBOUNDED FOLLOWING -> The last row
-- Running Sum from first rows to current row
-- : if you need to find running sum use ROWS BETWEEN instead of ORDER BY
SELECT *, 
	SUM(amount) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
  FROM sales;    
  
  
-- n PRECEDING 
SELECT *,
	SUM(amount) OVER(ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
  FROM sales;
SELECT *,
	SUM(amount) OVER(ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
  FROM sales;
  
-- n FOLLOWING
SELECT *, 
	SUM(amount) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND 1 FOLLOWING)
  FROM sales;
  
SELECT *,
	SUM(amount) OVER(
			order by sale_date
			ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING
		) AS current_next_sum
  FROM sales;
  
-- Practice Time
CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);

INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),
(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);


CREATE TABLE employee_attendance (
attendance_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
attendance_date DATE,
hours_worked INT
);

INSERT INTO employee_attendance VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 8),
(2, 'Amit', 'Electronics', '2026-01-02', 9),
(3, 'Amit', 'Electronics', '2026-01-03', 7),
(4, 'Neha', 'Electronics', '2026-01-01', 8),
(5, 'Neha', 'Electronics', '2026-01-02', 10),
(6, 'Neha', 'Electronics', '2026-01-03', 9),
(7, 'Raj', 'Furniture', '2026-01-01', 6),
(8, 'Raj', 'Furniture', '2026-01-02', 7),
(9, 'Raj', 'Furniture', '2026-01-03', 8),
(10, 'Simran', 'Furniture', '2026-01-01', 9),
(11, 'Simran', 'Furniture', '2026-01-02', 8),
(12, 'Simran', 'Furniture', '2026-01-03', 10),
(13, 'Vikas', 'Clothing', '2026-01-01', 5),
(14, 'Vikas', 'Clothing', '2026-01-02', 6),
(15, 'Vikas', 'Clothing', '2026-01-03', 7),
(16, 'Priya', 'Clothing', '2026-01-01', 8),
(17, 'Priya', 'Clothing', '2026-01-02', 8),
(18, 'Priya', 'Clothing', '2026-01-03', 9),
(19, 'Karan', 'Electronics', '2026-01-01', 10),
(20, 'Karan', 'Electronics', '2026-01-02', 11);

-- Tables -> employees_sales, employee_attendance
SELECT * FROM employee_attendance;
SELECT * FROM employees_sales;

-- Q1. Find total Sales by each Department
SELECT employee_name, department, sales_amount, 
	SUM(sales_amount) OVER(PARTITION BY department) AS total_department_sales
  FROM employees_sales;
  
-- Q2. Find Avg salary per employee
SELECT employee_name, sales_amount, 
	AVG(sales_amount) OVER(PARTITION BY employee_name) AS avg_salary
  FROM employees_sales;
  
-- Q3. Rank employees by sales within each department
SELECT employee_name, department, sales_amount, 
	RANK() OVER(PARTITION BY department ORDER BY sales_amount)
  FROM employees_sales;
  
-- Q4. Find previous sale amount for each employee
SELECT employee_name, sale_date, sales_amount, 
	LAG(sales_amount) OVER()
  FROM employees_sales;
  
-- Q5. Find next sale amount for each employee
SELECT employee_name, sale_date, sales_amount,
	LEAD(sales_amount) OVER()
  FROM employees_sales;
  
-- Q6. Calculating Running total using rows between 
SELECT employee_name, sale_date, sales_amount, 
	SUM(sales_amount) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM employees_sales;
  
-- Q7. Calculate moving average of current row and previous row
SELECT employee_name, sale_date, sales_amount,
	AVG(sales_amount) OVER(ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
  FROM employees_sales;
  
-- Q8. Calculate sum of current row and next row
SELECT employee_name, sale_date, sales_amount,
	SUM(sales_amount) OVER(ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING)
  FROM employees_sales;

-- Q9. Calculate 3 row moving total
SELECT employee_name, sale_date, sales_amount,
	SUM(sales_amount) OVER(ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
  FROM employees_sales;
  
-- Q10. Find cummulative hours worked for each employees 
-- employee_name, attendance_date, hours_worked, cumulative_hours
SELECT employee_name, attendance_date, hours_worked, 
	SUM(hours_worked) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_hours
  FROM employee_attendance;