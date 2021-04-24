USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 3. List the names of students who have taken course v4 (crsCode).

-- Optimization Approach:
	-- Specify primary key and composite keys inside Student and Transcript tables
    -- in order to index table and avoid duplicates (Each primary key must be unique).
    
-- Initial Actual Estimate Time to obtain all rows: 1.352 ms.
-- New Actual Estimate Time: 0.025 ms

EXPLAIN ANALYZE 
SELECT (name)
FROM Student 
WHERE id 
IN
(SELECT studId FROM Transcript WHERE crsCode = @v4);








-- Error Code: 1064. You have an error in your SQL syntax; 
-- check the manual that corresponds to your MySQL server version 
-- for the right syntax to use near 
-- 'INNER JOIN Transcript t 
-- Find proper syntax for JOIN (make sure update should ' at line 5


