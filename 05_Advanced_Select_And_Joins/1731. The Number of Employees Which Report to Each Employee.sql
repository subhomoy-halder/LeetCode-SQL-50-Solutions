/* PROBLEM: 1731. The Number of Employees Which Report to Each Employee
DIFFICULTY: Easy
TOPIC: Sorting And Grouping & Self-Joins (CTE Approach)

LOGIC:
The objective is to identify managers (employees who have at least one report) 
and calculate the total number of reports and their average age. We use two 
CTEs to isolate the report statistics and name mapping independently before 
performing the final join.

ARCHITECTURAL NOTE: 
1. Self-Referential Integrity: Like problem #570, this uses a self-referential 
   structure. By filtering 'WHERE reports_to IS NOT NULL' in the 'stats' CTE, 
   we efficiently narrow the dataset to only those records that define a 
   reporting relationship.
2. Numeric Precision & Casting: We use 'AVG(age * 1.0)' to ensure floating-point 
   math during the average calculation. The combination of ROUND() and 
   'CAST(... AS INT)' ensures the final output meets the business requirement 
   for an integer average.
3. Modular CTE Design: Breaking the query into 'stats' and 'emp_name' makes 
   the logic much easier to audit. In a production environment, this allows 
   different developers to troubleshoot the aggregation logic and the 
   identity mapping separately.
*/

WITH stats AS (
    SELECT
        reports_to AS employee_id,
        COUNT(*) AS reports_count,
        CAST(ROUND(AVG(age * 1.0), 0) AS INT) AS average_age
    FROM employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
), emp_name AS (
    SELECT
        employee_id,
        name
    FROM employees
)
SELECT
    a.employee_id,
    b.name,
    a.reports_count,
    a.average_age
FROM stats AS a
LEFT JOIN emp_name AS b
  ON a.employee_id = b.employee_id
ORDER BY a.employee_id;
