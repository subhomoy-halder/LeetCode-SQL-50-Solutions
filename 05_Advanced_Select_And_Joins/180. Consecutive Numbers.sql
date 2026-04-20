/* PROBLEM: 180. Consecutive Numbers
DIFFICULTY: Medium
TOPIC: Advanced Select and Joins & Sequence Detection

LOGIC:
The objective is to find all numbers that appear at least three times 
consecutively. We achieve this by performing two successive self-joins 
on the 'Logs' table, matching a record with its immediate successor (id + 1) 
and its second successor (id + 2).
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
