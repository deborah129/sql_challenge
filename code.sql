

--Crete tables and insert data

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

--List the following details of each employee: employee number, last name, first name, gender, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
from employees
join salaries
on employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.

SELECT first_name, last_name FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: departmentnumber, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
select dm.dep_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from departments as d
join dept_manager as dm
on dm.dep_no = d.dep_no
join employees as e
on e.emp_no = dm.emp_no;



--List the department of each employee with the following information: employee number, last name, first name, and department name
select de.emp_no, d.dept_name, e.last_name, e.first_name
from dept_emp as de
join employees as e
on e.emp_no = de.emp_no
join departments as d
on d.dep_no = de.dep_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on de.dep_no = d.dep_no
where dept_name like 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name and department name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on de.dep_no = d.dep_no
where dept_name like 'Sales' or dept_name like 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
select last_name, count(last_name) from employees
group by last_name;
