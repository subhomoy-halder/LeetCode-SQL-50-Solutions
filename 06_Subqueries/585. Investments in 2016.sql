/* PROBLEM: 585. Investments in 2016
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Multi-Criteria Filtering

LOGIC:
The objective is to sum the total investment value for 2016 ('tiv_2016') for 
policyholders who meet two specific criteria:
1. They share the same 'tiv_2015' value with at least one other person.
2. They are located in a unique 'lat/lon' pair (not in the same city as 
   any other policyholder).

ARCHITECTURAL NOTE: 
1. Single-Pass Filtering via Window Functions: Instead of using expensive 
   correlated subqueries or multiple self-joins, we use 'COUNT(*) OVER(...)' 
   to calculate the frequency of 'tiv_2015' and 'lat/lon' pairs in a 
   single pass. This is significantly more efficient for large insurance 
   datasets (O(N) vs O(N^2)).
2. PostgreSQL Type Casting: In PostgreSQL, the ROUND function requires a 
   'numeric' type. Since investment values are often stored as floats, we cast 
   the sum to '::numeric' to ensure mathematical precision and fulfill the 
   rounding requirement.
3. Business Logic Implementation: The WHERE clause implements the mutually 
   exclusive criteria: 'count_2015 >= 2' (shared value) AND 'loc = 1' 
   (unique location).
*/

WITH metrics AS (
    SELECT
        tiv_2016,
        COUNT(*) OVER(PARTITION BY tiv_2015) AS count_2015,
        COUNT(*) OVER(PARTITION BY lat, lon) AS loc
    FROM insurance
)
SELECT
    ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM metrics
WHERE count_2015 >= 2
  AND loc = 1;
