create database shadidb;

use shadidb;

create table biodata( id int, name varchar(20), age int);

insert into biodata values (1, 'rahul', 28), (2, 'anjali', 28), (3, 'aishwarya', 40), (4, 'naina', 23);

select * from biodata;

select age from biodata where name='rahul'; -- age of rahul

select * from biodata where age=28;

select * from biodata where age=(select age from biodata where name='rahul');

select * from biodata where age=(select age from biodata where name='rahul') and name!='rahul';


-- find out girl 
select name, char_length(name) from biodata 
where char_length(name)=(select char_length(name) from biodata where name='rahul');

-- this type of subquery called single row subquery
-- Types of Subquery
-- 1. Single Row Subquery
-- it is the type of subquery in which inner query return only one row 



use sakila;
select * from film;

-- q. mujhe us movie ka naam nikalna h where the rental_rate is same for the movie of african egg

-- (i) find rental_rate of african egg movie
select rental_rate from film where title='AFRICAN EGG';

-- (ii) find result in manual static
select title, rental_rate from film
where rental_rate=2.99;

-- (iii) find result in dynamic
select title, rental_rate from film
where rental_rate=(select rental_rate from film where title='AFRICAN EGG');

-- q. get the movie id and the movie name where the rental_rate is equal to min(rental_rate)
select film_id, title from film
where rental_rate=(select min(rental_rate) from film);

-- q. get the movie id and the movie  name and the duration where the duration is greater than the avg duration of movies
select film_id, title, length from film
where length>(select avg(length) from film);

-- q. get the movie id for the movies where the release year of the movie should be equals to
--    relasing_date of alone trip movie and the rating should be same as of the movie "apollo teen"
select film_id, title, release_year, rating from film
where release_year=(select release_year from film where title='ALONE TRIP')
and rating=(select rating from film where title='APOLLO TEEN');

-- 2. Multi Row Subquery
 -- if it return multiple rows ( more then one row )
 
 use shadidb;
 
 select * from biodata;
 
 -- multirow subquery me comparison operator (=, <, >, <=, >=) nhi chal sakte
 select * from biodata where name='rahul'
 and age=(select age from biodata where name='anjali' or name='aishwarya');

select * from biodata where name='rahul'
and age in (select age from biodata where name='anjali' or name='aishwarya');
 
select * from biodata 
where age in (select age from biodata where name='anjali' or name='aishwarya') and name!='rahul';

select * from biodata
where age=(select age from biodata where name='rahul') or age=(select age from biodata where name='rahul')+12;

-- find the name for rahul where the age is not eqal to the age of anjali or aishwarya
select * from biodata
where age not in (select age from biodata where name='anjali' or name='aishwarya') and name!='rahul';

-- Hacker rank 3 star should complete