# Database Management Systems Laboratory

A structured collection of DBMS laboratory experiments, SQL examples, and illustrative expected results. Scripts are organized by experiment for practice and revision.

<p><img src="https://img.shields.io/badge/SQL-Database%20Practice-4479A1?style=flat-square&logo=mysql&logoColor=white" alt="SQL database practice"/> <img src="https://img.shields.io/badge/Experiments-10-2563EB?style=flat-square" alt="Ten experiments"/> <img src="https://img.shields.io/badge/Focus-DBMS%20%26%20SQL-0F766E?style=flat-square" alt="DBMS and SQL"/></p>

## Experiment index

| # | Experiment | Script |
|---:|---|---|
| 01 | Database creation and information retrieval | [Experiment-01.sql](EXPERIMNTS/Experiment-01.sql) |
| 02 | INSERT, UPDATE, DELETE, ALTER, and conditional queries | [Experiment-02.sql](EXPERIMNTS/Experiment-02.sql) |
| 03 | Data Control Language (DCL) and Transaction Control Language (TCL) | [Experiment-03.sql](EXPERIMNTS/Experiment-03.sql) |
| 04 | Constraints and data integrity | [Experiment-04.sql](EXPERIMNTS/Experiment-04.sql) |
| 05 | Advanced queries, subqueries, and set operators | [Experiment-05.sql](EXPERIMNTS/Experiment-05.sql) |
| 06 | Aggregate functions, GROUP BY, and HAVING | [Experiment-06.sql](EXPERIMNTS/Experiment-06.sql) |
| 07 | Views, AUTO_INCREMENT, indexes, and savepoints | [Experiment-07.sql](EXPERIMNTS/Experiment-07.sql) |
| 08 | Database normalization from 1NF through 5NF | [Experiment-08.sql](EXPERIMNTS/Experiment-08.sql) |
| 09 | Table relationships, JOINs, and subqueries | [Experiment-09.sql](EXPERIMNTS/Experiment-09.sql) |
| 10 | PL/SQL blocks, exceptions, procedures, functions, triggers, and cursors | [Experiment-10.sql](EXPERIMNTS/Experiment-10.sql) |

## Requirements and compatibility

- **Experiments 01–09:** intended for MySQL 8.0+; use [MySQL](https://dev.mysql.com/downloads/) with [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) or the MySQL command-line client.
- **Experiment 10:** uses Oracle PL/SQL syntax and is intended for an Oracle environment such as SQL*Plus or [Oracle SQL Developer](https://www.oracle.com/database/sqldeveloper/). It is not a MySQL script.

Check the individual script before choosing a database engine.

## Running an experiment

1. Install and start the database engine required for that experiment.
2. Open the matching `.sql` file in your SQL client.
3. Read the script and comments before executing it.
4. Run statements in order in a lab or test database.
5. Compare results with any illustrative output comments.

## Important safety note

Some scripts may create databases or tables, modify records, or drop objects to make reruns easier. **Review destructive statements before execution** and do not run them against a database containing data you need to preserve. Expected output is illustrative; formatting and behavior can vary by database version and client.

## Repository layout

```text
DBMS/
├── CERTIFICATES/
└── EXPERIMNTS/
    ├── Experiment-01.sql
    ├── Experiment-02.sql
    ├── ...
    └── Experiment-10.sql
```

The folder name `EXPERIMNTS` is preserved to match the current repository path.

## Related repositories

- [Java Programming Lab](https://github.com/surya-scsvmv/JAVA)
- [C++ Programming Lab](https://github.com/surya-scsvmv/CPP)
- [DSA in C](https://github.com/surya-scsvmv/DSA)

---

<p align="center">Learn SQL by writing queries, checking results, and understanding the data.</p>