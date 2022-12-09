-- Checking for the data quality issue of missing data

-- BRANDS TABLE
-- listing the entire brands table data
select * 
from brands		

-- calculating the percentage of missing data in brands table
SELECT CAST(SUM (CASE WHEN brandCode is NULL THEN 1 ELSE 0 END)as float) / COUNT(*) AS ProportionMissing
FROM brands

-- CATEGORIES TABLE
-- listing the categories table data
select * 
from categories

-- calculating the percentage of missing data in categories table
SELECT CAST(SUM (CASE WHEN categoryCode is NULL THEN 1 ELSE 0 END)as float) / COUNT(*) AS ProportionMissing
FROM categories