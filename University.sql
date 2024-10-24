-- Active: 1729092110039@@127.0.0.1@5432@university_db
CREATE DATABASE university_db;

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY, 
    student_name VARCHAR(50) NOT NULL, 
    age DATE NOT NULL, 
    email VARCHAR(50) NOT NULL,
    frontend_mark INT NOT NULL,
    backend_mark INT NOT NULL,
    status VARCHAR(15),
    );


CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
)


CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
)


INSERT INTO students (, age, email, frontend_mark, backend_mark, status)
VALUES
('Alice Johnson', '2003-04-15', 'alice.johnson@example.com', 85, 88, NULL),
('Bob Smith', '2001-08-22', 'bob.smith@example.com', 78, 81, NULL),
('Catherine Lee', '2002-01-30', 'catherine.lee@example.com', 92, 89, NULL),
('David Miller', '2000-11-12', 'david.miller@example.com', 67, 72, NULL),
('Eva White', '2004-06-05', 'eva.white@example.com', 81, 84, NULL),
('Franklin Adams', '1999-09-19', 'frank.adams@example.com', 90, 88, NULL),
('Grace Thompson', '2001-07-25', 'grace.thompson@example.com', 74, 79, NULL),
('Henry Garcia', '2003-03-17', 'henry.garcia@example.com', 85, 83, NULL),
('Isabella Moore', '2000-05-11', 'isabella.moore@example.com', 91, 90, NULL),
('Jack Martinez', '2002-10-02', 'jack.martinez@example.com', 79, 77, NULL);


INSERT INTO courses (course_name, credits)
VALUES 
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3)


INSERT INTO enrollment (student_id, course_id)
VALUES (1, 1),
(1, 2),
(2, 1),
(3, 2)



--Query 1:
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Pranesh Johnson', '2002-03-15', 'parnesh.johnson@example.com', 90, 88, NULL);

--Query :
SELECT student_name  FROM enrollment 
JOIN students USING(student_id)
JOIN courses USING(course_id)
WHERE courses.course_name = 'Next.js';


--Query 3:
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
SELECT student_id 
FROM students
ORDER BY (frontend_mark + backend_mark) DESC
LIMIT 1
)


SELECT * FROM courses;


-- Query 4: 
DELETE FROM courses
WHERE courses.course_id NOT IN (SELECT course_id FROM enrollment);



-- Query 5:
SELECT student_name FROM students LIMIT 2 OFFSET 2;


--Query 6 :
SELECT course_name, count(student_id) as students_enrolled FROM enrollment
JOIN courses USING(course_id)
GROUP BY course_name
ORDER BY students_enrolled;

-- Query 7 :
SELECT avg(extract(year from AGE(CURRENT_DATE, age::DATE)))::NUMERIC(5, 2) AS average_age FROM students;



-- Query 8:
SELECT student_name FROM students WHERE email LIKE '%example.com';



-- Questions (Answer 10 Questions):
1. What is PostgreSQL?
ans: PostgreSQL is a powerful, open source object-relational database system with over 35 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.


2. What is the purpose of a database schema in PostgreSQL?
ans: Schemas in PostgreSQL are logical containers that allow you to organize database objects such as tables, stored procedures, functions, etc. Schemas provide a way to rationally group related objects and separate them based on their functionalities or business domains.


3. Explain the primary key and foreign key concepts in PostgreSQL.
ans: A primary key is used to ensure data in the specific column is unique. A foreign key is a column or group of columns in a relational database table that provides a link between data in two tables.


4. What is the difference between the VARCHAR and CHAR data types?
ans: The main difference between char and varchar is that the char data type stores characters of a fixed length. On the other hand, the Varchar data type stores characters of variable length.


5. Explain the purpose of the WHERE clause in a SELECT statement.

ans: The where clause is used to specify a condition that must be met for a row to be included in the result set. This allows you to retrieve only the rows that meet specific criteria, and exclude the ones that dont.



6. The LIMIT clause restricts the amount of rows fetched. The OFFSET clause indicates at which position to start reading the values, the first OFFSET values are ignored. LIMIT can be used without an ORDER BY clause, the results might not be deterministic without the ORDER BY clause.


7. How can you perform data modification using UPDATE statements?
Ans: The UPDATE statement specifies the row or rows you want changed, and the expressions to be used as the new values for specific columns in those rows. You can use the UPDATE statement to change single rows, groups of rows, or all the rows in a table.


8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
ans: PostgreSQL JOINS are used with SELECT command, which helps us to retrieve data from various tables. And we can merge the Select and Joins statements together into a single command. Whenever we want to get records from two or more tables, we will execute the joins commands. It is used to merge columns from one or more tables according to the data of the standard columns between connected tables. Usually, the standard columns of the first table are primary key columns and the second table columns are foreign key columns.


9. Explain the GROUP BY clause and its role in aggregation operations.
ans: The GROUP BY clause contains the columns by which you want your output to be grouped. This clause is often used with the WHERE and HAVING clauses for filtering. In the syntax, WHERE comes before GROUP BY, while HAVING comes after it. Also, your data will sometimes contain NULLs, so you’ll be interested to learn how GROUP BY treats NULLs.

10. How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
ans: Aggregation refers to the concept where a specific outcome is formed from the combination of several elements. In Postgres, aggregation is performed via different built-in methods, such as SUM(), AVG(), COUNT(), etc. All these methods serve a unique purpose, however, one thing is common in all of them i.e., accept multiple elements and return a single outcome.
 a. Use SUM() Function on Table’s Data : SELECT SUM(COLUMN Name) AS 'column name which add extra column in table' FROM 'COLUMN Name';
 b. COUNT() function : SELECT COUNT(*) FROM tab_name;
 c. AVG() functions: SELECT AVG(COLUMN Name) FROM 'COLUMN Name';
 d. MAX() Function : SELECT MAX(COLUMN Name) FROM 'COLUMN Name';

11. What is the purpose of an index in PostgreSQL, and how does it optimize query performance?
Ans: Indexes play a pivotal role in optimizing database performance by facilitating faster data retrieval, and understanding their nuances is crucial for efficient query execution. We’ll delve into various types of indexes available in PostgreSQL, their functionalities, optimal use cases, and the impact they have on query performance.

12. Explain the concept of a PostgreSQL view and how it differs from a table.
ans: A view is a named query stored in the PostgreSQL database server. A view is defined based on one or more tables which are known as base tables, and the query that defines the view is referred to as a defining query. After creating a view, you can query data from it as you would from a regular table. Behind the scenes, PostgreSQL will rewrite the query against the view and its defining query, executing it to retrieve data from the base tables. Views do not store data except the materialized views. In PostgreSQL, you can create special views called materialized views that store data physically and periodically refresh it from the base tables. The materialized views are handy in various scenarios, providing faster data access to a remote server and serving as an effective caching mechanism.