-- LeetCode 511: Game Play Analysis I (Easy)
-- Concept: GROUP BY with MIN to get the first date per player
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
