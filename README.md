# 🛒 E-Commerce Customer Analytics & RFM Segmentation

## 📌 Project Overview

This project analyzes e-commerce transaction data to understand **customer behavior, purchasing patterns, product performance, market performance, and customer value**.

The project uses an end-to-end data analytics workflow:

**Excel & Power Query → MySQL & SQL → Python & Statistics → RFM Segmentation → Power BI → Business Report**

The main objective is to convert raw transaction data into **clear business insights and actionable recommendations** that can help an e-commerce business improve customer retention, identify high-value customers, optimize products, and reduce customer churn.

---

## 🎯 Business Objectives

The analysis focuses on answering important business questions:

- How is the business performing overall?
- Which customers generate the most revenue?
- How frequently do customers purchase?
- Which customers are most valuable to the business?
- Which customers are at risk of becoming inactive?
- Which customers may have potential for future growth?
- Which products generate the most revenue?
- Which products have the highest sales volume?
- Which countries contribute the most revenue?
- How does revenue change over time?
- How concentrated is revenue among high-value customers?
- What business actions should be taken based on the analysis?

---

## 🧰 Tools & Technologies

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Initial data inspection and preparation |
| **Power Query** | Data cleaning, transformation, and dataset preparation |
| **MySQL** | Data storage, validation, querying, and business analysis |
| **SQL** | KPI analysis, customer analysis, RFM calculation, product and market analysis |
| **Python** | Statistical analysis, customer analysis, RFM validation, outlier analysis |
| **Pandas** | Data manipulation and analysis |
| **NumPy** | Numerical analysis |
| **Matplotlib** | Data visualization |
| **Power BI** | Interactive dashboard and business reporting |
| **DAX** | Measures and analytical calculations |
| **GitHub** | Project documentation and version control |

---

# 📂 Project Structure

