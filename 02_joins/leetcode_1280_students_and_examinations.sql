-- LeetCode 1280: Students and Examinations (Amazon, Easy)
-- Tables: Students(student_id, student_name), Subjects(subject_name), Examinations(student_id, subject_name)
-- New tool 2026-10-20: CROSS JOIN builds every student x subject pair, including pairs with no exams.
-- LEFT JOIN Examinations on BOTH columns (#25), COUNT a right-side column so missing pairs show 0 (#23).
-- Marked "To return and practice".
select s.student_id, s.student_name, sub.subject_name, count(e.subject_name) as attended_exams
from Students s
cross join Subjects sub
left join Examinations e on e.student_id = s.student_id and sub.subject_name = e.subject_name
group by s.student_id, s.student_name, sub.subject_name
order by s.student_id, sub.subject_name;
