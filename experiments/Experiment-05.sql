-- EXPERIMENT 05: Advanced SQL queries and set operators
-- Case study: library management (MySQL 8.0.31+ for INTERSECT)
CREATE DATABASE IF NOT EXISTS LibraryExp5;
USE LibraryExp5;
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(book_id INT PRIMARY KEY,title VARCHAR(100) NOT NULL,category VARCHAR(40),price DECIMAL(8,2));
CREATE TABLE Members(member_id INT PRIMARY KEY,member_name VARCHAR(60) NOT NULL,city VARCHAR(40));
CREATE TABLE Loans(loan_id INT PRIMARY KEY,book_id INT,member_id INT,loan_date DATE,FOREIGN KEY(book_id) REFERENCES Books(book_id),FOREIGN KEY(member_id) REFERENCES Members(member_id));
INSERT INTO Books VALUES (1,'Database Systems','DBMS',650),(2,'Python Basics','Programming',450),(3,'Computer Networks','Networking',700),(4,'SQL Practice','DBMS',500),(5,'Algorithms','Programming',800);
INSERT INTO Members VALUES (101,'Arun','Chennai'),(102,'Priya','Hyderabad'),(103,'Ravi','Chennai'),(104,'Sneha','Bengaluru');
INSERT INTO Loans VALUES (1001,1,101,'2026-01-10'),(1002,2,102,'2026-01-12'),(1003,4,103,'2026-02-01');
-- Output: 5 books, 4 members, 3 loans.
SELECT title,price FROM Books WHERE price > (SELECT AVG(price) FROM Books) ORDER BY price;
-- Output: Database Systems 650, Computer Networks 700, Algorithms 800.
SELECT title FROM Books WHERE book_id IN (SELECT book_id FROM Loans) ORDER BY title;
-- Output: Database Systems, Python Basics, SQL Practice.
SELECT title FROM Books b WHERE EXISTS (SELECT 1 FROM Loans l WHERE l.book_id=b.book_id) ORDER BY title;
-- Output: same three loaned book titles.
SELECT title FROM Books b WHERE NOT EXISTS (SELECT 1 FROM Loans l WHERE l.book_id=b.book_id) ORDER BY title;
-- Output: Algorithms, Computer Networks.
SELECT book_id FROM Books WHERE category='DBMS' UNION SELECT book_id FROM Loans ORDER BY book_id;
-- Output: book IDs 1, 2, 4.
SELECT book_id FROM Books WHERE category='DBMS' INTERSECT SELECT book_id FROM Loans ORDER BY book_id;
-- Output: book ID 1. Requires MySQL 8.0.31 or later.
SELECT (SELECT COUNT(*) FROM Books) AS books,(SELECT COUNT(*) FROM Members) AS members,(SELECT COUNT(*) FROM Loans) AS loans;
-- Output: books=5, members=4, loans=3.
