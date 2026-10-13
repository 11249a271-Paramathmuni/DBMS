-- EXPERIMENT 04: Database constraints
-- Case study: online retail order management (MySQL 8.0.16+)
CREATE DATABASE IF NOT EXISTS RetailConstraintDB;
USE RetailConstraintDB;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(60) NOT NULL,
 email VARCHAR(100) UNIQUE,
 city VARCHAR(40) DEFAULT 'Unknown'
);
CREATE TABLE Products(
 product_id INT PRIMARY KEY,
 product_name VARCHAR(60) NOT NULL,
 price DECIMAL(10,2) CHECK(price>0),
 stock INT DEFAULT 0 CHECK(stock>=0)
);
CREATE TABLE Orders(
 order_id INT PRIMARY KEY,
 customer_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL CHECK(quantity>0),
 order_status VARCHAR(20) DEFAULT 'Pending',
 FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
 FOREIGN KEY(product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers VALUES (201,'Arun','arun@example.com','Chennai'),(202,'Priya','priya@example.com','Hyderabad'),(203,'Ravi','ravi@example.com','Unknown');
INSERT INTO Products VALUES (301,'Keyboard',1200,20),(302,'Mouse',600,35),(303,'Monitor',9500,10);
INSERT INTO Orders VALUES (401,201,301,2,'Shipped'),(402,202,303,1,'Pending'),(403,203,302,3,'Processing');
-- Output: 3 customers, 3 products and 3 orders inserted.
SELECT * FROM Orders ORDER BY order_id;
-- Output: orders 401, 402 and 403 with the inserted customer/product IDs.
-- The following invalid statements are intentionally comments; uncomment one at a time to observe constraint errors.
-- INSERT INTO Customers(customer_id,customer_name,email) VALUES (204,NULL,'x@example.com'); -- NOT NULL violation
-- INSERT INTO Customers VALUES (205,'Duplicate email','arun@example.com','Chennai'); -- UNIQUE violation
-- INSERT INTO Products VALUES (304,'Invalid price',-1,3); -- CHECK violation
-- INSERT INTO Orders VALUES (404,999,301,1,'Shipped'); -- FOREIGN KEY violation
-- INSERT INTO Orders VALUES (405,201,301,0,'Shipped'); -- CHECK violation
SELECT customer_id,customer_name,email,city FROM Customers ORDER BY customer_id;
-- Output: 201 Arun, 202 Priya, 203 Ravi; city default shown as Unknown for Ravi.
SHOW CREATE TABLE Orders;
-- Output: definition includes PRIMARY KEY, FOREIGN KEY, NOT NULL and CHECK constraints.
