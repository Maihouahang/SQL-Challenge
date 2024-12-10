-- List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
	FROM "Employees" AS emp
	JOIN "Salaries" AS sal
	ON emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name,
	   last_name,
	   hire_date
	FROM "Employees"
	WHERE EXTRACT(YEAR FROM hire_date)='1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT man.dept_no, dep.dept_name, man.emp_no, emp.last_name, emp.first_name
	FROM "Dept_Manager" AS man
	INNER JOIN "Employees" AS emp 
	ON man.emp_no = emp.emp_no
	INNER JOIN "Departments" AS dep 
	ON man.dept_no = dep.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT dem.dept_no, emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
	FROM "Employees" AS emp
	INNER JOIN "Dept_Emp" AS dem 
	ON emp.emp_no = dem.emp_no
	INNER JOIN "Departments" AS dep 
	ON dem.dept_no = dep.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
	FROM "Employees"
	WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
	FROM "Employees" AS emp
	JOIN "Dept_Emp" AS dem 
	ON emp.emp_no = dem.emp_no
	JOIN "Departments" AS dep 
	ON dem.dept_no = dep.dept_no
	WHERE dep.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
	FROM "Employees" AS emp
	JOIN "Dept_Emp" AS dem 
	ON emp.emp_no = dem.emp_no
	JOIN "Departments" AS dep 
	ON dem.dept_no = dep.dept_no
	WHERE dep.dept_name 
	IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name, COUNT(*)
	FROM "Employees"
	GROUP BY last_name
	ORDER BY COUNT(*) DESC;