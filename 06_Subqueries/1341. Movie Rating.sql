/* PROBLEM: 1341. Movie Rating
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Set Operations

LOGIC:
The objective is to retrieve two specific results: the user with the most 
ratings and the movie with the highest average rating in February 2020. 
We use two independent CTEs ('names' and 'ratings') to isolate each metric, 
then combine them using UNION ALL.

ARCHITECTURAL NOTE: 
1. Deterministic Tie-Breaking: The problem requires lexicographical ordering 
   as a secondary sort. By using 'ORDER BY ... DESC, name ASC', we ensure the 
   result is deterministic, which is critical for consistent reporting and 
   automated testing.
2. Floating-Point Precision: In PostgreSQL, we use 'AVG(rating * 1.0)' to 
   force floating-point math. This prevents integer truncation during the 
   average calculation, ensuring the "highest" average is mathematically 
   accurate.
3. Robust Date Filtering: The ratings CTE uses an inequality range 
   (>= '2020-02-01' AND < '2020-03-01'). This is more performant and robust 
   than using YEAR() and MONTH() functions, as it allows the database engine 
   to utilize indexes on the 'created_at' column.
4. Set Composition: Using 'UNION ALL' to merge distinct analytical findings 
   into a single column ('results') is a common pattern for executive 
   dashboards that need a "top highlights" summary.
*/

WITH names AS (
    SELECT
        b.name AS results
    FROM movierating AS a
    INNER JOIN users AS b
      ON a.user_id = b.user_id
    GROUP BY b.name
    ORDER BY 
        COUNT(a.movie_id) DESC, 
        b.name ASC
    LIMIT 1
), ratings AS (
    SELECT
        b.title AS results
    FROM movierating AS a
    INNER JOIN movies AS b
      ON a.movie_id = b.movie_id
    WHERE a.created_at >= '2020-02-01' 
      AND a.created_at < '2020-03-01'
    GROUP BY b.title
    ORDER BY 
        AVG(a.rating * 1.0) DESC, 
        b.title ASC
    LIMIT 1
)
SELECT results FROM names
UNION ALL
SELECT results FROM ratings;
