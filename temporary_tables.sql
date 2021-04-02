USE florence11;

-- NOTES

CREATE TABLE my_numbers(
    n INT UNSIGNED NOT NULL 
);

INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5);


SELECT * FROM my_numbers;

SHOW TABLES;


CREATE TEMPORARY TABLE current_salary AS (
SELECT employees.employees.first_name, employees.employees.last_name, employees.salaries.salary
FROM employees.salaries
JOIN employees.employees USING (emp_no)
WHERE to_date > curdate());

SELECT *
FROM current_salary;


-- if we do 5% raises for all current employees, what is the sum of those salaries


--  UPDATE my_numbers SET n = n + 1(where clause if needed);

UPDATE current_salary SET salary = salary + salary * .05;

SELECT sum(salary) FROM current_salary;
 
SELECT sum(salary) FROM employees.salaries;





CREATE TEMPORARY TABLE fruits AS (
SELECT *
FROM fruits_db.fruits);


SELECT * 
FROM fruits;



---  EXERCISES

USE florence11;


-- 1.  Using the example from the lesson, re-create the employees_with_departments table.  
-- ADD a COLUMN named full_name TO this table. It should be a VARCHAR whose length IS the sum of the lengths of the FIRST NAME AND LAST NAME COLUMNS
-- UPDATE the TABLE so that FULL NAME COLUMN CONTAINS the correct DATA
-- Remove the first_name AND last_name COLUMNS FROM the table.
-- What IS another way you could have ended up WITH this same TABLE?


SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(dmp_no)
JOIN emplouees.departments USING(dept_no)
WHERE TO_date > curdate();

 SELECT first_name, last_name, dept_name
    FROM employees.employees
    JOIN employees.dept_emp USING(emp_no)
    JOIN employees.departments USING(dept_no)
    WHERE to_date > curdate()
);

employees_with_departments ADD full_name VARCHAR(30)


ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;


SELECT * FROM employees_with_departments;


-- 2.  CREATE a TEMPORARY TABLE based ON the payment TABLE FROM the sakila database.
-- WRITE the SQL necessary TO transform the amount COLUMN such that it IS stored AS an INTEGER representing the number of cents of the payment. FOR example, 1.99 should become 199.

USE florence11;


DROP TABLE IF EXISTS payments;

CREATE TEMPORARY TABLE payments AS (
    SELECT payment_id, customer_id, staff_id, rental_id, amount * 100 AS amount_in_pennies, payment_date, last_update
    FROM sakila.payment
);

SELECT * FROM payments;
DESCRIBE payments;

ALTER TABLE payments MODIFY amount_in_pennies INT NOT NULL;

DESCRIBE payments;




-- 3.  Find OUT how the current average pay IN EACH department compares TO the overall, historical average pay. IN order TO make the comparison easier, you should USE the Z-score FOR salaries. IN terms of salary, what IS the best department RIGHT now TO WORK FOR? The worst?


create temporary table historic_aggregates as (
    select avg(salary) as avg_salary, std(salary) as std_salary
    from employees.salaries 
);

create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);

select * from current_info;

alter table current_info add historic_avg float(10,2);
alter table current_info add historic_std float(10,2);
alter table current_info add zscore float(10,2);

update current_info set historic_avg = (select avg_salary from historic_aggregates);
update current_info set historic_std = (select std_salary from historic_aggregates);

select * from current_info;

update current_info 
set zscore = (department_current_average - historic_avg) / historic_std;

select * from current_info
order by zscore desc;