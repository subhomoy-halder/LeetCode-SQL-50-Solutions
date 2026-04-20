/* PROBLEM: 1280. Students and Examinations
DIFFICULTY: Easy
TOPIC: Basic Joins & Cross Products

LOGIC:
The objective is to report the number of times each student attended each exam, 
including those with zero attendances. We first generate a Cartesian product 
(CROSS JOIN) of all students and subjects to establish the baseline. We then 
map pre-aggregated exam counts onto this baseline using a LEFT JOIN.
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
