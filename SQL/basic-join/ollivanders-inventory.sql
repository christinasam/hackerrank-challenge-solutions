/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing 
Charlie's old broken wand. Hermione decides the best way to choose is by 
determining the minimum number of gold galleons needed to buy each non-evil 
wand of high power and age. Write a query to print the id, age, coins_needed,
and power of the wands that Ron's interested in, sorted in order of 
descending power. If more than one wand has same power, sort the result 
in order of descending age.
*/

SELECT w.id, p.age, w.coins_needed, w.power
FROM wands AS w
INNER JOIN wands_property AS p 
ON w.code=p.code
WHERE p.is_evil=0 AND w.coins_needed=(
                            /*select the cheapest wands for a given combination
                            of power and age*/
                            SELECT MIN(coins_needed)
                            FROM wands AS w1
                            INNER JOIN wands_property AS p1 
                            ON w1.code=p1.code
                            WHERE w1.power=w.power AND p1.age=p.age)
ORDER BY w.power DESC, p.age DESC;