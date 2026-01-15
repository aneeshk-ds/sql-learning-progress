-- Find the number of employees in each department.

SELECT
    department,
    COUNT(emp_id) AS employee_count
FROM Employees
GROUP BY department;
