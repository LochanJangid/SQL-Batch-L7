CREATE DATABASE practice_grp_sub_jn;
USE practice_grp_sub_jn;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    manager_id INT NULL,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
	
INSERT INTO employees
(emp_id, emp_name, department, salary, manager_id)
VALUES
(101,'Alice Johnson','IT',72000,NULL),
(102,'Bob Smith','IT',65000,101),
(103,'Carol White','HR',58000,NULL),
(104,'David Brown','HR',54000,103),
(105,'Eva Green','Finance',80000,NULL),
(106,'Frank Black','Finance',75000,105),
(107,'Grace Lee','IT',68000,101),
(108,'Henry Wilson','Marketing',60000,NULL),
(109,'Ivy Turner','Marketing',56000,108),
(110,'Jack Davis','Finance',70000,105),
(111,'Karen Moore','IT',63000,101),
(112,'Leo Harris','HR',50000,103),
(113,'Mia Clark','Marketing',62000,108),
(114,'Nate Lewis','Finance',78000,105),
(115,'Olivia Walker','IT',71000,101),
(116,'Paul Hall','HR',53000,103),
(117,'Quinn Young','Marketing',59000,108),
(118,'Rachel King','Finance',82000,105),
(119,'Sam Scott','IT',66000,101),
(120,'Tina Adams','HR',55000,103);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    join_year INT
);

INSERT INTO customers
(customer_id, customer_name, city, country, join_year)
VALUES
(201,'Aarav Mehta','Mumbai','India',2021),
(202,'Priya Sharma','Delhi','India',2020),
(203,'Rohan Gupta','Pune','India',2022),
(204,'Sunita Patel','Ahmedabad','India',2021),
(205,'Vikram Rao','Bangalore','India',2019),
(206,'Neha Singh','Chennai','India',2023),
(207,'Arjun Kumar','Hyderabad','India',2020),
(208,'Deepa Nair','Kochi','India',2022),
(209,'Sanjay Joshi','Jaipur','India',2021),
(210,'Meera Iyer','Coimbatore','India',2023),
(211,'Ravi Verma','Lucknow','India',2020),
(212,'Anita Das','Kolkata','India',2019),
(213,'Kiran Reddy','Vizag','India',2022),
(214,'Pooja Shah','Surat','India',2021),
(215,'Amit Bose','Nagpur','India',2023),
(216,'Tara Menon','Trivandrum','India',2020),
(217,'Nikhil Kulkarni','Nashik','India',2022),
(218,'Swati Chatterjee','Bhopal','India',2019),
(219,'Rahul Pandey','Patna','India',2021),
(220,'Divya Tiwari','Indore','India',2023);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_qty INT
);

INSERT INTO products
(product_id, product_name, category, price, stock_qty)
VALUES
(301,'Laptop','Electronics',55000,30),
(302,'Smartphone','Electronics',22000,80),
(303,'Headphones','Electronics',3500,120),
(304,'Monitor','Electronics',18000,45),
(305,'Keyboard','Accessories',1500,200),
(306,'Mouse','Accessories',900,250),
(307,'Desk Chair','Furniture',8500,40),
(308,'Standing Desk','Furniture',22000,15),
(309,'Webcam','Electronics',4200,70),
(310,'USB Hub','Accessories',1200,180),
(311,'Notebook','Stationery',150,500),
(312,'Pen Set','Stationery',250,600),
(313,'Printer','Electronics',12000,25),
(314,'Scanner','Electronics',9000,20),
(315,'External SSD','Electronics',7500,60),
(316,'Lamp','Furniture',2200,90),
(317,'Whiteboard','Office Supplies',3800,35),
(318,'Cable Organiser','Accessories',600,300),
(319,'Power Bank','Electronics',2800,100),
(320,'Smart Watch','Electronics',15000,55);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO orders
(order_id, customer_id, product_id, amount, order_date)
VALUES
(1001,201,301,1500,'2024-01-05'),
(1002,202,302,2300,'2024-01-12'),
(1003,203,303,800,'2024-02-03'),
(1004,201,304,3200,'2024-02-14'),
(1005,204,301,1100,'2024-03-01'),
(1006,205,302,4500,'2024-03-15'),
(1007,202,303,950,'2024-03-22'),
(1008,206,304,2100,'2024-04-05'),
(1009,203,301,1750,'2024-04-18'),
(1010,207,302,3300,'2024-04-30'),
(1011,204,303,680,'2024-05-10'),
(1012,208,304,2900,'2024-05-22'),
(1013,205,301,1200,'2024-06-08'),
(1014,201,302,2700,'2024-06-15'),
(1015,209,303,500,'2024-06-28'),
(1016,206,304,3800,'2024-07-07'),
(1017,207,301,1600,'2024-07-19'),
(1018,210,302,4100,'2024-07-25'),
(1019,208,303,720,'2024-08-02'),
(1020,209,304,2200,'2024-08-14');

-- Topic - 1
-- 1.
SELECT department, COUNT(*) AS emp_count
  FROM employees
GROUP BY department;

-- 2. 
SELECT department, AVG(salary) AS avg_salary
  FROM employees
GROUP BY department
HAVING avg_salary > 60000;

-- 3.
SELECT department, SUM(salary) AS total_salary
  FROM employees
GROUP BY department
ORDER BY total_salary DESC;

-- 4.
SELECT department, COUNT(*) AS emp_count,
		AVG(salary) AS avg_salary
  FROM employees
GROUP BY department
HAVING emp_count > 4 AND avg_salary > 55000;

-- 5. 
SELECT customer_id, COUNT(*) AS order_count,
		SUM(amount) AS total_amount  
  FROM orders
GROUP BY customer_id
HAVING order_count >= 2 AND total_amount > 5000;


-- Topic - 2
-- 1.
SELECT c.customer_name, COUNT(*) AS order_count
  FROM orders AS o
  JOIN customers AS c ON c.customer_id=o.customer_id
GROUP BY o.customer_id, c.customer_name
ORDER BY order_count DESC;

-- 2.
SELECT p.product_name, SUM(o.amount) AS total_revanue
  FROM orders AS o
  JOIN products AS p ON o.product_id=p.product_id
GROUP BY o.product_id, p.product_name;

-- 3.
SELECT category, SUM(stock_qty) AS total_stock
  FROM products
GROUP BY category;

-- 4.
SELECT c.customer_name, c.city,
		SUM(o.amount) AS total_spend
  FROM orders AS o 
  JOIN customers AS c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.customer_name
HAVING total_spend > 3000;

-- 5.
SELECT p.category, AVG(o.amount) AS avg_order_amount,
		COUNT(DISTINCT o.customer_id) AS distinct_customers
  FROM orders AS o
  JOIN products AS p ON o.product_id=p.product_id
GROUP BY p.category;


-- Topic - 3
-- 1.
SELECT e.emp_name, IFNULL(m.emp_name, 'No Manager') AS manager_name
  FROM employees AS e
LEFT JOIN employees AS m ON e.manager_id=m.emp_id;

-- 2.
SELECT e.emp_name, e.salary AS emp_salary, m.emp_name AS manager_name,
		m.salary AS manager_salary
  FROM employees AS e
  JOIN employees AS m ON e.manager_id=m.emp_id
 WHERE e.salary > m.salary;
 
-- 3.
SELECT emp_name, department
  FROM employees
 WHERE manager_id=(SELECT emp_id FROM employees 
					WHERE emp_name='Alice Johnson');
                    
-- 4.
SELECT m.emp_name AS manager_name, m.department,
		COUNT(*) AS team_size,
        AVG(e.salary) AS avg_report_salary
  FROM employees AS e
  JOIN employees AS m ON e.manager_id=m.emp_id
