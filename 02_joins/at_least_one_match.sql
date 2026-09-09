-- Problem: Return the names of authors who have written at least one book.
-- Concept: "at least one match" is an inner join. Non-matching authors never appear,
-- so no COUNT or HAVING is needed. DISTINCT drops the duplicate name an author with
-- multiple books would otherwise produce.

SELECT DISTINCT a.name
FROM author a
JOIN book b ON b.author_id = a.id;
