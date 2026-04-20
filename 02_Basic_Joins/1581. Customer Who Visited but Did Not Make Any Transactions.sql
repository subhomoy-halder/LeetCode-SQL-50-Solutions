/* PROBLEM: 1581. Customer Who Visited but Did Not Make Any Transactions
DIFFICULTY: Easy
TOPIC: Basic Joins & Anti-Join Logic

LOGIC:
The objective is to identify customers who have entries in the 'Visits' table 
but no corresponding records in the 'Transactions' table for that specific 
visit. We aggregate these "transaction-less" visits by customer and count 
the occurrences.
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
