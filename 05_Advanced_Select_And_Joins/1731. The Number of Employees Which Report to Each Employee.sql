/* PROBLEM: 1731. The Number of Employees Which Report to Each Employee
DIFFICULTY: Easy
TOPIC: Sorting And Grouping & Self-Joins (CTE Approach)

LOGIC:
The objective is to identify managers (employees who have at least one report) 
and calculate the total number of reports and their average age. We use two 
CTEs to isolate the report statistics and name mapping independently before 
performing the final join.
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
