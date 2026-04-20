/* PROBLEM: 1661. Average Time of Process per Machine
DIFFICULTY: Easy
TOPIC: Basic Joins & Aggregations

LOGIC:
The objective is to calculate the average duration of processes for each machine. 
We perform a self-join on the 'Activity' table, matching 'start' events with their 
corresponding 'end' events for the same machine and process. We then calculate 
the difference between timestamps and average them per machine.
*/

SELECT 
    a1.machine_id, 
    ROUND(AVG(a2.timestamp - a1.timestamp)::numeric, 3) AS processing_time
FROM Activity a1
JOIN Activity a2 
    ON a1.machine_id = a2.machine_id 
    AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'start' 
  AND a2.activity_type = 'end'
GROUP BY a1.machine_id;
