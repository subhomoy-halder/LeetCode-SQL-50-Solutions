/* PROBLEM: 1661. Average Time of Process per Machine
DIFFICULTY: Easy
TOPIC: Basic Joins & Aggregations

LOGIC:
The objective is to calculate the average duration of processes for each machine. 
We perform a self-join on the 'Activity' table, matching 'start' events with their 
corresponding 'end' events for the same machine and process. We then calculate 
the difference between timestamps and average them per machine.

ARCHITECTURAL NOTE: 
1. Join Optimization: By joining on (machine_id, process_id), we leverage the 
   table's primary key structure. This is far more efficient than joining on 
   calculated row numbers, as it allows the engine to perform a "Merge Join" 
   or "Hash Join" using existing indexes.
2. Precision Handling: PostgreSQL requires explicit rounding for business 
   metrics. We utilize ROUND(..., 3) to satisfy the requirement for three 
   decimal places.
3. Execution Efficiency: This optimized approach reduces the number of 
   table scans. Instead of multiple CTEs, we use a single join followed by a 
   grouped aggregation, minimizing memory overhead.
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
