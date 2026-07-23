CREATE DATABASE FINAL_PROJECT;

CREATE TABLE students (
	student_ID INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(50),
    birth_date DATE,
    enrollment_date DATE
);

INSERT INTO students(student_ID, first_name, last_name, email, birth_date, enrollment_date) VALUES
(1, 'John', 'Doe', 'john.doe@emamil.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');

CREATE TABLE courses (
	course_ID INT,
    course_name VARCHAR(20),
	department_ID INT,
    credits INT
);

INSERT INTO courses(course_ID, course_name, department_ID, credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);

CREATE TABLE instructors (
	instructors_ID INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(50),
    department_ID INT
);

INSERT INTO instructors(instructors_ID, first_name, last_name, email, department_ID) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2);

CREATE TABLE enrollments(
	enrollment_ID INT,
    student_ID INT,
    course_ID INT,
    enrollment_date DATE
);

INSERT INTO enrollments(enrollment_ID, student_ID, course_ID,enrollment_date) VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');

CREATE TABLE departments(
	department_ID INT,
    department_name VARCHAR(20)
);

INSERT INTO departments(department_ID, department_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'); 

-- perform CRUD operations on all tables
-- 1. student table CRUD 
-- create
INSERT INTO students (student_ID, first_name, last_name, email, birth_date, enrollment_date) VALUES
(3, 'Emily', 'Brown', 'emily.brown@email.com', '2001-03-18', '2023-08-01');
-- read
SELECT * FROM students;
-- update
UPDATE students
SET email = 'john.new@email.com'
WHERE student_ID = 1;
-- delete 
DELETE FROM students
WHERE student_ID = 3;

-- 2. courses table
-- create
INSERT INTO courses (course_ID, course_name, department_ID, credits) VALUES
(103, 'Database Systems', 1, 4);
-- read
SELECT * FROM courses;
-- update
UPDATE courses
SET credits = 5
WHERE course_ID = 103;
-- delete 
DELETE FROM courses
WHERE course_ID = 103;

-- 3. instructors table
-- create
INSERT INTO instructors (instructors_ID, first_name, last_name, email, department_ID) VALUES
(3, 'David', 'Wilson', 'david.wilson@univ.com', 1);
-- read
SELECT * FROM instructors;
-- update
UPDATE instructors
SET email = 'alice.new@univ.com'
WHERE instructors_ID = 1;
-- delete
DELETE FROM instructors
WHERE instructors_ID = 3;

-- 4. enrollment table 
-- create
INSERT INTO enrollments (enrollment_ID, student_ID, course_ID, enrollment_date) VALUES
(3, 1, 102, '2023-01-10');
-- read
SELECT * FROM enrollments;
-- update
UPDATE enrollments
SET course_ID = 101
WHERE enrollment_ID = 3;
-- delete
DELETE FROM enrollments
WHERE enrollment_ID = 3;

-- 5. department table
-- create
INSERT INTO departments (department_ID, department_name) VALUES
(3, 'Physics');
-- read
SELECT * FROM departments; 
-- update 
UPDATE departments
SET department_name = 'Computer Science'
WHERE department_ID = 1;
-- delete
DELETE FROM departments
WHERE department_ID = 3;

-- Retrieve students who enrolled after 2022. 
SELECT * FROM students WHERE enrollment_date > '2022-12-31';

-- Retrive courses offered by the mathematics departments with a limit of 5 courses. 
SELECT
    c.course_ID,
    c.course_name,
    c.credits,
    d.department_name
FROM courses c
INNER JOIN departments d
ON c.department_ID = d.department_ID
WHERE d.department_name = 'Mathematics'
LIMIT 5;

-- GET the number of students enrolled in each course, filtering for courses with more than 5 students. 
SELECT
    c.course_ID,
    c.course_name,
    COUNT(e.student_ID) AS total_students
FROM courses c
INNER JOIN enrollments e
ON c.course_ID = e.course_ID
GROUP BY c.course_ID, c.course_name
HAVING COUNT(e.student_ID) > 5;

-- find students who are enrolled in both introduction to SQL and data structures 
SELECT
    s.student_ID,
    s.first_name,
    s.last_name
FROM students s
INNER JOIN enrollments e
ON s.student_ID = e.student_ID
INNER JOIN courses c
ON e.course_ID = c.course_ID
WHERE c.course_name IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.student_ID, s.first_name, s.last_name
HAVING COUNT(DISTINCT c.course_name) = 2;

-- find students who are enrolled in both introduction to SQL or data structures 
SELECT
    s.student_ID,
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_ID = e.student_ID
INNER JOIN courses c
ON e.course_ID = c.course_ID
WHERE c.course_name IN ('Introduction to SQL', 'Data Structures');

-- calculate the average number of credits in each department
SELECT
    d.department_ID,
    d.department_name,
    AVG(c.credits) AS average_credits
FROM departments d
INNER JOIN courses c
ON d.department_ID = c.department_ID
GROUP BY d.department_ID, d.department_name;

-- find the maximum salary of instructors in the computer science department
ALTER TABLE instructors
ADD salary INT;

UPDATE instructors
SET salary = 70000
WHERE instructors_ID = 1;

UPDATE instructors
SET salary = 65000
WHERE instructors_ID = 2;

SELECT
    i.first_name,
    i.last_name,
    i.salary,
    d.department_name
FROM instructors i
INNER JOIN departments d
ON i.department_ID = d.department_ID
WHERE d.department_name = 'Computer Science'
ORDER BY i.salary DESC
LIMIT 1;

-- count the number of students and their corresponding courses. 
SELECT
    c.course_ID,
    c.course_name,
    COUNT(e.student_ID) AS total_students
FROM courses c
INNER JOIN enrollments e
ON c.course_ID = e.course_ID
GROUP BY c.course_ID, c.course_name;

-- inner join 
SELECT
    s.student_ID,
    s.first_name,
    s.last_name,
    c.course_ID,
    c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_ID = e.student_ID
INNER JOIN courses c
ON e.course_ID = c.course_ID;

-- Left join 
SELECT
    s.student_ID,
    s.first_name,
    s.last_name,
    c.course_ID,
    c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_ID = e.student_ID
LEFT JOIN courses c
ON e.course_ID = c.course_ID;

-- subquery: find students enrolled in courses that have more than 10 students 
SELECT
    s.student_ID,
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_ID = e.student_ID
INNER JOIN courses c
ON e.course_ID = c.course_ID
WHERE e.course_ID IN (
    SELECT course_ID
    FROM enrollments
    GROUP BY course_ID
    HAVING COUNT(student_ID) > 10
);

-- extract the year from the enrollment date of students
SELECT
    student_ID,
    first_name,
    last_name,
    enrollment_date,
    YEAR(enrollment_date) AS enrollment_year
FROM students;

-- concatename the instuctor's first and last name
SELECT 
	first_name, 
    last_name,
    CONCAT(first_name,' ',last_name) AS full_name
FROM instructors;

-- calculate the running total of students enrolled in courses.
SELECT
    c.course_ID,
    c.course_name,
    COUNT(e.student_ID) AS students_enrolled,
    SUM(COUNT(e.student_ID)) OVER (
        ORDER BY c.course_ID
    ) AS running_total
FROM courses c
LEFT JOIN enrollments e
ON c.course_ID = e.course_ID
GROUP BY c.course_ID, c.course_name;

-- label students as 'senior' or 'junior' based on their year of enrollment.(if the enrollment date is more than 4 years 
-- from the currentdate, put the label 'senior' otherwise 'junior')
SELECT
    student_ID,
    first_name,
    last_name,
    enrollment_date,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, enrollment_date, CURDATE()) >= 4 THEN 'Senior'
        ELSE 'Junior'
    END AS student_level
FROM students;