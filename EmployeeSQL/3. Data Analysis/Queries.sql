/* List the employee number, last name, first name, sex, and salary of each employee. */

SELECT e.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name", 
	   e.sex AS "Sex", 
	   s.salary AS "Salary" 
FROM 
	employees e 
	INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;
	
-------------------------------------------------------------------------------------------------------

/* List the first name, last name, and hire date for the employees who were hired in 1986. */

SELECT first_name AS "First Name", 
	   last_name AS "Last Name", 
	   hire_date AS "Hire Date"
FROM employees
WHERE extract(year from hire_date) = 1986
ORDER BY "Hire Date";

-------------------------------------------------------------------------------------------------------

/* List the manager of each department along with their department number, department name, 
   employee number, last name, and first name. */

SELECT 
	t.title AS "Title",
	d.dept_no AS "Department Number", 
	d.dept_name AS "Department Name",
	dm.emp_no AS "Employee Number", 
	e.last_name AS "Last Name",
	e.first_name AS "First Name"

FROM 
	dept_manager dm 
	INNER JOIN employees e ON dm.emp_no = e.emp_no
	RIGHT JOIN departments d ON dm.dept_no = d.dept_no -- A Inner join would suffice for this data set, however, a right join helps identify any departments without a manager. 
	INNER JOIN titles t ON e.emp_title_id = t.title_id
ORDER BY d.dept_no;

-------------------------------------------------------------------------------------------------------

/* List the department number for each employee along with that employee’s employee number, last name, 
   first name, and department name. */

SELECT  
	de.dept_no AS "Department Number", 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM 
	dept_emp de 
	RIGHT JOIN employees e ON de.emp_no = e.emp_no -- A Inner join would suffice for this data set, however, a right join helps identify any employees not allocated to a department. 
	INNER JOIN departments d ON de.dept_no = d.dept_no
ORDER BY e.emp_no;


-------------------------------------------------------------------------------------------------------

/* List first name, last name, and sex of each employee whose first name is Hercules and whose last name
   begins with the letter B. */

SELECT  
	first_name AS "First Name",
	last_name AS "Last Name", 
	sex AS "Sex"
FROM 
	employees
WHERE first_name = 'Hercules' 
	  AND 
	  last_name LIKE 'B%'
ORDER BY "Last Name";

-------------------------------------------------------------------------------------------------------

/* List each employee in the Sales department, including their employee number, last name, 
   and first name. */

SELECT 
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"
FROM 
	dept_emp de 
	INNER JOIN employees e ON de.emp_no = e.emp_no
WHERE
	de.dept_no = 'd007'
ORDER BY de.emp_no;

-------------------------------------------------------------------------------------------------------

/* List each employee in the Sales and Development departments, including their employee number, 
   last name, first name, and department name.*/ 
   
SELECT 
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
FROM 
	dept_emp de 
	INNER JOIN departments d ON de.dept_no = d.dept_no
	INNER JOIN employees e ON de.emp_no = e.emp_no
WHERE
	d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY de.emp_no;

-------------------------------------------------------------------------------------------------------

/* List the frequency counts, in descending order, of all the employee last names (that is, how many 
   employees share each last name). */

SELECT 
	last_name AS "Last Name", 
	COUNT(last_name) AS "Frequency Count"
FROM 
	employees
GROUP BY 
	"Last Name"
ORDER BY "Frequency Count" DESC;
  
	



	  