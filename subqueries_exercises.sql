USE employees;


#1. Find all the employees with the same hire date as employee 101010 using a sub-query. 69 Rows
SELECT first_name, last_name,  emp_no, hire_date FROM employees
WHERE hire_date IN
(SELECT hire_date FROM employees
WHERE emp_no = '101010');


#2.Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles
SELECT title FROM titles
WHERE emp_no IN
(SELECT emp_no FROM employees
WHERE first_name = 'Aamod');

#2. Another way with grouping all titles
SELECT title, COUNT(*) FROM titles
WHERE emp_no IN
(SELECT emp_no FROM employees
WHERE first_name = 'Aamod')
GROUP BY title;

#3. Find all the current department managers that are female.
SELECT first_name, last_name FROM employees
WHERE gender = 'F'
AND emp_no IN
(SELECT emp_no FROM dept_manager WHERE to_date > NOW());


#BONUS
#1. Find all the department names that currently have female managers.
SELECT dept_name FROM departments
WHERE dept_no IN
(SELECT dept_no FROM dept_manager
WHERE to_date > NOW()
AND emp_no IN
(SELECT emp_no FROM employees
WHERE gender = 'F'));






