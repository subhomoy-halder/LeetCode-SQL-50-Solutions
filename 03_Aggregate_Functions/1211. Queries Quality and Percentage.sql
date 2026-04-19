/* PROBLEM: 1211. Queries Quality and Percentage
DIFFICULTY: Easy
TOPIC: Aggregate Functions & Conditional Logic

LOGIC:
The objective is to calculate two distinct metrics per query category:
1. Quality: The average ratio of rating to position.
2. Poor Query Percentage: The percentage of queries with a rating strictly less 
   than 3.

ARCHITECTURAL NOTE: 
1. Ratio Aggregation: By placing the calculation '(rating * 1.0 / position)' 
   inside the AVG() function, we ensure the ratio is calculated at the row 
   level before the group-level average is determined.
2. Conditional Aggregation: We utilize a 'CASE WHEN' statement inside a SUM() 
   to perform a filtered count. This is a highly efficient pattern that 
   allows us to calculate multiple sub-metrics in a single table scan (O(N)), 
   avoiding the need for multiple passes or subqueries.
3. Integer Division Prevention: Multiplying by 1.0 is a standard PostgreSQL 
   technique to cast integers to numerics. This ensures that the division 
   results in a float rather than an integer, preserving accuracy for the 
   final ROUND(..., 2) operation.
*/

SELECT 
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100, 2) AS poor_query_percentage
FROM queries
GROUP BY query_name;
