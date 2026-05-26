USE datatypedb;
-- DDL Statements
CREATE TABLE test10(id INT, nam VARCHAR(20));
INSERT INTO test10 VALUES(1,'abhi'),(2, 'shini'), (3, 'yash');
SELECT * FROM test10;

-- TRUNCATE ( ddl statement ) => first delete table than recreate table
TRUNCATE test10; -- data is deleted but not the table structure
SELECT * FROM test10;

-- DROP ( ddl statement )  delete ->[ table + structure ]
DROP TABLE test10; -- drop table strucuture is dropped/removed
DROP TABLE test6; 

CREATE TABLE test10(id INT, name VARCHAR(20));
INSERT INTO test10 VALUES(1,'abhi'),(2, 'shini'), (3, 'yash');
SELECT * FROM test10;

ALTER TABLE test10 ADD COLUMN (salary INT); -- to add columns
ALTER TABLE test10 ADD COLUMN (age INT DEFAULT 18);
ALTER TABLE test10 DROP COLUMN salary; -- to delte column
ALTER TABLE test10 RENAME COLUMN salary TO new_salary; -- rename column name
ALTER TABLE test10 ADD CONSTRAINT primary key (id);
DESC test10;

-- q. add a column before name column
q. change the data type of name column to integer
-- q. add a not null constraint to the name and age column
-- q. add a foreign key of a column name as dept_id refer to departments table


SELECT DATABASE();
SELECT * FROM sakila.actor; -- to use another db table ( db_name.table_name )

-- CTAS -> Create table as Select
-- create a table from a select query
DROP TABLE tushar999;
CREATE TABLE tushar999 AS 
SELECT actor_id, first_name FROM sakila.actor;

SELECT * FROM tushar999;
-- DML (Data Manipulation Language)
INSERT INTO tushar999 VALUES(1999, 'Japan');
-- ------------ --
SET SQL_SAFE_UPDATES = 0;
-- ------------ --
UPDATE tushar999 SET first_name = 'Urvashi'; -- filled Urvashi in all rows
UPDATE tushar999 SET first_name = 'Raj'
 WHERE actor_id=2;
UPDATE tushar999 SET first_name = 'Julie'
 WHERE actor_id=4;
 
DELETE FROM tushar999; -- Delete All rows
DELETE FROM tushar999 
 WHERE actor_id = 2; -- Delete Specific row as given condition
 
SELECT * FROM tushar999;


-- Interview Question
-- 1. what is ddl and dml 
-- 2. diff. between truncate, delete or drop
-- 3. what is normalization
-- 4. diff. between char(), varcahr() data type