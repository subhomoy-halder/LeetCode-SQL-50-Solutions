/* PROBLEM: 595. Big Countries
DIFFICULTY: Easy
TOPIC: Selection & Logical Operators (OR)

LOGIC:
The requirement is to filter a dataset based on two independent thresholds: 
geographic size (area) or demographic density (population). We use the OR 
logical operator to return a record if it satisfies at least one of these 
discrete business rules.
*/

SELECT 
    name, 
    population, 
    area
FROM World
WHERE area >= 3000000 
   OR population >= 25000000;
