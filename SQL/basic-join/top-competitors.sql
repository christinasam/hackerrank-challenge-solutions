/*
Julia just finished conducting a coding contest, and she needs your help 
assembling the leaderboard! Write a query to print the respective hacker_id and
name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which
the hacker earned a full score. If more than one hacker received full scores 
in same number of challenges, then sort them by ascending hacker_id.
*/

SELECT h.hacker_id, h.name
FROM hackers AS h
    INNER JOIN submissions AS s 
    ON h.hacker_id = s.hacker_id
    INNER JOIN challenges AS c  
    ON c.challenge_id = s.challenge_id
    INNER JOIN difficulty AS d
    ON d.difficulty_level = c.difficulty_level
WHERE s.score = d.score
GROUP BY s.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(*) DESC, h.hacker_id ASC;


-- We omit the WHERE condition line above and incorporate that condition directly 
-- in the INNER JOIN ON clause. For example: 
-- INNER JOIN difficulty AS d 
-- ON d.difficulty_level = c.difficulty_level AND s.score = d.score

-- The condition d.difficulty_level = c.difficulty_level is not required 
in the WHERE clause since the submissions and difficulty tables are already 
joined by difficulty_level. 
*/

/*
-- ALTERNATIVE SCRIPT: USING SUBQUERY APPROACH
SELECT h.hacker_id, h.name
FROM hackers AS h
INNER JOIN (
    SELECT s.hacker_id, COUNT(s.hacker_id) AS full_score_count 
    FROM submissions AS s
    INNER JOIN challenges AS c
    INNER JOIN difficulty AS d
    ON c.challenge_id = s.challenge_id AND d.difficulty_level = c.difficulty_level
    WHERE s.score = d.score
    GROUP BY s.hacker_id
    ORDER BY COUNT(*) DESC
    ) AS fullscores
ON h.hacker_id = fullscores.hacker_id
WHERE full_score_count > 1
ORDER BY full_score_count DESC, h.hacker_id ASC;
*/

