/* PROBLEM: 1193. Monthly Transactions I
DIFFICULTY: Medium
TOPIC: Aggregate Functions & Temporal Formatting

LOGIC:
The objective is to aggregate transaction data by month and country, calculating 
both total and approved metrics. We use PostgreSQL-specific date formatting to 
extract the "YYYY-MM" pattern and conditional aggregation to isolate 
'approved' transactions.
*/

SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
