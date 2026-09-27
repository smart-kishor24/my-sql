1. creating the database:-
create database company_db;

2. To show database:-
SHOW DATABASES;

3. To use database:-
USE company_db;

4. too create a table in the database:-
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

5. To display the data in the department table:-
DESC departments;

6. Inserting values in the department table:-
INSERT INTO departments
VALUES (1, 'Computer Science');
INSERT INTO departments
VALUES (2, 'Mechanical');

7. slect the data in the database:-
SELECT * FROM departments;

8. creating a new table :-
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(100) UNIQUE,

    salary DECIMAL(10,2) CHECK (salary > 0),

    city VARCHAR(50) DEFAULT 'Bangalore',

    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

9. Insert the values in the employee table:-
INSERT INTO employees
(employee_id, name, email, salary, department_id)
VALUES
(101, 'Rahul', 'rahul@gmail.com', 50000, 1);

 Problem Statement : A college want to maintain info about it scores and students create a database name college _db and create the following tables 

courses: 

column  	Datatype	constraint
course_id       INT              PRIMARY KEY
course_name     Varchar(100)     UNIQUE, NOT NULL
duration        INT 		 CHECK
fees 		DECIMAL(10,2)    CHECK


STUDENTS:

column 		Datatype 	constarint 
student_id 	INT             PRIMARY KEY 
student_name    Varchar(100)    NOT NULL
email 		Varchar(100)    UNIQUE
age             INT    		CHECK
city            Varchar(50)     DEFAULT
course_id	INT		FOREIGN KEY


Queies:

USE college_db;
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    duration INT CHECK (duration > 0),
    fees DECIMAL(10,2) CHECK (fees >= 0)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Guntur',
    course_id INT,
    
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO courses (course_id, course_name, duration, fees)
VALUES
(101, 'Python', 6, 15000.00),
(102, 'Java', 8, 20000.00),
(103, 'Data Science', 10, 30000.00),
(104, 'Web Development', 6, 18000.00),
(105, 'Machine Learning', 12, 40000.00);

INSERT INTO students 
(student_id, student_name, email, age, city, course_id)
VALUES
(1, 'Kishor', 'kishor@gmail.com', 21, 'Guntur', 101),
(2, 'Rahul', 'rahul@gmail.com', 22, 'Vijayawada', 102),
(3, 'Priya', 'priya@gmail.com', 20, 'Hyderabad', 103),
(4, 'Anil', 'anil@gmail.com', 23, 'Guntur', 104),
(5, 'Sneha', 'sneha@gmail.com', 21, 'Chennai', 105);

USE college_db;
alter table students
add address varchar(200);
alter table students
modify age decimal(12, 2);
select * from students;
desc students;
alter table students
rename column phone_num to phone_number;
desc students;


SELECT
	e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

SELECT
	e.employee_name,
    p.project_name 
FROM employees e
cross join projects p;

SELECT
	e.employee_name,
    d.department_name,
    p.project_name 
FROM employees e
inner join departments d
	ON e.department_id = d.department_id
inner join employee_projects ep
	ON e.employee_id = ep.employee_id
inner join projects p
	ON ep.project_id = p.project_id;

SELECT
	e.employee_name,
    p.project_name,
    p.budget
FROM employees e
join employee_projects ep
	ON e.employee_id = ep.employee_id
join projects p
	ON ep.project_id = p.project_id
WHERE p.budget  > 40000;

CREATE VIEW it_employees2 AS
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    e.email,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';


CREATE VIEW high_salary_employees1 AS
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > 60000;

SELECT *
FROM high_salary_employees;

