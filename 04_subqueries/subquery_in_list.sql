-- Subquery with IN: the inner query returns a LIST of values,
-- the outer keeps rows whose value appears in that list.
-- Use IN (not =) whenever the subquery can return more than one row.
-- The inner query FILTERS by one column but RETURNS the column the
-- outer matches on (department id), not the filter column.
SELECT name
FROM employees
WHERE dept_id IN (SELECT id FROM departments WHERE region = 'West');
