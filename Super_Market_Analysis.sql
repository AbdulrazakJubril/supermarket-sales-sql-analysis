/*
===============================================================================
SUPERMARKET SALES ANALYSIS 
===============================================================================
Scope:
The dataset comprises detailed transactional records, including product categories, branch locations, 
payment methods, customer demographics, timestamps, and satisfaction ratings. 
Insights were generated across the following thematic areas:

•	Sales Performance
•	Customer Behavior
•	Branch and Location Analysis
•	Product Line Performance
•	Time-Based Sales Trends
•	Payment Preferences and Transaction Patterns
•	Operational Efficiency Metrics
•	Customer Satisfaction and Experience


SQL Functions Used:
    - Aggregate Functions: SUM(), AVG(), COUNT()
	- Date Functions: FORMAT(),
===============================================================================
*/
--========================================================================================================

--A: SALES PERFORMANCE ANALYSIS
-- Insight 1: Product Line with Highest Total Sales and Gross Income 
-- Purpose: Identify which product category generated the most revenue and profit 

SELECT TOP 1 -- Return the top product line only 
	product_line, -- Product category 
	SUM(total) AS total_sales, -- Total sales amount per category 
	SUM(gross_income) AS total_gross_income -- Total profit per category 
FROM supermarket_sales 
GROUP BY product_line -- Group by each product line 
ORDER BY total_sales DESC -- Sort by highest; 

-- Insight 2: Average Sales and Profit Per Transaction 
-- Purpose: Understand average revenue and profit generated per transaction 
SELECT 
	ROUND(AVG(total), 2) AS avg_sales, -- Average transaction total 
	ROUND(AVG(gross_income), 2) AS avg_profit -- Average transaction profit 
FROM supermarket_sales; 

--========================================================================================================

--B: CUSTOMER BEHAVIOR
-- Insight 3: Average Spend by Customer Type 
-- Purpose: Compare average transaction amounts between Members and Normal customers 
SELECT 
	customer_type, -- Member or Normal 
	ROUND(AVG(total), 2) AS avg_transaction -- Average spending per transaction
FROM supermarket_sales
GROUP BY customer_type; 
	
-- Insight 4: Gender-Based Analysis
-- Purpose: Determine which gender spends more and buys more items on average 
SELECT TOP 1 
	gender, -- Male or Female 
	ROUND(AVG(total), 2) AS avg_transaction, -- Average total per transaction 
	ROUND(AVG(quantity), 2) AS avg_quantity -- Average quantity purchased 
FROM supermarket_sales 
GROUP BY gender
ORDER BY avg_transaction DESC, avg_quantity DESC; 

--========================================================================================================

--C: BRANCH AND LOCATION ANALYSIS
-- Insight 5: Highest Revenue and Profit by Branch 
-- Purpose: Find the best-performing branch in terms of total revenue and gross income 

SELECT TOP 1 
	branch, -- Branch A, B, or C 
	SUM(total) AS total_revenue, -- Total revenue per branch 
	SUM(gross_income) AS total_profit -- Total profit per branch 
FROM supermarket_sales 
GROUP BY branch 
ORDER BY total_revenue DESC; 

-- Insight 6: Customer Satisfaction by Branch and City 
-- Purpose: Evaluate average customer rating per branch and city 
SELECT 
	branch, 
	city, -- City where the branch is located 
	ROUND(AVG(rating), 2) AS avg_rating -- Average customer satisfaction score 
FROM supermarket_sales 
GROUP BY branch, city 
ORDER BY avg_rating DESC;

--========================================================================================================

--D: Product Analysis
-- Insight 7: Top 3 Product Lines by Quantity and Revenue 
-- Purpose: Identify the most popular and high-earning product categories 

SELECT TOP 3 
	product_line, 
	SUM(quantity) AS total_quantity, -- Total units sold 
	SUM(total) AS total_revenue -- Total revenue generated 
FROM supermarket_sales 
GROUP BY product_line 
ORDER BY total_quantity DESC, total_revenue DESC; 

-- Insight 8: Product Lines with Highest Avg Profit and Rating 
-- Purpose: See which product categories perform best in profit margin and customer satisfaction 

SELECT TOP 1
	product_line, 
	ROUND(AVG(gross_income), 2) AS avg_profit, -- Average profit per transaction 
	ROUND(AVG(rating), 2) AS avg_rating -- Average customer satisfaction
FROM supermarket_sales 
GROUP BY product_line 
ORDER BY avg_profit DESC; 

--========================================================================================================

--E: TIME BASED TRENDS	
-- Insight 9: Peak Sales Days and Times 
-- Purpose: Discover the busiest days and times for sales volume 
SELECT 
	FORMAT(date, 'dddd') AS day_of_week, -- Extract weekday name from date 
	COUNT(*) AS transaction_count,-- Count number of transactions per day 
	SUM(total) AS total_sales -- Total sales across days of the week
FROM supermarket_sales 
GROUP BY FORMAT(date, 'dddd') 
ORDER BY transaction_count DESC; 

-- Hourly trend    
SELECT 
	FORMAT(time,'hh') AS hour_of_day,          
	COUNT(*) AS transaction_count,          
	SUM(total) AS total_sales   
FROM supermarket_sales   
GROUP BY FORMAT(time,'hh')  
ORDER BY total_sales DESC;

-- Insight 10: Peak Hours by Branch 
-- Purpose: Determine when each branch experiences the highest sales 
SELECT 
	branch, 
	FORMAT(time,'hh') AS hour_of_day, -- Extract hour from time 
	SUM(total) AS total_sales -- Sum of sales during that hour 
	FROM supermarket_sales 
GROUP BY branch, FORMAT(time,'hh')
ORDER BY total_sales DESC; 

--========================================================================================================

--F: PAYMENT AND TRANSACTION INSIGHTS
-- Insight 11: Most Used Payment Method and Its Correlation 
-- Purpose: Identify preferred payment method and analyze sales distribution 
SELECT TOP 1 
	payment, 
	COUNT(*) AS usage_count, -- Count of transactions using this payment method 
	ROUND(AVG(total), 2) AS avg_transaction, -- Average transaction value 
	COUNT(DISTINCT customer_type) AS customer_type_count -- Customer diversity 
FROM supermarket_sales 
GROUP BY payment 
ORDER BY usage_count DESC; 
	
-- Insight 12: Average Transaction by Payment Method per Branch 
-- Purpose: Analyze how payment methods perform across different branches 
SELECT 
	branch, 
	payment, 
	ROUND(AVG(total), 2) AS avg_transaction -- Average sale amount 
FROM supermarket_sales 
GROUP BY branch, payment 
ORDER BY branch; 

--========================================================================================================

--G: OPERATIONAL INSIGHTS
-- Insight 13: Average Quantity per Product Line 
-- Purpose: Understand purchase volume by product category 
SELECT 
	product_line, 
	ROUND(AVG(quantity), 2) AS avg_quantity -- Average items bought per transaction 
FROM supermarket_sales 
GROUP BY product_line
ORDER BY avg_quantity; 

-- Insight 14: Profit Variation by Day of Week 
-- Purpose: See which days generate the highest profit 

SELECT 
	FORMAT(date, 'dddd') AS day_of_week, 
	ROUND(AVG(gross_income), 2) AS avg_profit -- Average profit per day 
FROM supermarket_sales 
GROUP BY FORMAT(date,'dddd')
ORDER BY avg_profit DESC; 

--========================================================================================================

