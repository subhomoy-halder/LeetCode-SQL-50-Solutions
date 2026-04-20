/* PROBLEM: 577. Employee Bonus
DIFFICULTY: Easy
TOPIC: Basic Joins & NULL Handling

LOGIC:
The objective is to list all employees who either have a bonus less than 1000 
or have no bonus recorded at all. We must use a LEFT JOIN starting from the 
'Employee' table to ensure every staff member is evaluated, regardless of 
whether they exist in the 'Bonus' table.
*/

SELECT 
    e.name, 
    b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b 
    ON e.empId = b.empId
WHERE b.bonus < 1000 
   OR b.bonus IS NULL;
