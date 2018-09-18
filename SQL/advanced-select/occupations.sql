/* 
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted 
alphabetically and displayed underneath its corresponding Occupation. The output
column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.
*/

-- USING USER VARIABLES

/*initialize the rank counter*/
set @drow=0, 
    @prow=0,
    @srow=0, 
    @arow=0;

SELECT MIN(doctor), MIN(professor), MIN(singer), MIN(actor)
 FROM (
    SELECT
        /*Create a row indexing columun using rank counters. NOTE: ":=" means "assignment" */ 
        CASE
            WHEN occupation = "Doctor" THEN (@drow := @drow + 1) 
            WHEN occupation = "Professor" THEN (@prow := @prow + 1)
            WHEN occupation = "Singer" THEN (@srow := @srow + 1)
            WHEN occupation = "Actor" THEN (@arow := @arow + 1)
            END AS rowrank,
        occupation, 
        name,
        /*Create extended columns and fill the columns with name or null value.*/        
        (CASE WHEN occupation = "Doctor" THEN name  ELSE NULL END) AS doctor,
        (CASE WHEN occupation = "Professor" THEN name  ELSE NULL END) AS professor,
        (CASE WHEN occupation = "Singer" THEN name  ELSE NULL END) AS singer,
        (CASE WHEN occupation = "Actor" THEN name  ELSE NULL END) AS actor
        /*NOTE: The ELSE IS NULL is not required since CASE automatically returns
        NULL by default. If returning 0 is desired, then we should write ELSE 0. */    
    FROM occupations
    ORDER BY name
    ) AS occupations_pivoted
GROUP BY rowrank;


-- USING SELF-JOIN 

/*
SELECT MIN(doctor), MIN(professor), MIN(singer), MIN(actor)
FROM (
    SELECT COUNT(*) AS row_rank,    -- create a row-index columun
        a.occupation,
        a.name, 
        /*create extended columns and fill the columns with a name or a null value*/    
        (CASE WHEN a.occupation = "Doctor" THEN a.name ELSE null END) AS doctor,
        (CASE WHEN a.occupation = "Professor" THEN a.name ELSE null END) AS professor,
        (CASE WHEN a.occupation = "Singer" THEN a.name ELSE null END) AS singer,
        (CASE WHEN a.occupation = "Actor" THEN a.name ELSE null END) AS actor
        /*Note that the ELSE NULL is not required in these CASE statements since
        CASE returns NULL by default. If returning 0 is desired, then write ELSE 0.*/  
    FROM occupations AS a
        INNER JOIN occupations AS b 
        ON a.occupation = b.occupation AND a.name >= b.name
        GROUP BY a.occupation, a.name
    ) AS occupations_pivoted
GROUP BY row_rank;
*/
  

-- For ON a.occupation = b.occupation AND a.name >= b.name, think of 
-- the AND clause above as a WHERE clause before the tables are joined. It filters 
-- for only those rows where a.name is at an equal or greater ranking position 
-- than b.name. This is the key to building a row index for pivoting values*/

-- For MIN(doctor), MIN(professor), MIN(singer), MIN(actor), since there is 
-- only one non-null value in each column of the grouped rowrank number, we can use
-- either MIN() or MAX() to get the first non-null value from the 
-- occupations_privoted table after a GROUP BY.*/



