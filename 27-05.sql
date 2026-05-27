-- TCL (Transaction Control Language)
-- Transaction -> are the group of sql statements which work as a unit
-- this tcl command ensure my data is correct & accurate by following 
-- the 4 properties
-- ACID properties
-- A. Atomicity (trasaction will completly done or completly undone)
-- C. Consistency (step by step execution)
-- I. Isolation (aapka kaam aapke paas hi hoga jb tk commit nhi kre)
-- D. Durability (my data will save permanently)

CREATE DATABASE rajdb;
USE rajdb;
CREATE TABLE raj45(id INT);
INSERT INTO raj45 VALUES(10);
SELECT * FROM raj45;

-- tcl
START TRANSACTION;  -- from here changes will inconsistacne & only for me
-- i will not save in my db i will manage my db not mysql
INSERT INTO raj45 VALUES(100), (40);
SELECT * FROM raj45;
COMMIT; -- make changes save & make db consistence

-- transactions kab kab start hote h
-- START TRANSACTION -> data will not consistance and not save automaically
-- AUTO COMMIT DISABLE IN MYSQL => SET autocommit = 0
-- when we run dml commands

-- trasactions end kb hota h
-- COMMIT -> save changes
-- ROLLBACK --> Revert changes
-- any DDL statement Execute

START TRANSACTION;
UPDATE raj45 SET id=100;
-- not effect on DDL commands they will run bravely
ALTER TABLE raj45 MODIFY id INT PRIMARY KEY; 
SELECT * FROM raj45;
DESC raj45;
ROLLBACK; 


SELECT * FROM raj45;
DELETE FROM raj45;
SELECT * FROM raj45;
ROLLBACK; -- kitna hi kr lo (! trasaction ko start kro for becoming independent boy)


SELECT @@autocommit;
SET autocommit = 0;
SELECT * FROM raj45;
INSERT INTO raj45 VALUES (20), (70);
ROLLBACK;

START TRANSACTION;
INSERT INTO raj45 VALUES(22), (33), (44);
DELETE FROM raj45 WHERE id=22;
SELECT * FROM raj45;
COMMIT;

START TRANSACTION;
INSERT INTO raj45 VALUES (45), (99), (88);
SELECT * FROM raj45;

SAVEPOINT raj45_savepoint_ins;
UPDATE raj45 SET id=5000;
ROLLBACK TO raj45_savepoint_ins; -- rollback to savepoint to revert upto specific point

-- Commit by run any ddl statement
CREATE TABLE tb_name(id INT);

-- diff between drop and truncate are ddl statement, delete is dml statement
-- we can't rollback drop and truncate but delete can be
