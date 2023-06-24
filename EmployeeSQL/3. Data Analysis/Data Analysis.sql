-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name", 
	   e.sex AS "Sex", 
	   s.salary AS "Salary" 
FROM 
	employees e 
	INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY "Last Name";
	
-------------------------------------------------------------------------------------------------------

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name AS "First Name", 
	   last_name AS "Last Name", 
	   hire_date AS "Hire Date"
FROM employees
WHERE extract(year from hire_date) = 1986
ORDER BY "Hire Date";

-------------------------------------------------------------------------------------------------------

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
	t.title AS "Title",
	dm.dept_no AS "Department Number", 
	d.dept_name AS "Department Name",
	dm.emp_no AS "Employee Number", 
	e.last_name AS "Last Name",
	e.first_name AS "First Name"

FROM 
	dept_manager dm 
	LEFT JOIN employees e ON dm.emp_no = e.emp_no
	LEFT JOIN departments d ON dm.dept_no = d.dept_no
	LEFT JOIN titles t ON e.emp_title_id = t.title_id
ORDER BY "Department Name";

-------------------------------------------------------------------------------------------------------

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT  
	de.dept_no, 
	de.emp_no,
	e.last_name, 
	e.first_name,
	d.dept_name
FROM 
	dept_emp de 
	LEFT JOIN departments d ON de.dept_no = d.dept_no
	LEFT JOIN employees e ON de.emp_no = e.emp_no;
	