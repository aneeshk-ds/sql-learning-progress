-- LeetCode 577: Employee Bonus (Amazon, Easy)
-- Tables: Employee(empId, name, supervisor, salary), Bonus(empId, bonus)
-- Rule: NULL < 1000 is unknown, so WHERE drops it. Employees with no bonus need OR b.bonus is null.
-- 2026-10-20: sample (Staff/Commission) clean, then this, clean.
select e.name, b.bonus
from Employee e
left join Bonus b on e.empId = b.empId
where b.bonus < 1000 or b.bonus is null;
