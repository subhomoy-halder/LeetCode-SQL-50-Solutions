/* PROBLEM: 1789. Primary Department for Each Employee
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Window Functions

LOGIC:
The objective is to identify the primary department for each employee. We must 
consider two conditions:
1. Employees belonging to multiple departments have one marked with 'Y'.
2. Employees belonging to only one department should have that single 
   department reported, even if it is marked 'N'.
*/

WITH primary_depts AS (
    SELECT
        employee_id,
        department_id,
        primary_flag,
        COUNT(*) OVER(PARTITION BY employee_id) AS dept_count
    FROM employee
)
SELECT
    employee_id,
    department_id
FROM primary_depts
WHERE primary_flag = 'Y' 
   OR dept_count = 1;
