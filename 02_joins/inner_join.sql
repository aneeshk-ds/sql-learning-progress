-- Get customer names with their order amounts
SELECT
    c.customer_name,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


-- Inner join between Employees and Departments
SELECT e.emp_name,
       e.salary,
       d.department_name
FROM Employees e
INNER JOIN Departments d
    ON e.department = d.department_name;

-- Inner join with additional filtering
SELECT e.emp_name,
       e.salary,
       d.department_name
FROM Employees e
INNER JOIN Departments d
    ON e.department = d.department_name
WHERE e.salary > 55000;


-- Total count of employees per joined department
SELECT d.department_name,
       COUNT(e.emp_id) AS num_employees
FROM Employees e
INNER JOIN Departments d
    ON e.department = d.department_name
GROUP BY d.department_name;




