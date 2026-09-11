# 🛒 E-Commerce Customer Analytics & RFM Segmentation

[![Python](https://img.shields.io/badge/Python-3.9+-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power_BI-Desktop-F2C811?style=flat-square&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Excel](https://img.shields.io/badge/Microsoft_Excel-Power_Query-217346?style=flat-square&logo=microsoftexcel&logoColor=white)](https://www.microsoft.com/excel)
[![Pandas](https://img.shields.io/badge/Pandas-Data_Analysis-150458?style=flat-square&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![NumPy](https://img.shields.io/badge/NumPy-Scientific_Computing-013243?style=flat-square&logo=numpy&logoColor=white)](https://numpy.org/)
[![Dataset](https://img.shields.io/badge/Transactions-779K+_Cleaned-green?style=flat-square)](https://github.com/adityanarayanpanda/ecommerce-customer-analytics-rfm)

---

## 📌 Project Overview

This project analyzes e-commerce transaction data to understand **customer behavior, purchasing patterns, product performance, market performance, and customer value**.

The project follows an end-to-end data analytics workflow:

**Excel & Power Query → MySQL & SQL → Python & Statistics → RFM Segmentation → Power BI → Business Report**

The primary objective is to transform raw transaction records into **clear business insights and actionable recommendations** that help an e-commerce business improve customer retention, identify high-value customers, evaluate product performance, and address customer churn.

```text
                           END-TO-END PROJECT FLOW
 ┌─────────────────┐     ┌──────────────────┐     ┌──────────────────┐
 │   Raw Retail    │────>│  Excel / Power   │────>│   MySQL Database │
 │ Transaction Log │     │  Query Cleaning  │     │   & SQL Analysis │
 └─────────────────┘     └──────────────────┘     └──────────────────┘
                                                           │
 ┌─────────────────┐     ┌──────────────────┐              ▼
 │ 90-Day Action   │<────│   3-Page Power   │<────┌──────────────────┐
 │ Plan & Report   │     │   BI Dashboard   │     │ Python & Pandas  │
 └─────────────────┘     └──────────────────┘     │ Statistics & RFM │
                                                  └──────────────────┘
```

---

## 🎯 Key Business Highlights

| Metric / Dimension | Analyzed Value | Business Implication |
|---|---|---|
| **Cleaned Transaction Volume** | **779,425 records** across 2 years | Validated baseline with missing IDs and non-positive records removed |
| **Analyzed Customers** | **5,878 customers** | Customer-level aggregation for behavioral analysis |
| **Analyzed Products** | **4,600+ products** | Comprehensive catalog volume and monetary evaluation |
| **Total Customer Revenue** | **Approximately ₹17.375M** | Baseline monetary volume across analyzed customer base |
| **High-Value Concentration (IQR)** | **633 customers (~10.8%) generate ~65.3% of revenue (~₹11.34M)** | Substantial revenue concentration requiring prioritized customer retention |
| **Champions Segment** | **1,289 customers contribute ~68% of total revenue** | Core customer segment requiring dedicated retention and loyalty programs |
| **At-Risk Customers** | **825 customers (~9% revenue contribution)** | Valuable past customers showing declining activity; prime reactivation candidates |
| **Lost Customers** | **Approximately 2,000 customers (~4% revenue)** | Significant pool of dormant customers suitable for win-back campaigns |
| **Geographic Concentration** | **United Kingdom generates ~₹14.4M (~83% of revenue)** | Core domestic dependency; opportunity for international diversification |
| **Revenue Skewness** | **Mean: ₹22.29 vs. Median: ₹12.48 per transaction** | Right-skewed transactions; median and distribution analysis provide reliable insight |
| **Outlier Investigation** | **Invoice #16446: 80,995 units = ₹168,469.60** | Validated extreme transaction retained as a genuine large purchase |

---

## 📑 Table of Contents

- [📌 Project Overview](#-project-overview)
- [🎯 Key Business Highlights](#-key-business-highlights)
- [📂 Repository Structure](#-repository-structure)
- [📊 Dataset & Data Preparation](#-dataset--data-preparation)
- [🗄️ MySQL Database & SQL Analysis](#️-mysql-database--sql-analysis)
- [🐍 Python & Statistical Analysis](#-python--statistical-analysis)
- [📐 RFM Scoring & Customer Segmentation](#-rfm-scoring--customer-segmentation)
- [⭐ High-Value Customer Analysis](#-high-value-customer-analysis)
- [🌍 Geographic Market & Product Performance](#-geographic-market--product-performance)
- [📈 Power BI Interactive Dashboard](#-power-bi-interactive-dashboard)
- [💡 Key Business Insights](#-key-business-insights)
- [🚨 Business Problems Identified](#-business-problems-identified)
- [🎯 Strategic Business Recommendations](#-strategic-business-recommendations)
- [📆 90-Day Business Action Plan](#-90-day-business-action-plan)
- [🔬 Technical Methodology](#-technical-methodology)
- [📁 Project Deliverables](#-project-deliverables)
- [🚀 Future Analytics Opportunities](#-future-analytics-opportunities)
- [🧠 What This Project Demonstrates](#-what-this-project-demonstrates)
- [💻 Getting Started](#-getting-started)
- [👨‍💻 Author](#-author)

---

## 📂 Repository Structure

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
```

---

## 📊 Dataset & Data Preparation

The project uses the **Online Retail II** dataset, which contains transaction-level information for an online retail business:

* **`Invoice`**: Transaction identifier.
* **`StockCode`**: Product / item code.
* **`Description`**: Product name.
* **`Quantity`**: Number of units purchased.
* **`InvoiceDate`**: Timestamp of transaction.
* **`Price`**: Unit price of the product.
* **`Customer ID`**: Customer identifier.
* **`Country`**: Country of customer residence.

A revenue field was calculated as:
$$\text{Revenue} = \text{Quantity} \times \text{Price}$$

### Data Cleaning Steps (Excel & Power Query)
1. **Combined Yearly Datasets**: Merged Year 2009–2010 and Year 2010–2011 sheets.
2. **Removed Overlap**: Eliminated the overlapping period between the two yearly files.
3. **Deduplication**: Removed exact duplicate rows.
4. **Customer Identification**: Removed records with missing `Customer ID`.
5. **Quantity & Price Validation**:
   - Filtered out records where `Quantity <= 0`.
   - Filtered out records where `Price <= 0`.
6. **Integrity Checks**: Verified blank product descriptions and country values.
7. **Datetime Formatting**: Converted `InvoiceDate` to standard date/time format and generated SQL-ready datetime values.
8. **Final Cleaned Dataset**: **779,425 valid transaction rows** prepared for MySQL and Python analysis with no unexpected NULL values in analyzed fields.

---

## 🗄️ MySQL Database & SQL Analysis

**Database**: `ecommerce_analytics`  
**Main Table**: `ecommerce_cleaned_data`

```sql
CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE ecommerce_cleaned_data (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10, 2),
    Customer_ID INT,
    Country VARCHAR(100),
    Revenue DECIMAL(12, 2)
);
```

### SQL Analysis Scope
The analysis in `sql/ecommerce_analysis.sql` covers:
1. **Overall Business KPIs**: Total Revenue, Total Orders, Total Customers, Total Products, Total Quantity, and Average Order Value.
2. **Customer Purchase Behavior**: Top customers by revenue, orders, and quantity; average spending; purchase frequency.
3. **RFM Base Calculation**: Recency, Frequency, and Monetary values aggregated at customer level.
4. **RFM Scoring via Window Functions**: 1–5 score ranking using `NTILE(5)`.
5. **Customer Segmentation**: Classification into business segments using conditional logic.
6. **Segment Analysis**: Customer count, segment revenue, average revenue per customer, and revenue contribution.
7. **Country Analysis**: Revenue, orders, quantity, and customer distribution by market.
8. **Product Analysis**: Top products by revenue, quantity, order frequency, and revenue per unit.
9. **Monthly Sales Trends**: Monthly revenue, order volume, and quantity.

#### Core KPI SQL Query
```sql
SELECT 
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT StockCode) AS Total_Products,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Revenue) / COUNT(DISTINCT Invoice), 2) AS Average_Order_Value
FROM ecommerce_cleaned_data;
```

#### RFM Scoring & Segmentation SQL Query
```sql
WITH Customer_Aggregates AS (
    SELECT 
        Customer_ID,
        DATEDIFF((SELECT MAX(InvoiceDate) FROM ecommerce_cleaned_data), MAX(InvoiceDate)) AS recency,
        COUNT(DISTINCT Invoice) AS frequency,
        ROUND(SUM(Revenue), 2) AS monetary
    FROM ecommerce_cleaned_data
    GROUP BY Customer_ID
),
RFM_Scores AS (
    SELECT 
        Customer_ID,
        recency,
        frequency,
        monetary,
        6 - NTILE(5) OVER (ORDER BY recency ASC) AS R_Score,
        6 - NTILE(5) OVER (ORDER BY frequency DESC) AS F_Score,
        6 - NTILE(5) OVER (ORDER BY monetary DESC) AS M_Score
    FROM Customer_Aggregates
)
SELECT 
    Customer_ID,
    recency,
    frequency,
    monetary,
    R_Score,
    F_Score,
    M_Score,
    (R_Score * 100 + F_Score * 10 + M_Score) AS RFM_Score,
    CASE 
        WHEN R_Score >= 4 AND F_Score >= 4 AND M_Score >= 4 THEN 'Champions'
        WHEN R_Score >= 3 AND F_Score >= 4 THEN 'Loyal Customers'
        WHEN R_Score >= 4 AND F_Score <= 3 THEN 'Potential Loyalists'
        WHEN R_Score <= 2 AND F_Score >= 3 THEN 'At Risk'
        WHEN R_Score <= 2 AND F_Score <= 2 THEN 'Lost Customers'
        ELSE 'Others'
    END AS Customer_Segment
FROM RFM_Scores;
```

---

## 🐍 Python & Statistical Analysis

Python (`python/ecommerce_customer_analysis.ipynb`) was used to validate SQL findings and perform deeper customer and distributional analyses using **Pandas**, **NumPy**, and **Matplotlib**.

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Summary statistics for transaction-level metrics
df[['Quantity', 'Price', 'Revenue']].describe()
```

### Transaction-Level Descriptive Statistics
| Metric | Mean | Median |
|---|---|---|
| **Quantity** | 13.49 | 6.00 |
| **Price** | ₹3.22 | ₹1.95 |
| **Revenue per Transaction** | ₹22.29 | ₹12.48 |

The substantial difference between the mean and median confirms that transaction data is heavily right-skewed by bulk orders.

### Customer Revenue Statistics
* **Total Customers Analyzed**: 5,878
* **Mean Customer Revenue**: Approximately ₹2,955
* **Median Customer Revenue**: Approximately ₹867.74
* **Standard Deviation**: Approximately ₹14,440.8
* **Minimum Customer Revenue**: Approximately ₹2.95
* **Maximum Customer Revenue**: Approximately ₹580,987.04

The wide gap between the median (₹867.74) and mean (₹2,955) confirms that a small group of customers generates a disproportionate share of total revenue.

### Outlier Analysis
Statistical review identified extreme transaction values, notably:
* **Customer ID**: `16446`
* **Product**: `PAPER CRAFT, LITTLE BIRDIE`
* **Quantity**: `80,995`
* **Price**: `₹2.08`
* **Revenue**: `₹168,469.60`

**Interpretation**: This transaction is a mathematically valid extreme transaction and was retained because an outlier is not automatically a data error. Domain validation should be performed before removing such observations.

---

## 📐 RFM Scoring & Customer Segmentation

RFM analysis evaluates customers across three core behavioral dimensions:
* **Recency ($R$)**: Days since the customer's most recent purchase (lower is better).
* **Frequency ($F$)**: Count of distinct orders placed (higher is better).
* **Monetary ($M$)**: Total revenue generated (higher is better).

Scores from **1 to 5** were calculated:
* `R_Score = 6 - NTILE(5) OVER (ORDER BY recency ASC)`
* `F_Score = 6 - NTILE(5) OVER (ORDER BY frequency DESC)`
* `M_Score = 6 - NTILE(5) OVER (ORDER BY monetary DESC)`
* `Combined RFM Score = R_Score * 100 + F_Score * 10 + M_Score`

### Segmentation Logic
* **Champions**: `R >= 4 AND F >= 4 AND M >= 4` (Highly engaged, high-value customers)
* **Loyal Customers**: `R >= 3 AND F >= 4` (Frequent buyers with consistent activity)
* **Potential Loyalists**: `R >= 4 AND F <= 3` (Recent customers with potential to become frequent buyers)
* **At Risk**: `R <= 2 AND F >= 3` (Previously frequent customers showing declining recent activity)
* **Lost Customers**: `R <= 2 AND F <= 2` (Customers with low recent activity and lower engagement)
* **Others**: Remaining customer profiles

### Customer Segment Distribution & Revenue Share
| Customer Segment | Customer Count | Approximate Revenue Contribution | Business Meaning |
|---|---|---|---|
| **Champions** | 1,289 | ~68% | Highly engaged, top revenue contributors |
| **Loyal Customers** | 708 | ~11% | Frequent purchasers with steady relationship |
| **At Risk** | 825 | ~9% | Previously active customers showing reduced activity |
| **Potential Loyalists** | 878 | ~5% | Recent buyers with opportunity to build purchase frequency |
| **Lost Customers** | ~2,000 | ~4% | Inactive customers with low engagement |
| **Others** | Remaining | Remaining share | Customers outside primary segment bounds |
| **Total** | **5,878** | **100%** | |

---

## ⭐ High-Value Customer Analysis

Customer revenue values were evaluated using an Interquartile Range (IQR) method to identify unusually high spenders.

* **Identified High-Value Customers**: **633 customers**
* **Total Revenue from High-Value Customers**: **Approximately ₹11.34M**
* **Revenue Contribution**: **Approximately 65.3%** of total customer revenue

### Top High-Value Customer Revenue Examples
| Customer ID | Revenue (₹) |
|:---:|:---:|
| `18102` | ₹580,987.04 |
| `14646` | ₹528,602.52 |
| `14156` | ₹313,437.62 |
| `14911` | ₹291,420.81 |
| `17450` | ₹244,784.25 |
| `13694` | ₹195,640.69 |
| `17511` | ₹172,132.87 |
| `16446` | ₹168,472.50 |
| `16684` | ₹147,142.77 |
| `12415` | ₹144,458.37 |

**Strategic Implication**: High-value customers represent critical retention priorities because the loss of a small number of top customers could meaningfully impact total revenue.

---

## 🌍 Geographic Market & Product Performance

### Geographic Analysis
* **Total Markets Analyzed**: 38 countries
* **United Kingdom Revenue**: Approximately ₹14.4M
* **United Kingdom Revenue Share**: Approximately 83% of total revenue

**Strategic Implication**: Revenue concentration in the UK indicates geographic dependency and suggests an opportunity to explore international market diversification.

### Product Performance Analysis
Products were evaluated across revenue, quantity sold, order count, and revenue per unit:
* **High Volume + High Revenue**: Strong core products driving both sales volume and revenue.
* **High Volume + Low Revenue**: Popular items that generate volume but carry lower revenue per unit.
* **Low Volume + High Revenue**: Products with higher revenue per unit that generate meaningful revenue from fewer sales.
* **Low Volume + Low Revenue**: Long-tail items requiring portfolio review.

Evaluating products using volume and revenue metrics together ensures items are not judged solely by units sold.

### Sales Trends
* **Monthly Revenue Variation**: Monthly revenue varied between approximately ₹0.45M–₹0.52M in lower periods and ₹1.16M–₹1.17M during peak periods.
* Sales performance shows noticeable time-based and seasonal patterns that can inform promotional scheduling and inventory planning.

---

## 📈 Power BI Interactive Dashboard

The interactive Power BI file (`powerbi/ecommerce_customer_analytics.pbix`) contains three analytical pages:

### Page 1 — Executive Overview
* **KPI Cards**: Total Revenue, Total Orders, Total Customers, Total Products, Average Order Value
* **Main Visuals**:
  * Monthly Revenue Trend
  * Top Countries by Revenue
  * Top 10 Products by Revenue
  * Revenue Contribution by Customer Segment
* **Slicers**: Customer Segment, Year, Month, Country

### Page 2 — Customer & RFM Analysis
* **KPI Cards**: Total Customers, Champions, At Risk, Loyal Customers, Potential Loyalists, Lost Customers
* **Main Visuals**:
  * Revenue Contribution by Customer Segment
  * Customer Recency Distribution
  * Top 20 High-Value Customers
  * Customer Segment Mix
  * Average Revenue per Customer by Segment
* **Slicers**: Customer Segment, Recency

### Page 3 — Product & Market Analysis
* **KPI Cards**: Total Revenue, Active Products, Average Unit Price, Total Markets, Revenue per Product
* **Main Visuals**:
  * Top 10 Products by Quantity Sold
  * Product Volume vs Revenue Analysis
  * Top 10 Products by Revenue per Unit
  * Product Revenue Concentration
  * Product Performance Matrix
* **Slicers**: Year, Month, Country, Customer Segment

### Key Power BI Measures
* `Total Revenue`
* `Total Orders`
* `Total Customers`
* `Total Products`
* `Total Quantity`
* `Average Order Value`
* `Active Products`
* `Total Markets`
* `Average Unit Price`
* `Revenue per Product`
* `Revenue per Unit`

RFM segmentation data is connected to transaction records via `Customer ID`.

---

## 💡 Key Business Insights

1. **High-Value Customers Drive Revenue**: Approximately 65.3% of revenue originates from the 633 identified high-value customers, making customer retention a primary commercial priority.
2. **Champions Are the Core Segment**: 1,289 Champions contribute approximately 68% of total revenue. Protecting this segment with loyalty programs and priority service is critical.
3. **At-Risk Customers Need Immediate Engagement**: 825 customers have demonstrated past value but show declining recent activity. Proactive engagement can prevent churn into the Lost segment.
4. **Lost Customers Represent a Win-Back Opportunity**: Around 2,000 customers fall into the Lost segment, offering an audience for targeted win-back campaigns and re-engagement promotions.
5. **Geographic Dependency**: The UK generates approximately 83% of revenue, indicating strong core market performance alongside an opportunity for international expansion.
6. **Multi-Metric Product Evaluation**: Quantity alone does not explain product value; revenue, order frequency, and revenue per unit provide a complete perspective on portfolio performance.
7. **Seasonality Influences Performance**: Monthly revenue swings from ₹0.45M–₹0.52M to peak months of ₹1.16M–₹1.17M highlight the value of aligning promotions with demand cycles.

---

## 🚨 Business Problems Identified

* **Problem 1 — Revenue Concentration**: A large share of revenue depends on a small group of high-value accounts. Losing key customers could noticeably affect business performance.
* **Problem 2 — At-Risk Customer Base**: 825 customers are at risk of lapsing without structured re-engagement.
* **Problem 3 — Large Inactive Customer Base**: Approximately 2,000 customers have become inactive, representing missed repeat-purchase opportunities.
* **Problem 4 — Market Concentration**: The UK contributes ~83% of revenue, creating geographic dependence.
* **Problem 5 — Product Concentration**: Revenue is unevenly distributed across products, requiring active catalog management.

---

## 🎯 Strategic Business Recommendations

1. **Protect Champions**: Introduce dedicated loyalty initiatives, VIP retention programs, early product access, and personalized product recommendations.
2. **Reactivate At-Risk Customers**: Deploy targeted reactivation campaigns:
   $$\text{Identify At-Risk Customers} \rightarrow \text{Analyze Past Purchases} \rightarrow \text{Personalized Re-engagement} \rightarrow \text{Track Response}$$
3. **Win Back Lost Customers**: Use targeted win-back campaigns, reminder emails, seasonal incentives, and special promotional offers.
4. **Convert Potential Loyalists**: Increase purchase frequency among Potential Loyalists using cross-selling, product bundles, and repeat-purchase incentives.
5. **Analyze High-Value Customer Patterns**: Study purchasing behaviors of top-spending accounts to tailor ordering schedules and product availability.
6. **Explore Geographic Diversification**: Analyze opportunities in non-UK markets to reduce single-country reliance.
7. **Evaluate Product Portfolio Holistically**: Monitor products across revenue, quantity, orders, and revenue per unit to identify volume drivers, revenue generators, and underperforming items.
8. **Align Operations with Sales Trends**: Plan marketing promotions, staffing, and inventory around historical peak and off-peak monthly revenue periods.

---

## 📆 90-Day Business Action Plan

The following phased roadmap outlines recommended strategic priorities:

### Phase 1 — Days 1–30: Customer Retention
* **Focus**: Securing core customer relationships and addressing early churn signals.
* **Recommended Actions**:
  * Identify and review Champions accounts for VIP retention efforts.
  * Launch an initial reactivation campaign targeted at the 825 At-Risk customers.
  * Monitor customer response and engagement rates.
* **Recommended KPIs**: Reactivation Rate, Customer Retention Rate, Repeat Purchase Rate, Segment Revenue.

### Phase 2 — Days 31–60: Customer Growth
* **Focus**: Increasing purchase frequency and transaction value.
* **Recommended Actions**:
  * Deliver targeted cross-selling and bundle recommendations to Potential Loyalists.
  * Evaluate promotional incentives to encourage repeat purchases.
  * Review customer purchasing intervals across active segments.
* **Recommended KPIs**: Purchase Frequency, Average Order Value (AOV), Revenue per Customer, Conversion Rate.

### Phase 3 — Days 61–90: Market & Product Optimization
* **Focus**: Diversification and catalog efficiency.
* **Recommended Actions**:
  * Analyze top international markets to identify expansion potential.
  * Review product performance matrix to identify high-potential and underperforming SKUs.
  * Optimize promotional allocations across top-performing product categories.
* **Recommended KPIs**: Non-UK Revenue Share, Product Revenue per Unit, Market Revenue, Category Revenue.

---

## 🔬 Technical Methodology

```text
RAW E-COMMERCE DATASET (Online Retail II)
         │
         ▼
EXCEL & POWER QUERY (Data Cleaning, Overlap Removal, Revenue Feature)
         │
         ▼
CLEANED TRANSACTION DATASET (779,425 Records)
         │
         ▼
MySQL DATABASE (`ecommerce_analytics`, DDL, Indexing)
         │
         ▼
SQL BUSINESS ANALYSIS (KPIs, CTEs, Window Functions, RFM)
         │
         ▼
PYTHON STATISTICAL ANALYSIS (Pandas, NumPy, Matplotlib, IQR Outliers)
         │
         ▼
RFM SCORING & CUSTOMER SEGMENTATION (R, F, M 1–5 Scoring)
         │
         ▼
POWER BI 3-PAGE DASHBOARD (DAX Measures, Segment Slicers)
         │
         ▼
BUSINESS INSIGHTS & STRATEGIC RECOMMENDATIONS
         │
         ▼
90-DAY BUSINESS ACTION PLAN
```

---

## 📁 Project Deliverables

* **SQL Script** (`sql/ecommerce_analysis.sql`):
  * DDL schema and table definitions
  * Overall business KPIs
  * Customer purchase behavior
  * RFM calculation and scoring
  * Customer segmentation
  * Product and country analysis
  * Monthly sales trends
* **Python Notebook** (`python/ecommerce_customer_analysis.ipynb`):
  * Data inspection and quality validation
  * Descriptive statistics (mean, median, standard deviation)
  * IQR outlier analysis
  * High-value customer revenue analysis
  * Customer segmentation summary
  * Data visualizations and correlation checks
* **Power BI Workbook** (`powerbi/ecommerce_customer_analytics.pbix`):
  * 3-page interactive business dashboard
  * Executive Overview, Customer & RFM Analysis, Product & Market Analysis
* **Business Report** (`report/Ecommerce_Customer_Analytics_Business_Report.pdf`):
  * Comprehensive business analysis, findings, and recommendations
* **Documentation** (`documentation/project_methodology.md`):
  * Documentation of data cleaning steps and methodology

---

## 🚀 Future Analytics Opportunities

The following areas represent practical directions for extending this project:
- **Predictive Churn Modeling**: Train classification models to estimate customer churn risk before activity ceases.
- **Customer Lifetime Value (CLV)**: Model expected future revenue per customer segment to prioritize retention investments.
- **Market Basket Analysis**: Apply association rule mining to identify items frequently purchased together.
- **Sales Forecasting**: Forecast future monthly revenue using time-series forecasting techniques.
- **Customer Cohort Analysis**: Track customer retention and revenue curves across acquisition cohorts over time.
- **Automated Data Pipelines**: Schedule regular ETL updates to refresh SQL tables and dashboard reports automatically.

---

## 🧠 What This Project Demonstrates

* **Data Engineering**: Data cleaning, deduplication, type casting, and schema validation with Power Query and Excel.
* **Relational Database & SQL**: Schema design, aggregations, conditional expressions (`CASE`), common table expressions (`WITH`), and window ranking functions (`NTILE`).
* **Statistical Analysis**: Distribution analysis, right-skewed data handling, mean vs. median comparisons, standard deviation, and IQR-based outlier screening using Python.
* **Customer Analytics**: RFM modeling, scoring logic, and customer segmentation framework design.
* **Business Intelligence & Reporting**: Multi-page Power BI dashboard design, data modeling, DAX measure creation, and interactive reporting.
* **Commercial Acumen**: Translating analytical findings into root causes, strategic business recommendations, and a phased 90-day action plan.

---

## 💻 Getting Started

### Prerequisites
* MySQL Server 8.0+
* Python 3.9+ with `pandas`, `numpy`, and `matplotlib`
* Microsoft Power BI Desktop

### Setup Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/adityanarayanpanda/ecommerce-customer-analytics-rfm.git
   cd ecommerce-customer-analytics-rfm
   ```
2. **Execute SQL Scripts**:
   ```bash
   mysql -u your_username -p < sql/ecommerce_analysis.sql
   ```
3. **Run Python Analysis**:
   ```bash
   jupyter notebook python/ecommerce_customer_analysis.ipynb
   ```
4. **Open Power BI Dashboard**:
   - Open `powerbi/ecommerce_customer_analytics.pbix` in Microsoft Power BI Desktop.
   - Refresh data sources to view the interactive reports.

---

## 👨‍💻 Author

**Aditya Narayan Panda**  
*B.Tech in Computer Science & Engineering*  
*Interested in Data Analytics, Business Intelligence, SQL, Python, and Power BI*

* **GitHub**: [github.com/adityanarayanpanda](https://github.com/adityanarayanpanda)
* **LinkedIn**: [linkedin.com/in/adityanarayanpanda](https://www.linkedin.com/in/adityanarayanpanda)
* **Email**: [adityapanda0879@gmail.com](mailto:adityapanda0879@gmail.com)
