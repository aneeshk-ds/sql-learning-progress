-- Find the number of employees in each department,
-- including departments with zero employees.

SELECT
    d.department_id,
    d.department_name,
    COUNT(e.emp_id) AS employee_count
FROM Departments d
LEFT JOIN Employees e
    ON d.department_name = e.department
GROUP BY d.department_id, d.department_name;
