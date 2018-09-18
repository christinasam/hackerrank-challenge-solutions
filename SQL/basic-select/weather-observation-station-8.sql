/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
as both their first and last characters. Your result cannot contain duplicates.*/

SELECT DISTINCT city FROM station
WHERE city REGEXP "^[aeiou].*[aeiou]$";


-- Pattern ^ matches begining of string
-- Pattern [...] matches any character listed between the square brackets
-- Pattern . matches single character
-- Pattern * matches zero or more instances of preceding element
-- Pattern $ matches end of string
-- Useful resource: https://www.tutorialspoint.com/mysql/mysql-regexps.htm