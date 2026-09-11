# Dataset

## Source

This project uses the **Online Retail II** transaction dataset.

The original dataset contains two worksheets:

- `Year 2009-2010`
- `Year 2010-2011`

The dataset contains e-commerce transaction-level information including:

- Invoice
- Stock Code
- Product Description
- Quantity
- Invoice Date
- Price
- Customer ID
- Country

## Data Preparation

The raw data was prepared using **Excel and Power Query**.

The main cleaning steps were:

1. Combined the two yearly worksheets.
2. Identified and removed the overlapping transaction period from the second worksheet.
3. Removed exact duplicate records.
4. Removed records with missing Customer IDs.
5. Removed transactions where Quantity was less than or equal to zero.
6. Removed records where Price was less than or equal to zero.
7. Checked Product Description and Country for missing values.
8. Converted Invoice Date to the correct Date/Time format.
9. Created a Revenue field:

   `Revenue = Quantity × Price`

10. Prepared the cleaned dataset for SQL analysis.

## Final Analysis Dataset

After cleaning and validation:

- **779,425 transaction records**
- **5,878 customers**
- **36,969 orders**
- **4,631 products**
- **Multiple countries/markets**

The cleaned dataset was then analyzed using MySQL, Python, Statistics and Power BI.

> The original raw dataset is not included in this repository. The repository contains the analysis workflow and documentation rather than redistributing the source dataset.
