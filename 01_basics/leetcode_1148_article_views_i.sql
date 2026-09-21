-- LeetCode 1148: Article Views I (Easy)
-- Concept: same-row column comparison (author = viewer), DISTINCT, alias, sort
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
