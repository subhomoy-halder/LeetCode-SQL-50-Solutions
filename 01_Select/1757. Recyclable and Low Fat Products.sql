/* PROBLEM: 1757. Recyclable and Low Fat Products
DIFFICULTY: Easy
TOPIC: Basic Selection & Filtering

LOGIC:
The objective is to isolate a specific subset of rows based on a dual-predicate filter. 
We utilize the WHERE clause with the AND logical operator to ensure only records 
satisfying both the 'low_fats' and 'recyclable' ENUM constraints are returned.
*/

SELECT
    product_id
FROM Products
WHERE low_fats = 'Y' 
  AND recyclable = 'Y';
