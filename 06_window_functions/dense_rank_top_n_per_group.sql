-- Rank employees by salary within each department, return top 3 per department
-- Uses DENSE_RANK to handle ties -- employees with equal salary both count
WITH RankedSalaries AS (
    SELECT d.name AS Department,
           e.name AS Employee,
           e.salary AS Salary,
           DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE salary_rank <= 3;
