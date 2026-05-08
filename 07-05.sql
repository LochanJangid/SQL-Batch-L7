use regexjoin;

insert into orders values(111, 99, 'Ice Cream');

-- join = inner join
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers inner join orders on customers.customer_id=orders.customer_id;

select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers left join orders on customers.customer_id=orders.customer_id
union
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers right join orders on customers.customer_id=orders.customer_id;

-- left join where no connection in order table it will give null
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers left join orders on customers.customer_id=orders.customer_id;

-- is null -> is used to filter the data where column is null 
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers left join orders on customers.customer_id=orders.customer_id
where product_name is null;

select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers left join orders on customers.customer_id=orders.customer_id
where product_name is not null;

-- right join
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers right join orders on customers.customer_id=orders.customer_id;

select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers right join orders on customers.customer_id=orders.customer_id
where customers.customer_name is null;

-- Bakwas join
-- Natural Join - it applies condition on common column if common column are >= 2 then it will check both and match
-- 					if there are no common column it will give cross (many to many) (every possible matching)...
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name
from customers natural join orders;