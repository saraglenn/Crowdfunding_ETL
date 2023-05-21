-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id, COUNT(campaign.backers_count) AS num_backers
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY num_backers DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT cf_id, COUNT(*) AS num_backers
FROM backers
GROUP BY cf_id
ORDER BY num_backers DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

CREATE TABLE email_contacts_remaining_goal_amount AS
SELECT c.first_name, c.last_name, c.email, (cd.goal - cd.pledged) AS "Remaining Goal Amount"
FROM contacts AS c
JOIN campaign AS cd ON cd.cf_id = cd.cf_id
WHERE cd.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;

SELECT * FROM email_contacts_remaining_goal_amount;

-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

CREATE TABLE email_backers_remaining_goal_amount AS
SELECT b.email, c.first_name, c.last_name, b.cf_id, b.company_name, b.description, b.end_date, (b.goal - b.pledged) AS "Left of Goal"
FROM backers AS b
JOIN contacts AS c ON b.backer_id = c.contact_id;

-- Check the table
