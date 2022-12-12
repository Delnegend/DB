# Todo List
- [x] Add a student/lecturer/course.
- [x] Delete a student/lecturer/course.
- [x] Modify a student/lecturer/course.
- [x] Find student by any field.
- [x] Get list of student by year/major/course.
- [x] Get list of student can apply for scholarship.
- [x] Role based access control.

# Requirements
- Admin can read/write to `student`, `lecturer`, `course`, `grade` tables
- Lecturer can read `student`, `lecturer`, `course`, `grade` tables but can only write to `grade`, `course` and `lecturer` tables that they are in charge of.
- Student can only read `student`, `lecturer`, `course`, `grade` tables.

# Initialize the database and add some sample data
- `Init.sql`
## Student
- Insert to a temporary table
```sql
INSERT INTO student_hold (name, DOB, address, gender, major) VALUES
("Trần Thảo Nhật", "7-5-2003", "205 Ninh Bình", "M", "ICT"),
("Nguyễn Anh Lan", "15-2-2003", "62 Phú Yên", "F", "DS"),
("Nguyễn Lan Đức", "23-5-2003", "224 Hưng Yên", "F", "DS"),
("Phạm Bảo Như", "4-9-2003", "135 Phú Yên", "M", "ICT"),
("Nguyễn Huy Vị", "12-12-2003", "269 Hải Phòng", "M", "DS"),
("Phạm Hoài Hoàng", "9-5-2003", "130 Quảng Bình", "M", "ICT"),
("Vũ Ái Thu", "25-7-2003", "257 Quảng Nam", "M", "ICT"),
("Nguyễn Trâm Mạnh", "11-3-2003", "85 Hà Nội", "F", "CS"),
("Phan Khải Hoài", "14-10-2003", "196 Cần Thơ", "M", "CS"),
("Nguyễn Khánh Hiếu", "7-7-2003", "232 Phú Yên", "M", "ICT");
```
- `Process.sql`: sort the table by first name, add email, student ID.
- `Update.sql`: add everything from `student_hold` to `student` table.

## Lecturer
```sql
INSERT INTO lecturer (lecturer_id, name, email, phone) VALUES
("NVA_ICT_LAB", "Nguyen Van A", "nva@usth.edu.vn", "0123456789"),
("NVB_ICT_LAB", "Nguyen Van B", "nvb@usth.edu.vn", "0123456788"),
("NVC_MATH_LAB", "Nguyen Van C", "nvc@usth.edu.vn", "0123456787"),
("NVD_FLC", "Nguyen Van D", "nvd@usth.edu.vn", "0123456786");
```

## Course
```sql
INSERT INTO course (ID, name, ETCs, attendance_weight, midterm_weight, final_weight, lecturer_id, course_year) VALUES
("12FUN_DATA", "Fundamental of Database", 3, 10, 30, 60, "NVA_ICT_LAB", 2021),
("12FUN_PROG", "Fundamental of Programming", 3, 10, 30, 60, "NVB_ICT_LAB", 2021),
("12FUN_MATH", "Fundamental of Mathematics", 3, 10, 30, 60, "NVC_MATH_LAB", 2021),
("12ENG_LIS", "English Listening", 3, 10, 30, 60, "NVD_FLC", 2021),
("12ENG_SPK", "English Speaking", 3, 10, 30, 60, "NVD_FLC", 2021);
```

## Grade
```sql
INSERT INTO grade (student_id, course_id, attendance, midterm, final) VALUES
("2022-001", "12FUN_DATA", 15, 11, 13),
("2022-001", "12FUN_PROG", 20, 16, 13),
("2022-001", "12FUN_MATH", 17, 15, 19),
("2022-001", "12ENG_LIS", 17, 17, 13),
("2022-001", "12ENG_SPK", 10, 20, 10),
("2022-002", "12FUN_DATA", 11, 13, 15),
("2022-002", "12FUN_PROG", 19, 19, 10),
("2022-002", "12FUN_MATH", 16, 14, 19),
("2022-002", "12ENG_LIS", 14, 16, 12),
("2022-002", "12ENG_SPK", 20, 16, 20),
("2022-003", "12FUN_DATA", 16, 15, 14),
("2022-003", "12FUN_PROG", 11, 18, 13),
("2022-003", "12FUN_MATH", 20, 14, 16),
("2022-003", "12ENG_LIS", 19, 16, 10),
("2022-003", "12ENG_SPK", 19, 14, 16),
("2022-004", "12FUN_DATA", 15, 15, 10),
("2022-004", "12FUN_PROG", 11, 15, 13),
("2022-004", "12FUN_MATH", 19, 20, 20),
("2022-004", "12ENG_LIS", 15, 12, 11),
("2022-004", "12ENG_SPK", 16, 13, 15),
("2022-005", "12FUN_DATA", 11, 14, 13),
("2022-005", "12FUN_PROG", 12, 20, 16),
("2022-005", "12FUN_MATH", 18, 14, 12),
("2022-005", "12ENG_LIS", 19, 17, 20),
("2022-005", "12ENG_SPK", 17, 15, 10),
("2022-006", "12FUN_DATA", 18, 19, 14),
("2022-006", "12FUN_PROG", 18, 10, 17),
("2022-006", "12FUN_MATH", 15, 11, 20),
("2022-006", "12ENG_LIS", 17, 19, 17),
("2022-006", "12ENG_SPK", 20, 15, 10),
("2022-007", "12FUN_DATA", 15, 11, 10),
("2022-007", "12FUN_PROG", 14, 19, 20),
("2022-007", "12FUN_MATH", 15, 17, 12),
("2022-007", "12ENG_LIS", 11, 20, 11),
("2022-007", "12ENG_SPK", 18, 20, 20),
("2022-008", "12FUN_DATA", 16, 10, 11),
("2022-008", "12FUN_PROG", 16, 14, 16),
("2022-008", "12FUN_MATH", 17, 17, 19),
("2022-008", "12ENG_LIS", 18, 13, 20),
("2022-008", "12ENG_SPK", 15, 18, 14),
("2022-009", "12FUN_DATA", 16, 17, 16),
("2022-009", "12FUN_PROG", 15, 20, 18),
("2022-009", "12FUN_MATH", 20, 20, 14),
("2022-009", "12ENG_LIS", 17, 18, 10),
("2022-009", "12ENG_SPK", 11, 20, 15),
("2022-010", "12FUN_DATA", 15, 11, 14),
("2022-010", "12FUN_PROG", 16, 12, 11),
("2022-010", "12FUN_MATH", 12, 15, 10),
("2022-010", "12ENG_LIS", 14, 10, 10),
("2022-010", "12ENG_SPK", 11, 20, 14);
```

