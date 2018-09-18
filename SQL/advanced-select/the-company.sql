/*
Given the table schemas below, write a query to print the company_code, 
founder name, total number of lead managers, total number of senior managers,
total number of managers, and total number of employees. Order your output 
by ascending company_code.
*/

SELECT c.company_code, c.founder, 
    COUNT(DISTINCT l.lead_manager_code) AS tot_lead_manager,
    COUNT(DISTINCT s.senior_manager_code) AS tot_senior_manager,
    COUNT(DISTINCT m.manager_code) AS tot_manager,
    COUNT(DISTINCT e.employee_code) AS tot_employee
FROM company AS c
INNER JOIN lead_manager AS l ON c.company_code = l.company_code
INNER JOIN senior_manager AS s ON l.lead_manager_code = s.lead_manager_code
INNER JOIN manager AS m ON s.senior_manager_code = m.senior_manager_code
INNER JOIN employee AS e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY company_code;


