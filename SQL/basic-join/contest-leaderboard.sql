/*
You did such a great job helping Julia with her last coding contest challenge 
that she wants you to work on this one, too! The total score of a hacker is 
the sum of their maximum scores for all of the challenges. Write a query 
to print the hacker_id, name, and total score of the hackers ordered by 
the descending score. If more than one hacker achieved the same total score, 
then sort the result by ascending hacker_id. Exclude all hackers with 
a total score of 0 from your result.
*/

SELECT h.hacker_id, h.name, SUM(mxscore) AS total_score
FROM hackers AS h
INNER JOIN ( 
        /*get the maximum score of each challenge by hacker*/
        SELECT hacker_id, challenge_id, max(score) AS mxscore 
        FROM submissions
        GROUP BY hacker_id, challenge_id) AS scores
ON h.hacker_id = scores.hacker_id
GROUP BY h.hacker_id, h.name
/*filter for only those hackers with a total score greater than zero*/
HAVING sum(mxscore) > 0
ORDER BY total_score DESC, h.hacker_id ASC;