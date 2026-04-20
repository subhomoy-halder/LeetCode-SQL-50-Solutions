/* PROBLEM: 570. Managers with at Least 5 Direct Reports
DIFFICULTY: Medium
TOPIC: Basic Joins & Subqueries (Self-Referential)

LOGIC:
The objective is to identify managers who supervise five or more employees. 
The table has a self-referential relationship where 'managerId' points to the 
'id' of another record in the same table. We first aggregate the reports per 
manager and then join this result back to the main table to retrieve the 
manager's name.
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
