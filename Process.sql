-- Add to a temporary table to import back to `student_hold` table by first name
CREATE TABLE temporary (
    name VARCHAR(50) NOT NULL,
    DOB VARCHAR(10) NOT NULL,
    address VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    major VARCHAR(100) NOT NULL
);
INSERT INTO temporary (name, DOB, address, gender, major)
SELECT name, DOB, address, gender, major FROM student_hold ORDER BY SUBSTRING_INDEX(name, ' ', -1);
TRUNCATE TABLE student_hold;
INSERT INTO student_hold (name, DOB, address, gender, major)
SELECT name, DOB, address, gender, major FROM temporary;
DROP TABLE temporary;

-- email = <enrolled_year>.<name_with_space_removed>.<dob>@school.edu
UPDATE student_hold
SET email = CONCAT(YEAR(NOW()), ".", REPLACE(name, " ", ""), ".", DOB, "@school.edu") WHERE INDEX_KEY > 0;

-- ID = <enrolled_year>-<index_but_has_prefix_0_if_not_contains_3_digits>
UPDATE student_hold
-- get the last student ID of the current year if exist and increment by 1 for the next student
SET ID = CONCAT(YEAR(NOW()), "-", LPAD(CAST(SUBSTRING_INDEX(ID, '-', -1) + 1 AS CHAR), 3, '0'))
WHERE INDEX_KEY > 0 AND ID LIKE CONCAT(YEAR(NOW()), "-%");

-- enroll_year = current year
UPDATE student_hold
SET enroll_year = YEAR(NOW()) WHERE INDEX_KEY > 0;