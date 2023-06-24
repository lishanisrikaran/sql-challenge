
-- Creates departments table.

CREATE TABLE departments (
	dept_no VARCHAR(5) NOT NULL, 
	dept_name VARCHAR(255) NOT NULL, 
	PRIMARY KEY (dept_no)
	);

-- Selects departments table.

SELECT * FROM departments;

-----------------------------------------------------------------------------------------------

-- Creates titles table

CREATE TABLE titles (
	title_id VARCHAR(5) NOT NULL, 
	title VARCHAR(255) NOT NULL,
	PRIMARY KEY (title_id)
	);
	
-- Selects titles table.

SELECT * FROM titles;

-----------------------------------------------------------------------------------------------

-- Creates employees table.

CREATE TABLE employees (
	emp_no INTEGER NOT NULL, 
	emp_title_id VARCHAR(5) NOT NULL, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR(255) NOT NULL, 
	last_name VARCHAR(255) NOT NULL, 
	sex CHAR NOT NULL, 
	hire_date DATE NOT NULL, 
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id), 
	PRIMARY KEY (emp_no)
	);

-- Selects employees table.

SELECT * FROM employees;

-----------------------------------------------------------------------------------------------

-- Creates dept_emp table.

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL, 
	dept_no VARCHAR(5) NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
	PRIMARY KEY (emp_no, dept_no)
	);
	
-- Selects dept_emp table.

SELECT * FROM dept_emp;

-----------------------------------------------------------------------------------------------

-- Creates dept_manager table.

CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL, 
	emp_no INTEGER NOT NULL, 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
	PRIMARY KEY (emp_no)
	);
	
-- Selects dept_manager table.

SELECT * FROM dept_manager;

-----------------------------------------------------------------------------------------------

-- Creates salaries table.

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL, 
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
	PRIMARY KEY (emp_no)
	);
	
-- Selects salaries table.

SELECT * FROM salaries;