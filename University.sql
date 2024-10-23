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


-- Query 4: not down
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






