-- EXPERIMENT 01: Database creation and information retrieval (MySQL 8.0+)
-- Aim: Create a student table and demonstrate filtering and sorting.
CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
CREATE TABLE IF NOT EXISTS Student (Student_ID INT PRIMARY KEY, Student_Name VARCHAR(50) NOT NULL, Department VARCHAR(20) NOT NULL, Year INT NOT NULL, Age INT, Gender VARCHAR(10), Marks DECIMAL(5,2), City VARCHAR(30));
INSERT INTO Student VALUES (101,'Arun','CSE',2,19,'Male',85,'Chennai'),(102,'Priya','ECE',3,20,'Female',92,'Hyderabad'),(103,'Ravi','CSE',2,19,'Male',67,'Vijayawada'),(104,'Sneha','AIML',1,18,'Female',88,'Bengaluru'),(105,'Kiran','EEE',4,21,'Male',56,'Chennai'),(106,'Divya','CSE',3,20,'Female',94,'Tirupati'),(107,'Rahul','MECH',2,19,'Male',72,'Nellore'),(108,'Anjali','AIML',1,18,'Female',81,'Hyderabad'),(109,'Naveen','ECE',4,21,'Male',63,'Guntur'),(110,'Kavya','CSE',3,20,'Female',90,'Chennai');
SELECT * FROM Student ORDER BY Student_ID;
-- Output: 10 student rows, IDs 101 through 110, in ascending order.
SELECT Student_ID,Student_Name,Department FROM Student WHERE Department='CSE' ORDER BY Student_ID;
-- Output: (101, Arun, CSE), (103, Ravi, CSE), (106, Divya, CSE), (110, Kavya, CSE).
SELECT Student_Name,Marks FROM Student WHERE Marks BETWEEN 70 AND 90 ORDER BY Marks ASC;
-- Output: Rahul 72, Anjali 81, Arun 85, Sneha 88, Kavya 90.
SELECT Student_ID,Student_Name FROM Student WHERE Student_Name LIKE 'A%' ORDER BY Student_ID;
-- Output: (101, Arun), (108, Anjali).
SELECT COUNT(*) AS Total_Students,COUNT(DISTINCT Department) AS Departments FROM Student;
-- Output: Total_Students = 10; Departments = 5.
SELECT Student_Name,Marks FROM Student ORDER BY Marks DESC LIMIT 3;
-- Output: Divya 94, Priya 92, Kavya 90.
