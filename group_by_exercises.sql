
USE employees;

-- 2.  IN your script, USE DISTINCT TO find the UNIQUE titles IN the titles table. How many UNIQUE titles have there ever been? Answer that IN a COMMENT IN your SQL file.


SELECT DISTINCT titles
FROM titles;

---  There have been   unique titles


-- 3.  WRITE a QUERY TO TO find a LIST of ALL UNIQUE LAST NAMES of ALL employees that START AND END WITH 'E' USING GROUP BY.


SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;


-- returned 5 rows


-- 4.  WRITE a QUERY TO TO find ALL UNIQUE combinations of FIRST AND LAST NAMES of ALL employees whose LAST NAMES START AND END WITH 'E'.

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE "e%e" AND last_name LIKE 'e%e'
GROUP BY first_name, last_name;



-- returned 4 rows

 

-- 5.  WRITE a QUERY TO find the UNIQUE LAST NAMES WITH a 'q' but NOT 'qu'. Include those NAMES IN a COMMENT IN your SQL code.


SELECT last_name
FROM employees
WHERE LAST_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- returned Chelq, Lindqvist, Qiwen



-- 6.  ADD a COUNT() TO your results (the QUERY above) AND USE ORDER BY TO make it easier TO find employees whose unusual NAME IS shared WITH others.

SELECT DISTINCT last_name, COUNT(last_name)
from employees
WHERE last_name Like '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name
Order By last_name;

-- Chleq 189, Lindqvist 190, Qiwen 168




-- 7.  Find ALL ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya'. USE COUNT(*) AND GROUP BY TO find the number of employees FOR EACH gender WITH those names.

	
SELECT gender, first_name, count(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name;

-- returned 3 m and 3 f 



-- 8.  USING your QUERY that generates a username FOR ALL of the employees, generate a count employees FOR EACH UNIQUE username. Are there ANY DUPLICATE usernames? BONUS: How many DUPLICATE usernames are there?


SELECT
LOWER(
    CONCAT(
        SUBSTR(first_name,1,1), 
        SUBSTR(last_name,1,4), 
        '_', 
        SUBSTR(birth_date,6,2), 
        SUBSTR(birth_date,3, 2))) 
        AS username, count(*)
FROM employees
GROUP BY username
HAVING count(*)>1;

-- returned 285872 rows with duplicate user names.  13251 rows

