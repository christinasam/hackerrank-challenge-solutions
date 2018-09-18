/*A median is defined as a number separating the higher half of a data set from the 
lower half. Query the median of the Northern Latitudes (LAT_N) from STATION 
and round your answer to 4 decimal places.*/
         
/*Take the average of the middle two values as the median*/
SELECT ROUND(AVG(t1.lat_n), 4) AS median
FROM (
        /*get a sorted two-column table with one of the columns an index for the sorted rows*/
        SELECT @row_id := @row_id + 1 AS row_id, s.lat_n
        FROM station AS s 
        CROSS JOIN (SELECT @row_id := 0) AS r
        ORDER BY s.lat_n) AS t1
CROSS JOIN (
        /*get a single value for total rows*/
        SELECT COUNT(*) AS total_rows
        FROM station) AS t2
/*find the middle value for an odd number set or average of two middle value for an even set*/
WHERE t1.row_id in (FLOOR((total_rows + 1) / 2), FLOOR ((total_rows + 2) / 2));


-- The sub query 'SELECT @row_id :=0' is the same thing as writing 
-- 'SET @row_id := 0;'outside the query. It initializes the user variable to 0.

-- A CROSS JOIN gives a result set which joined each row in the left table to every row
-- in the right table without any join condition specified. If we restrict 
-- CROSS JOIN with the WHERE clause, join would have become equivalent to 
-- an INNER JOIN (the result set would have excluded all rows that didn't satisfy 
-- the WHERE condition).
-- Useful resource: https://www.benlcollins.com/sql/mysql-averages/






