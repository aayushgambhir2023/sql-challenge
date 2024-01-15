-- List the employee number, last name, first name, sex, and salary of each employee
SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	s.salary
FROM "Employees" as emp
LEFT join "Salaries" as s ON emp.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
   emp.first_name,
   emp.last_name,
   emp.hire_date
FROM "Employees" as emp
WHERE EXTRACT(YEAR FROM emp.hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    dm.emp_no AS manager_emp_no,
    dm.dept_no AS department_number,
    dept.dept_name AS department_name,
    emp.emp_no AS employee_number,
    emp.last_name,
    emp.first_name
FROM "Dept_manager" AS dm
JOIN "Employees" AS emp ON dm.emp_no = emp.emp_no
JOIN "Departments" AS dept ON dm.dept_no = dept.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    emp.emp_no,
    emp.last_name,
    emp.first_name,
    emp_dept.dept_no,
    dept.dept_name
FROM "Employees" as emp
LEFT JOIN "Dept_emp" as emp_dept ON emp.emp_no = emp_dept.emp_no
LEFT JOIN "Departments" as dept ON emp_dept.dept_no = dept.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	emp.first_name,
	emp.last_name,
	emp.sex
FROM "Employees" as emp
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    emp.emp_no,
    emp.last_name,
    emp.first_name,
    emp_dept.dept_no,
    dept.dept_name
FROM "Employees" as emp
LEFT JOIN "Dept_emp" as emp_dept ON emp.emp_no = emp_dept.emp_no
LEFT JOIN "Departments" as dept ON emp_dept.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    emp.emp_no,
    emp.last_name,
    emp.first_name,
    dept.dept_name
FROM "Employees" as emp
LEFT JOIN "Dept_emp" as emp_dept ON emp.emp_no = emp_dept.emp_no
LEFT JOIN "Departments" as dept ON emp_dept.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
    emp.last_name,
    COUNT(emp.last_name) AS NameFrequency
FROM "Employees" as emp
GROUP BY emp.last_name
ORDER BY NameFrequency DESC;