USE employees;

-- example

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager)
LIMIT 10;



-- 1.  Find ALL the current employees WITH the same hire DATE AS employee 101010 USING a sub-query.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date IN (
	SELECT hire_date
	FROM employees WHERE emp_no = 101010) AND to_date LIKE '9999%';
	
	
	
SELECT first_name, last_name, hire_date
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no 
WHERE hire_date IN (SELECT hire_date
FROM employees e
WHERE emp_no = 101010) AND to_date LIKE '9999%';

-- Returned 55 rows

	

-- 2.  Find ALL the titles ever held BY ALL current employees WITH the FIRST NAME Aamod.


SELECT title 
FROM titles
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod')
GROUP BY title;


-- 6 titles. Assistant Engineer, Engineer, Senior Engineer, Senior Staff, Staff, Technique Leader





-- 3.  How many people IN the employees TABLE are NO longer working FOR the company? Give the answer IN a COMMENT IN your code.

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_emp
	WHERE to_date NOT LIKE '9999%');


-- 85,108 are no longer working for the company



-- 4.  Find ALL the current department managers that are female. LIST their NAMES IN a COMMENT IN your code.

SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no 
	FROM dept_manager
	WHERE to_date LIKE '9999%')
AND gender = 'F';


-- The female managers are Isamu Legleitner, Karsten Sigstam, Leon Sasarma, Hilary Kambil




-- 5.  Find ALL the employees who currently have a higher salary THAN the companies overall, historical average salary.


select first_name, last_name
from employees
where emp_no in (
	select emp_no
	from salaries
	where salary > (
			select avg(salary)
			from salaries)
	and to_date > now());
	
	
-- returned 154,543 rows




-- 6.  How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can USE a built IN FUNCTION TO calculate the standard deviation.) What percentage of ALL salaries IS this?

SELECT *
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
WHERE to_date > NOW()
AND salary > 141315.17; 

SELECT STD(salary)
FROM salaries;

SELECT AVG(salary)
FROM salaries;

SELECT *
FROM salaries
WHERE to_date > NOW();
