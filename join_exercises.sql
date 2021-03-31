USE join_example_db;


--  2.  Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;


SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;


SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


-- another way from Madeline


SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;


-- Join returned 4 rows, Left returned 6 rows and Right returned 5 rows.



--  3.  Although NOT explicitly covered IN the lesson, AGGREGATE functions LIKE count can be used WITH JOIN queries. USE count AND the appropriate JOIN TYPE TO get a LIST of roles along WITH the number of users that has the role. Hint: You will also need TO USE GROUP BY IN the query.

SELECT roles.name AS roles, count(users.role_id) AS users
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles;


SELECT r.name, count(u.name)
FROM roles AS r
RIGHT JOIN users AS u ON r.id = u.role_id
GROUP BY r.name;

SELECT r.name, count(u.name)
FROM roles AS r
LEFT JOIN users AS u ON r.id = u.role_id
GROUP BY r.name;

-- admin 1, author 1, commenter 0, reviewer 2



-- 



USE employees;


-- 2.  Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.





SELECT d.dept_name AS 'Department Name',
CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
 FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
 JOIN departments AS d
  ON d.dept_no = de.dept_no 
WHERE de.to_date LIKE '9999%'
ORDER BY d.dept_name;






SELECT dept_name AS "Department Name", concat(first_name, ' ', last_name) AS "Department Manager"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > curdate()
ORDER BY dept_name ASC;



-- 3.  Find the name of all departments currently managed by women.
-- output: department and manger names


SELECT * FROM departments LIMIT 5;

---  from Madeline
SELECT departments.dept_name,
concat(employees.first_name, ' ', employees.last_name)
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date > now()
AND employees.gender = 'F'
ORDER BY dept_name;


SELECT d.dept_name AS 'Department NAME',
CONCAT(e.first_name, ' ', e.last_name) AS 'Manager NAME'
 FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
 JOIN departments AS d
  ON d.dept_no = de.dept_no 
WHERE de.to_date LIKE '9999%' AND e.gender = 'F'
ORDER BY d.dept_name;






-- 4.  Find the current titles of employees currently working in the Customer Service department.



SELECT titles.title,
count(employees.emp_no)
FROM departments
JOIN dept_emp AS d
	ON departments.dept_no = d.dept_no
JOIN employees ON d.emp_no = employees.emp_no
JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date > now() AND d.to_date > now()
AND dept_name = 'customer service'
GROUP BY title;








-- 5.  Find the current salary of all current managers.



SELECT d.dept_name, concat(employees.first_name, ' ', employees.last_name)
AS employee_name,
s.salary
FROM employees 
JOIN salaries s ON employees.emp_no = s.emp_no
JOIN dept_manager ON s.emp_no = dept_manager.emp_no
JOIN departments d ON d.dept_no = dept_manager.dept_no
WHERE s.to_date > now() AND dept_manager.to_date > now()
ORDER BY dept_name;






-- 6.  Find the number of current employees in each department.


SELECT de.dept_no, dept_name, count(e.emp_no) AS num_employees
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE de.to_date LIKE '9999%'
GROUP BY de.dept_no;










-- 7.  Which department has the highest average salary? Hint: Use current not historic information.


SELECT dept_name, avg (salary)
FROM departments
JOIN dept_emp using (dept_no)
JOIN salaries using (emp_no)
WHERE salaries.to_date LIKE '9999-01-01' and dept_emp.to_date like '9999-01-01' and dept_name = 'Sales'
group by dept_name
order by avg (salary) desc;





-- 8.  Who is the highest paid employee in the Marketing department?


SELECT first_name, last_name
FROM employees e
JOIN  salaries s ON s.emp_no = e.emp_no
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_no = 'd001'
ORDER BY salary DESC
LIMIT 1;


-- another way
SELECT e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > now()
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND s.to_date > now()
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;





-- 9.  Which current department manager has the highest salary?

 

SELECT e.first_name, e. last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > now()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > now()
JOIN departments AS d ON d.dept_no = dm.dept_no
ORDER BY s.salary DESC
LIMIT 1;



-- or

SELECT e.first_name, e. last_name, s.salary, d.dept_name
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > now()
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > now()
JOIN departments AS d ON d.dept_no = dm.dept_no
ORDER BY s.salary DESC
LIMIT 1;



-- 10.  Bonus Find the names of all current employees, their department name, and their current manager's name.














-- 11.  Bonus Who is the highest paid employee within each department.