CREATE DATABASE company_db;
USE company_db;
CREATE TABLE departments (
departments_id INT PRIMARY KEY AUTO_INCREMENT,
departments_name VARCHAR(100) NOT NULL,
location VARCHAR(100)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    department_id INT,
    manager_id INT,
    joining_date DATE,
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id),
    FOREIGN KEY(manager_id)
    REFERENCES employees(employee_id)
    );
    CREATE TABLE projects (
       project_id INT PRIMARY KEY AUTO_INCREMENT,
       project_name VARCHAR(100) NOT NULL,
       budget DECIMAL(12,2),
       start_date date

SELECT
    e.employee_name AS employee,
    e.salary,
    d.department_name AS department
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;

SELECT
    e.employee_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

SELECT
    e.employee_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

SELECT
    e.employee_name,
    p.project_name,
    ep.assigned_date
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
JOIN projects p
    ON ep.project_id = p.project_id;

SELECT
    e.employee_name
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
JOIN projects p
    ON ep.project_id = p.project_id
WHERE p.project_name = 'E-Commerce Application';

SELECT
    e.employee_name,
    ep.assigned_date
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
JOIN projects p
    ON ep.project_id = p.project_id
WHERE p.project_name = 'Banking Application';

CREATE VIEW high_salary_employees AS
SELECT
	employee_id,
    employee_name,
    salary
FROM employees
WHERE salary > 60000;

SELECT 
	employee_name,
	length(employee_name) AS name_length
FROM employees;

SELECT COUNT(*) AS total_employees
FROM employees;


USE company_db1;

CREATE VIEW department_salary_summary AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS average_salary,
	MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM departments d
LEFT JOIN employees e
    ON e.department_id = d.department_id
    GROUP BY d.department_id, d.department_name;
    SELECT *
    FROM department_salary_summary;

USE company_db1;
CREATE  OR REPLACE VIEW high_salary_employees AS
SELECT
    employee_id,
    employee_name,
    salary,
    department_id
    FROM employees
    WHERE salary > 70000;

DELIMITER //
CREATE FUNCTION annual_salary(monthly_salary DECIMAL(10, 2))
RETURNS DECIMAL(12, 2)
DETERMINISTIC
BEGIN
	RETURN monthly_salary * 12;
END //

DELIMITER ;

SELECT 
	employee_name,
    salary,
    annual_salary(salary) AS yearly_salary
FROM employees;

USE company_db1;

DELIMITER //

CREATE FUNCTION salary_category(
    monthly_salary DECIMAL(10, 2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    IF monthly_salary >= 70000 THEN
        RETURN 'High Salary';
    ELSEIF monthly_salary >= 50000 THEN
        RETURN 'Medium Salary';
    ELSE
        RETURN 'Low Salary';
    END IF;
END //

DELIMITER ;

USE company_db1;

DELIMITER //

CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT * 
    FROM employees;
END //

DELIMITER ;

USE company_db1;

DROP PROCEDURE IF EXISTS get_employee_by_department;

DELIMITER //

CREATE PROCEDURE get_employee_by_department(
    IN dept_name VARCHAR(50)
)
BEGIN
    SELECT
        employee_id,
        employee_name,
        salary,
        department
    FROM employees
    WHERE department = dept_name;
END //

DELIMITER ;

CALL get_employee_by_department('IT');

USE company_db1;
DELIMITER //
CREATE PROCEDURE update_employee_salary(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees 
       SET salary = new_salary
       WHERE employee_id = emp_id;
END//
DELIMITER :
CALL update_employee_salary(2, 700000);

USE company_db1;

DELIMITER //

CREATE PROCEDURE add_employee(
    IN emp_name VARCHAR(100),
    IN emp_email VARCHAR(100), 
    IN emp_salary DECIMAL(10,2),
    IN dept_id INT,
    IN join_date DATE
)
BEGIN
    INSERT INTO employees (
        employee_name, 
        email, 
        salary, 
        department_id,
        joining_date
    )
    VALUES (
        emp_name,
        emp_email, 
        emp_salary,
        dept_id,
        join_date
    );
END //
DELIMITER ;
CALL add_employee(
    'Vijay',
    'vijay@gmail.com',
     65000,
     1,
    '2026-01-15'
);








