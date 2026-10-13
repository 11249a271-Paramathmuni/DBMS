-- EXPERIMENT 02: INSERT, DELETE, ALTER, UPDATE and conditional SELECT
-- Database: Employee Payroll System (MySQL 8.0+)
CREATE DATABASE IF NOT EXISTS PayrollLabDB;
USE PayrollLabDB;
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  Emp_ID INT PRIMARY KEY,
  Emp_Name VARCHAR(50) NOT NULL,
  Department VARCHAR(30),
  Salary DECIMAL(10,2),
  Email VARCHAR(100)
);
INSERT INTO Employee VALUES
(201,'Arun','Sales',35000,'arun@example.com'),
(202,'Priya','IT',52000,'priya@example.com'),
(203,'Ravi','Operations',41000,'ravi@example.com'),
(204,'Sneha','Sales',46000,'sneha@example.com'),
(205,'Kiran','IT',60000,'kiran@example.com'),
(206,'Divya','Operations',39000,'divya@example.com');
-- Output: 6 employee rows inserted.
SELECT * FROM Employee ORDER BY Emp_ID;
-- Output: IDs 201-206, with the employee data inserted above.
UPDATE Employee SET Salary=Salary*1.10 WHERE Department='Sales';
-- Output: 2 rows updated; Arun=38500, Sneha=50600.
SELECT Emp_Name,Salary FROM Employee WHERE Salary>=45000 ORDER BY Salary DESC;
-- Output: Kiran 60000, Sneha 50600, Priya 52000 (ordered by salary: Kiran, Priya, Sneha).
ALTER TABLE Employee ADD COLUMN Phone VARCHAR(15);
-- Output: Phone column added.
UPDATE Employee SET Phone='9000000201' WHERE Emp_ID=201;
-- Output: phone number set for employee 201.
DELETE FROM Employee WHERE Department='Operations' AND Emp_ID=206;
-- Output: employee 206 deleted; employee 203 remains.
SELECT COUNT(*) AS Final_Count FROM Employee;
-- Output: Final_Count = 5.
SHOW COLUMNS FROM Employee;
-- Output: Employee columns include Emp_ID, Emp_Name, Department, Salary, Email, Phone.
