-- For each department, find the number of employees
-- and the total salary paid.

SELECT
    department,
    COUNT(emp_id) AS employee_count,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY department;
