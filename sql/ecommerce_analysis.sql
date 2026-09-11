CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
CREATE TABLE ecommerce_cleaned_data(
    Invoice VARCHAR(30),
    StockCode VARCHAR(30),
    Description VARCHAR(300),
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10,2),
    Customer_ID INT NULL,
    Country VARCHAR(100),
    Revenue DECIMAL(12,2)
);
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'F:/MysqlData/Ecommerce_Cleaned_Data.csv'
INTO TABLE ecommerce_cleaned_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    Invoice,
    StockCode,
    Description,
    Quantity,
    Price,
    Customer_ID,
    Country,
    Revenue,
    @InvoiceDate
)
SET InvoiceDate = STR_TO_DATE(@InvoiceDate, '%Y-%m-%d %H:%i:%s');

-- 1 Data Validation
-- Row count validation
SELECT COUNT(*) FROM ecommerce_cleaned_data;

-- NULL values Checks
SELECT SUM(Invoice IS NULL) AS null_invoice,
SUM(StockCode IS NULL) AS null_stockcode,
SUM(Description IS NULL) AS null_description,
SUM(Quantity IS NULL) AS null_quantity,
SUM(InvoiceDate IS NULL) AS null_invoice_date,
SUM(Price IS NULL) AS null_price,
SUM(Customer_ID IS NULL) AS null_customer,
SUM(Country IS NULL) AS null_country,
SUM(Revenue IS NULL) AS null_revenue
FROM ecommerce_cleaned_data;

-- Rows with Any Missing Values
SELECT * FROM ecommerce_cleaned_data
WHERE Invoice IS NULL OR Invoice=''
OR StockCode IS NULL OR StockCode=''
OR Description IS NULL OR Description=''
OR Quantity IS NULL OR Price IS NULL
OR Customer_ID IS NULL OR Country IS NULL
OR Country='' OR InvoiceDate IS NULL OR
Revenue IS NULL;

-- Duplicate records Check (No Exact Duplicate Records)
SELECT Invoice,StockCode,Description,Quantity,InvoiceDate,
Price,Customer_ID,Country,Revenue,COUNT(*) AS counting
FROM ecommerce_cleaned_data 
GROUP BY Invoice,StockCode,Description,Quantity,InvoiceDate, 
Price,Customer_ID,Country,Revenue 
HAVING COUNT(*)>1;
-- Duplicate Invoice and Stockcode( when the same product is 
-- listed multiple times in the same invoice)(Yes Present)
SELECT Invoice,StockCode,COUNT(*) AS dup_count
FROM ecommerce_cleaned_data
GROUP BY Invoice,StockCode
HAVING COUNT(*) >1
ORDER BY dup_count DESC;

-- Duplicate Customers with Same Invoice(Yes Present)
SELECT Invoice,StockCode,COUNT(*) AS dup_count
FROM ecommerce_cleaned_data
GROUP BY Invoice,StockCode
HAVING COUNT(*)> 1
ORDER BY dup_count DESC;

-- Data Type & Range Validation
-- Quantity validation(No data return)
SELECT Invoice, StockCode, Quantity
FROM ecommerce_cleaned_data
WHERE Quantity IS NULL OR Quantity <= 0;
-- Price validation(Nothing Return)
SELECT * FROM ecommerce_cleaned_data
WHERE Price IS NULL OR Price < 0;
-- Revenue validation(Nothing Return)
SELECT Invoice,StockCode,Quantity,Price,Revenue,
(Quantity*Price) AS expected_revenue
FROM ecommerce_cleaned_data
WHERE Revenue !=(Quantity * Price);
-- Customer_ID (INT)(Nothing Return)
SELECT Customer_ID FROM ecommerce_cleaned_data
WHERE Customer_ID IS NULL OR
Customer_ID REGEXP '[^0-9]';
-- Country (VARCHAR) (Nothing Return) 
SELECT Country 
FROM ecommerce_cleaned_data
WHERE Country REGEXP '[0-9!@#$%^&*?()]';
-- StockCode Validate(BANK CHARGES Return)
SELECT StockCode
FROM ecommerce_cleaned_data
WHERE StockCode REGEXP'[^A-Za-z0-9]';
-- Invoice (INT)(Nothing return)
SELECT Invoice FROM ecommerce_cleaned_data
WHERE Invoice REGEXP '[^0-9]';
-- Invoice Date Checks(Return Zero)
WITH date_bounds AS(
SELECT MIN(InvoiceDate) AS min_date,
MAX(InvoiceDate) AS max_date
FROM ecommerce_cleaned_data
)
SELECT COUNT(*) AS invalid_dates
FROM ecommerce_cleaned_data, date_bounds
WHERE InvoiceDate IS NULL
OR InvoiceDate<min_date
OR InvoiceDate>max_date;
-- Cancelled Invoice Validation(No cancelled)
SELECT Invoice,COUNT(*) AS cancelled_count
FROM ecommerce_cleaned_data
WHERE Invoice LIKE'C%'
GROUP BY Invoice
ORDER BY cancelled_count DESC;

