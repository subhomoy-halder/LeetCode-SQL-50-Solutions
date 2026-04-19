/* PROBLEM: 596. Classes With at Least 5 Students
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Aggregate Filtering

LOGIC:
The objective is to identify classes with a student enrollment of five or more. 
We group the 'Courses' table by 'class' and apply a filter on the aggregated 
count using the HAVING clause.

ARCHITECTURAL NOTE: 
1. Post-Aggregation Filtering: The HAVING clause is used here instead of WHERE 
   because we are filtering based on an aggregate result (COUNT). WHERE filters 
   individual rows before they are grouped; HAVING filters the groups 
   themselves after the count is calculated.
2. Performance & Indexing: For high-volume academic records, an index on the 
   'class' column is vital. It allows the database engine to perform a "Group 
   Aggregate" or "Stream Aggregate" without needing to sort the entire 
   dataset in memory first.
3. Primary Key Consideration: Since (student, class) is the primary key, we 
   are guaranteed that there are no duplicate (student, class) pairs. 
   Therefore, 'COUNT(student)' correctly reflects unique enrollments without 
   needing a 'DISTINCT' modifier.
*/

SELECT
    class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5;
