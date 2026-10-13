-- EXPERIMENT 09: Relationships, JOINs and subqueries
-- Case study: IT company project management (MySQL 8.0+)
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments(Department_ID INT PRIMARY KEY,Department_Name VARCHAR(50) UNIQUE);
CREATE TABLE Employees(Employee_ID INT PRIMARY KEY,Employee_Name VARCHAR(60),Department_ID INT,Salary DECIMAL(10,2),FOREIGN KEY(Department_ID) REFERENCES Departments(Department_ID));
CREATE TABLE Projects(Project_ID INT PRIMARY KEY,Project_Name VARCHAR(80),Budget DECIMAL(12,2));
CREATE TABLE Assignments(Employee_ID INT,Project_ID INT,Hours_Worked INT,PRIMARY KEY(Employee_ID,Project_ID),FOREIGN KEY(Employee_ID) REFERENCES Employees(Employee_ID),FOREIGN KEY(Project_ID) REFERENCES Projects(Project_ID));
INSERT INTO Departments VALUES (1,'Engineering'),(2,'Data'),(3,'Support');
INSERT INTO Employees VALUES (101,'Arun',1,65000),(102,'Priya',2,72000),(103,'Ravi',1,58000),(104,'Sneha',3,48000),(105,'Kiran',2,80000);
INSERT INTO Projects VALUES (201,'Website',250000),(202,'Analytics',400000),(203,'Helpdesk',100000);
INSERT INTO Assignments VALUES (101,201,40),(102,202,55),(103,201,30),(105,202,60),(104,203,45);
-- Output: 3 departments, 5 employees, 3 projects and 5 assignments inserted.
SELECT e.Employee_Name,d.Department_Name FROM Employees e JOIN Departments d ON e.Department_ID=d.Department_ID ORDER BY e.Employee_ID;
-- Output: Arun-Engineering, Priya-Data, Ravi-Engineering, Sneha-Support, Kiran-Data.
SELECT e.Employee_Name,p.Project_Name,a.Hours_Worked FROM Assignments a JOIN Employees e USING(Employee_ID) JOIN Projects p USING(Project_ID) ORDER BY e.Employee_ID;
-- Output: five employee-project assignment rows with their hours.
SELECT Employee_Name,Salary FROM Employees WHERE Salary>(SELECT AVG(Salary) FROM Employees) ORDER BY Salary DESC;
-- Output: Kiran 80000 and Priya 72000.
SELECT Department_Name FROM Departments d WHERE NOT EXISTS(SELECT 1 FROM Employees e WHERE e.Department_ID=d.Department_ID);
-- Output: empty result because each department has employees.
SELECT p.Project_Name,SUM(a.Hours_Worked) AS Total_Hours FROM Projects p JOIN Assignments a USING(Project_ID) GROUP BY p.Project_ID,p.Project_Name ORDER BY p.Project_ID;
-- Output: Website 70 hours; Analytics 115 hours; Helpdesk 45 hours.
SELECT (SELECT COUNT(*) FROM Departments) AS Departments,(SELECT COUNT(*) FROM Employees) AS Employees,(SELECT COUNT(*) FROM Projects) AS Projects,(SELECT COUNT(*) FROM Assignments) AS Assignments;
-- Output: Departments=3, Employees=5, Projects=3, Assignments=5.
