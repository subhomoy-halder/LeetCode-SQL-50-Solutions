/* PROBLEM: 180. Consecutive Numbers
DIFFICULTY: Medium
TOPIC: Advanced Select and Joins & Sequence Detection

LOGIC:
The objective is to find all numbers that appear at least three times 
consecutively. We achieve this by performing two successive self-joins 
on the 'Logs' table, matching a record with its immediate successor (id + 1) 
and its second successor (id + 2).

ARCHITECTURAL NOTE: 
1. Sequence Matching via Self-Joins: Joining a table to itself using 
   incremented IDs is a standard technique for identifying patterns or 
   trends in time-series or sequential data.
2. Predicate Filtering: The WHERE clause filters the joined result set to 
   only include records where the 'num' value remains identical across all 
   three joined instances.
3. Deduplication: We utilize 'GROUP BY numa' (equivalent to SELECT DISTINCT) 
   to ensure that a number appearing consecutively four or more times is 
   only reported once in the final result set.
4. Assumption of Continuous IDs: This specific logic relies on 'id' being 
   a continuous, gapless sequence. In production environments with potential 
   deletions, a window function approach (e.g., LEAD/LAG) would be more resilient.
*/

SELECT
    numa AS consecutivenums
FROM (
    SELECT
        a.id AS ida,
        a.num AS numa,
        b.id AS idb,
        b.num AS numb,
        c.id AS idc,
        c.num AS numc
    FROM logs AS a
    LEFT JOIN logs AS b ON a.id + 1 = b.id
    LEFT JOIN logs AS c ON b.id + 1 = c.id
) AS t
WHERE numa = numb AND numb = numc
GROUP BY numa;
