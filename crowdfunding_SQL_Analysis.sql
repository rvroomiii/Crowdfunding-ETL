-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve 
SELECT (backers_count) AS "backer_counts", cf_id
FROM campaign
WHERE outcome=('live')
GROUP BY cf_id
ORDER BY cf_id DESC

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT (c.backers_count) As "backer_counts", b.cf_id
FROM backers as b
	JOIN campaign as c
	ON (b.cf_id = c.cf_id)
WHERE (c.outcome='live')
GROUP BY c.backers_count, c.cf_id, b.cf_id
ORDER BY b.cf_id DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT DISTINCT ca.first_name, ca.last_name, ca.email, c.goal - c.pledged AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM backers AS b
	JOIN campaign as c
	ON (b.cf_id = c.cf_id)
	JOIN contacts as ca
	ON (c.contact_id = ca.contact_id)
	WHERE (c.outcome='live')
ORDER BY "Remaining Goal Amount" DESC 
-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT DISTINCT ca.email, ca.first_name, ca.last_name, c.cf_id, c.company_name, c.description, c.end_date,c.outcome, c.goal - c.pledged AS "Left Of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign AS c
	join backers as b
	on c.cf_id = b.cf_id
	join contacts as ca
	ON c.contact_id = ca.contact_id
 	WHERE (c.outcome='live')
ORDER BY ca.email DESC 

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount


