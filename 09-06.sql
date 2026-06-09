-- Indexes -> 
-- Indexes are the object which is used to improve the data retrieval from a table

CREATE DATABASE indexdb;
USE indexdb;

DROP TABLE employees;
CREATE TABLE employees(
	id INT,
    name VARCHAR(20),
    age INT
);

INSERT INTO employees VALUES
(1, 'abc', 90),
(3, 'def', 100),
(2, 'abhi', 23),
(5, 'naina', 7899),
(6, 'shyam', 100),
(4, 'tushar', 60);

EXPLAIN SELECT * FROM employees;

EXPLAIN SELECT * FROM employees WHERE id=2;

# 1. Clustered Index -> when we make PRIMARY KEY. PRIMARY KEY is Clustered Index
-- don't allow duplicates
-- save in physical sort method

ALTER TABLE employees
MODIFY COLUMN id INT PRIMARY KEY;
-- or --
ALTER TABLE employees
ADD PRIMARY KEY (id);

SELECT * FROM employees; -- sorted format data because it stores data in b-tree data strucutre form

EXPLAIN SELECT * FROM employees WHERE id=2; -- fast because of indexing ( binary tree )
EXPLAIN SELECT * FROM employees WHERE name='tushar'; -- slow due to search in all rows

-- 2. Non-Clustered Index -> separate structure pointing to table rows
-- allows duplicates

-- > non clustered is a type of index in which a separate data structure will be created
-- > it stores in a sorted format
-- > data store and its pointer (row_id) point to origin table.
-- > Toda sa slow ho sakta h because isko todi si searching karni padti h

EXPLAIN SELECT * FROM employees WHERE age=100;
SHOW INDEXES FROM employees; -- it will show the index on table

CREATE INDEX age_index ON employees(age);

-- > (unique key)unique index also nonclustered index 

-- > COMPOSITE index -- seq matter

SHOW INDEXES FROM employees;
CREATE INDEX comp_idex ON employees(age, name);

EXPLAIN SELECT * FROM employees WHERE age=100 and name='shyam';
EXPLAIN SELECT * FROM employees WHERE age=100;
EXPLAIN SELECT * FROM employees WHERE name='shyam'; -- can't use index bcz seq. matter (we should use seq1 column in filtering)
EXPLAIN SELECT * FROM employees WHERE name='shyam' and age=100;

-- Most Common Interview Questions
-- GROUP BY, LEFT JOIN, INNERJOIN, SELF JOIN, 
-- CORRELATED SUBQUERY, WINDOW FUNCTION FULL, 
-- RUNNING SUM, VIEWS, INDEXES, NORMALIZATION & ACID PROPERTIES, OPTIMIZATION