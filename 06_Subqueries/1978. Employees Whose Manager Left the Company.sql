/* PROBLEM: 1978. Employees Whose Manager Left the Company
DIFFICULTY: Easy
TOPIC: Advanced Select And Joins & Subqueries

LOGIC:
The objective is to identify low-earning employees (salary < $30,000) whose 
manager is no longer in the company. We filter for records where a manager_id 
is present, then use a NOT EXISTS subquery to verify that the manager_id 
does not correspond to any active employee_id in the table.

ARCHITECTURAL NOTE: 
1. Correlation via NOT EXISTS: Using 'NOT EXISTS' is often more performant than 
   'NOT IN' when dealing with potential NULL values in the subquery. It 
   stops scanning as soon as a single match is found (semi-join logic).
2. Data Integrity: This query identifies "Orphaned Records"—a common issue 
   in databases without strict foreign key constraints where a parent record 
   (the manager) is deleted but the child record (the employee) remains.
3. Filtering Sequence: We filter for 'manager_id IS NOT NULL' first. This 
   ensures we don't accidentally flag employees who simply don't have 
   a manager (like the CEO) as having a "missing" manager.
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
