/* PROBLEM: 1978. Employees Whose Manager Left the Company
DIFFICULTY: Easy
TOPIC: Advanced Select And Joins & Subqueries

LOGIC:
The objective is to identify low-earning employees (salary < $30,000) whose 
manager is no longer in the company. We filter for records where a manager_id 
is present, then use a NOT EXISTS subquery to verify that the manager_id 
does not correspond to any active employee_id in the table.
*/

SELECT
    a.employee_id
FROM employees AS a
WHERE a.manager_id IS NOT NULL
  AND a.salary < 30000
  AND NOT EXISTS (
      SELECT 1
      FROM employees AS b
      WHERE b.employee_id = a.manager_id
  )
ORDER BY a.employee_id;
