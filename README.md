# Student Management System – SQL Final Project

## 📌 Project Overview

This project demonstrates the implementation of a **Student Management System** using **MySQL**. It covers database creation, CRUD operations, joins, aggregate functions, subqueries, date functions, string functions, window functions, and conditional statements.

The project is designed to strengthen SQL fundamentals and intermediate concepts commonly used in real-world database applications and data analyst interviews.

---

## 🛠 Technologies Used

- MySQL 8.0+
- SQL

---

## 📂 Database Schema

The database consists of five tables:

### 1. Students

Stores student information.

| Column | Data Type |
|----------|-----------|
| student_ID | INT |
| first_name | VARCHAR(20) |
| last_name | VARCHAR(20) |
| email | VARCHAR(50) |
| birth_date | DATE |
| enrollment_date | DATE |

---

### 2. Courses

Stores course details.

| Column | Data Type |
|----------|-----------|
| course_ID | INT |
| course_name | VARCHAR(20) |
| department_ID | INT |
| credits | INT |

---

### 3. Instructors

Stores instructor information.

| Column | Data Type |
|----------|-----------|
| instructors_ID | INT |
| first_name | VARCHAR(20) |
| last_name | VARCHAR(20) |
| email | VARCHAR(50) |
| department_ID | INT |
| salary | INT *(Added later using ALTER TABLE)* |

---

### 4. Enrollments

Stores student enrollment records.

| Column | Data Type |
|----------|-----------|
| enrollment_ID | INT |
| student_ID | INT |
| course_ID | INT |
| enrollment_date | DATE |

---

### 5. Departments

Stores department information.

| Column | Data Type |
|----------|-----------|
| department_ID | INT |
| department_name | VARCHAR(20) |

---

# 📚 SQL Concepts Covered

## 1. CRUD Operations

Performed **Create, Read, Update, and Delete** operations on:

- Students
- Courses
- Instructors
- Enrollments
- Departments

---

## 2. Filtering Data

- Retrieve students enrolled after a specific year.
- Retrieve courses offered by a specific department.
- Limit query results using `LIMIT`.

---

## 3. Aggregate Functions

Used:

- `COUNT()`
- `AVG()`
- `MAX()`

Examples include:

- Count students enrolled in each course.
- Calculate average course credits by department.
- Find the highest-paid instructor.

---

## 4. GROUP BY and HAVING

Grouped records to:

- Count enrollments
- Filter courses having more than five students

---

## 5. Joins

Implemented:

- **INNER JOIN**
- **LEFT JOIN**

Examples:

- Retrieve students with their enrolled courses.
- Display all students, including those without enrollments.

---

## 6. Subqueries

Created subqueries to:

- Find students enrolled in courses with more than ten students.

---

## 7. Date Functions

Used:

- `YEAR()`
- `TIMESTAMPDIFF()`

Examples:

- Extract enrollment year.
- Determine senior/junior student status.

---

## 8. String Functions

Used:

- `CONCAT()`

Example:

- Combine instructor first and last names.

---

## 9. Window Functions

Used:

- `SUM() OVER()`

Example:

- Calculate the running total of students enrolled across courses.

---

## 10. CASE Statements

Implemented conditional logic to classify students as:

- Senior
- Junior

based on their enrollment date.

---

# 📋 SQL Operations Included

### CRUD Operations

- Insert records
- Retrieve records
- Update existing records
- Delete records

---

### Filtering Queries

- Students enrolled after 2022
- Mathematics department courses
- Course limits using `LIMIT`

---

### Aggregate Queries

- Student count per course
- Average credits per department
- Maximum instructor salary

---

### JOIN Queries

- Student-course relationships using INNER JOIN
- Students with or without enrollments using LEFT JOIN

---

### Subqueries

- Students enrolled in courses having more than ten students

---

### Date Functions

- Extract enrollment year
- Calculate years since enrollment

---

### String Functions

- Instructor full names using `CONCAT()`

---

### Window Functions

- Running total of enrolled students

---

### Conditional Queries

- Label students as Senior or Junior using `CASE`

---

# 📁 Project Structure

```
FINAL_PROJECT
│
├── Create Database
├── Create Students Table
├── Create Courses Table
├── Create Instructors Table
├── Create Enrollments Table
├── Create Departments Table
│
├── Insert Sample Data
│
├── CRUD Operations
├── Filtering Queries
├── Aggregate Functions
├── GROUP BY & HAVING
├── INNER JOIN
├── LEFT JOIN
├── Subqueries
├── Date Functions
├── String Functions
├── Window Functions
└── CASE Statements
```

---

# 🎯 Learning Outcomes

This project demonstrates the ability to:

- Design a relational database
- Perform CRUD operations
- Work with multiple related tables
- Use SQL joins effectively
- Write aggregate queries
- Use GROUP BY and HAVING
- Create subqueries
- Apply date and string functions
- Use window functions for analytics
- Implement conditional logic using CASE
- Write clean, organized, and readable SQL code

---


# 👩‍💻 Author

**Bhumi Shah**

This project was developed as part of my SQL learning journey to strengthen my understanding of relational databases, SQL query writing, and database management concepts while preparing for data analyst and data science roles.
