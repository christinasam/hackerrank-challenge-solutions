/*
Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS, 
immediately followed by the first letter of each profession as a parenthetical 
(i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), 
AProfessorName(P), and ASingerName(S). 

2. Query the number of ocurrences of each occupation in OCCUPATIONS. 
Sort the occurrences in ascending order, and output them in the following
format:  There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in 
OCCUPATIONS and [occupation] is the lowercase occupation name. 
If more than one Occupation has the same [occupation_count], they should
be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
*/

SELECT 
    CASE
        WHEN o.occupation = 'Actor' THEN CONCAT(o.name, '(A)')
        WHEN o.occupation = 'Doctor' THEN CONCAT(o.name, '(D)')
        WHEN o.occupation = 'Professor' THEN CONCAT(o.name, '(P)')
        WHEN o.occupation = 'Singer' THEN CONCAT(o.name, '(S)')
    END AS name_occupation
FROM occupations AS o
INNER JOIN (
    SELECT occupation, COUNT(*) AS cnt
    FROM occupations
    GROUP BY occupation
    ) AS c
ON o.occupation = c.occupation
ORDER BY o.name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;


