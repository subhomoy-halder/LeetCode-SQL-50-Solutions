/* PROBLEM: 1193. Monthly Transactions I
DIFFICULTY: Medium
TOPIC: Aggregate Functions & Temporal Formatting

LOGIC:
The objective is to aggregate transaction data by month and country, calculating 
both total and approved metrics. We use PostgreSQL-specific date formatting to 
extract the "YYYY-MM" pattern and conditional aggregation to isolate 
'approved' transactions.

ARCHITECTURAL NOTE: 
1. Temporal Formatting: In PostgreSQL, 'TO_CHAR(trans_date, 'YYYY-MM')' is the 
   standard for extracting specific date parts. It is more versatile than 
   the T-SQL 'CONVERT' or 'LEFT' functions used in other dialects.
2. Conditional Aggregation: We utilize 'SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END)'. 
   This pattern allows us to calculate multiple sub-totals (counts and sums) 
   in a single pass over the table, which is significantly more efficient than 
   using multiple subqueries or joins.
3. Grouping by Alias: Note that while some engines allow grouping by an alias, 
   standard SQL (and stricter PostgreSQL configurations) requires grouping by 
   the exact expression or the column position. Here, we group by the formatted 
   date and country to ensure total compatibility.
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
