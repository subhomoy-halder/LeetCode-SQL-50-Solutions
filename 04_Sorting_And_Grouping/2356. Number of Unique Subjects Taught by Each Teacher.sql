/* PROBLEM: 2356. Number of Unique Subjects Taught by Each Teacher
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Unique Aggregations

LOGIC:
The objective is to calculate the number of unique subjects taught by each 
teacher. We utilize the GROUP BY clause to isolate each teacher and the 
COUNT(DISTINCT ...) function to ensure that duplicate subject entries across 
different departments for the same teacher are not double-counted.
*/

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;
