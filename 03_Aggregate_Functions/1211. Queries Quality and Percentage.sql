/* PROBLEM: 1211. Queries Quality and Percentage
DIFFICULTY: Easy
TOPIC: Aggregate Functions & Conditional Logic

LOGIC:
The objective is to calculate two distinct metrics per query category:
1. Quality: The average ratio of rating to position.
2. Poor Query Percentage: The percentage of queries with a rating strictly less 
   than 3.
*/

SELECT 
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100, 2) AS poor_query_percentage
FROM queries
GROUP BY query_name;
