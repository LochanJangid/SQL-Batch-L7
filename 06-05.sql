-- joins in sql

create database regexjoin;

use regexjoin;


-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');

INSERT INTO customers VALUES
(6, 'Amit', 'Delhi');

-- Create second table: orders
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');


INSERT INTO orders VALUES
(106, 6, 'Laptop'),
(107, 6, 'Mobile');



select * from customers;
select * from orders;

 
select customers.customer_id, customers.customer_name, orders.order_id, orders.product_name from customers
join orders where customers.customer_id = orders.customer_id;

select customers.customer_id, customers.customer_name, orders.order_id, orders.product_name from customers
join orders where customers.customer_id = orders.customer_id and customers.customer_name = 'amit';

-- inner join, left join, right join