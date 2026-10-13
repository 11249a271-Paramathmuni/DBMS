# DBMS Laboratory Experiments

This repository contains the SQL source for all 10 DBMS laboratory experiments. The original PDFs are **not uploaded**. Explanatory text, notes, and expected outputs are written as SQL comments (`-- ...`), while executable SQL/PL/SQL statements remain code so GitHub syntax-highlights them.

## Experiment files

| No. | Topic | Source file |
|---:|---|---|
| 01 | Database creation and information retrieval | [Experiment-01.sql](experiments/Experiment-01.sql) |
| 02 | INSERT, DELETE, ALTER, UPDATE and conditional SELECT | [Experiment-02.sql](experiments/Experiment-02.sql) |
| 03 | DCL and TCL commands — banking transactions | [Experiment-03.sql](experiments/Experiment-03.sql) |
| 04 | Database constraints — retail orders | [Experiment-04.sql](experiments/Experiment-04.sql) |
| 05 | Advanced queries and set operators — library | [Experiment-05.sql](experiments/Experiment-05.sql) |
| 06 | Aggregate functions, GROUP BY and HAVING | [Experiment-06.sql](experiments/Experiment-06.sql) |
| 07 | Views, AUTO_INCREMENT, indexes and savepoints | [Experiment-07.sql](experiments/Experiment-07.sql) |
| 08 | Normalization: 1NF through 5NF | [Experiment-08.sql](experiments/Experiment-08.sql) |
| 09 | Relationships, JOINs and subqueries | [Experiment-09.sql](experiments/Experiment-09.sql) |
| 10 | Oracle PL/SQL: blocks, exceptions, procedures, functions, triggers and cursors | [Experiment-10.sql](experiments/Experiment-10.sql) |

## Software

- Experiments 01–09 use MySQL 8.0+ and a compatible client such as MySQL Workbench or the MySQL command-line client.
- Experiment 10 uses Oracle Database and SQL*Plus or SQL Developer. It is Oracle PL/SQL, not MySQL syntax.
- Each file includes illustrative expected-output comments. Exact formatting can vary by client and database version; execute statements in order on a test schema.
- Some destructive setup statements (`DROP TABLE`) are included to make reruns easier. Do not run these against data you need to keep.
