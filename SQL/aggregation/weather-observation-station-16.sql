/*
Query the smallest Northern Latitude (LAT_N) from STATION that is
greater than 38.7780. Round your answer to decimal 4 places.
*/

-- Using Limit 
SELECT ROUND(lat_n, 4)
FROM station
WHERE lat_n > 38.7780
ORDER BY lat_n
LIMIT 1;

/*
-- Using min function
SELECT MIN(ROUND(lat_n, 4))
FROM station
WHERE lat_n > 38.7780;
*/