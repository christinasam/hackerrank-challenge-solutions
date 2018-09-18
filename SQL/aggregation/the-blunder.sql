/*
Samantha was tasked with calculating the average monthly salaries for all 
employees in the EMPLOYEES table, but did not realize her keyboard's 
key was broken until after completing the calculation. She wants your 
help finding the difference between her miscalculation (using salaries with
any zeroes removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries)
and round it up to the next integer.
*/

SELECT CEILING(AVG((salary) - REPLACE(salary,'0','')))
FROM employees;


-- Alternative
/*
SELECT CEILING(AVG(salary) - AVG(REPLACE(salary,'0','')))
FROM employees;
*/


-- REPLACE() converts the numeric salary to a string. 
-- AVG() converts the REPLACE() back to numeric. Numeric subtract numeric 
-- is numeric, thus there i no need to apply a CAST() function here to get 
-- salary back to a numeric data type.

-- Type conversion in expression evaluation: When an operator is used with 
-- operands of different types, type conversion occurs to make the operands 
-- compatible. 
-- Some conversions occur implicitly. For example, MySQL automatically converts 
-- numbers to strings as necessary, and vice versa. It is also possible to 
-- convert a number to a string explicitly using the CAST() function. 
-- Conversion occurs implicitly with the CONCAT() function because it expects 
-- string arguments.
-- Useful resource: https://dev.mysql.com/doc/refman/8.0/en/type-conversion.html
