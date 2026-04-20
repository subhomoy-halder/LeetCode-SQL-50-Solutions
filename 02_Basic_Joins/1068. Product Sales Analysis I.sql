/* PROBLEM: 1068. Product Sales Analysis I
DIFFICULTY: Easy
TOPIC: Basic Joins & Transactional Data

LOGIC:
The objective is to enrich transactional records from the 'Sales' table with 
descriptive master data (product_name) from the 'Product' table. By joining 
on 'product_id', we map the foreign key in 'Sales' to the primary key in 'Product'.
*/

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales AS s
LEFT JOIN Product AS p
  ON s.product_id = p.product_id;
