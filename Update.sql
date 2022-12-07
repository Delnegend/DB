INSERT INTO student (ID, name, DOB, address, gender, email, enroll_year, major)
SELECT ID, name, DOB, address, gender, email, enroll_year, major FROM student_hold;
TRUNCATE TABLE student_hold;