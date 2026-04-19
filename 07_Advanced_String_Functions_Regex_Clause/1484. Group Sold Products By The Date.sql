/* PROBLEM: 1484. Group Sold Products By The Date
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to find the number of unique products sold for each date and 
list their names in a comma-separated, alphabetically sorted string. We use 
a CTE to first isolate distinct date-product pairs, then aggregate the 
results in the final select.

ARCHITECTURAL NOTE: 
1. Pre-Aggregation Deduplication: Using a CTE ('distinct_sales') to filter 
   out duplicate sales records *before* the aggregation step is more 
   performant and readable than using 'COUNT(DISTINCT...)' and 
   'STRING_AGG(DISTINCT...)' inside the main query.
2. PostgreSQL String Aggregation: In PostgreSQL, the 'STRING_AGG' function 
   accepts an optional 'ORDER BY' clause inside the parentheses. This 
   efficiently handles the lexicographical sorting requirement while the 
   data is being concatenated.
3. Data Normalization: This solution transforms normalized transactional 
   rows into a denormalized "report-ready" format, a common requirement for 
   business intelligence exports and daily sales summaries.
*/

WITH distinct_sales AS (
    SELECT DISTINCT
        sell_date,
        product
    FROM activities
)
SELECT
    sell_date,
    COUNT(*) AS num_sold,
    STRING_AGG(product, ',' ORDER BY product) AS products
FROM distinct_sales
GROUP BY sell_date
ORDER BY sell_date;
