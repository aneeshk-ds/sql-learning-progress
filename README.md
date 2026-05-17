# SQL Learning Progress

Structured SQL practice from fundamentals to advanced analytics — written for PostgreSQL, compatible with MySQL with minor changes.

Folders are ordered by difficulty. Each contains standalone scripts with clear problem statements and annotated queries.

---

## Topics covered

| Folder | Topic |
|---|---|
| `01_basics` | SELECT, WHERE, ORDER BY |
| `02_joins` | INNER, LEFT, RIGHT, FULL joins |
| `03_aggregations` | GROUP BY, HAVING, COUNT, SUM, AVG |
| `04_subqueries` | Correlated and non-correlated subqueries |
| `05_ctes` | Common Table Expressions |
| `06_window_functions` | ROW_NUMBER, RANK, LAG, LEAD, running totals |
| `07_case_when` | Conditional logic and bucketing |
| `08_data_cleaning` | NULL handling, deduplication, type casting |
| `09_business_problems` | End-to-end analytics scenarios |

---

## How to use

Clone the repo and run any `.sql` file against a PostgreSQL instance, or paste directly into [DB Fiddle](https://www.db-fiddle.com/) or [SQLiteOnline](https://sqliteonline.com/).

```bash
git clone https://github.com/aneeshk-ds/sql-learning-progress.git
psql -d your_db -f 06_window_functions/running_totals.sql
```

---

## Stack

- PostgreSQL (primary syntax)
- Works on MySQL 8+ with minor adjustments (`ROW_NUMBER` etc.)
