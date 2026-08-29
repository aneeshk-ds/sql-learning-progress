-- Compare the three ranking functions on tied values (they only differ on a tie)
-- ROW_NUMBER : unique number per row, never ties -> 1,2,3,4
-- RANK       : ties share a rank, then skips     -> 1,2,2,4
-- DENSE_RANK : ties share a rank, no skip        -> 1,2,2,3
SELECT player,
       score,
       ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num,
       RANK()       OVER (ORDER BY score DESC) AS rank_val,
       DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rank_val
FROM Players;
