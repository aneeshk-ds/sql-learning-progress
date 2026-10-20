-- LeetCode 176: Second Highest Salary (Amazon, Deloitte, Oracle, Medium)
-- Table: Employee(id, salary)
-- 2026-10-20: DENSE_RANK card run first; I chose MAX below MAX instead.
-- MAX over zero rows returns NULL, so "no second salary" returns null with no extra wrap.
-- DENSE_RANK route still to be written: 177 (Nth highest) needs it.
select max(salary) as SecondHighestSalary
from Employee
where salary < (select max(salary) from Employee);
