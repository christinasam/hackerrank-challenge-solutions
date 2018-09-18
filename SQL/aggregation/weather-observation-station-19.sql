/*
Consider P1(a,b) and P2(c,d)  to be two points on a 2D plane where (a,b) are 
the respective minimum and maximum values of Northern Latitude (LAT_N) and
(c,d) are the respective minimum and maximum values of 
Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1  and P2  and format your 
answer to display 4 decimal digits.
*/

SELECT ROUND(SQRT(POWER(MAX(lat_n)-MIN(lat_n), 2) + 
       POWER(MAX(long_w)-MIN(long_w), 2)), 4)
FROM station;

/*
NOTES:
Euclidean Distance: In the Euclidean plane, if p = (p1, p2) and q = (q1, q2) 
then the distance is given by square root( sqaure (q2-p2) + square (q1-p1)).

Trick to this problem:
-- Euclidean distance: p =(p1, p2) and q=(q1, q2) are points with x,y 
coordinates respectively. Distance is given by square root( sqaure (q2-p2) + 
square (q1-p1))
-- In this problem, P1=(a,b)=(lat_n min, lat_n max) and 
P2=(c,d)=(long_w min, long_w max). Note P1 and P2 not x,y coordinate pairs.
-- If we let lat_n be on the x-axis and long_w be on the y-axis, then the
two point coordinates are p=(min long_w, min lat_n) and 
q=(max long_w, max lat_n).
*/