USE employees;

-- 1.  WRITE a QUERY that RETURNS ALL employees (emp_no), their department number, their START DATE, their END DATE, AND a NEW COLUMN 'is_current_employee' that IS a 1 IF the employee IS still WITH the company AND 0 IF not.

SELECT emp_no, 
dept_no, 
from_date, 
to_date
FROM dept_no
	CASE  
	
	IF(to_date = '%9999%', TRUE, FALSE) AS current_employee
FROM dept_emp;
		

SELECT 
de.emp_no, 
dept_no, 
de.from_date, 
de.to_date,
CASE 
	WHEN de.to_date = '9999-01-01' THEN 1
	ELSE 0
END AS is_current_employee 
FROM dept_emp AS de
JOIN salaries ON de.emp_no = salaries.emp_no
AND salaries.to_date = '9999-01-01';
		
		
SELECT
	emp_no,
	dept_no,
	from_date,
	to_date,
	IF(to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM dept_emp;
		



-- 2.  WRITE a QUERY that RETURNS ALL employee NAMES (previous AND current), AND a NEW COLUMN 'alpha_group' that RETURNS 'A-H', 'I-Q', OR 'R-Z' depending ON the FIRST letter of their LAST name.

SELECT concat(first_name, ' ', last_name) AS employee_name,
CASE 
WHEN last_name BETWEEN 'A%' AND 'I%' THEN 'A-H'
WHEN last_name BETWEEN 'I%' AND 'R%' THEN 'I-Q'
else 'R-Z'
END AS alpha_group
FROM employees;




SELECT concat(first_name, ' ', last_name) AS employee_name,
CASE 
WHEN last_name BETWEEN 'A' AND 'I' THEN 'A-H'
WHEN last_name BETWEEN 'I' AND 'R' THEN 'I-Q'
ELSE 'R-Z'
END AS alpha_group
FROM employees;




-- 3.  How many employees (current OR previous) were born IN EACH decade?



SELECT count(*),
CASE 
WHEN birth_date LIKE '195%' THEN 'born_in_50s'
WHEN birth_date LIKE '196%' THEN 'born_in_60s'
END AS decades
FROM employees
GROUP BY decades;


