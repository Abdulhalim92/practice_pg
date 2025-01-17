CREATE TABLE student
(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    birthday DATE,
    phone VARCHAR
);

CREATE TABLE cathedra
(
    cathedra_id SERIAL PRIMARY KEY,
    cathedra_name VARCHAR,
    dean VARCHAR
);

ALTER TABLE student
ADD COLUMN middle_name VARCHAR;

ALTER TABLE student
ADD COLUMN rating float;

ALTER TABLE student
ADD COLUMN enrolled DATE;

ALTER TABLE student
DROP COLUMN  middle_name;

ALTER TABLE cathedra
RENAME TO chair;

ALTER TABLE chair
RENAME cathedra_id TO chair_id;

ALTER TABLE chair
RENAME cathedra_name TO chair_name;

ALTER TABLE student
ALTER COLUMN first_name SET DATA TYPE VARCHAR(64);

ALTER TABLE student
ALTER COLUMN last_name SET DATA TYPE VARCHAR(64);

ALTER TABLE student
ALTER COLUMN phone SET DATA TYPE VARCHAR(30);

CREATE TABLE faculty
(
    faculty_id SERIAL PRIMARY KEY,
    faculty_name VARCHAR
);

INSERT INTO faculty (faculty_name)
VALUES
    ('Computer Science'),
    ('Math'),
    ('Physics');

SELECT * FROM faculty;

TRUNCATE  TABLE faculty RESTART IDENTITY;

DROP TABLE faculty;