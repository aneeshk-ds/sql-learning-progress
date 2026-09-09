-- Problem: Return the IDs of stores with monthly sales above 50000, ordered by ID.
-- Concept: filter with WHERE, sort with ORDER BY. Read the output column and the sort
-- the prompt names, not the framing in the title.

SELECT id
FROM store
WHERE monthly_sales > 50000
ORDER BY id;
