--Create tables and insert data

drop table departments;

CREATE TABLE departments(
dep_no varchar (10)primary key,
dept_name varchar (30));

select * from departments;

drop table employees;

CREATE TABLE employees(
	 emp_no serial PRIMARY KEY,
	birth_date varchar (30), 
	first_name varchar(30),
	last_name VARCHAR (30), 
	gender varchar (10), hire_date date);
	
select * from employees;
	
drop table salaries;
	
CREATE TABLE salaries (
	salary_id serial Primary Key,
	emp_no integer, 
	salary integer,
	from_date date,
	to_date date,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no));
	
select * from salaries;

drop table titles;

CREATE TABLE titles( 
	title_id serial primary key,
	emp_no integer, 
	title varchar (30),
	from_date date, 
	to_date date,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no));
	
select * from titles;

drop table dept_emp;

CREATE TABLE dept_emp(
	emp_no integer,
	dep_no varchar(10),
	from_date date,
	to_date date,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dep_no) REFERENCES departments(dep_no),
	PRIMARY KEY (emp_no, dep_no));

Select * from dept_emp;

drop table dept_manager;

CREATE TABLE dept_manager(
	dep_no varchar(10),
	emp_no integer,
	from_date date,
	to_date date,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dep_no) REFERENCES departments(dep_no),
	PRIMARY KEY (emp_no, dep_no));

select * from dept_manager;

