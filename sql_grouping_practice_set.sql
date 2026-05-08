use sakila;

show tables;

CREATE TABLE Sales_Data (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50),
    Category VARCHAR(50),
    OrderDate DATE,
    OrderValue DECIMAL(10, 2)
);

INSERT INTO Sales_Data (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);


-- Level 1
-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category. 
	select sum(orderValue) from Sales_Data group by category;

-- Q2. Count the total number of orders placed in each Category. 
	select count(*) from Sales_Data group by category;
    
-- Q3. Find the highest (maximum) single OrderValue within each Category. 
	select category, max(orderValue) from Sales_Data group by category;
    
-- Level 2
-- Q1. List all unique product Categories that appear in the Sales_Data table. 
	select DISTINCT category from Sales_Data;
    
-- Q2. List all unique CustomerIDs who have placed at least one order.
	select DISTINCT CustomerId from Sales_Data where OrderValue > 0;

-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories). 
	select CustomerId, Category from Sales_Data group by CustomerId, Category ORDER BY CustomerId;
    
-- Level 3
-- Q1. Revenue by CustomerID and Category
	select CustomerId, Category, sum(OrderValue) as Total_Revenue from Sales_Data group by CustomerId, Category ORDER BY CustomerId;
    
-- Q2. Order Count by CustomerID and Category
	select CustomerId, Category, count(OrderValue) as Order_Count from Sales_Data group by CustomerId, Category ORDER BY CustomerId;
    
-- Q3. Revenue by Category and Month
	select Category, month(OrderDate) as Order_Month, sum(OrderValue) as Total_Revenue from Sales_Data group by Category, month(OrderDate);
    
-- Level 4
-- Q1. Categories with Revenue > $20,000
	select Category, sum(OrderValue) as Total_Revenue from Sales_data group by Category HAVING sum(OrderValue) > 20000;
    
-- Q2. Customers with More Than 1 Order
	select CustomerId, count(OrderValue) as Order_Count from Sales_Data group by CustomerId HAVING Order_Count > 1;
    
-- Q3. Customer + Category Combinations Spending > $10,000
	select CustomerId, Category, sum(OrderValue) as Total_Spent from Sales_Data group by CustomerId, Category having Total_Spent > 10000;
    
-- Level 5
-- Q1. Category Summary (Avg Order Value > $5,000, sorted by Revenue)
	select Category, count(OrderValue) as Total_Orders, sum(OrderValue) as Total_Revenue, avg(OrderValue) as Avg_OrderValue
    from Sales_Data
    group by Category
    having Avg_OrderValue > 5000
    order by Total_Revenue Desc;
    
-- Q2. High-Value Repeat Customers (>1 order, Avg OrderValue > $6,000)
	select CustomerId, count(OrderValue) as Order_Count, avg(OrderValue) as Avg_OrderValue 
    from Sales_Data
    group by CustomerId
    having Order_Count > 1 and Avg_OrderValue > 6000;
    
-- Q3. Category-Month Summary (Min 2 Orders, Sorted by Month then Revenue)
	select Category, month(OrderDate) as Month, count(*) as Orders, sum(OrderValue) as Total_Revenue, avg(OrderValue) as Avg_OrderValue
    from Sales_Data
    group by Category, month(OrderDate)
    having Orders >= 2
    order by month(OrderDate), Total_Revenue;