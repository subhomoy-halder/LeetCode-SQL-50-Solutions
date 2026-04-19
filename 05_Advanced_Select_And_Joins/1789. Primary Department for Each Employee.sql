/* PROBLEM: 1789. Primary Department for Each Employee
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Window Functions

LOGIC:
The objective is to identify the primary department for each employee. We must 
consider two conditions:
1. Employees belonging to multiple departments have one marked with 'Y'.
2. Employees belonging to only one department should have that single 
   department reported, even if it is marked 'N'.

ARCHITECTURAL NOTE: 
1. Analytical Window Functions: We utilize 'COUNT(*) OVER(PARTITION BY...)' to 
   calculate the total number of department associations for each employee 
   without collapsing the result set. This allows us to apply row-level filters 
   based on group-level statistics in a single pass.
2. Business Logic Implementation: The WHERE clause effectively implements the 
   business rule by checking for either an explicit primary flag ('Y') OR 
   membership in only a single department ('dept_count = 1').
3. Performance: Using a CTE with a window function is generally more performant 
   than a self-join or a correlated subquery, as it avoids redundant scans of 
   the 'Employee' table.
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
