/* PROBLEM: 1341. Movie Rating
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Set Operations

LOGIC:
The objective is to retrieve two specific results: the user with the most 
ratings and the movie with the highest average rating in February 2020. 
We use two independent CTEs ('names' and 'ratings') to isolate each metric, 
then combine them using UNION ALL.
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
