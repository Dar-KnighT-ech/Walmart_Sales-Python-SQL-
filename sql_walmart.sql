SELECT * FROM walmart;
--
SELECT COUNT(*) FROM walmart;

SELECT 
	DISTINCT payment_method
from walmart;

SELECT 
	payment_method,
    COUNT(*)
from walmart
GROUP BY payment_method;

SELECT COUNT(DISTINCT Branch) 
FROM walmart;

SELECT MAX(quantity) FROM walmart;
SELECT MIN(quantity) FROM walmart;

-- # Business Problems
-- # Q.1) Find different payment_method and number of trancastion, number of qty sold

SELECT 
	payment_method,
    COUNT(*) as no_payments,
    SUM(quantity) as no_qty_sold
from walmart
GROUP BY payment_method;


-- Q.2)Indentify the highest category in each branch,dispalying the branch, category AVG RATING

WITH t AS (
    SELECT
        branch,
        category,
        AVG(rating) AS avg_rating
    FROM walmart
    GROUP BY branch, category
)
SELECT
    branch,
    category,
    avg_rating,
    RANK() OVER (PARTITION BY branch ORDER BY avg_rating DESC) AS `rank`
FROM t;

-- Q.3) indentify the busiest say for each branch based on the the number of transaction.alter

SELECT *
FROM (
    SELECT
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
        COUNT(*) AS day_count,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS `rank`
    FROM walmart
    GROUP BY branch, day_name
) AS t
WHERE `rank` = 1;

 -- Q.4)  Calculate the total quantity of items sold per payment method. List payment_method and total_quantity.

SELECT 
	payment_method,
   --  COUNT(*) as no_payments,
    SUM(quantity) as no_qty_sold
from walmart
GROUP BY payment_method;

-- Q.5)  Determined the average, minimum and maximum rating of products for each city.
-- List the city, average_rating, min_rating and max_rating.

SELECT
	city,
    category,
    MIN(rating) as min_rating,
    MAX(rating) as max_rating,
    AVG(rating) as avg_rating
FROM walmart
GROUP BY city, category;

-- Q.6) Calculate the total profit for each category by considering total_profit as (unit_price * quantity * profit_margin).
-- List category and total_profit, ordered from highest to lowest profit.

SELECT
    category,
    SUM(total) AS total_revenue,
    SUM(total * profit_margin) AS profit
FROM walmart
GROUP BY category
ORDER BY profit DESC;

-- Q.7) Determine the most common payment method for each Branch. 
-- Display branch and the preferred_payment_method.

WITH cte
AS
(SELECT
	branch,
    payment_method,
    COUNT(*) as total_trans,
    RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS `rank`
FROM walmart
GROUP BY branch, payment_method
)
SELECT *
FROM cte
WHERE `rank` = 1;

-- Q.8) Categorize sales into 3 group MORNING, AFTERNOON, EVENING
-- Find out each of the shift and number of invoices

SELECT 
    branch,
    CASE 
        WHEN HOUR(time) < 12 THEN 'Morning'
        WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS day_time,
    COUNT(*) AS total_count
FROM walmart
GROUP BY branch, day_time
ORDER BY branch, total_count DESC;

-- Q.9) Identify 5 branch with highest decrease ratio in 
-- revenue compare to last year (current year 2023 and last year 2022)

-- rdr==last_rev-cr_rev/ls_rev*100

SELECT *,
YEAR(STR_TO_DATE(date, '%d/%m/%y')) AS formatted_date
FROM walmart;

WITH revenue_2022 AS (
    SELECT
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2023
    GROUP BY branch
)
SELECT
    ls.branch,
    ls.revenue AS last_year_revenue,
    cs.revenue AS current_year_revenue,
    ROUND(
        (ls.revenue - cs.revenue) / ls.revenue * 100,
        2
    ) AS rev_desc_ratio
FROM revenue_2022 AS ls
JOIN revenue_2023 AS cs
    ON ls.branch = cs.branch
WHERE ls.revenue > cs.revenue
ORDER BY rev_desc_ratio DESC
LIMIT 5;
    