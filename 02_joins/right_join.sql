-- Keeps all departments
-- Unmatched employees return NULL
SELECT
    d.department_name,
    e.emp_id
FROM Employees e
RIGHT JOIN Departments d
    ON e.department = d.department_name;
