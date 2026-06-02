-- CTE -> Common Table Expression
-- Storing a result in a temprorary basis
-- makes query readable

USE sakila;

SELECT actor_id, COUNT(film_id) AS moviesCount
  FROM sakila.film_actor
GROUP BY actor_id;

SELECT SUM(moviesCount) FROM 
(
SELECT actor_id, COUNT(film_id) AS moviesCount
  FROM sakila.film_actor
GROUP BY actor_id
) AS tb
WHERE actor_id>10;
  
WITH test AS
(
	SELECT actor_id, COUNT(film_id) AS moviesCount
	  FROM sakila.film_actor
	GROUP BY actor_id
)
SELECT SUM(moviesCount) FROM test 
 WHERE actor_id>10;
 
 
USE windowsdb;
SELECT * FROM employees;

-- Correlated ( Avoid )
SELECT * FROM employees e
 WHERE salary= (SELECT MAX(salary) FROM employees WHERE dept=e.dept);
 
-- window function
SELECT * FROM 
(SELECT *, MAX(salary) OVER(PARTITION BY dept) AS deptmax
FROM employees) AS temp
WHERE salary=deptmax;

WITH t AS (
(SELECT *, MAX(salary) OVER(PARTITION BY dept) AS deptmax
FROM employees)

SELECT * FROM t WHERE salary=deptmax;

WITH xyz AS (
SELECT dept, MAX(salary) AS deptMax FROM employees GROUP BY dept)

SELECT * FROM employees JOIN xyz WHERE employees.dept=xyz.dept
	AND employees.salary=xyz.deptMax;
    