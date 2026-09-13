-- CTE that aggregates, then filters the named result.
-- Build a named result first with WITH, then query it like a table.
-- The aggregate is filtered in the main query with a plain WHERE,
-- because inside the CTE result it is already a normal column.
WITH dept_totals AS (
    SELECT department, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
)
SELECT department, total_salary
FROM dept_totals
WHERE total_salary >= 10000
ORDER BY total_salary DESC;
