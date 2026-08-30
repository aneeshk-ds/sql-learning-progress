-- Label each product Expensive or Cheap by a price cutoff
-- CASE WHEN is SQL's if/else: first matching WHEN wins, ELSE is the fallback, END closes it.
SELECT name,
       price,
       CASE WHEN price >= 10000 THEN 'Expensive'
            ELSE 'Cheap'
       END AS band
FROM products;
