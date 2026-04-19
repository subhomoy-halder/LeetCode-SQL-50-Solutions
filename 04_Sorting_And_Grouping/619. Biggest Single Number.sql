/* PROBLEM: 619. Biggest Single Number
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Aggregate Functions

LOGIC:
The objective is to find the largest number that appears exactly once in the 
'MyNumbers' table. We utilize a CTE to isolate all numbers with a frequency of 1 
and then perform a MAX() aggregation on that subset.

ARCHITECTURAL NOTE: 
1. Aggregate Behavior: In SQL, performing MAX() on an empty result set 
   automatically returns NULL. This inherent behavior elegantly handles the 
   edge case where no single numbers exist, fulfilling the business requirement 
   without needing extra COALESCE or IFNULL logic.
2. Subquery vs. CTE: While a subquery in the FROM clause works, using a 
   named CTE ('single_num') improves readability and makes the intent of 
   the filtering stage clear to other developers.
3. Performance: The engine first performs a 'Group Aggregate' to find counts. 
   On large datasets, a B-tree index on the 'num' column would allow the engine 
   to group the data in O(N) time, making this a highly scalable solution.
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
