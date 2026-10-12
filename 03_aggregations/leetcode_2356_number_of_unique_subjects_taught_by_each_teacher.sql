-- LeetCode 2356 Number of Unique Subjects Taught by Each Teacher (Easy, 89%)
-- 2026-10-12, Ladder day 1, stretch block. New tool: COUNT(DISTINCT). Clean solo, first try.
-- Why DISTINCT: (subject_id, dept_id) is the key, so one subject can appear in 2 rows for
-- the same teacher (one per department). Plain COUNT would count it twice.
-- Note: a space was missing before AS in the submitted line (`)as cnt`); runs, but keep it clean.

select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id;
