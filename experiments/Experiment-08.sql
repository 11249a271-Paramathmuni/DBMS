-- EXPERIMENT 08: Normalization from 1NF through 5NF
-- Case study: university course registration and academic resource management (MySQL 8.0+)
CREATE DATABASE IF NOT EXISTS NormalizationLabDB;
USE NormalizationLabDB;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS StudentCourse1NF;
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(Student_ID INT PRIMARY KEY,Student_Name VARCHAR(60) NOT NULL,Department VARCHAR(20));
CREATE TABLE StudentCourse1NF(Student_ID INT,Course VARCHAR(50),Faculty VARCHAR(50),PRIMARY KEY(Student_ID,Course),FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID));
INSERT INTO Student VALUES (1,'Ravi','CSE'),(2,'Anu','CSE'),(3,'Bala','ECE');
INSERT INTO StudentCourse1NF VALUES (1,'DBMS','Kumar'),(1,'Python','Priya'),(2,'DBMS','Kumar'),(3,'Python','Priya'),(3,'AI','Raj');
-- Output: five atomic student-course rows, demonstrating 1NF.
CREATE TABLE Course(Course_ID INT PRIMARY KEY,Course_Name VARCHAR(50) UNIQUE,Faculty VARCHAR(50));
CREATE TABLE Enrollment(Student_ID INT,Course_ID INT,PRIMARY KEY(Student_ID,Course_ID),FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID),FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID));
INSERT INTO Course VALUES (10,'DBMS','Kumar'),(11,'Python','Priya'),(12,'AI','Raj');
INSERT INTO Enrollment VALUES (1,10),(1,11),(2,10),(3,11),(3,12);
-- Output: student, course and enrollment facts are separated (2NF/3NF design).
SELECT s.Student_Name,c.Course_Name FROM Enrollment e JOIN Student s USING(Student_ID) JOIN Course c USING(Course_ID) ORDER BY s.Student_ID,c.Course_ID;
-- Output: Ravi-DBMS, Ravi-Python, Anu-DBMS, Bala-Python, Bala-AI.
-- 4NF: independent multivalued facts are stored in separate relations.
CREATE TABLE StudentSkill(Student_ID INT,Skill VARCHAR(40),PRIMARY KEY(Student_ID,Skill),FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID));
CREATE TABLE StudentHobby(Student_ID INT,Hobby VARCHAR(40),PRIMARY KEY(Student_ID,Hobby),FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID));
INSERT INTO StudentSkill VALUES (1,'SQL'),(1,'Java'),(2,'SQL');
INSERT INTO StudentHobby VALUES (1,'Chess'),(1,'Music'),(2,'Reading');
-- Output: skills and hobbies are stored independently, avoiding unnecessary cross-product rows.
-- 5NF illustration: supplier-part-project facts are decomposed into pairwise relations.
CREATE TABLE SupplyRaw(SupplierID INT,PartID INT,ProjectID INT,PRIMARY KEY(SupplierID,PartID,ProjectID));
INSERT INTO SupplyRaw VALUES (1,10,100),(1,11,100),(2,10,101);
CREATE TABLE SupplierPart(SupplierID INT,PartID INT,PRIMARY KEY(SupplierID,PartID));
CREATE TABLE SupplierProject(SupplierID INT,ProjectID INT,PRIMARY KEY(SupplierID,ProjectID));
CREATE TABLE PartProject(PartID INT,ProjectID INT,PRIMARY KEY(PartID,ProjectID));
INSERT IGNORE INTO SupplierPart SELECT DISTINCT SupplierID,PartID FROM SupplyRaw;
INSERT IGNORE INTO SupplierProject SELECT DISTINCT SupplierID,ProjectID FROM SupplyRaw;
INSERT IGNORE INTO PartProject SELECT DISTINCT PartID,ProjectID FROM SupplyRaw;
SELECT * FROM StudentCourse1NF ORDER BY Student_ID,Course;
-- Output: five rows with one course per student-course record.
