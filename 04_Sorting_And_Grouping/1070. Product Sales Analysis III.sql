/* PROBLEM: 1070. Product Sales Analysis III
DIFFICULTY: Medium
TOPIC: Sorting and Grouping & Joins

LOGIC:
The objective is to retrieve the sales details (quantity and price) for the first 
year every product was sold. We first identify the minimum year per product 
using a CTE, then perform an INNER JOIN back to the 'Sales' table to filter 
only for the records matching that specific year.
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
