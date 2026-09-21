-- LeetCode 596: Classes With at Least 5 Students (Easy)
-- Concept: GROUP BY with HAVING on an aggregate count
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
