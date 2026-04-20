/* PROBLEM: 1251. Average Selling Price
DIFFICULTY: Easy
TOPIC: Aggregate Functions & Non-Equi Joins

LOGIC:
The objective is to calculate the weighted average selling price for each product 
over specific time periods. We join transactional data (UnitsSold) to a 
dimensional price table (Prices) using a 'BETWEEN' clause to match the 
transaction date to the correct pricing window.
*/

WITH sales_cte AS (
    SELECT
        a.product_id,
        b.purchase_date,
        COALESCE(a.price, 0.0) * 1.0 AS price,
        COALESCE(b.units, 0.0) * 1.0 AS unit,
        COALESCE(a.price * b.units * 1.0, 0.0) AS sales
    FROM prices AS a
    LEFT JOIN unitssold AS b
    ON a.product_id = b.product_id
    AND b.purchase_date BETWEEN a.start_date AND a.end_date
)
SELECT
    product_id,
    ROUND(COALESCE(SUM(sales) / NULLIF(SUM(unit), 0), 0), 2) AS average_price
FROM sales_cte
GROUP BY product_id;
