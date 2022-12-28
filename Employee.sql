CREATE TABLE departments(
dept_no VARCHAR (25),
dept_name VARCHAR (225)
);

CREATE TABLE dept_emp(
emp_no INTEGER,
dept_no VARCHAR (25)
);

CREATE TABLE dept_manager(
dept_no VARCHAR (25),
emp_no INTEGER
);

CREATE TABLE employees(
emp_no INTEGER,
emp_title_id VARCHAR(25),
birth_date DATE,
first_name VARCHAR(225),
last_name VARCHAR(225),
sex VARCHAR(5),
hire_date DATE
);

CREATE TABLE salaries(
emp_no INTEGER,
salary INTEGER
);

CREATE TABLE titles(
title_id VARCHAR(25),
title VARCHAR(25)
);

SELECT * FROM employees;

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE EXTRACT ('year' FROM hire_date) = 1986;


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT d.dept_name, d.dept_no, dm.emp_no, e.first_name, e.last_name, t.title
FROM departments d
JOIN dept_manager dm ON (d.dept_no = dm.dept_no)
JOIN employees e ON (e.emp_no = dm.emp_no)
JOIN titles t ON (e.emp_title_id = t.title_id)
WHERE title= 'Manager'


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_emp de ON (d.dept_no = de.dept_no)
JOIN employees e ON (de.emp_no = e.emp_no);

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de ON (d.dept_no = de.dept_no)
JOIN employees e ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de ON (d.dept_no = de.dept_no)
JOIN employees e ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS "last_name_count"
FROM employees e
GROUP BY last_name
ORDER BY "last_name_count" DESC;
