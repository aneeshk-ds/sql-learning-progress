-- LeetCode 1378 (Easy). 2026-10-06 sprint Day 2. Needed a hint.
-- Restate first read as "if Employees.id = EmployeeUNI.id then show null" (inverted).
-- Fixed with the template "Every employee, with their unique_id. If none, NULL."
-- Why LEFT JOIN: a plain JOIN drops the employees with no match (Alice, Bob).
select u.unique_id, e.name
from Employees e
Left join EmployeeUNI u on e.id = u.id
