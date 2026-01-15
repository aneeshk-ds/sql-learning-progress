-- Find the total number of employees
-- and the number of employees who are assigned to a department.

SELECT
    COUNT(*) AS total_employees,
    COUNT(department) AS employees_with_department
FROM Employees;

SELECT
    COUNT(*) AS total_employees, -- counts all rows
    COUNT(department) AS employees_with_department --skips NULLs
FROM Employees;
