use employees;


-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select *
from employees
	where first_name in ('irena', 'vidya', 'maya')
	order by first_name;


SELECT *
from employees
	where first_name in ('irena', 'vidya', 'maya')
	order by first_name desc, emp_no desc;



-- returns 709 rows. 





-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select *
from employees
	where first_name in ('Irena', 'Vidya', 'Maya')
	order by first_name, last_name;
	
	
-- return Irena Acton and Vidya Zweizig



-- 4.  Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?


select *
from employees
where first_name in ('Irena', 'Vidya', or 'Maya')
order by first_name, last_name;


---  returned Irena Acton and Maya Zyda


-- 5.  Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

select *
from employees
where last_name like 'e%e'
order by emp_no;

-- returned 899 records Ramzi Erde and Tadahiro Erde


-- 6.  Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.

select *
from employees
	where last_name like 'e%e'
	order by hire_date DESC;
	
	
	
---  899 returned..  newest employee Teiji Eldridge and oldest is sergi erde





-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.

select *
from employees
	where hire_date like '199%' and birth_date like '%12-25'
	order by birth_date, hire_date desc;
	
-- 362 rows Khun Mernini was first and Douadi Pettis was last 