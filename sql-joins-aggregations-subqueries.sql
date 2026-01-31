-- JOIN + AGGREGATION
-- Add your JOIN + aggregation examples here

-- DERIVED METRICS
-- Add your derived metrics examples here

-- SCALAR SUBQUERIES
SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- IN SUBQUERIES
SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
ls -l sql-joins-aggregations-subqueries.sql

ls -l sql-joins-aggregations-subqueries.sql
pwd

