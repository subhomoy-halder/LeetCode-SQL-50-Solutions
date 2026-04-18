/* PROBLEM: 1757. Recyclable and Low Fat Products
DIFFICULTY: Easy
TOPIC: Basic Selection & Filtering

LOGIC:
The objective is to isolate a specific subset of rows based on a dual-predicate filter. 
We utilize the WHERE clause with the AND logical operator to ensure only records 
satisfying both the 'low_fats' and 'recyclable' ENUM constraints are returned.

ARCHITECTURAL NOTE: 
1. SARGability: This query is fully SARGable (Search ARGumentable). If an index 
   exists on (low_fats, recyclable), the database engine can perform an Index Seek 
   rather than a Full Table Scan, making this operation O(log N) in an optimized 
   environment.
2. ENUM Handling: Since the columns are defined as ENUMs, the database stores 
   these internally as integers (1 for 'Y', 2 for 'N'). Filtering on 'Y' is 
   extremely efficient as the engine is performing an integer comparison 
   under the hood despite the string-based syntax.
*/

SELECT
    product_id
FROM Products
WHERE low_fats = 'Y' 
  AND recyclable = 'Y';
