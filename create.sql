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