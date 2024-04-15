-- Create table Students
DROP TABLE IF EXISTS students;
CREATE TABLE students(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    groups_id INTEGER,
    FOREIGN KEY (groups_id) REFERENCES groups(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create table Groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(128) UNIQUE NOT NULL
);

-- Create table Teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL
);

-- Create table Teaching Subjects
DROP TABLE IF EXISTS teaching_subjects;
CREATE TABLE teaching_subjects(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(255) UNIQUE NOT NULL,
    teachers_id INTEGER ,
    FOREIGN KEY (teachers_id) REFERENCES teachers(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create table Journal
DROP TABLE IF EXISTS journal;
CREATE TABLE journal(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    date_of_rating DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (subject_id) REFERENCES teaching_subjects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
