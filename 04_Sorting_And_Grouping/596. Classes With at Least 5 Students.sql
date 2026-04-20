/* PROBLEM: 596. Classes With at Least 5 Students
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Aggregate Filtering

LOGIC:
The objective is to identify classes with a student enrollment of five or more. 
We group the 'Courses' table by 'class' and apply a filter on the aggregated 
count using the HAVING clause.
*/

SELECT
    class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5;
