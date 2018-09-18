/*Query the list of CITY names from STATION that do not start with vowels and 
do not end with vowels. Your result cannot contain duplicates.*/

SELECT DISTINCT city FROM station
WHERE city NOT REGEXP "^[aeiou]" AND city NOT REGEXP ".*[aeiou]$";


-- Pattern ^ matches begining of string
-- Pattern [...] matches any character listed between the square brackets
-- Pattern . matches single character
-- Pattern * matches zero or more instances of preceding element
-- Pattern $ matches end of string
-- Useful resource: https://www.tutorialspoint.com/mysql/mysql-regexps.htm