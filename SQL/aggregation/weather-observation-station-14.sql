/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION
that is less than 137.2345 . Truncate your answer to 4 decimal places.
*/

-- Using LIMIT 
SELECT ROUND(lat_n, 4)
FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;

/*
-- Using MAX function
SELECT MAX(ROUND(lat_n, 4))
FROM station
WHERE lat_n < 137.2345;
*/