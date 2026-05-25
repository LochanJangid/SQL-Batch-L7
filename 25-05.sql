-- Data Types
CREATE DATABASE IF NOT EXISTS datatypedb;
USE datatypedb;

-- Numeric
CREATE TABLE test1 (id TINYINT);
INSERT INTO test1 VALUES(-1), (10);
INSERT INTO test1 VALUES(128); -- Out of Range (1 bytes => 8 bits => 2**8 (-128 to 127))
SELECT * FROM test1;

-- SMALL INT -> 2 byte
-- MEDIUM INT -> 3 byte
-- INT -> 4 byte
-- BIG INT -> 8 byte

CREATE TABLE test2(age TINYINT UNSIGNED); -- Range Changed => (-128 to 127) -> (0, 255)
INSERT INTO test2 VALUES(150);
INSERT INTO test2 VALUES(-2); -- Out of Range
INSERT INTO test2 VALUES(255);
SELECT * FROM test2;

-- float gives only 2 to 3 decimal digits
-- double gives upto 7 decimal digits
CREATE TABLE test3 (SALARY FLOAT, salary2 DOUBLE);
INSERT INTO test3 VALUES(1989.2343243, 1989.2343243);
SELECT * FROM test3;

CREATE TABLE test4 (price DOUBLE(6, 2)); -- total is 6, 2 is decimal digits, 4 are before decimal digits
INSERT INTO test4 VALUES(0.7326723);
INSERT INTO test4 VALUES(44.7326723);
INSERT INTO test4 VALUES(1234);
INSERT INTO test4 VALUES(12345.7326723); -- Out of Range bcz 5 digits before decimal

SELECT * FROM test4;

-- String data
CREATE TABLE test5 ( country_code CHAR(3)); -- fixed size  
INSERT INTO test5 VALUES ('IND');
INSERT INTO test5 VALUES('INDIA'); -- Error: Data too long to fixed size
INSERT INTO test5 VALUES('I');
INSERT INTO test5 VALUES('he                   '); -- it truncate ending whitespaces

SELECT *, char_length(country_code) FROM test5;

CREATE TABLE test6 ( country_code varchar(3)); -- size  
INSERT INTO test6 VALUES ('IND');
INSERT INTO test6 VALUES('INDIA'); -- Error: Data too long to fixed size
INSERT INTO test6 VALUES('I');
INSERT INTO test6 VALUES('h                   '); -- it just take till its own size

SELECT *, char_length(country_code) FROM test6;
