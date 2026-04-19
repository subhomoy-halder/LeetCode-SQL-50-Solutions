/* PROBLEM: 1581. Customer Who Visited but Did Not Make Any Transactions
DIFFICULTY: Easy
TOPIC: Basic Joins & Anti-Join Logic

LOGIC:
The objective is to identify customers who have entries in the 'Visits' table 
but no corresponding records in the 'Transactions' table for that specific 
visit. We aggregate these "transaction-less" visits by customer and count 
the occurrences.

ARCHITECTURAL NOTE: 
1. Anti-Join Patterns: This problem can be solved via a LEFT JOIN (filtering 
   for NULLs) or a WHERE NOT EXISTS subquery. The NOT EXISTS 
   approach used here is often more efficient in modern database engines as 
   it can "short-circuit" the search—stopping as soon as a single match 
   is found, rather than building a full join result set in memory.
2. Grouping & Aggregation: We utilize GROUP BY on 'customer_id' to consolidate 
   the data, followed by a COUNT() on 'visit_id' to generate the required 
   business metric (count_no_trans).
3. Data Integrity: This query helps identify "drop-off" points in a customer 
   journey, showcasing how SQL can be used to generate actionable business 
   intelligence from raw visit logs.
*/

SELECT 
    v.customer_id, 
    COUNT(v.visit_id) AS count_no_trans
FROM Visits v
WHERE NOT EXISTS (
    SELECT 1 
    FROM Transactions t 
    WHERE t.visit_id = v.visit_id
)
GROUP BY v.customer_id;
