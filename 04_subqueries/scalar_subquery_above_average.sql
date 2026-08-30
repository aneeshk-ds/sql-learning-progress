-- Return employees who earn more than the company average salary
-- Scalar subquery: the inner query returns one value (the average),
-- the outer query compares each row against it.
SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
