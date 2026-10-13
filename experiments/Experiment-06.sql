-- EXPERIMENT 06: Aggregate functions, GROUP BY and HAVING
-- Case study: retail sales analysis (MySQL 8.0+)
CREATE DATABASE IF NOT EXISTS RetailSalesDB;
USE RetailSalesDB;
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales(Sale_ID INT PRIMARY KEY,Product VARCHAR(50),Category VARCHAR(30),Region VARCHAR(30),Quantity INT,Unit_Price DECIMAL(10,2),Sale_Date DATE);
INSERT INTO Sales VALUES
(1,'Laptop','Electronics','North',2,55000,'2026-01-05'),
(2,'Phone','Electronics','South',5,18000,'2026-01-07'),
(3,'Chair','Furniture','North',4,3500,'2026-01-10'),
(4,'Desk','Furniture','West',2,8500,'2026-01-12'),
(5,'Tablet','Electronics','West',3,22000,'2026-02-01'),
(6,'Chair','Furniture','South',6,3500,'2026-02-04'),
(7,'Phone','Electronics','North',3,18000,'2026-02-10'),
(8,'Desk','Furniture','South',1,8500,'2026-02-11');
-- Output: 8 sales records inserted.
SELECT COUNT(*) AS Transactions,SUM(Quantity) AS Units,ROUND(AVG(Quantity),2) AS Avg_Quantity,MIN(Unit_Price) AS Min_Price,MAX(Unit_Price) AS Max_Price FROM Sales;
-- Output: Transactions=8; Units=26; Avg_Quantity=3.25; Min_Price=3500.00; Max_Price=55000.00.
SELECT Category,SUM(Quantity) AS Units_Sold,ROUND(SUM(Quantity*Unit_Price),2) AS Revenue FROM Sales GROUP BY Category ORDER BY Category;
-- Output: Electronics units=13, revenue=296000.00; Furniture units=13, revenue=45500.00.
SELECT Region,COUNT(*) AS Transactions,SUM(Quantity*Unit_Price) AS Revenue FROM Sales GROUP BY Region ORDER BY Region;
-- Output: North 3 transactions / 174000; South 3 / 71500; West 2 / 74500.
SELECT Category,SUM(Quantity*Unit_Price) AS Revenue FROM Sales GROUP BY Category HAVING SUM(Quantity*Unit_Price)>50000 ORDER BY Revenue DESC;
-- Output: Electronics 296000.00 only.
SELECT Category,Region,SUM(Quantity) AS Units_Sold FROM Sales GROUP BY Category,Region ORDER BY Category,Region;
-- Output: totals grouped by each category/region combination.
SELECT COUNT(DISTINCT Category) AS Categories FROM Sales;
-- Output: Categories = 2.
