/* PROBLEM: 1045. Customers Who Bought All Products
DIFFICULTY: Medium
TOPIC: Sorting and Grouping & Relational Division

LOGIC:
The objective is to identify customers who have purchased every item listed in 
the 'Product' table. We first deduplicate the 'Customer' table to ensure we 
are counting unique product associations per person. Then, we filter the 
groups by comparing their unique product count to the total count of 
available products.

ARCHITECTURAL NOTE: 
1. Relational Division: This is a classic "Set Theory" problem known as 
   Relational Division. We are looking for a subset of entities (Customers) 
   that have a relationship with the entire set of another entity (Products).
2. Handling Duplicate Transactions: Because the problem note mentions that the 
   'Customer' table may contain duplicate rows, using 'SELECT DISTINCT' in 
   the CTE is vital. It prevents a customer who bought the same product twice 
   from being incorrectly flagged as having bought "all" products.
3. Subquery Optimization: The scalar subquery in the HAVING clause is 
   evaluated only once by most modern database engines. This is more efficient 
   than a join-based approach for this specific business requirement 
  .
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
