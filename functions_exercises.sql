USE employees;

-- 2.  WRITE a QUERY TO TO find ALL employees whose LAST NAME STARTS AND ENDS WITH 'E'. USE concat() TO combine their FIRST AND LAST NAME together AS a single COLUMN named full_name.

SELECT concat(first_name, ':', last_name)
	AS 'full_name'
	FROM employees
	WHERE last_name LIKE '%e' AND last_name LIKE 'e%';
	
-- returned list 

-- 3.  CONVERT the NAMES produced IN your LAST QUERY TO ALL uppercase.

SELECT UPPER concat(first_name, ':', last_name)
	AS 'full_name'
	FROM employees
	WHERE last_name LIKE '%e' AND last_name LIKE 'e%';





-- 4.  Find ALL employees hired IN the 90s AND born ON Christmas. USE datediff() FUNCTION TO find how many days they have been working AT the company (Hint: You will also need TO USE NOW() OR CURDATE()),

-- 5.  Find the smallest AND largest current salary FROM the salaries table.

-- 6.  USE your knowledge of built IN SQL functions TO generate a username FOR ALL of the employees. A username should be ALL lowercase, AND consist of the FIRST CHARACTER of the employees FIRST NAME, the FIRST 4 characters of the employees LAST NAME, an underscore, the MONTH the employee was born, AND the LAST two digits of the YEAR that they were born. Below IS an example of what the FIRST 10 ROWS will look LIKE: