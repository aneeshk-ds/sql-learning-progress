-- Find the total salary paid in each department,
-- including departments with no employees.

SELECT
    d.department_id,
    d.department_name,
    COALESCE(SUM(e.salary), 0) AS total_salary
FROM Departments d
LEFT JOIN Employees e
    ON d.department_name = e.department
GROUP BY d.department_id, d.department_name;
