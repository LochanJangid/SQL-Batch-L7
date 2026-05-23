CREATE DATABASE const_db;

USE const_db;
SELECT DATABASE();

-- DDL -> Data Defination Language -> CREATE
CREATE TABLE IF NOT EXISTS test1(
	id INT, 
    age INT
);
-- DML -> Data Manipulation Language -> INSERT
INSERT INTO test1 VALUES (101, 32), (102, NULL);
INSERT INTO test1 VALUES (101, 52), (102, 52);

-- DQL -> Data Query Language -> SELECT
SELECT * FROM test1;

-- constraints -> are the rules which are applied to the table column to prevent invalid
-- 				  data entry in the table

-- Aplly Constraints -> 
-- NOT NULL to 'age' column
CREATE TABLE IF NOT EXISTS test2(
	id INT,
    age INT NOT NULL
);

INSERT INTO test2 VALUES(101, 32);
SELECT * FROM test2;
INSERT INTO test2 VALUES(102, NULL); -- Invalid Data Entry: Column 'age' cannot be NULL

-- UNIQUE to 'id' column
CREATE TABLE IF NOT EXISTS test3(
	id INT UNIQUE,
    age INT NOT NULL
);

INSERT INTO test3 VALUES(101, 32);
SELECT * FROM test3;
INSERT INTO test3 VALUES(101, 51); -- Invalid Data Entry: Duplicate entry!
INSERT INTO test3 VALUES(NULL, 51); -- Unique constraints me NULL values aa sakti h.

CREATE TABLE IF NOT EXISTS test4(
	id INT DEFAULT 100,
    age INT
);
INSERT INTO test4(age) VALUES(20);
INSERT INTO test4 VALUES(NULL, 40); -- default will not apply
SELECT * FROM test4;

CREATE TABLE IF NOT EXISTS test5(
	id INT PRIMARY KEY,
    age INT
);
INSERT INTO test5 VALUES(80, 23);
INSERT INTO test5 VALUES(80, 40); -- Duplicate entry for PRIMARY KEY ! 
SELECT * FROM test5;

-- (id, age) -> PRIMARY KEY (Composite key)
CREATE TABLE IF NOT EXISTS test6(
	id INT,
    age INT,
    salary INT,
    PRIMARY KEY (id, age)
);
INSERT INTO test6 VALUES(1, 50, 50000), (2, 40, 3400000), (1, 51, 200230203), (3, 50, 1031230);
INSERT INTO test6 VALUES(80, 40); -- Duplicate entry for PRIMARY KEY ! 
SELECT * FROM test6;

DESC test6; -- to describe the structure of table

-- CHECK constraint -> give condition to a col you can use any canditional operators.
CREATE TABLE IF NOT EXISTS test7(
	id INT,
    age INT CHECK (age>18)
);
INSERT INTO test7 VALUES(1, 50);
INSERT INTO test7 VALUES(2, 10); -- Check Constraint violated !
SELECT * FROM test7;

CREATE TABLE IF NOT EXISTS test8(
	id INT,
    age INT CHECK (age BETWEEN 18 AND 30)
);
INSERT INTO test8 VALUES(1, 20);
INSERT INTO test8 VALUES(2, 31); -- Check Constraint violated !
SELECT * FROM test8;
DESC test8;

-- FOREIGN KEY -> it generally refers to primary key
-- 				  it connects a table to another table

-- Independent tables
 -- Here is a problem when we insert any student cname which dosen't exists 
 -- it will run. 
CREATE TABLE student(
	id INT,
    name VARCHAR(20),
    cname VARCHAR(20)
);
INSERT INTO student VALUES(1, 'Naina', '10'), (2, 'Abhi', 12);
CREATE TABLE class(
	cname VARCHAR(20) PRIMARY KEY
);
INSERT INTO class VALUES(10), (8), (9);

SELECT * FROM class;

-- Related Tables 

-- parent table
CREATE TABLE s_class(
	cname VARCHAR(20) PRIMARY KEY
);
INSERT INTO s_class VALUES(10), (8), (9);

-- child table
CREATE TABLE s_student(
	id INT,
    name VARCHAR(20),
    cname VARCHAR(20),
    FOREIGN KEY (cname) REFERENCES s_class(cname)
);
INSERT INTO s_student VALUES(1, 'Naina', '10');
INSERT INTO s_student VALUES(2, 'Abhi', '12'); -- Cannot add/update a child row: foreign key constraint fails

SELECT * FROM s_student;


-- Learning Assignment -> Data Types