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

-- 1. List the name of the student with id equal to v1 (id).

-- Optimization Approach:
	-- Set id inside Student table to primary key to index (uniquely identify each record and point
    -- to each value for faster lookup time).


-- Initial Actual Est. Time: 0.185 ms
-- New Actual Est. Time w/ Indexing: 0.22 ms 
-- New Actual Est. Time w/ Primary Key: 0.00 ms

EXPLAIN ANALYZE
SELECT name FROM Student WHERE id = @v1;











