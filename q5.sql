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

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.

-- Optimization Approach:
	-- Try to change subquery to JOIN (Did not use).
    -- Or, try to use WHERE and IN to remove duplicate records.
    -- Using the "id" column matching "studId" of specified criteria vs. using inside the WHERE clause.

-- Initial Actual Est. Time: 15.060 ms
-- New Actual Est. Time: 1.288 ms

/*
-- Comment out Execution Plan:

-- This is a correlated subquery, where subquery is treated as table using alias.
-- Natural join is being used. No JOIN command, but it is implicit (INNER JOIN). 

EXPLAIN ANALYZE
SELECT * FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode -- Subquery
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias -- Subquery
WHERE Student.id = alias.studId;
*/

-- New Query:
EXPLAIN ANALYZE
SELECT name FROM Student
WHERE id IN 
(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode));








