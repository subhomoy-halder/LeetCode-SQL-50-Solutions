/* PROBLEM: 1280. Students and Examinations
DIFFICULTY: Easy
TOPIC: Basic Joins & Cross Products

LOGIC:
The objective is to report the number of times each student attended each exam, 
including those with zero attendances. We first generate a Cartesian product 
(CROSS JOIN) of all students and subjects to establish the baseline. We then 
map pre-aggregated exam counts onto this baseline using a LEFT JOIN.

ARCHITECTURAL NOTE: 
1. Pre-Aggregation Optimization: Instead of joining the raw 'Examinations' 
   table, we aggregate it first in a subquery. This reduces the join 
   complexity from O(N * M) to a much smaller O(N + K), where K is the number 
   of unique student-subject pairs.
2. Cross Join Intent: The CROSS JOIN is used deliberately to satisfy the 
   business requirement that every subject must be represented for every 
   student, even if no exam was taken.
3. Handling Missing Data: We utilize COALESCE(..., 0) to ensure that null 
   results from the LEFT JOIN are displayed as zero, providing a complete and 
   accurate business report.
*/

SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COALESCE(e.attended_exams, 0) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects AS sub
LEFT JOIN (
    SELECT 
        student_id, 
        subject_name, 
        COUNT(*) AS attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name
) AS e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
ORDER BY s.student_id, sub.subject_name;
