-- Select total salary per department for employees with salary > 50,000
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
WHERE salary > 50000
GROUP BY department;
