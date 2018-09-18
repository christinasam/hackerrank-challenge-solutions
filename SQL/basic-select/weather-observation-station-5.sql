/*Query the two cities in STATION with the shortest and longest CITY names, as well
as their respective lengths (i.e.: number of characters in the name). If there is
more than one smallest or largest city, choose the one that comes first when 
ordered alphabetically.*/

SELECT city, LENGTH(city) FROM station
WHERE city = (SELECT city FROM station ORDER BY LENGTH(city), city LIMIT 1)
    OR city = (SELECT city FROM station ORDER BY LENGTH(city) DESC LIMIT 1);