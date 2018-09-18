/*
Julia asked her students to create some coding challenges. Write a query 
to print the hacker_id, name, and the total number of challenges created 
each student. Sort your results by the total number of challenges
in descending order. 

If more than one student created the same number of challenges, then 
the result by hacker_id. If more than one student created the same 
number of challenges and the count is less than the maximum number of 
challenges created, then exclude those students from the result.
*/

SELECT h.hacker_id, h.name, COUNT(*) AS challenges_created
FROM hackers AS h
INNER JOIN challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING challenges_created = (
                /*Get the maximum number */
                SELECT COUNT(*)
                FROM challenges
                GROUP BY hacker_id
                ORDER BY COUNT(*) DESC
                LIMIT 1) 
        OR 
        challenges_created in (
                /*Get all the hackers with less than the max number of challenges
                and who don't have the same number with anyone else*/
                SELECT challenges_created
                FROM (SELECT hacker_id, count(*) AS challenges_created
                      FROM challenges
                      GROUP BY hacker_id
                      ORDER BY count(*) DESC) AS counts
                /*In the case where there is only one hacker with the most 
                challenges created, filter out that hacker from this list 
                to avoid double counting */
                WHERE challenges_created != (
                        /*Get the maximum number */
                        SELECT count(*)
                        FROM challenges
                        GROUP BY hacker_id
                        ORDER BY count(*) DESC
                        LIMIT 1)
                GROUP BY challenges_created
                HAVING count(*) = 1)                                                   
ORDER BY challenges_created DESC, h.hacker_id



