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

-- 4. List the names of students who have taken a course taught by professor v5 (name).

-- Approach:
	-- Include primary and composite key to index and remove data redundancy.
	-- Use CTE vs. nested joins to optimize query performance.
    -- We don't need the arguments for alias2. Only Student, Professor and any bridge tables.
		-- crsCode can be used inside WHERE clause to filter for Professor w/ Professor.name = @v5.

-- Initial Actual Est. Time: 0.733 ms
-- New Actual Est. Time: 0.252 ms

/* 
-- Old query:
EXPLAIN ANALYZE
SELECT name FROM Student,
	(SELECT studId FROM Transcript, -- subquery
		(SELECT crsCode, semester FROM Professor -- subquery
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
WHERE Student.id = alias2.studId;
*/


-- New query:
-- 4 Main tables: Student, Professor, Transcript and Teaching.
-- Note columns to join on: studId, crsCode, profId

EXPLAIN ANALYZE
WITH cte AS (
SELECT studId FROM Transcript
WHERE crsCode IN (SELECT crsCode FROM Professor
					JOIN Teaching
                    WHERE Professor.name = @v5 AND Professor.id = Teaching.profId))
SELECT name FROM Student s
JOIN cte ON cte.studId = s.id;
    
    
    
    
    
    
    


