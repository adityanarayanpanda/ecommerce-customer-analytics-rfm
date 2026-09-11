# Project Methodology

## Project Objective

The objective of this project is to analyze e-commerce transaction data to understand:

- Revenue and sales performance
- Customer purchasing behavior
- Customer value
- RFM customer segments
- Product performance
- Market/geographic concentration
- Business risks and growth opportunities

## Analytical Workflow

The project follows an end-to-end Data Analytics workflow:

Excel
↓
Power Query
↓
MySQL / SQL
↓
Python + Statistics
↓
Power BI
↓
Business Insights & Recommendations

## 1. Excel & Power Query

Excel was used as the initial source environment.

Power Query was used to:

- Combine the yearly worksheets
- Handle the overlapping transaction period
- Remove exact duplicates
- Remove missing Customer IDs
- Remove invalid Quantity and Price records
- Validate Description and Country fields
- Convert InvoiceDate to Date/Time
- Calculate Revenue
- Prepare SQL-ready data

## 2. MySQL & SQL

The cleaned dataset was loaded into MySQL for structured analysis.

SQL was used for:

- Data validation
- Revenue analysis
- Customer analysis
- Order analysis
- Product analysis
- Country analysis
- Monthly sales trends
- RFM calculation and scoring
- Customer segmentation

## 3. Python & Statistics

Python was used for deeper exploratory and statistical analysis.

Libraries used:

- Pandas
- NumPy
- Matplotlib

Analysis included:

- Descriptive statistics
- Customer revenue distribution
- Mean vs median analysis
- RFM analysis
- High-value customer identification
- IQR-based outlier analysis
- Revenue contribution
- Correlation analysis
- Product and market analysis

## 4. RFM Segmentation

Customers were evaluated using three dimensions:

- **Recency** — How recently a customer purchased
- **Frequency** — How often a customer ordered
- **Monetary** — How much revenue a customer generated

Customers were scored using five groups for each RFM dimension.

The final segments were:

- Champions
- Loyal Customers
- Potential Loyalists
- At Risk
- Lost Customers
- Others

## 5. Power BI

Power BI was used to communicate the analysis through an interactive dashboard.

The dashboard contains three main analytical areas:

### Executive Overview

- Revenue
- Orders
- Customers
- Products
- Average Order Value
- Revenue trends
- Country performance
- Product performance
- Segment revenue

### Customer & RFM Analysis

- Customer segments
- Revenue contribution
- Recency distribution
- High-value customers
- Segment mix
- Average revenue per customer

### Product & Market Analysis

- Product quantity
- Product revenue
- Revenue per unit
- Product volume vs revenue
- Product revenue concentration
- Market performance

## 6. Business Insight Generation

The final stage converted analytical findings into business recommendations.

Key areas of focus were:

- High-value customer retention
- At Risk customer recovery
- Market diversification
- Product concentration monitoring
- Customer value growth
