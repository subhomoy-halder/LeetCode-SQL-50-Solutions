/* PROBLEM: 1907. Count Salary Categories
DIFFICULTY: Medium
TOPIC: Advanced Select and Joins & Reporting Skeleton Patterns

LOGIC:
The objective is to report the number of bank accounts in three specific 
salary categories. A key requirement is that all three categories must 
appear in the result, even if they have zero accounts. We achieve this by:
1. Creating a "Skeleton" CTE ('categories') that explicitly defines the 
   required output rows.
2. Categorizing the actual data in a second CTE ('incomes') using a CASE statement.
3. Using a LEFT JOIN to ensure categories with no matching data return 0 
   instead of being omitted.
*/

WITH categories AS (
    SELECT 'Low Salary' AS cat
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
), incomes AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS income_cat
    FROM accounts
)
SELECT
    a.cat AS category,
    COUNT(b.income_cat) AS accounts_count
FROM categories AS a
LEFT JOIN incomes AS b
  ON a.cat = b.income_cat
GROUP BY a.cat;
