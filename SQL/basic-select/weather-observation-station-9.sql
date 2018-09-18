/*Query the list of CITY names from STATION that do not start with vowels. 
Your result cannot contain duplicates.*/

SELECT DISTINCT city FROM station
WHERE city NOT REGEXP "^[aeiou]";


-- Pattern ^ matches begining of string
-- Pattern [...] matches any character listed between the square brackets
-- Useful resource: https://www.tutorialspoint.com/mysql/mysql-regexps.htm