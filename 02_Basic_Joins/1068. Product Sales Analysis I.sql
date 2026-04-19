/* PROBLEM: 1068. Product Sales Analysis I
DIFFICULTY: Easy
TOPIC: Basic Joins & Transactional Data

LOGIC:
The objective is to enrich transactional records from the 'Sales' table with 
descriptive master data (product_name) from the 'Product' table. By joining 
on 'product_id', we map the foreign key in 'Sales' to the primary key in 'Product'.

ARCHITECTURAL NOTE: 
1. Relational Mapping: This represents a classic many-to-one relationship. 
   While an INNER JOIN is technically sufficient since 'product_id' is a 
   foreign key, a LEFT JOIN is often utilized in production to ensure 
   transactional 'Sales' records are never lost, even if a corresponding 
   product record is temporarily missing or archived.
2. Indexing Strategy: For optimal performance, the 'product_id' columns in 
   both tables should be indexed. This allows the engine to perform a 
   "Merge Join" or "Hash Join" instead of a nested loop, significantly 
   improving speed as the Sales volume grows.
3. Column Selection: We only project the specific columns required by the 
   business rule (product_name, year, price) to reduce memory overhead during 
   the result set generation.
*/

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales AS s
LEFT JOIN Product AS p
  ON s.product_id = p.product_id;
