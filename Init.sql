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
    enroll_year INT NOT NULL,
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
    attendence_weight INT NOT NULL,
    midterm_weight INT NOT NULL,
    final_weight INT NOT NULL,
    lecturer_ID VARCHAR(50) NOT NULL,
    course_year INT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE grade (
    ID INT NOT NULL AUTO_INCREMENT,
    student_id VARCHAR(8) NOT NULL,
    course_id VARCHAR(50) NOT NULL,
    attendence INT,
    midterm INT,
    final INT,
    PRIMARY KEY (ID)
);

CREATE TABLE lecturer (
    lecturer_ID VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (lecturer_ID)
);

ALTER TABLE grade ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(ID);
ALTER TABLE grade ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES course(ID);
ALTER TABLE course ADD CONSTRAINT lecturer_id FOREIGN KEY (lecturer_ID) REFERENCES lecturer(lecturer_ID);
