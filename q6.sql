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

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).

-- Think: We want to remove unnecessary subqueries.

-- Initial Actual Est. Time (NO OUTPUT): 0.210 ms
-- New Actual Est. Time: 0.148 ms

/*
-- Comment out execution plan to see no results shown.
-- EXPLAIN ANALYZE
SELECT name FROM Student, -- Remove unnecessary join/filter.?
	(SELECT studId -- Subquery
	FROM Transcript
		WHERE crsCode IN -- Usage of IN (used to filter on set of values vs. combining multiple tables based on specified field - JOIN.)
		(SELECT crsCode FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching)) -- Another subquery
		GROUP BY studId
		HAVING COUNT(*) = -- Remove This condition because of low performance (has to search through all values to perform COUNT aggregation function).
			(SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))) as alias -- Another subquery
WHERE id = alias.studId; -- Remove
*/

-- Optimization Approach:
	-- Change the usage of JOIN to use WHERE clause and IN operator/filter.
    -- We mainly need the names from Students table and use crsCode to filter values inside the Course 
    -- table w/ deptId = @v8.

-- New Query:
EXPLAIN ANALYZE
SELECT name FROM Student
WHERE id IN (SELECT studId FROM Transcript
WHERE crsCode IN ( SELECT crsCode FROM Course WHERE deptId = @v8));

-- Also, I basically removed any unnecessary subqueries to optimize for code readability as well as
-- time efficiency.


