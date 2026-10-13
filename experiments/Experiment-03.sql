-- EXPERIMENT 03: DCL and TCL commands
-- Case study: Banking transaction management (MySQL 8.0+)
CREATE DATABASE IF NOT EXISTS BankDB;
USE BankDB;
DROP TABLE IF EXISTS BankAccount;
CREATE TABLE BankAccount(Account_ID INT PRIMARY KEY, Holder_Name VARCHAR(50), Balance DECIMAL(12,2) CHECK(Balance>=0));
INSERT INTO BankAccount VALUES (201,'Arun',5000),(202,'Priya',7500),(203,'Ravi',3000);
-- Output: 3 accounts inserted; total balance = 15500.00.
SELECT * FROM BankAccount ORDER BY Account_ID;
-- Output: 201 Arun 5000.00; 202 Priya 7500.00; 203 Ravi 3000.00.
START TRANSACTION;
UPDATE BankAccount SET Balance=Balance-1000 WHERE Account_ID=201;
UPDATE BankAccount SET Balance=Balance+1000 WHERE Account_ID=202;
SELECT Account_ID,Balance FROM BankAccount WHERE Account_ID IN (201,202) ORDER BY Account_ID;
-- Output inside transaction: 201=4000.00, 202=8500.00.
SAVEPOINT transfer_done;
UPDATE BankAccount SET Balance=Balance-2000 WHERE Account_ID=203;
-- Output: account 203 temporarily becomes 1000.00.
ROLLBACK TO SAVEPOINT transfer_done;
-- Output: account 203 is restored to 3000.00; transfer remains pending.
COMMIT;
-- Output: transfer committed; balances are 4000.00, 8500.00, 3000.00.
SELECT SUM(Balance) AS Total_Balance FROM BankAccount;
-- Output: Total_Balance = 15500.00.
-- DCL demonstration (run with an account that has permission to manage users):
-- CREATE USER 'lab_teller'@'localhost' IDENTIFIED BY 'ChangeThis_StrongPassword!';
-- GRANT SELECT, UPDATE ON BankDB.BankAccount TO 'lab_teller'@'localhost';
-- SHOW GRANTS FOR 'lab_teller'@'localhost';
-- REVOKE UPDATE ON BankDB.BankAccount FROM 'lab_teller'@'localhost';
-- DROP USER 'lab_teller'@'localhost';
-- Output: permissions are granted/revoked as requested. These statements are comments to avoid creating users accidentally.
