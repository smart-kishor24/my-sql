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
