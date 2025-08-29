create database dbSchoolManagementSystem; 
go
use dbSchoolManagementSystem; 
go

-- Create the Classes table
CREATE TABLE Classes (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255)
);

-- Create the Students table
CREATE TABLE Students (
    id INT PRIMARY KEY IDENTITY(1,1),
    First_Name NVARCHAR(255),
    Last_Name NVARCHAR(255),
    Father_Name NVARCHAR(255),
    Mother_Name NVARCHAR(255),
    BirthDate DATE,
    Address NVARCHAR(255),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(id)
);

-- Create the Teachers table
CREATE TABLE Teachers (
    id INT PRIMARY KEY IDENTITY(1,1),
 First_Name NVARCHAR(255),
    Last_Name NVARCHAR(255),
    Email NVARCHAR(255),
    BirthDate DATE 
);

-- Create the Subjects table
CREATE TABLE Subjects (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255),
    teacher_id INT,
    passed_grade INT, -- Add data type for passed grade
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);



-- Create the Grades table
CREATE TABLE Grades (
    id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    subject_id INT,
    mark INT,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);
