USE employees;


-- 2.  Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya' USING IN. Enter a COMMENT WITH the number of records returned.

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- returned 709 rows



-- 3.  Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AS IN Q2, but USE OR instead of IN. Enter a COMMENT WITH the number of records returned. Does it MATCH number of ROWS FROM Q2?

SELECT *
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';

-- returned 709n rows with matched the previous question.


-- 4.  Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', USING OR, AND who IS male. Enter a COMMENT WITH the number of records returned.

SELECT *
FROM employees
WHERE gender = 'm' AND first_name IN ('Irena', 'Vidya', 'Maya');

-- returned 441 records



-- 5.  Find ALL current OR previous employees whose LAST NAME STARTS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS WITH E.

SELECT *
FROM employees
WHERE last_name LIKE 'e%'

-- returned 441 records



-- 6.  Find ALL current OR previous employees whose LAST NAME STARTS OR ENDS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS OR ENDS WITH E. How many employees have a LAST NAME that ENDS WITH E, but does NOT START WITH E?

select *
from employees
where last_name like 'e%' or last_name like '%e';

select *
from employees
where last_name not like 'e%' and last_name like '%e';


-- 30723 and 23393



-- 7.  Find ALL current OR previous employees employees whose LAST NAME STARTS AND ENDS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS AND ENDS WITH E. How many employees' LAST NAMES END WITH E, regardless of whether they START WITH E?

SELECT *
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE '%e';

-- 899 and 24292 employees


-- 8.  Find ALL current OR previous employees hired IN the 90s. Enter a COMMENT WITH the number of employees returned.

SELECT emp_no
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- 15214 employees hired in 90s



-- 9.  Find ALL current OR previous employees born ON Christmas. Enter a COMMENT WITH the number of employees returned.

SELECT emp_no
FROM employees
WHERE birth_date LIKE '%12-25';

-- returned 842



-- 10.  Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

SELECT emp_no
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%12-25';

-- returned 362 rows


-- 11.  Find ALL current OR previous employees WITH a 'q' IN their LAST name. Enter a COMMENT WITH the number of records returned.

SELECT emp_no
FROM employees
WHERE last_name LIKE '%q%';

-- returned 1873


-- 12.  Find ALL current OR previous employees WITH a 'q' IN their LAST NAME but NOT 'qu'. How many employees are FOUND?

SELECT emp_no
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';


-- returned 547



