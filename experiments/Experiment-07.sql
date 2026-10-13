-- EXPERIMENT 07: Views, sequences/auto-increment, indexes and savepoints
-- Case study: inventory and warehouse management (MySQL 8.0+)
-- MySQL has no standalone CREATE SEQUENCE in this lab context; AUTO_INCREMENT is used instead.
CREATE DATABASE IF NOT EXISTS WarehouseDB;
USE WarehouseDB;
DROP VIEW IF EXISTS LowStockProducts;
DROP TABLE IF EXISTS Product;
CREATE TABLE Product(Product_ID INT AUTO_INCREMENT PRIMARY KEY,Product_Name VARCHAR(80) NOT NULL,Category VARCHAR(40),Stock_Qty INT NOT NULL DEFAULT 0,Unit_Price DECIMAL(10,2) NOT NULL CHECK(Unit_Price>=0));
INSERT INTO Product(Product_Name,Category,Stock_Qty,Unit_Price) VALUES ('Keyboard','Accessories',15,1200),('Mouse','Accessories',5,600),('Monitor','Displays',3,9500),('Laptop','Computers',8,65000);
-- Output: 4 products inserted; generated Product_ID values are 1 through 4.
CREATE VIEW LowStockProducts AS SELECT Product_ID,Product_Name,Stock_Qty FROM Product WHERE Stock_Qty<10;
SELECT * FROM LowStockProducts ORDER BY Product_ID;
-- Output: Mouse (5), Monitor (3), Laptop (8).
CREATE INDEX idx_product_category ON Product(Category);
SHOW INDEX FROM Product;
-- Output: PRIMARY and idx_product_category indexes are listed.
START TRANSACTION;
UPDATE Product SET Stock_Qty=Stock_Qty-1 WHERE Product_ID=1;
SAVEPOINT stock_update;
UPDATE Product SET Stock_Qty=Stock_Qty-2 WHERE Product_ID=2;
ROLLBACK TO SAVEPOINT stock_update;
COMMIT;
-- Output: Product 1 stock becomes 14; Product 2 remains 5.
SELECT Product_ID,Stock_Qty FROM Product ORDER BY Product_ID;
-- Output: (1,14), (2,5), (3,3), (4,8).
SELECT COUNT(*) AS Total_Products FROM Product;
-- Output: Total_Products = 4.
DROP INDEX idx_product_category ON Product;
-- Output: secondary index removed; primary key remains.
SHOW FULL TABLES IN WarehouseDB;
-- Output: Product is a BASE TABLE and LowStockProducts is a VIEW.
