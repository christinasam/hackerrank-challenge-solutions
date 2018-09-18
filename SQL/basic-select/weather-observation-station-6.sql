/*Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) 
from STATION. Your result cannot contain duplicates.*/

SELECT DISTINCT city FROM station
WHERE city REGEXP "^[aeiou]"; 


-- Since RLIKE is synonymous to REGEXP, we could also write: 
-- RLIKE "^[aeiou]" or RLIKE "^[aeiou].*". 
-- The construct ".*" is optional.

-- Pattern ^ matches begining of string
-- Pattern [...] matches any character listed between the square brackets
-- Pattern . matches single character
-- Pattern * matches zero or more instances of preceding element
-- Useful resource: https://www.tutorialspoint.com/mysql/mysql-regexps.htm


