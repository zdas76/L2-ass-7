-- Active: 1729092110039@@127.0.0.1@5432@university_db
CREATE DATABASE university_db;

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY, 
    student_name VARCHAR(50) NOT NULL, 
    age INT NOT NULL, 
    email VARCHAR(50) NOT NULL,
    frontend_mark NUMERIC(3, 2) NOT NULL,
    backend_mark NUMERIC(3, 2) NOT NULL,
    status VARCHAR(15)
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


