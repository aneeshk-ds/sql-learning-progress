-- LeetCode 1683: Invalid Tweets (Easy)
-- Concept: row-level filter with a string-length function (WHERE, not HAVING)
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
