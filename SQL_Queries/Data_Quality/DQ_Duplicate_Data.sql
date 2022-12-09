-- Checking for the data quality issue of duplicate data

-- USERS TABLE
-- Checking for duplicates in users table
select id, count(*) as Occurrences
from users
-- grouping the data by id of the users
group by id
-- setting the conditions 

having count(*) > 1 
-- order the results using Occurrences
order by Occurrences desc

-- BRANDS TABLE
-- Checking for duplicate data in brands table
select brandCode,count(id) as Occurrences
from brands
-- grouping the data by brandCode
group by brandCode
-- setting the conditions 
having count(id) > 1 and brandCode is not null
-- order the results using Occurrences
order by Occurrences desc
