Retail Sales Analysis Project
Dataset :
Objectives

- Database Setup: Create and populate a retail sales database with the provided sales data.
- Data Cleaning: Identify and remove records with missing or null values.
- Exploratory Data Analysis (EDA): Perform basic analysis to understand the dataset.
- Business Analysis: Answer business-relevant questions and derive insights from the sales data.

---

1. Database Setup
   - Database Creation: Create a database named `sql_project`.
   - Table Creation: Set up a `retail_sales` table to store the sales data with columns including:
     - `transaction_id`
     - `sale_date`
     - `sale_time`
     - `customer_id`
     - `gender`
     - `age`
     - `product_category`
     - `quantity_sold`
     - `price_per_unit`
     - `cost_of_goods_sold (COGS)`
     - `total_sale_amount`

2. Data Exploration & Cleaning
   - Record Count: Calculate the total number of records in the dataset.
   - Customer Count: Identify unique customer count within the dataset.
   - Category Count: List all unique product categories.
   - Null Value Check: Check for null values and delete any records containing missing data.

3. Findings
   - Customer Demographics: Diverse age groups of customers, with sales across categories like Clothing and Beauty.
   - High-Value Transactions: Identification of transactions with a total sale amount over 1000, suggesting premium purchases.
   - Sales Trends: Monthly analysis reveals sales variations, highlighting peak seasons.
   - Customer Insights: Pinpoint top-spending customers and popular product categories.
     
4. Reports
   - Sales Summary: Detailed report of total sales, customer demographics, and category performance.
   - Trend Analysis: Monthly sales trends and shifts.
   - Customer Insights: Reports on top customers and unique customer counts per category.
     
Conclusion

This SQL project provides a comprehensive introduction to retail sales data analysis, covering database setup, data cleaning, EDA, and business-focused SQL querying. The insights gained can drive business decisions by revealing patterns in sales, customer preferences, and product performance. 