-- 2. SQL Business Analysis
-- 2.1 Customer & Business KPIs

-- Total Customers
SELECT COUNT(DISTINCT Customer_ID) as total_customers
FROM ecommerce_cleaned_data;
-- Total Orders
SELECT COUNT(DISTINCT Invoice) AS total_orders
FROM ecommerce_cleaned_data;
-- Total Products
SELECT COUNT(DISTINCT StockCode) AS total_products
FROM ecommerce_cleaned_data;
-- Total Countries
SELECT COUNT(DISTINCT Country) AS total_countries
FROM ecommerce_cleaned_data;
-- Total Revenue
SELECT SUM(Revenue) AS total_revenue
FROM ecommerce_cleaned_data;
-- Average Order Value (AOV)
SELECT ROUND(SUM(Revenue)/COUNT(DISTINCT Invoice),2) AS avg_order_value
FROM ecommerce_cleaned_data;

-- 2.2 Customer Purchase Behavior
-- Top 10 customers by Revenue
SELECT Customer_ID,SUM(Revenue) AS total_revenue
FROM ecommerce_cleaned_data
GROUP BY Customer_ID ORDER BY total_revenue DESC
LIMIT 10;
-- Top 10 customers by Number of Orders
SELECT Customer_ID,COUNT(DISTINCT Invoice) AS total_orders
FROM ecommerce_cleaned_data
GROUP BY Customer_ID
ORDER BY total_orders DESC
LIMIT 10;
-- Top 10 customers by Quantity Purchased
SELECT Customer_ID,SUM(Quantity) AS total_quantity
FROM ecommerce_cleaned_data
GROUP BY Customer_ID
ORDER BY total_quantity DESC
LIMIT 10;
-- Average Spend per Customer
SELECT ROUND(AVG(customer_spend),2) AS avg_spend_per_customer
FROM (SELECT Customer_ID,SUM(Revenue) AS customer_spend
FROM ecommerce_cleaned_data
GROUP BY Customer_ID
) AS customer_total;

-- Purchase Frequency per Customer
SELECT Customer_ID,
COUNT(DISTINCT Invoice) AS purchase_frequency
FROM ecommerce_cleaned_data
GROUP BY Customer_ID
ORDER BY purchase_frequency DESC;

-- 2.3 RFM Analysis
-- RFM Base Table
-- Recency
SELECT Customer_ID,
DATEDIFF((SELECT MAX(InvoiceDate) FROM ecommerce_cleaned_data), 
MAX(InvoiceDate)
) AS recency
FROM ecommerce_cleaned_data
GROUP BY Customer_ID
ORDER BY recency ASC;
-- Frequency
SELECT Customer_ID,COUNT(DISTINCT Invoice) AS frequency
FROM ecommerce_cleaned_data
GROUP BY Customer_ID
ORDER BY frequency DESC;
-- Monetary
SELECT Customer_ID,SUM(Revenue) AS monetary
FROM ecommerce_cleaned_data
GROUP BY Customer_ID
ORDER BY monetary DESC;

-- Final RFM Base Table
-- Create view for RFM metrics
CREATE VIEW rfm_cal AS
SELECT Customer_ID,
DATEDIFF((SELECT MAX(InvoiceDate) FROM ecommerce_cleaned_data),
MAX(InvoiceDate)) AS recency,
COUNT(DISTINCT Invoice) AS frequency,
SUM(Revenue) AS monetary
FROM ecommerce_cleaned_data
GROUP BY Customer_ID;

SELECT * FROM rfm_cal;

-- 2.4 RFM(R, F, M Individual) Scoring
SELECT Customer_ID,recency,frequency,monetary,
6 - NTILE(5) OVER (ORDER BY recency ASC) AS R_Score,
6 - NTILE(5) OVER (ORDER BY frequency DESC) AS F_Score,
6 - NTILE(5) OVER (ORDER BY monetary DESC) AS M_Score
FROM rfm_cal
ORDER BY Customer_ID;

