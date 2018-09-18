/*
Write a query identifying the type of each record in the TRIANGLES table 
using its three side lengths. Output one of the following statements for 
each record in the table:

    Equilateral: a triangle with sides of equal length.
    Isosceles: a triangle with sides of equal length.
    Scalene: a triangle with sides of differing lengths.
    Not A Triangle: the given values of A, B, and C don't form a triangle.
*/

SELECT CASE
            WHEN a + b <= c OR a + c <= b OR b + c <= a THEN 'Not A Triangle'
            WHEN a = b AND b = c THEN 'Equilateral' 
            WHEN a = b OR a = c OR b = c THEN 'Isosceles'
            ELSE 'Scalene'  
       END AS triangle
FROM triangles;