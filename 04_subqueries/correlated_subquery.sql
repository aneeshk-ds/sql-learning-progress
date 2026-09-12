-- Correlated subquery: the inner query references a column from the
-- outer row (e.dept), so it cannot run once on its own. It re-runs for
-- every outer row, using that row's value.
-- Two aliases are required: e for the outer copy, e2 for the inner copy.
-- Task: employees who earn more than the average salary of their OWN department.
SELECT name
FROM employees e
WHERE salary > (SELECT AVG(salary)
                FROM employees e2
                WHERE e2.dept = e.dept);
