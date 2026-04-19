/* PROBLEM: 620. Not Boring Movies
DIFFICULTY: Easy
TOPIC: Basic Filtering & Sorting

LOGIC:
The objective is to filter for movies with an odd-numbered ID and a description 
that is not "boring". The results are then sorted by rating in descending 
order to prioritize higher-quality content.

ARCHITECTURAL NOTE: 
1. Mathematical Predicates: We use the modulo operator (%) to identify odd IDs. 
   While '% 2 != 0' is also valid, '% 2 = 1' is more explicit. On massive 
   datasets, bitwise operations (id & 1) can sometimes be faster, but the 
   standard modulo is the gold standard for readability.
2. String Filtering: The '!=' operator is used for inequality. Note that 
   in many production environments, string comparisons are case-sensitive by 
   default (like in PostgreSQL), so ensuring exact matches with 'boring' is 
   crucial.
3. Sorting Performance: The 'ORDER BY rating DESC' operation is highly 
   efficient if the 'rating' column has a B-tree index. Without an index, the 
   engine must perform a "filesort" in memory, which can become a bottleneck 
   as the table grows.
*/

SELECT 
    id, 
    movie, 
    description, 
    rating
FROM cinema
WHERE id % 2 = 1 
  AND description != 'boring'
ORDER BY rating DESC;
