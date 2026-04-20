/* PROBLEM: 1484. Group Sold Products By The Date
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to find the number of unique products sold for each date and 
list their names in a comma-separated, alphabetically sorted string. We use 
a CTE to first isolate distinct date-product pairs, then aggregate the 
results in the final select.
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
