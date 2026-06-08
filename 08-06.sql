-- Recursive CTE (Common Table Expression) 

-- set operations
USE sakila;
-- union -> combine all results but show unique rows only (remove duplicate)
SELECT * FROM actor WHERE actor_id BETWEEN 1 AND 3
 UNION 
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 5;

-- union all -> combine all resutls also show duplicates 
SELECT * FROM actor WHERE actor_id BETWEEN 1 AND 3
 UNION ALL 
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 5;

-- intersect -> give common rows of query1 and query2
SELECT * FROM actor WHERE actor_id BETWEEN 1 AND 3
 INTERSECT 
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 5;

-- except -> give the rows from query1 that are not in query2
SELECT * FROM actor WHERE actor_id BETWEEN 1 AND 3
 EXCEPT
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 5;


WITH cte AS
(SELECT 1 AS n)

SELECT n+5 FROM cte
 WHERE n<10;

WITH RECURSIVE cte AS (
	SELECT 1 AS n
	UNION ALL
	SELECT n+3 FROM cte
	 WHERE n<10
)
SELECT * FROM cte;

WITH RECURSIVE cte AS (
	SELECT 5 AS n
    UNION ALL
    SELECT n+1 FROM cte
     WHERE n<1010 -- Recursive query aborted after 1001 iterations. @@cte_max_recursion
)
SELECT * FROM cte;

-- employee -> manager -> super manager
CREATE TABLE employees3 (
	emp_id INT,
    emp_name VARCHAR(50),
    manager_id INT
);
DROP TABLE employees3;
INSERT INTO employees3 VALUES 
(1, 'CEO', NULL),
(2, 'John', 1),
(3, 'Mary', 1),
(4, 'David', 2),
(5, 'Lisa', 1),
(6, 'Ton', 4);

SELECT * FROM employees3;

WITH RECURSIVE cte AS (
	SELECT emp_id AS bid, emp_name AS bname, emp_name AS hireachy
      FROM employees3
	 WHERE manager_id IS NULL
	UNION ALL
	SELECT e.emp_id, e.emp_name, CONCAT(e.emp_name, '->', cte.hireachy) AS hireachy
	  FROM employees3 e
	  JOIN cte
	 WHERE e.manager_id=cte.bid
)

SELECT * FROM cte;

-- Learning Assignment -> What are indexes, why we use it, 
-- what is the use of explain keyword. 
-- what is clustered index and non clustered index