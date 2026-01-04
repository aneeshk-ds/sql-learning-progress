-- Total spending per customer
SELECT
    customer_id,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- Calculate total salary paid in each department
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

