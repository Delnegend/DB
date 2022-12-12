DROP DATABASE IF EXISTS school;
CREATE DATABASE school;

USE school;

CREATE TABLE student_hold (
    INDEX_KEY INT NOT NULL AUTO_INCREMENT,
    ID VARCHAR(20),
    name VARCHAR(50) NOT NULL,
    DOB VARCHAR(10) NOT NULL,
    address VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(50),
    enroll_year INT,
    major VARCHAR(100) NOT NULL,
    PRIMARY KEY (INDEX_KEY)
);

CREATE TABLE student (
    ID VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    DOB VARCHAR(10) NOT NULL,
    address VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    enroll_year INT NOT NULL,
    email VARCHAR(50) NOT NULL,
    major VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE course (
    ID VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    attendance_weight INT NOT NULL,
    midterm_weight INT NOT NULL,
    final_weight INT NOT NULL,
    lecturer_id VARCHAR(50) NOT NULL,
    course_year INT NOT NULL,
    ETCs INT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE grade (
    ID INT NOT NULL AUTO_INCREMENT,
    student_id VARCHAR(8) NOT NULL,
    course_id VARCHAR(50) NOT NULL,
    attendance INT,
    midterm INT,
    final INT,
    PRIMARY KEY (ID)
);

CREATE TABLE lecturer (
    lecturer_id VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (lecturer_id)
);

ALTER TABLE grade ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(ID);
ALTER TABLE grade ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES course(ID);
ALTER TABLE course ADD CONSTRAINT lecturer_id FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id);

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER 'lecturer'@'localhost' IDENTIFIED BY 'lecturer';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';

GRANT ALL PRIVILEGES ON school.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON school.course TO 'lecturer'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON school.grade TO 'lecturer'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON school.lecturer TO 'lecturer'@'localhost';
GRANT SELECT ON school.* TO 'student'@'localhost';