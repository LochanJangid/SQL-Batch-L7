use sakila;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);

INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');

select * from orders;

-- Q1. How many orders were placed in each city? (Sort by city A–Z)
	select city, count(*) from orders group by city order by city;

-- Q2. What is the total revenue (price × quantity) earned from each category? (Sort by total_revenue DESC)
	select category, sum( price * quantity) as total_revenue from orders group by category order by total_revenue desc;
    
-- 	Q3. How many orders belong to each category? (Sort by category A–Z)
	select category, count(*) as order_count from orders group by category;
    
-- Q4. What is the average price of orders in each city? Round to 2 decimal places. (Sort by city A–Z)
	select city, round(avg(price), 2) from orders group by city order by city;
    
-- Q5. What is the maximum price of a product in each category? (Sort by category A–Z)
	select category, max(price) as max_price from orders group by category order by category;
    
-- Q6. What is the minimum price of a product ordered in each city? (Sort by city A–Z)
	select city, min(price) as min_price from orders group by city order by city;	

-- Q7. What is the total quantity of items sold per category? (Sort by total_quantity DESC)
	select category, sum(quantity) as total_quantity from orders group by category order by total_quantity desc;
    
-- Q8. List each city along with the total number of items ordered (sum of quantity). (Sort by total_items DESC)
	select city, sum(quantity) as total_items from orders group by city order by total_items desc;
    
-- Q9. Find cities that have more than 3 orders. Show city and order count. (Sort by order_count DESC)
	select city, count(*) as order_count from orders 
    group by city
    having order_count > 3
    order by order_count desc;
    
-- Q10. Find categories where the total revenue (price × quantity) is more than 50000. (Sort by total_revenue DESC)
	select category, sum(price * quantity) as total_revenue from orders
    group by category
    having total_revenue > 50000
    order by total_revenue desc;

-- Q11. Which cities have an average order price greater than 10000? Show city and avg_price. (Sort by avg_price DESC)
	select city, avg(price) as avg_price 
    from orders
    group by city
    having avg_price > 10000
    order by avg_price desc;
    
-- Q12. Find the total revenue per city, but only include orders from the 'Electronics' category. (Sort by total_revenue DESC)
	select city, sum(price * quantity) as total_revenue
    from orders
    where category = 'Electronics'
    group by city
    order by total_revenue desc;
    
-- Q13. Find categories where the total quantity sold is greater than 8. (Sort by total_qty DESC)
	select category, sum(quantity) as total_qty
    from orders
    group by category
    having total_qty > 8
    order by total_qty desc;

-- Q14. Find the number of distinct cities from which each category received orders. (Sort by category A–Z)
	select category, count(distinct city) as city_count
    from orders
    group by category
    order by category;
    
-- Q15. List cities where the minimum order price is less than 2000. Show city and min_price. (Sort by min_price ASC)
	select city, min(price) as min_price
    from orders
    group by city
    having min_price < 2000
    order by min_price;
    
-- Q16. Find each city's total revenue (price × quantity). Show only cities where total revenue is between 30000 and 100000. (Sort by total_revenue DESC)
	select city, sum(price * quantity) as total_revenue
    from orders
    group by city
    having total_revenue between 30000 and 100000
    order by total_revenue desc;

-- Q17. For each combination of city and category, find the total revenue. Show only combinations where total revenue > 20000. (Sort by total_revenue DESC)
    select city, category, 	sum(price * quantity) as total_revenue
    from orders
    group by city, category
    having total_revenue > 20000	
    order by total_revenue desc;
    
-- 	