# E-commerce Sales Analysis

An end-to-end e-commerce analytics project using Google BigQuery SQL and Power BI to analyze sales performance, customer behavior, product performance, traffic channels, geography, and conversion funnel.

## Project Overview

This project analyzes historical Google Merchandise Store data available through the BigQuery public dataset.

The objective is to answer business questions such as:

- How much revenue did the business generate?
- Which countries and cities generate the most revenue?
- Which products sell the most and which products generate the most revenue?
- Which traffic channels bring the highest-value customers?
- Where do users drop off in the e-commerce funnel?
- How does revenue change over time?

## Dataset

**Source:** BigQuery Public Dataset

**Project:** `data-to-insights`

**Dataset:** `ecommerce`

**Main Table:** `all_sessions`

The raw table contains more than 21 million records and includes visitor, session, product, transaction, traffic, location, and e-commerce action information.

## Tools & Technologies

- Google BigQuery
- SQL
- Power BI
- GitHub

## Data Preparation

The analysis began with data profiling and quality checks.

Key issues identified:

- Multiple rows can belong to the same transaction.
- Transaction-level values can repeat across multiple rows.
- `productQuantity` contains extreme and negative values.
- Several transaction and product fields contain NULL values.

### Transaction-Level Cleaning

Transaction analysis was performed at the `transactionId` level to avoid double-counting.

Raw data:

`21,493,109 rows`

Transaction-related rows:

`56,409`

Unique transactions:

`23,918`

The transaction-level dataset was created by grouping records by `transactionId` and using the consistent `totalTransactionRevenue` value for each transaction.

## Key KPIs

| Metric | Value |
|---|---:|
| Total Revenue | $4.62M |
| Total Transactions | 23,918 |
| Average Order Value | $193.21 |
| Unique Visitors | 389,934 |
| Total Sessions | 518,514 |
| Average Session Duration | ~12.28 minutes |
| Average Pageviews per Session | ~19.5 |

## Key Analysis

### 1. Revenue Analysis

Total cleaned transaction-level revenue was approximately **$4.62M**.

December 2016 recorded the highest monthly revenue at approximately **$700.7K**.

### 2. Geographic Analysis

The United States generated approximately **$4.37M**, representing about **94.6%** of total revenue.

Top revenue-generating cities included:

- Mountain View
- New York
- San Francisco
- Sunnyvale
- Palo Alto

### 3. Product Analysis

The analysis compares products by both units sold and product-level revenue.

**Highest units sold among the validated product analysis:**

`Maze Pen` — 17,983 units

**Highest product-level revenue:**

`Nest Learning Thermostat 3rd Gen-USA - Stainless Steel` — approximately $873.8K

### 4. Traffic Channel Analysis

Referral traffic generated the highest revenue at approximately **$2.26M**.

Referral also had the highest conversion rate at **12.23%**.

Organic Search generated the highest number of sessions but had a lower conversion rate of **1.59%**.

### 5. E-commerce Funnel

| Stage | Sessions |
|---|---:|
| Product View | 163,863 |
| Add to Cart | 75,815 |
| Checkout | 39,376 |
| Purchase | 23,905 |

The largest drop-off occurred between **Product View and Add to Cart**, where 46.27% of product-view sessions progressed to the cart.

## Business Insights

- Revenue is highly concentrated in the United States.
- Referral traffic is the strongest acquisition channel by revenue and conversion.
- High-volume products are not necessarily the highest-revenue products.
- Product View to Add to Cart is the biggest funnel opportunity.
- November and December 2016 were the strongest sales months.

## Recommendations

- Strengthen referral partnerships and high-performing referral sources.
- Improve product-page content, pricing visibility, and calls to action.
- Monitor high-revenue products separately from high-volume products.
- Investigate opportunities to diversify revenue beyond the US market.
- Prepare stronger campaigns around historically strong sales periods.

## Power BI Dashboard

The project includes an interactive Power BI dashboard covering:

- Sales KPIs
- Revenue trends
- Revenue by country
- Revenue by city
- Traffic channel performance
- Product performance
- Conversion rates
- E-commerce funnel

### Dashboard Preview

![E-commerce Sales Dashboard](Dashboard/dashboard.png)

## Repository Structure

```text
Ecommerce-Sales-Analysis/
│
├── README.md
│
├── SQL/
│   ├── 01_data_understanding.sql
│   ├── 02_data_quality.sql
│   ├── 03_transaction_cleaning.sql
│   ├── 04_sales_analysis.sql
│   ├── 05_product_analysis.sql
│   ├── 06_customer_analysis.sql
│   ├── 07_traffic_conversion.sql
│   ├── 08_funnel_analysis.sql
│   └── 09_geographic_analysis.sql
│
└── Dashboard/
    ├── Ecommerce_Sales_Analysis.pbix
    └── dashboard.png

## Author
**Hitesh Mahakaliya**
