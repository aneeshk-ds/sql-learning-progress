-- LeetCode 619. Biggest Single Number  (Easy)
-- Solved 2026-10-02, first-try clean. CTE reached for unprompted.
--
-- MyNumbers(num int). A "single number" appears exactly once in the table.
-- Return the largest single number, or null if none exists. Output column named num.
--
-- The trap: MAX(DISTINCT num) returns the largest value in the table, not the largest
-- value that occurred once. DISTINCT collapses duplicates and discards the count,
-- which is the only thing that can answer the question. "Appears once" is a count
-- condition, so it belongs in HAVING.
--
-- Null case is free: MAX over an empty set returns one row holding null.

WITH counts AS (
    SELECT num, COUNT(num) AS repeats
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)
SELECT MAX(num) AS num
FROM counts;