GROUP BY m.emp_id, m.emp_name, m.department
HAVING team_size >=3;

-- 5.
SELECT e1.emp_name AS emp1, e2.emp_name AS emp2,
		e1.department, ABS(e2.salary - e1.salary) AS salary_diff 
  FROM employees AS e1
  JOIN employees AS e2 ON e1.department=e2.department
 WHERE ABS(e2.salary - e1.salary) <= 5000
   AND e2.emp_id<e1.emp_id;
   


-- Topic - 4
-- 1.
SELECT emp_name, department, salary
  FROM employees 
 WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2.
SELECT emp_id, emp_name, department, salary
  FROM employees
 WHERE salary = (SELECT MAX(salary) FROM employees);

SELECT emp_id, emp_name, department, salary
  FROM employees
ORDER BY salary DESC
LIMIT 1;

-- 3.
SELECT product_name, category, price
  FROM products
 WHERE price > (SELECT AVG(price) FROM products
			     WHERE category='Electronics');

-- 4. 
SELECT emp_name, department, salary
  FROM employees
 WHERE department=(
SELECT department
  FROM employees 
 WHERE salary IN (SELECT MAX(salary) FROM employees))
AND emp_id NOT IN (SELECT emp_id
			   FROM employees 
			  WHERE salary = (SELECT MAX(salary) FROM employees));

-- 5. 
SELECT order_id, customer_id, amount FROM (
SELECT order_id, customer_id, amount, AVG(amount) OVER() as avg_amount	
  FROM orders
  ) AS ot
 WHERE amount>avg_amount;


-- Topic - 5
-- 1.
SELECT emp_name, department, salary
  FROM employees
 WHERE department IN (SELECT DISTINCT department FROM employees
						GROUP BY department HAVING MAX(salary) > 75000);
                        
-- 2.
SELECT product_name, category, price
  FROM products
 WHERE price < (SELECT MAX(price) FROM products 
				 WHERE category='Furniture');
                 
-- 3.
SELECT customer_id, customer_name, city
  FROM customers
 WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);
 
SELECT DISTINCT c.customer_id, c.customer_name, c.city
  FROM customers AS c
  JOIN orders AS o ON c.customer_id=o.customer_id;
  
-- 4.
SELECT emp_name, department, salary
  FROM employees
 WHERE salary > ANY (SELECT salary FROM employees 
					  WHERE department='HR');
                      
-- 5.
SELECT p.product_id, o.customer_id, p.product_name
  FROM products AS p
  JOIN orders AS o ON p.product_id=o.product_id
 WHERE o.customer_id=201;



-- Topic - 6
-- 1.
SELECT * FROM (
	SELECT emp_name, department, salary,
		AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary
	  FROM employees ) AS et
WHERE salary > dept_avg_salary;

SELECT emp_name, department, salary, 
	(SELECT AVG(salary) FROM employees WHERE department=x.department) AS  dept_avg_salary
  FROM employees AS x
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department=x.department);
-- 2.
SELECT order_id, customer_id, amount,
		IF(AVG(amount) OVER(PARTITION BY customer_id) < amount, 'Above Avg', 'Below Avg') AS vs_customer_avg
  FROM orders;
  
-- 3.
SELECT customer_id, customer_name, city
  FROM customers c
 WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id=c.customer_id);

-- 4.
SELECT p.product_id, p.product_name
  FROM products AS p
  JOIN orders AS o ON p.product_id = o.product_id
 WHERE o.customer_id = 201
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT o.order_id) = (
       SELECT COUNT(DISTINCT order_id) 
         FROM orders 
        WHERE customer_id = 201
       );

-- 5.
SELECT product_name, max_order_amount, order_date FROM (
SELECT p.product_name, amount, order_date, MAX(o.amount) OVER() AS max_order_amount
  FROM orders AS o
  JOIN products AS p ON p.product_id=o.product_id) AS inner_tr
WHERE amount=max_order_amount;