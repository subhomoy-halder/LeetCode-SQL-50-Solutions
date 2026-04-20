/* PROBLEM: 1327. List the Products Ordered in a Period 
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to find products that had at least 100 units ordered during 
February 2020. We utilize a CTE to aggregate sales by product within the 
specified date range and filter the results using a HAVING clause. Finally, 
we join with the 'products' table to retrieve the descriptive names.
*/

WITH product_sales AS (
    SELECT
        product_id,
        SUM(unit) AS unit
    FROM orders
    WHERE order_date >= '2020-02-01' AND order_date < '2020-03-01'
    GROUP BY product_id
    HAVING SUM(unit) >= 100
)
SELECT
    b.product_name,
    a.unit
FROM product_sales AS a
INNER JOIN products AS b
  ON a.product_id = b.product_id;
