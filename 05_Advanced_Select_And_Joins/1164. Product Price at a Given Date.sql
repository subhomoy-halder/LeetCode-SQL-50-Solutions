/* PROBLEM: 1164. Product Price at a Given Date 
DIFFICULTY: Medium
TOPIC: Advanced Select and Joins & Point-in-Time Analysis

LOGIC:
The objective is to find the price of every product on a specific date 
('2019-08-16'). We use a two-pronged approach via CTEs:
1. Identify the latest price change on or before the target date.
2. Use UNION ALL to combine those latest prices with products that had no 
   changes before the target date (assigning them the default price of 10) 
  .

ARCHITECTURAL NOTE: 
1. Point-in-Time Recovery: This is a classic "As-Of" query. By using 
   MAX(change_date) with a date filter, we effectively reconstruct the state 
   of the database at a specific historical moment.
2. Set Operations: The 'UNION ALL' is used here to merge two logically 
   distinct datasets: products with historical activity and products in 
   their initial default state. This is more performant than a complex 
   OUTER JOIN with COALESCE in some high-volume scenarios.
3. Aggregate Filtering: The 'HAVING' clause in the second branch of the union 
   is a clever way to isolate products whose entire price history exists 
   strictly after the target date, ensuring the default price is only applied 
   where appropriate.
*/

WITH date_changes AS (
    SELECT
        product_id,
        MAX(change_date) AS change
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
), prices AS (
    SELECT
        a.product_id,
        a.new_price AS price
    FROM products AS a
    INNER JOIN date_changes AS b
      ON a.product_id = b.product_id
      AND a.change_date = b.change
    UNION ALL
    SELECT
        product_id,
        10 AS price
    FROM products
    GROUP BY product_id
    HAVING '2019-08-16' < MIN(change_date)
)
SELECT * FROM prices;
