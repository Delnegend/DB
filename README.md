# Todo List
- [x] Add a student/lecturer/course.
- [ ] Delete a student/lecturer/course.
- [ ] Modify a student/lecturer/course.
- [ ] Find student by any field.
- [ ] Get list of student by year/major/course.
- [ ] Get list of student can apply for scholarship.
- [ ] Role based access control.
- [ ] Attendance.

# Initialize the database

- `Init.sql`

# Features
## Add a new entry to the tables

### Student
#### Insert to a temporary table
```sql
INSERT INTO student_hold (name, DOB, address, gender) VALUES
("Trần Thảo Nhật", "7-5-2003", "205 Ninh Bình", "M"),
("Nguyễn Anh Lan", "15-2-2003", "62 Phú Yên", "F"),
("Nguyễn Lan Đức", "23-5-2003", "224 Hưng Yên", "F"),
("Phạm Bảo Như", "4-9-2003", "135 Phú Yên", "M"),
("Nguyễn Huy Vị", "12-12-2003", "269 Hải Phòng", "M"),
("Phạm Hoài Hoàng", "9-5-2003", "130 Quảng Bình", "M"),
("Vũ Ái Thu", "25-7-2003", "257 Quảng Nam", "M"),
("Nguyễn Trâm Mạnh", "11-3-2003", "85 Hà Nội", "F"),
("Phan Khải Hoài", "14-10-2003", "196 Cần Thơ", "M"),
("Nguyễn Khánh Hiếu", "7-7-2003", "232 Phú Yên", "M");
```

#### Process the `student_hold`
- `Process.sql` (sort by name to add `ID` based on the order and `email`)

#### Add everything back to the main `student` table then clear the temporary table
- `Update.sql`

### Lecturer
```sql
INSERT INTO lecturer (lecturer_ID, name, email, phone) VALUES
("NVA_ICT_LAB", "Nguyen Van A", "nva@usth.edu.vn", "0123456789"),
("NVB_ICT_LAB", "Nguyen Van B", "nvb@usth.edu.vn", "0123456788"),
("NVC_MATH_LAB", "Nguyen Van C", "nvc@usth.edu.vn", "0123456787"),
("NVD_FLC", "Nguyen Van D", "nvd@usth.edu.vn", "0123456786");
```

### Course
```sql
INSERT INTO course (ID, name, attendence_weight, midterm_weight, final_weight, lecturer_ID, course_year) VALUES
("12FUN_DATA", "Fundamental of Database", 10, 30, 60, "NVA_ICT_LAB", 2021),
("12FUN_PROG", "Fundamental of Programming", 10, 30, 60, "NVB_ICT_LAB", 2021),
("12FUN_MATH", "Fundamental of Mathematics", 10, 30, 60, "NVC_MATH_LAB", 2021),
("12ENG_LIS", "English Listening", 10, 30, 60, "NVD_FLC", 2021),
("12ENG_SPK", "English Speaking", 10, 30, 60, "NVD_FLC", 2021);
```

## Delete an entry from the tables
```sql
DELETE FROM student WHERE ID = "2022-001";
DELETE FROM lecturer WHERE lecturer_ID = "NVA_ICT_LAB";
```

## Modify an entry from the tables
```sql
UPDATE student SET name = "Nguyen Van A" WHERE ID = "2022-001";
UPDATE lecturer SET name = "Nguyen Van A" WHERE lecturer_ID = "NVA_ICT_LAB";
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
SELECT * FROM student WHERE ID IN (SELECT student_ID FROM student_course WHERE course_ID = "12FUN_DATA");
```

## Get list of student can apply for scholarship
- Calculate the average score of each course for each student based on the weight
- Calculate the average score of each student based on the average score of each course
- Get the list of student whose average score is greater than 15 and no single course score is less than 10

```sql
SELECT * FROM student WHERE ID IN (
    SELECT student_ID FROM (
        SELECT student_ID, AVG(score) AS avg_score FROM (
            SELECT student_ID, course_ID, attendence_score * attendence_weight / 100 + midterm_score * midterm_weight / 100 + final_score * final_weight / 100 AS score FROM student_course
        ) AS temp GROUP BY student_ID
    ) AS temp2 WHERE avg_score > 15 AND student_ID NOT IN (
        SELECT student_ID FROM (
            SELECT student_ID, course_ID, attendence_score * attendence_weight / 100 + midterm_score * midterm_weight / 100 + final_score * final_weight / 100 AS score FROM student_course
        ) AS temp3 WHERE score < 10
    )
);
```