# Features

## Delete an entry from the tables
```sql
DELETE FROM student WHERE ID = "2022-001";
DELETE FROM lecturer WHERE lecturer_id = "NVA_ICT_LAB";
```

## Modify an entry from the tables
```sql
UPDATE student SET name = "Nguyen Van A" WHERE ID = "2022-001";
UPDATE lecturer SET name = "Nguyen Van A" WHERE lecturer_id = "NVA_ICT_LAB";
UPDATE course SET name = "Basic of Database" WHERE ID = "12FUN_DATA";
```

## Find student by any field
```sql
SELECT * FROM student WHERE ID = "2022-001";
SELECT * FROM student WHERE name = "Nguyen Van A";
SELECT * FROM student WHERE SUBSTRING(DOB, 4, 2) = "03";
```

## Get list of student by year/major/course
```sql
SELECT * FROM student WHERE SUBSTRING(ID, 1, 4) = "2022";
SELECT * FROM student WHERE SUBSTRING(ID, 6, 3) = "ICT";
SELECT * FROM student WHERE ID IN (SELECT student_id FROM student_course WHERE courseid = "12FUN_DATA");
```

## Get list of students can apply for scholarship
GPA >= 15 and no course with grade < 10

```sql
CREATE TEMPORARY TABLE temp_score AS (
    SELECT student_id, course_id, attendance * attendance_weight / 100 AS attendance, midterm * midterm_weight / 100 AS midterm, final * final_weight / 100 AS final
    FROM grade, course
    WHERE grade.course_id = course.ID
);
CREATE TEMPORARY TABLE temp_avg_score AS (
    SELECT student_id, course_id, (attendance + midterm + final) AS avg_score
    FROM temp_score
);
CREATE TEMPORARY TABLE temp_avg_student_score AS (
    SELECT student_id, AVG(avg_score) AS avg_score
    FROM temp_avg_score
    GROUP BY student_id
);
SELECT student.ID, student.name, temp_avg_student_score.avg_score, student.major, student.email
FROM student, temp_avg_student_score
WHERE student.ID = temp_avg_student_score.student_id AND temp_avg_student_score.avg_score > 15 AND student.ID NOT IN (
    SELECT student_id
    FROM temp_avg_score
    WHERE avg_score < 10
);
DROP TABLE temp_score;
DROP TABLE temp_avg_score;
DROP TABLE temp_avg_student_score;
```

## Get a list of students need to retake one or more courses
Average score < 10, list of courses

```sql
CREATE TEMPORARY TABLE temp_score AS (
    SELECT student_id, course_id, attendance * attendance_weight / 100 AS attendance, midterm * midterm_weight / 100 AS midterm, final * final_weight / 100 AS final
    FROM grade, course
    WHERE grade.course_id = course.ID
);
CREATE TEMPORARY TABLE temp_avg_score AS (
    SELECT student_id, course_id, (attendance + midterm + final) AS avg_score
    FROM temp_score
);
CREATE TEMPORARY TABLE temp_avg_student_score AS (
    SELECT student_id, AVG(avg_score) AS avg_score
    FROM temp_avg_score
    GROUP BY student_id
);
SELECT student.ID, student.name, temp_avg_student_score.avg_score, student.major, student.email, course.name AS course_name
FROM student, temp_avg_student_score, course, temp_avg_score
WHERE student.ID = temp_avg_student_score.student_id AND temp_avg_student_score.avg_score < 10 AND student.ID = temp_avg_score.student_id AND temp_avg_score.avg_score < 10 AND course.ID = temp_avg_score.course_id;
DROP TABLE temp_score;
DROP TABLE temp_avg_score;
DROP TABLE temp_avg_student_score;
```