-- 2.5 Final RFM Score Calculate
WITH rfm_scores AS (SELECT Customer_ID,recency,frequency,monetary,
-- RFM scoring
6 - NTILE(5) OVER (ORDER BY recency ASC) AS R_Score,
6 - NTILE(5) OVER (ORDER BY frequency DESC) AS F_Score,
6 - NTILE(5) OVER (ORDER BY monetary DESC) AS M_Score
FROM rfm_cal
)
SELECT Customer_ID,recency,frequency,monetary,
R_Score,F_Score,M_Score,
-- Final Our RFM Score
(R_Score*100 + F_Score*10 + M_Score) AS RFM_Score
FROM rfm_scores
ORDER BY Customer_ID;

-- 2.6 Customer Segmentation

WITH rfm_scores AS (SELECT Customer_ID,recency,frequency,monetary,
-- RFM scoring
6 - NTILE(5) OVER (ORDER BY recency ASC) AS R_Score,
6 - NTILE(5) OVER (ORDER BY frequency DESC) AS F_Score,
6 - NTILE(5) OVER (ORDER BY monetary DESC) AS M_Score
FROM rfm_cal
)

SELECT Customer_ID,recency,frequency,monetary,
R_Score,F_Score,M_Score,
(R_Score*100 + F_Score *10 + M_Score) AS RFM_Score,
CASE
	WHEN R_Score>= 4 AND F_Score>= 4 AND M_Score >= 4 THEN 'Champions'
	WHEN R_Score>= 3 AND F_Score>= 4 THEN 'Loyal Customers'
	WHEN R_Score >= 4 AND F_Score<= 3 THEN 'Potential Loyalists'
	WHEN R_Score <=2 AND F_Score >=3 THEN 'At Risk'
	WHEN R_Score<= 2 AND F_Score<=2 THEN 'Lost Customers'
	ELSE 'Others'
END AS Customer_Segment
FROM rfm_scores
ORDER BY Customer_ID;

-- 2.7 Segment Summary Report
WITH rfm_scores AS (SELECT Customer_ID,recency,frequency,monetary,
-- RFM scoring
6 - NTILE(5) OVER (ORDER BY recency ASC) AS R_Score,
6 - NTILE(5) OVER (ORDER BY frequency DESC) AS F_Score,
6 - NTILE(5) OVER (ORDER BY monetary DESC) AS M_Score
FROM rfm_cal
),
rfm_segments AS(
SELECT Customer_ID,recency,frequency,monetary,
R_Score,F_Score,M_Score,
(R_Score*100 + F_Score *10 + M_Score) AS RFM_Score,
CASE
	WHEN R_Score>= 4 AND F_Score>= 4 AND M_Score >= 4 THEN 'Champions'
	WHEN R_Score>= 3 AND F_Score>= 4 THEN 'Loyal Customers'
	WHEN R_Score >= 4 AND F_Score<= 3 THEN 'Potential Loyalists'
	WHEN R_Score <=2 AND F_Score >=3 THEN 'At Risk'
	WHEN R_Score<= 2 AND F_Score<=2 THEN 'Lost Customers'
	ELSE 'Others'
END AS Customer_Segment
FROM rfm_scores
)
SELECT Customer_Segment,COUNT(*) AS Customer_Count,
SUM(monetary) AS Total_Revenue,
ROUND(AVG(monetary),2) AS Avg_Revenue_Per_Customer
FROM rfm_segments
GROUP BY Customer_Segment
ORDER BY Total_Revenue DESC;

-- 2.9 Country Analysis
SELECT Country,COUNT(DISTINCT Customer_ID) AS total_customer,
COUNT(DISTINCT Invoice) AS total_orders,
SUM(Revenue) AS total_revenue
FROM ecommerce_cleaned_data
GROUP BY Country ORDER BY total_revenue DESC;

-- 2.10 Product Analysis
SELECT StockCode,Description,SUM(Quantity) AS total_quantity,
COUNT(DISTINCT Invoice) AS total_orders,
SUM(Revenue) AS total_revenue
FROM ecommerce_cleaned_data
GROUP BY StockCode, Description
ORDER BY total_revenue DESC;

-- 2.11 Sales Trend Analysis
SELECT YEAR(InvoiceDate) AS year,
MONTH(InvoiceDate) AS month_number,
MONTHNAME(InvoiceDate) AS month,
SUM(Quantity) AS total_quantity,
COUNT(DISTINCT Invoice) AS total_orders,
SUM(Revenue) AS total_revenue
FROM ecommerce_cleaned_data
GROUP BY YEAR(InvoiceDate),MONTH(InvoiceDate),MONTHNAME(InvoiceDate)
ORDER BY year,month_number;
