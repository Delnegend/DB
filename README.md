# Todo List
- [ ] Add a student detail.
- [ ] Delete a student detail.
- [ ] Modify a student detail.
- [ ] Find student by any field.
- [ ] Get list of student by year/major/course.
- [ ] Get list of student can apply for scholarship.
- [ ] Role based access control.
- [ ] Attendance.

# Initialize the database

- `Init.sql`

# Insert some data
## Student
### Insert to a temporary table
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

### Process the `student_hold`
- `Process.sql` (sort by name to add `ID` based on the order and `email`)

### Add everything back to the main `student` table then clear the temporary table
- `Update.sql`

## Lecturer
```sql
INSERT INTO lecturer (lecturer_ID, name, email, phone) VALUES
("NVA_ICT_LAB", "Nguyen Van A", "nva@usth.edu.vn", "0123456789"),
("NVB_ICT_LAB", "Nguyen Van B", "nvb@usth.edu.vn", "0123456788"),
("NVC_MATH_LAB", "Nguyen Van C", "nvc@usth.edu.vn", "0123456787"),
("NVD_FLC", "Nguyen Van D", "nvd@usth.edu.vn", "0123456786");
```

## Course
```sql
INSERT INTO course (ID, name, attendence_weight, midterm_weight, final_weight, lecturer_ID, course_year) VALUES
("12FUN_DATA", "Fundamental of Database", 10, 30, 60, "NVA_ICT_LAB", 2021),
("12FUN_PROG", "Fundamental of Programming", 10, 30, 60, "NVB_ICT_LAB", 2021),
("12FUN_MATH", "Fundamental of Mathematics", 10, 30, 60, "NVC_MATH_LAB", 2021),
("12ENG_LIS", "English Listening", 10, 30, 60, "NVD_FLC", 2021),
("12ENG_SPK", "English Speaking", 10, 30, 60, "NVD_FLC", 2021);
```