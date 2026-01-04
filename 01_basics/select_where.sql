-- List all customers from Mumbai
SELECT *
FROM customers
WHERE city = 'Mumbai';

-- View all data from Employees table
SELECT *
FROM Employees;

-- Select only required columns instead of using *
SELECT emp_name, salary
FROM Employees;

-- Sort employees by salary from highest to lowest
SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC;

-- Retrieve top 3 highest-paid employees
SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 3;

-- Select employees earning more than 55,000
SELECT emp_name, salary
FROM Employees
WHERE salary > 55000;

-- Select IT employees earning more than 50,000
SELECT emp_name, salary
FROM Employees
WHERE salary > 50000
AND department = 'IT';

-- Select employees who work in IT OR earn more than 70,000
SELECT emp_name, salary
FROM Employees
WHERE department = 'IT'
OR salary > 70000;

-- Select employees who are in IT
-- OR in HR and earning more than 50,000
SELECT emp_name, salary
FROM Employees
WHERE department = 'IT'
OR (department = 'HR' AND salary > 50000);

-- Select IT employees and sort them by salary (highest to lowest)
SELECT emp_name, salary
FROM Employees
WHERE department = 'IT'
ORDER BY salary DESC;





