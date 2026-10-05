-- LeetCode 596 Classes With at Least 5 Students (Easy)
-- 2026-10-05 sprint Day 1 diagnostic. Solo, first try, about 2 minutes.
-- Restate: "need class with students >= 5 in any order".
select class
from Courses
group by class
having count(student) >= 5 ;
