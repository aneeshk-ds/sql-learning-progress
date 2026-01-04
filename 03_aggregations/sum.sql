-- Calculate total salary paid to all employees
SELECT SUM(salary) AS total_salary
FROM Employees;

-- Calculate total salary paid to IT department employees
SELECT SUM(salary) AS it_total_salary
FROM Employees
WHERE department = 'IT';
