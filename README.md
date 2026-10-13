# 🗃️ DBMS Laboratory

<p align="center">
  <strong>Database Management Systems · SQL Practice · Lab Experiments</strong><br/>
  A structured collection of DBMS laboratory work, query examples, and expected results.
</p>

<p align="center">
  <img alt="SQL" src="https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=mysql&logoColor=white"/>
  <img alt="Experiments" src="https://img.shields.io/badge/Experiments-10-success?style=for-the-badge"/>
  <img alt="Status" src="https://img.shields.io/badge/Status-Lab%20Practice-informational?style=for-the-badge"/>
</p>

## 👋 About this repository

This repository organizes my DBMS laboratory experiments into readable, syntax-highlighted SQL source files. The scripts include explanatory notes and illustrative expected outputs as SQL comments, so the actual statements remain easy to identify.

## 📚 Experiment index

| No. | Experiment | File |
|:--:|---|---|
| 01 | Database creation and information retrieval | [Experiment-01.sql](EXPERIMNTS/Experiment-01.sql) |
| 02 | INSERT, UPDATE, DELETE, ALTER and conditional queries | [Experiment-02.sql](EXPERIMNTS/Experiment-02.sql) |
| 03 | Data Control Language (DCL) and Transaction Control Language (TCL) | [Experiment-03.sql](EXPERIMNTS/Experiment-03.sql) |
| 04 | Constraints and data integrity | [Experiment-04.sql](EXPERIMNTS/Experiment-04.sql) |
| 05 | Advanced queries, subqueries and set operators | [Experiment-05.sql](EXPERIMNTS/Experiment-05.sql) |
| 06 | Aggregate functions, GROUP BY and HAVING | [Experiment-06.sql](EXPERIMNTS/Experiment-06.sql) |
| 07 | Views, AUTO_INCREMENT, indexes and savepoints | [Experiment-07.sql](EXPERIMNTS/Experiment-07.sql) |
| 08 | Database normalization: 1NF through 5NF | [Experiment-08.sql](EXPERIMNTS/Experiment-08.sql) |
| 09 | Table relationships, JOINs and subqueries | [Experiment-09.sql](EXPERIMNTS/Experiment-09.sql) |
| 10 | PL/SQL blocks, exceptions, procedures, functions, triggers and cursors | [Experiment-10.sql](EXPERIMNTS/Experiment-10.sql) |

## 🏅 Certificates

Certificate files will be organized in the [CERTIFICATES](CERTIFICATES/) folder.

## 🛠️ Tools and compatibility

- **Experiments 01–09:** MySQL 8.0+; run with MySQL Workbench or the MySQL command-line client.
- **Experiment 10:** Oracle Database; run with SQL*Plus or Oracle SQL Developer. This experiment uses Oracle PL/SQL syntax and is not a MySQL script.

## ▶️ How to run

1. Install and start the database engine required for the experiment.
2. Open the matching `.sql` file in your SQL client.
3. Read the comments first; they describe the goal and expected results.
4. Execute the statements in order, preferably in a lab or test database.
5. Compare the actual results with the expected-output comments.

> **Important:** Some scripts create databases/tables or use `DROP TABLE` to make reruns easier. Review those statements before running them against any database containing data you need to keep. Expected outputs are illustrative; formatting and behavior can vary by database version.

## 📁 Repository layout

```text
DBMS/
├── CERTIFICATES/
└── EXPERIMNTS/
    ├── Experiment-01.sql
    ├── Experiment-02.sql
    ├── ...
    └── Experiment-10.sql
```

---

<p align="center">
  Made for learning, practicing, and documenting database concepts.
</p>
