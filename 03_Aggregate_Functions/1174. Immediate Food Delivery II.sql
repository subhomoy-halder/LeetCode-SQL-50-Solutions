/* PROBLEM: 1174. Immediate Food Delivery II
DIFFICULTY: Medium
TOPIC: Aggregate Functions & Window Functions

LOGIC:
The objective is to find the percentage of "immediate" orders among the first 
orders of all customers. We use a two-step process:
1. Identify the 'First Order' for every customer using the ROW_NUMBER() window 
   function partitioned by customer.
2. Calculate the ratio of immediate orders (where order_date matches preferred 
   delivery date) to total first orders across the entire dataset.
*/

WITH min_dates AS (
    SELECT
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS row_integrity
    FROM delivery
),
immediates AS (
    SELECT
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 100.0 ELSE 0.0 END) AS total_imm,
        COUNT(customer_pref_delivery_date) * 1.0 AS total_orders
    FROM min_dates
    WHERE row_integrity = 1
)
SELECT
    ROUND(COALESCE(total_imm / NULLIF(total_orders, 0), 0.0), 2) AS immediate_percentage
FROM immediates;
