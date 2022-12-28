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