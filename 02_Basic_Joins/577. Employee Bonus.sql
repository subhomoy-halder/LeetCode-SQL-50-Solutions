/* PROBLEM: 577. Employee Bonus
DIFFICULTY: Easy
TOPIC: Basic Joins & NULL Handling

LOGIC:
The objective is to list all employees who either have a bonus less than 1000 
or have no bonus recorded at all. We must use a LEFT JOIN starting from the 
'Employee' table to ensure every staff member is evaluated, regardless of 
whether they exist in the 'Bonus' table.

ARCHITECTURAL NOTE: 
1. Join Directionality: While a RIGHT JOIN can achieve this (as seen in the 
   initial draft), a LEFT JOIN starting with the primary entity 
   (Employee) is standard practice. It follows the natural "Master-to-Detail" 
   readability pattern used in enterprise data pipelines.
2. Three-Valued Logic: In SQL, 'bonus < 1000' evaluates to UNKNOWN for 
   employees with no bonus (NULL). Because the WHERE clause only returns TRUE 
   results, we must explicitly include 'OR bonus IS NULL' to prevent data 
   loss for non-bonused employees.
3. Predicate Evaluation: The engine first performs the join to create a 
   virtual table containing all employees, then applies the filter to the 
   calculated bonus column.
*/

SELECT 
    e.name, 
    b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b 
    ON e.empId = b.empId
WHERE b.bonus < 1000 
   OR b.bonus IS NULL;
