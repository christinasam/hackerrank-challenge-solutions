/*Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
Your result cannot contain duplicates.*/

SELECT DISTINCT city FROM station
WHERE city REGEXP ".*[aeiou]$";


-- Pattern . matches single character
-- Pattern * matches zero or more instances of preceding element
-- Pattern [...] matches any character listed between the square brackets
-- Pattern $ matches end of string
-- Useful resource: https://www.tutorialspoint.com/mysql/mysql-regexps.htm