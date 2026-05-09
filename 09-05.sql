create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);

-- Display employee names along with their department names.
select employees.emp_name, departments.dept_name
from employees
join departments on employees.dept_id=departments.dept_id
order by employees.emp_name;

-- Display all employees and their department names, including employees without departments.
select employees.emp_name, departments.dept_name
from employees
left join departments on employees.dept_id=departments.dept_id
order by employees.emp_name;

-- Find the number of employees in each department.
select departments.dept_name, count(employees.emp_id)
from employees
join departments on departments.dept_id=employees.dept_id
group by departments.dept_name;

-- Display all departments and the total salary paid in each department.
select departments.dept_name, sum(employees.salary)
from employees
join departments on departments.dept_id=employees.dept_id
group by departments.dept_name;

-- Find how many employees report to each manager.
select mngr.emp_id, mngr.emp_name, count(emp.manager_id)
from employees as emp
join employees as mngr on emp.manager_id=mngr.emp_id
group by mngr.emp_id, mngr.emp_name;

select mngr.emp_name, count(*)
from employees as emp
join employees as mngr on emp.manager_id=mngr.emp_id
group by mngr.emp_name
order by mngr.emp_name;

-- Display average salary department-wise where average salary is greater than 60000.
select departments.dept_name, avg(employees.salary)
from departments
join employees on departments.dept_id=employees.dept_id
group by departments.dept_name
having avg(employees.salary) > 60000;


/*
Display employee names along with their department names.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |



Display all employees and their department names, including employees without departments.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
| Oscar    | NULL      |


Find the number of employees in each department.
| dept_name | total_employees |
| --------- | --------------- |
| HR        | 3               |
| IT        | 5               |
| Finance   | 3               |
| Sales     | 3               |



Display all departments and the total salary paid in each department.
| dept_name | total_salary |
| --------- | ------------ |
| HR        | 217000       |
| IT        | 309000       |
| Finance   | 161000       |
| Sales     | 150000       |




Find how many employees report to each manager.
| manager | team_size |
| ------- | --------- |
| Alice   | 5         |
| Bob     | 4         |
| David   | 4         |
| Eva     | 2         |
| Grace   | 1         |



Display average salary department-wise where average salary is greater than 60000.
| dept_name | avg_salary |
| --------- | ---------- |
| HR        | 72333.33   |
| IT        | 61800      |





*/


use sakila;

select * from actor;
select * from film_actor;
select * from film;

-- q1. select actor_id actor full name and film id jisme actor ne work kiya
select film_actor.actor_id, concat_ws(' ', actor.first_name, actor.last_name), film_actor.film_id
from film_actor
join actor on film_actor.actor_id=actor.actor_id;

-- q2. get the film id the film title and the actor id 
select film_actor.actor_id, film.film_id, film.title
from film_actor
join film on film_actor.film_id=film.film_id;

-- q3. find the actor id , actor name and movie he has worked
select film_actor.actor_id, concat_ws(' ', actor.first_name, actor.last_name), film.title
from actor 
join film_actor on actor.actor_id=film_actor.actor_id
join film on film_actor.film_id=film.film_id;

-- q4. get actor id, actor name, film name only for the movie whose length is greater than 120
select film_actor.actor_id, concat_ws(' ', actor.first_name, actor.last_name), film.title
from actor 
join film_actor on actor.actor_id=film_actor.actor_id
join film on film_actor.film_id=film.film_id
where film.length>120;

-- q5. get the actor id, actor name and the total number of movie he has worked
select film_actor.actor_id, concat_ws(' ', actor.first_name, actor.last_name), count(film.title)
from actor 
join film_actor on actor.actor_id=film_actor.actor_id
join film on film_actor.film_id=film.film_id
group by film_actor.actor_id;

-- q6. get the film title, and the number of actor worked in that film
select film.title, count(*) 
from film 
join film_actor on film.film_id=film_actor.film_id
join actor on film_actor.actor_id=actor.actor_id
group by film.title;