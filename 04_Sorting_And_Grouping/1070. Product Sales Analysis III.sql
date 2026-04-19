/* PROBLEM: 1070. Product Sales Analysis III
DIFFICULTY: Medium
TOPIC: Sorting and Grouping & Joins

LOGIC:
The objective is to retrieve the sales details (quantity and price) for the first 
year every product was sold. We first identify the minimum year per product 
using a CTE, then perform an INNER JOIN back to the 'Sales' table to filter 
only for the records matching that specific year.

ARCHITECTURAL NOTE: 
1. Subquery vs. Window Function: While this can be solved using RANK() or 
   DENSE_RANK(), the CTE + INNER JOIN approach is often more performant in 
   legacy environments or systems where window function optimization is limited. 
   It allows the engine to leverage a "Nested Loop" or "Hash Join" after the 
   aggregation.
2. Join Condition Integrity: We join on both 'product_id' and 'year'. This 
   precision is critical; joining only on 'year' would incorrectly return 
   data for all products sold in that year, regardless of whether it was 
   their "first" year.
3. Handling Multiple Sales: Because a product may have multiple sales entries 
   in its first year, the INNER JOIN correctly preserves and returns all 
   relevant rows for that specific year, as required by the business logic 
  .
*/

WITH first_sale AS (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM sales
    GROUP BY product_id
)
SELECT
    a.product_id,
    a.year AS first_year,
    a.quantity,
    a.price
FROM sales AS a
INNER JOIN first_sale AS b
  ON a.product_id = b.product_id
  AND a.year = b.first_year;
