/*
You are given a table, BST, containing two columns: N and P, where N represents
the value of a node in Binary Tree, and P is the parent of N. 

Write a query to find the node type of Binary Tree ordered by the value of the node. Output
one of the following for each node:
    Root: if node is root node.
    Leaf: if node is leaf node.
    Inner: if node is neither root nor leaf node.
*/

SELECT n, CASE
            WHEN p IS NULL THEN 'Root'
            WHEN n IN (SELECT DISTINCT p FROM bst) THEN 'Inner' 
            ELSE 'Leaf'
          END AS node_type
FROM bst
ORDER BY n;

-- Alternative: using WHERE EXISTS clause
/*
SELECT nd.n, CASE
                WHEN nd.p IS NULL THEN 'Root'
                WHEN EXISTS (
                    SELECT DISTINCT pt.p 
                    FROM bst AS pt 
                    WHERE pt.p=nd.n
                    ) THEN 'Inner' 
                ELSE 'Leaf'
             END AS node_type
FROM bst AS nd
ORDER BY nd.n;
*/


-- An EXISTS statement performs better on the same sub-query than an IN statement
-- for large a data set as it returns the result as soon as the first value exists 
-- in the list. Source: http://www.gregreda.com/2013/06/03/join-vs-exists-vs-in/
