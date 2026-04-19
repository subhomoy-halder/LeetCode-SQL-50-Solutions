/* PROBLEM: 1527. Patients With a Condition
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to identify patients who have Type I Diabetes. The problem 
specifies that Type I Diabetes codes always start with the 'DIAB1' prefix. 
Since a patient can have multiple conditions separated by spaces, we check for 
two scenarios:
1. 'DIAB1%' - The code is the very first entry in the conditions string.
2. '% DIAB1%' - The code appears later in the string, preceded by a space 
  .

ARCHITECTURAL NOTE: 
1. Pattern Matching Precision: Using two specific 'LIKE' patterns is a robust 
   way to handle space-delimited lists without the overhead of a full regular 
   expression engine. It prevents "false positives" (e.g., a code like 'MDIAB1' 
   would be correctly ignored).
2. SARGability: In many database systems, a 'LIKE' pattern starting with a 
   constant (e.g., 'DIAB1%') is SARGable, meaning the engine can utilize 
   indexes to find matches quickly. The second pattern ('% DIAB1%') requires 
   a full scan, but the combination remains highly efficient for most 
   clinical datasets.
3. Logical OR Efficiency: Using 'OR' between these two patterns ensures 
   complete coverage of the delimited list regardless of the code's 
   position.
*/

SELECT
    patient_id,
    patient_name,
    conditions
FROM patients
WHERE conditions LIKE 'DIAB1%' 
   OR conditions LIKE '% DIAB1%';