```text
ecommerce-customer-analytics-rfm/
│
├── data/
│   └── README.md
│
├── documentation/
│   └── project_methodology.md
│
├── powerbi/
│   └── ecommerce_customer_analytics.pbix
│
├── python/
│   └── ecommerce_customer_analysis.ipynb
│
├── report/
│   └── Ecommerce_Customer_Analytics_Business_Report.pdf
│
└── sql/
    └── ecommerce_analysis.sql

📊 Dataset

The project uses the Online Retail II transaction dataset.

The original dataset contains two yearly sheets:

Year 2009-2010
Year 2010-2011

The dataset contains transaction-level information such as:

Invoice
Stock Code
Product Description
Quantity
Invoice Date
Price
Customer ID
Country

A revenue field was created using:

Revenue = Quantity × Price
🧹 Data Preparation & Cleaning

The raw dataset was prepared using Excel and Power Query before loading it into MySQL and Python.

Main cleaning steps
Combined the two yearly datasets.
Removed the overlapping period between the two sheets.
Removed exact duplicate rows.
Removed records with missing Customer ID.
Removed records where Quantity was less than or equal to zero.
Removed records where Price was less than or equal to zero.
Checked missing product descriptions.
Checked missing country values.
Converted InvoiceDate into a proper Date/Time format.
Created Revenue using Quantity × Price.
Created SQL-compatible datetime values.
Prepared the cleaned dataset for MySQL import.
Final cleaned dataset

779,425 transaction records

The cleaned data was then loaded into MySQL for structured analysis.

🗄️ MySQL Database

Database used:

ecommerce_analytics

Main table:

ecommerce_cleaned_data

The table contains:

Invoice
StockCode
Description
Quantity
InvoiceDate
Price
Customer_ID
Country
Revenue
Data validation performed

The dataset was validated for:

Total row count
NULL values
Duplicate records
Invalid quantities
Invalid prices
Revenue calculation accuracy
Customer ID validity
Country validity
Stock code consistency
Invoice format
Invoice date validity

The final dataset contained 779,425 valid transaction rows with no unexpected NULL values in the analyzed fields.

🔎 SQL Business Analysis

SQL was used to perform the main business analysis.

Key SQL analysis areas
1. Overall Business KPIs

Calculated:

Total Revenue
Total Orders
Total Customers
Total Products
Total Quantity
Average Order Value
2. Customer Purchase Behavior

Analyzed:

Top customers by revenue
Top customers by number of orders
Top customers by quantity purchased
Average customer spending
Customer purchase frequency
3. RFM Analysis

Calculated:

Recency
Frequency
Monetary Value

RFM was calculated at customer level.

4. Customer Segmentation

Customers were classified into meaningful business segments:

Champions
Loyal Customers
Potential Loyalists
At Risk
Lost Customers
Others
5. Segment Analysis

Compared:

Customer count
Total revenue
Average revenue per customer
Revenue contribution
6. Country Analysis

Analyzed:

Revenue by country
Orders by country
Quantity by country
Customer distribution by market
7. Product Analysis

Analyzed:

Top products by revenue
Top products by quantity
Product order performance
Revenue per unit
8. Sales Trend Analysis

Analyzed monthly:

Revenue
Orders
Quantity

This helped identify changes in sales performance over time.

🐍 Python & Statistical Analysis

Python was used to validate the SQL analysis and perform deeper customer-level analysis.

Main libraries:

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
📈 Descriptive Statistics

Important transaction-level statistics included:

Mean Quantity: 13.49
Median Quantity: 6
Mean Price: 3.22
Median Price: 1.95
Mean Revenue per Transaction: 22.29
Median Revenue per Transaction: 12.48

The analysis showed a strong difference between the mean and median values, indicating that transaction values are right-skewed.

👥 Customer Revenue Analysis

Customer-level revenue analysis showed:

Total customers: 5,878
Median customer revenue: approximately 867.74
Mean customer revenue: approximately 2,955
Maximum customer revenue: approximately 580,987

The large difference between mean and median indicates that a relatively small group of customers generates a disproportionately large amount of revenue.

This makes customer segmentation and retention particularly important.

📊 RFM Analysis

RFM stands for:

Recency

How recently a customer purchased.

Frequency

How often a customer purchased.

Monetary

How much revenue a customer generated.

Each customer was assigned an RFM score using a 1–5 scoring system.

Higher scores indicate stronger customer value.

The combined RFM score was calculated from:

R Score × 100 + F Score × 10 + M Score
🧩 Customer Segmentation

Based on RFM scores, customers were divided into business-focused segments.

Segment	Business Meaning
Champions	Highly engaged and valuable customers
Loyal Customers	Frequent customers with strong engagement
Potential Loyalists	Recent customers with potential to become loyal
At Risk	Previously valuable/frequent customers showing reduced activity
Lost Customers	Customers with low recent activity and lower engagement
Others	Customers who do not fit the main segment definitions
Customer segment distribution

Approximate customer counts:

Segment	Customers
Champions	1,289
At Risk	825
Loyal Customers	708
Potential Loyalists	878
Lost Customers	~2,000
Others	Remaining customers
💰 Customer Segment Revenue

The analysis showed that the Champions segment contributes the largest share of total revenue.

Approximate revenue contribution:

Segment	Revenue Contribution
Champions	~68%
Loyal Customers	~11%
At Risk	~9%
Potential Loyalists	~5%
Lost Customers	~4%
Others	Remaining share

This shows that high-value customers are extremely important to the business.

⭐ High-Value Customer Analysis

An IQR-based method was used to identify unusually high customer revenue values.

The analysis identified approximately:

633 high-value customers

These customers generated approximately:

₹11.34M

of revenue.

Their contribution was approximately:

65% of total customer revenue

This indicates significant revenue concentration among high-value customers.

🏆 Top High-Value Customers

Examples of the highest-revenue customers included:

Customer ID	Revenue
18102	₹580,987
14646	₹528,603
14156	₹313,438
14911	₹291,421
17450	₹244,784
13694	₹195,641
17511	₹172,133
16446	₹168,473
16684	₹147,143
12415	₹144,458

These customers represent important retention opportunities because losing a small number of very high-value customers could have a meaningful revenue impact.

📦 Product Performance Analysis

Product analysis focused on:

Revenue
Quantity sold
Number of orders
Revenue per unit
Product concentration

The analysis identified the highest-performing products based on both sales volume and revenue generation.

A product should not be evaluated only by quantity sold because a high-volume product may generate lower revenue per unit.

Therefore, both volume and monetary performance were considered.

📊 Product Volume vs Revenue

A scatter analysis was created to compare:

Quantity Sold
Revenue

This helps identify different product behaviors:

High Volume + High Revenue

Strong products that contribute significantly to overall business performance.

High Volume + Low Revenue

Popular products that may have lower revenue per unit.

Low Volume + High Revenue

Potentially premium or high-value products.

Low Volume + Low Revenue

Products that may require further evaluation.

🌍 Market & Geographic Analysis

Country-level analysis showed a strong concentration of business activity in the United Kingdom.

The UK generated approximately:

₹14.4M

of revenue, representing approximately:

83% of total revenue

This indicates that the business is highly dependent on its primary market.

Other countries contribute smaller shares of overall revenue.

📅 Sales Trend Analysis

Monthly sales analysis was performed using:

Revenue
Orders
Quantity

The monthly trend showed noticeable variation in revenue throughout the analyzed period.

Monthly revenue reached approximately ₹1.16M–₹1.17M during peak periods, while lower months were approximately ₹0.45M–₹0.52M.

This suggests that sales performance has meaningful seasonal or time-based variation.

⚠️ Outlier Analysis

Statistical analysis identified extreme transaction values.

One notable transaction contained:

Quantity: 80,995
Price: ₹2.08
Revenue: ₹168,469.60

The transaction was associated with:

Product: PAPER CRAFT, LITTLE BIRDIE
Customer: 16446

The revenue calculation is mathematically valid.

The transaction was therefore not automatically removed as an error.

This demonstrates an important analytical principle:

An outlier is not automatically a data error.

Large transactions may represent genuine bulk purchases and should be investigated before removal.

📊 Power BI Dashboard

The cleaned transaction data and RFM segmentation results were loaded into Power BI.

The dashboard contains three main analytical pages.

📄 Page 1 — Executive Overview
KPI Cards
Total Revenue
Total Orders
Total Customers
Total Products
Average Order Value
Main Visuals
Monthly Revenue Trend
Top Countries by Revenue
Top 10 Products by Revenue
Revenue Contribution by Customer Segment
Filters
Customer Segment
Year
Month
Country

This page provides a high-level view of overall business performance.

📄 Page 2 — Customer & RFM Analysis
KPI Cards
Total Customers
Champions
At Risk
Loyal Customers
Potential Loyalists
Lost Customers
Main Visuals
Revenue Contribution by Customer Segment
Customer Recency Distribution
Top 20 High-Value Customers
Customer Segment Mix
Average Revenue per Customer by Segment
Filters
Customer Segment
Recency

This page focuses on customer value, customer engagement, and retention opportunities.

📄 Page 3 — Product & Market Analysis
KPI Cards
Total Revenue
Active Products
Average Unit Price
Total Markets
Revenue per Product
Main Visuals
Top 10 Products by Quantity Sold
Product Volume vs Revenue Analysis
Top 10 Products by Revenue per Unit
Product Revenue Concentration
Product Performance Matrix
Filters
Year
Month
Country
Customer Segment

This page focuses on product performance, product concentration, and market performance.

💡 Key Business Insights
1. High-value customers drive a large share of revenue

Approximately 65% of customer revenue comes from the identified high-value customer group.

Business implication

Customer retention should be a major priority.

2. Champions are the most important customer segment

Champions represent approximately 1,289 customers and contribute approximately 68% of total revenue.

Business implication

The company should protect this segment with:

Personalized offers
Loyalty benefits
Early access to products
VIP customer treatment
Cross-selling opportunities
3. At-risk customers require immediate attention

Approximately 825 customers were classified as At Risk.

They have previously demonstrated meaningful purchasing behavior but show weaker recent activity.

Business implication

A targeted reactivation campaign can potentially recover valuable customers before they become Lost Customers.

4. Lost customers represent a reactivation opportunity

A large number of customers fall into the Lost segment.

Business implication

The company should test:

Win-back campaigns
Personalized discounts
Product recommendations
Reminder emails
Limited-time offers
5. Revenue is highly concentrated geographically

The UK generates approximately 83% of total revenue.

Business implication

The UK is the core market, but geographic diversification could reduce dependence on one market.

6. Product performance should be evaluated using multiple metrics

Quantity alone does not explain product value.

Revenue, quantity, orders, and revenue per unit provide a more complete view.

Business implication

Products should be managed using both volume and profitability/revenue indicators.

7. Sales performance varies over time

Monthly revenue shows noticeable variation between high-performing and low-performing periods.

Business implication

The company should investigate seasonal patterns and align:

Marketing campaigns
Inventory planning
Promotions
Customer campaigns

with high and low demand periods.

🚨 Business Problems Identified

The analysis highlights several important business challenges.

Problem 1 — Revenue concentration

A large share of revenue depends on a relatively small group of high-value customers.

Risk

Losing these customers could significantly affect revenue.

Problem 2 — At-risk customer base

A significant number of customers are classified as At Risk.

Risk

Without targeted engagement, these customers may move into the Lost segment.

Problem 3 — Large Lost Customer segment

Many customers have low recent engagement.

Risk

The company may be losing repeat-purchase opportunities.

Problem 4 — Market concentration

The UK contributes the majority of total revenue.

Risk

Heavy dependence on one market creates geographic concentration risk.

Problem 5 — Product concentration

Revenue is not evenly distributed across all products.

Risk

Poor management of key products could affect overall revenue.

🎯 Business Recommendations
Recommendation 1 — Protect Champions

Create a dedicated VIP retention program.

Actions:

Personalized offers
Loyalty rewards
Early access
Exclusive promotions
Personalized product recommendations
Recommendation 2 — Reactivate At-Risk Customers

Build an automated reactivation campaign.

Example workflow:

Identify At-Risk Customer
        ↓
Analyze Previous Purchases
        ↓
Create Personalized Offer
        ↓
Send Email / Campaign
        ↓
Track Response
        ↓
Measure Reactivation
Recommendation 3 — Win Back Lost Customers

Use targeted win-back campaigns.

Possible strategies:

Discount offers
Product recommendations
Reminder campaigns
Seasonal promotions
Limited-time incentives
Recommendation 4 — Convert Potential Loyalists

Potential Loyalists should receive campaigns designed to increase purchase frequency.

Actions:

Cross-selling
Product bundles
Loyalty points
Personalized recommendations
Repeat-purchase incentives
Recommendation 5 — Reduce Geographic Dependence

Explore opportunities in markets outside the UK.

Potential strategies:

Localized marketing
Market-specific promotions
Country-level product analysis
Customer acquisition campaigns
Recommendation 6 — Improve Product Portfolio Management

Products should be monitored using:

Revenue
Quantity
Orders
Revenue per unit
Customer demand

This allows the business to identify strong products, volume-driven products, and underperforming products.

📆 90-Day Business Action Plan
Phase 1 — Days 1–30
Focus: Customer Retention

Actions:

Identify Champions
Identify At-Risk customers
Launch VIP retention campaign
Launch At-Risk reactivation campaign
Track campaign response
KPIs
Reactivation Rate
Repeat Purchase Rate
Customer Revenue
Customer Retention Rate
Phase 2 — Days 31–60
Focus: Customer Growth

Actions:

Target Potential Loyalists
Introduce cross-selling campaigns
Create personalized recommendations
Analyze customer purchasing patterns
Test different promotional strategies
KPIs
Purchase Frequency
Average Order Value
Revenue per Customer
Conversion Rate
Phase 3 — Days 61–90
Focus: Market & Product Optimization

Actions:

Analyze non-UK markets
Identify high-performing products
Review low-performing products
Analyze product revenue concentration
Optimize marketing allocation
KPIs
Market Revenue
Product Revenue
Revenue per Unit
New Customer Revenue
Geographic Revenue Share
🔬 Technical Methodology

The project follows an end-to-end analytics pipeline:

Raw E-Commerce Dataset
        ↓
Excel / Power Query
        ↓
Data Cleaning
        ↓
Cleaned Transaction Dataset
        ↓
MySQL
        ↓
SQL Business Analysis
        ↓
Python Statistical Analysis
        ↓
RFM Scoring
        ↓
Customer Segmentation
        ↓
Power BI Dashboard
        ↓
Business Insights
        ↓
Recommendations
📐 RFM Methodology
Recency

Calculated as the number of days since the customer's most recent purchase.

Recency =
Analysis Date − Last Purchase Date
Frequency

Calculated as the number of unique invoices/orders made by the customer.

Frequency =
Number of Distinct Orders
Monetary

Calculated as the total revenue generated by the customer.

Monetary =
Sum of Customer Revenue

Customers were then assigned RFM scores from 1 to 5.

📊 Statistical Techniques Used

The project applied several statistical concepts:

Mean
Median
Standard Deviation
Percentiles
Interquartile Range
Outlier Detection
Distribution Analysis
Correlation Analysis
Revenue Contribution Analysis

The analysis demonstrated why median and distribution analysis are important when customer revenue contains extreme values.

📁 Project Deliverables

This repository contains the major project outputs:

SQL
sql/ecommerce_analysis.sql

Contains SQL queries for:

Business KPIs
Customer analysis
RFM analysis
Customer segmentation
Product analysis
Country analysis
Sales trend analysis
Python
python/ecommerce_customer_analysis.ipynb

Contains:

Data inspection
Data quality analysis
Feature engineering
Statistical analysis
Customer analysis
RFM analysis
Segmentation
Outlier analysis
High-value customer analysis
Correlation analysis
Power BI
powerbi/ecommerce_customer_analytics.pbix

Contains the interactive business dashboard with:

Executive Overview
Customer & RFM Analysis
Product & Market Analysis
Business Report
report/Ecommerce_Customer_Analytics_Business_Report.pdf

Contains the complete business analysis, insights, recommendations, and 90-day action plan.

Documentation
documentation/project_methodology.md

Contains the project methodology and analytical workflow.

🚀 Future Analytics Opportunities

This project can be extended with more advanced analytics.

Customer Lifetime Value

Estimate future customer value and prioritize retention based on expected lifetime revenue.

Churn Prediction

Build a machine learning model to predict which customers are likely to stop purchasing.

Customer Recommendation System

Recommend products based on previous purchasing behavior.

Sales Forecasting

Forecast future revenue and demand using historical sales patterns.

Customer Cohort Analysis

Analyze customer retention by acquisition month or period.

Market Expansion Analysis

Identify countries with high potential for customer acquisition and revenue growth.

🧠 What This Project Demonstrates

This project demonstrates practical skills across the complete data analytics lifecycle:

Data Preparation
Excel
Power Query
Data Cleaning
Data Validation
SQL
SELECT
WHERE
GROUP BY
HAVING
JOIN
CASE
Subqueries
CTE
Window Functions
RFM Analysis
Business KPIs
Python
Pandas
NumPy
Data Cleaning
Feature Engineering
Statistical Analysis
Outlier Analysis
Customer Analysis
Business Analytics
Customer Segmentation
RFM Analysis
Revenue Concentration
Product Analysis
Market Analysis
Customer Retention
Business Recommendations
Power BI
Data Modeling
DAX
KPI Cards
Interactive Filters
Customer Segmentation Dashboard
Product Analysis
Executive Reporting
Communication
Business storytelling
Insight generation
Data-driven recommendations
Action planning
Professional business reporting
🔄 End-to-End Project Flow
             RAW DATA
                 ↓
        EXCEL / POWER QUERY
                 ↓
        CLEAN & TRANSFORM
                 ↓
              MySQL
                 ↓
          SQL ANALYSIS
                 ↓
              PYTHON
                 ↓
       STATISTICAL ANALYSIS
                 ↓
          RFM SEGMENTATION
                 ↓
             POWER BI
                 ↓
        BUSINESS INSIGHTS
                 ↓
        RECOMMENDATIONS
                 ↓
         90-DAY ACTION PLAN
📌 Project Summary

E-Commerce Customer Analytics & RFM Segmentation transforms more than 779K cleaned transaction records into a complete customer and business intelligence solution.

The project identifies:

High-value customers
Champions
Loyal customers
Potential Loyalists
At-Risk customers
Lost customers
High-performing products
Important markets
Revenue concentration
Sales trends
Business risks
Customer retention opportunities

The analysis shows that customer value is highly concentrated, with Champions and high-value customers contributing a large share of total revenue.

The final dashboard and business report convert these findings into practical recommendations focused on:

Customer Retention → Customer Growth → Product Optimization → Market Expansion

👨‍💻 Author

Aditya Narayan Panda

B.Tech Computer Science & Engineering

Interested in:

Data Analytics
Business Intelligence
SQL
Python
Power BI
Data-Driven Decision Making
⭐ Project Highlights
779K+ cleaned transaction records
5.8K+ customers analyzed
4.6K+ products analyzed
RFM-based customer segmentation
633+ high-value customers identified
65%+ revenue contribution from high-value customers
68%+ revenue contribution from Champions
83%+ revenue contribution from the UK
3-page interactive Power BI dashboard
Complete SQL + Python + BI workflow
Professional business report
90-day action plan
🏁 Final Outcome

This project demonstrates how raw e-commerce transaction data can be transformed into a complete business analytics solution using:

Excel → Power Query → MySQL → SQL → Python → Statistics → RFM → Power BI → Business Strategy

The goal is not only to analyze what happened, but also to understand:

Why it happened, who matters most, where the opportunities are, and what the business should do next.
