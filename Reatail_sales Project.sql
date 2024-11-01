-- SQL Retail Sales Analysis - P1
CREATE DATABASE sql_project;


-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

SELECT * FROM retail_sales
LIMIT 10;


    

SELECT 
    COUNT(*) 
FROM retail_sales;

-- Data Cleaning

SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
    
-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales;

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;



SELECT DISTINCT category FROM retail_sales;




/* DATA ANALYSIS AND BUSINESS KEY PROBLEMS AND ANSWERS*/
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05' and identify how many distinct customers are there?

SELECT * FROM retail_sales WHERE sale_date='2022-11-05';

SELECT COUNT(DISTINCT(customer_id)) FROM retail_sales WHERE sale_date='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT 
  *
FROM retail_sales
WHERE 
    CATEGORY = 'Clothing'
    AND 
    DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
    AND
    quantiy >=4;
    
   -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 SELECT CATEGORY ,SUM(total_sale) AS Total_sales FROM retail_sales group by CATEGORY;
 
 -- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
 SELECT age FROM retail_sales where CATEGORY='Beauty';
 SELECT AVG(age) AS AVERAGE_AGE FROM retail_sales WHERE CATEGORY='Beauty';
 
 -- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
 SELECT * FROM retail_sales WHERE total_sale > 1000;
 
 -- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
 SELECT category,gender,COUNT(transactions_id) as total_transactions  FROM retail_sales GROUP BY gender,category;
 
 -- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- average sale for each month
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale FROM retail_sales
    GROUP BY year,month order by year,avg_sale desc ;

-- best selling month in each year
SELECT year,month,avg_sale FROM 
(
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS month_rank
        FROM retail_sales
    GROUP BY year,month) AS t1 WHERE month_rank=1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as unique_cs
FROM retail_sales
GROUP BY category;

 -- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;

 
 
 