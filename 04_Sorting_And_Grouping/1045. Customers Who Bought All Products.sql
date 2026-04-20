/* PROBLEM: 1045. Customers Who Bought All Products
DIFFICULTY: Medium
TOPIC: Sorting and Grouping & Relational Division

LOGIC:
The objective is to identify customers who have purchased every item listed in 
the 'Product' table. We first deduplicate the 'Customer' table to ensure we 
are counting unique product associations per person. Then, we filter the 
groups by comparing their unique product count to the total count of 
available products.
*/

WITH uniq_cust AS (
    SELECT DISTINCT
        customer_id,
        product_key
    FROM customer
)
SELECT
    customer_id
FROM uniq_cust
GROUP BY
    customer_id
HAVING
    COUNT(product_key) = (SELECT COUNT(product_key) FROM product);
