-- Return the third-highest distinct employee salary.
-- The inner query assigns the same dense rank to tied salaries.
-- The outer query filters the calculated window-function result.
WITH ranked_salaries AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT DISTINCT salary AS third_highest_salary
FROM ranked_salaries
WHERE salary_rank = 3;
