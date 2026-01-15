-- Calculate the total salary of all employees
-- and the total salary of only those employees who belong to a department.

SELECT
    SUM(salary) AS total_salary,
    SUM(
        CASE
            WHEN department IS NOT NULL THEN salary
            ELSE 0
        END
    ) AS salary_with_department
FROM Employees;

