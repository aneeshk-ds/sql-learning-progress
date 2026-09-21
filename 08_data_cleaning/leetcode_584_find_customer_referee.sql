-- LeetCode 584: Find Customer Referee (Easy)
-- Concept: NULL handling. A comparison filter drops NULL rows, so name NULLs explicitly.
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
