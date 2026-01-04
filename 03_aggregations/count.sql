-- Count total number of employees
SELECT COUNT(emp_id) AS total_employees
FROM Employees;

-- Count number of employees working in the IT department
SELECT COUNT(emp_id) AS it_employee_count
FROM Employees
WHERE department = 'IT';

