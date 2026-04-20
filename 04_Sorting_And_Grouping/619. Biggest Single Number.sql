/* PROBLEM: 619. Biggest Single Number
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Aggregate Functions

LOGIC:
The objective is to find the largest number that appears exactly once in the 
'MyNumbers' table. We utilize a CTE to isolate all numbers with a frequency of 1 
and then perform a MAX() aggregation on that subset.
*/

WITH single_num AS (
    SELECT
        num
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)
SELECT
    MAX(num) AS num
FROM single_num;
