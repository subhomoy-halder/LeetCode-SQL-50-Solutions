/* PROBLEM: 570. Managers with at Least 5 Direct Reports
DIFFICULTY: Medium
TOPIC: Basic Joins & Subqueries (Self-Referential)

LOGIC:
The objective is to identify managers who supervise five or more employees. 
The table has a self-referential relationship where 'managerId' points to the 
'id' of another record in the same table. We first aggregate the reports per 
manager and then join this result back to the main table to retrieve the 
manager's name.

ARCHITECTURAL NOTE: 
1. Self-Referential Integrity: This problem highlights a common hierarchical 
   data model. In production, 'managerId' would typically be a foreign key 
   referencing the 'id' column, and an index on 'managerId' is vital for 
   performance as the organizational chart grows.
2. Filtering via HAVING: By utilizing the HAVING clause in our subquery, we 
   reduce the size of the dataset early in the execution pipeline. This 
   "Filter-Before-Join" strategy minimizes the memory overhead required for 
   the subsequent INNER JOIN.
3. Join selection: We use an INNER JOIN because we only care about entities 
   that meet the threshold. Employees who are not managers or managers with 
   fewer than 5 reports are correctly excluded from the final result set.
*/

SELECT 
    m.name
FROM Employee AS m
INNER JOIN (
    SELECT 
        managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) AS r 
    ON m.id = r.managerId;
