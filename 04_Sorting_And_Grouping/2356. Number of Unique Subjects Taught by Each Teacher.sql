/* PROBLEM: 2356. Number of Unique Subjects Taught by Each Teacher
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Unique Aggregations

LOGIC:
The objective is to calculate the number of unique subjects taught by each 
teacher. We utilize the GROUP BY clause to isolate each teacher and the 
COUNT(DISTINCT ...) function to ensure that duplicate subject entries across 
different departments for the same teacher are not double-counted.

ARCHITECTURAL NOTE: 
1. Distinct Aggregations: Using COUNT(DISTINCT) is a standard method for 
   identifying unique cardinality within a group. In massive datasets, the 
   database engine often performs this by building an in-memory hash set 
   for each group, which is highly efficient for unique counts.
2. Grouping Efficiency: By grouping on the 'teacher_id', the engine can 
   utilize a "Hash Aggregate" or "Sort Aggregate" operation. If 'teacher_id' 
   is indexed, this query performs at O(N) complexity where N is the number 
   of rows in the table.
3. Scaling: This pattern is foundational for building "Unique User" or 
   "Product Diversity" reports in business intelligence dashboards, where 
   filtering out duplicate transactional events is critical for accuracy.
*/

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;
