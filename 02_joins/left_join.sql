--Keeps all employees
-- Unmatched departments return NULL
SELECT
    e.emp_name,
    d.department_name
FROM Employees e
LEFT JOIN Departments d
    ON e.department = d.department_name;
