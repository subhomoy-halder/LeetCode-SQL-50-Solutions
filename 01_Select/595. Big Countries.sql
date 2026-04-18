/* PROBLEM: 595. Big Countries
DIFFICULTY: Easy
TOPIC: Selection & Logical Operators (OR)

LOGIC:
The requirement is to filter a dataset based on two independent thresholds: 
geographic size (area) or demographic density (population). We use the OR 
logical operator to return a record if it satisfies at least one of these 
discrete business rules.

ARCHITECTURAL NOTE: 
1. Predicate Evaluation: When using an 'OR' across two different columns, 
   database engines often perform an "Index Merge" if separate indexes exist 
   on both 'area' and 'population'. 
2. Performance Trade-off: In extremely large datasets, some architects 
   prefer using a 'UNION' of two separate SELECT statements to ensure 
   individual index usage, though for a standard table of this scale, a 
   single 'OR' is the most readable and efficient approach.
*/

SELECT 
    name, 
    population, 
    area
FROM World
WHERE area >= 3000000 
   OR population >= 25000000;
