CREATE DATABASE QuanLiSinhVienVaLopHoc;

CREATE TABLE Students
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    birth_date DATE,
    email      VARCHAR(100)
);

CREATE TABLE Courses
(
    id                 INT PRIMARY KEY AUTO_INCREMENT,
    course_name        VARCHAR(100) NOT NULL,
    course_description TEXT
);

CREATE TABLE Enrollments
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    student_id      INT NOT NULL,
    course_id       INT NOT NULL,
    enrollment_date DATE,
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES Students (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES Courses (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Students (first_name, last_name, birth_date, email)
VALUES ('John', 'Doe', '2001-05-12', 'john.doe@example.com'),
       ('Jane', 'Smith', '2002-07-19', 'jane.smith@example.com'),
       ('Michael', 'Brown', '2000-03-22', 'michael.brown@example.com'),
       ('Emily', 'Davis', '2003-09-30', 'emily.davis@example.com'),
       ('Daniel', 'Wilson', '2001-11-15', 'daniel.wilson@example.com');

INSERT INTO Courses (course_name, course_description)
VALUES ('Mathematics', 'An introductory course on basic mathematical principles.'),
       ('Physics', 'A fundamental course on mechanics and thermodynamics.'),
       ('Computer Science', 'An introductory course on programming and algorithms.');

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, '2024-01-10'),
       (2, 2, '2024-01-11'),
       (3, 3, '2024-01-12'),
       (4, 1, '2024-01-13'),
       (5, 3, '2024-01-14');

