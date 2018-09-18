/*
Given the CITY and COUNTRY tables, query the sum of the populations of all 
cities where the CONTINENT is 'Asia'. 
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT SUM(city.population) FROM city 
INNER JOIN country ON city.CountryCode = country.Code
WHERE country.continent = 'Asia'
GROUP BY country.continent
;