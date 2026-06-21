# BMW Sales Analytics

## Overview

This project analyzes BMW sales data using SQL and Power BI to understand revenue performance, model popularity, and regional sales trends.

The dataset was cleaned and transformed using SQL before being used to build a Power BI dashboard for business insights.

---

## Tools Used

- SQL (SQLite)
- Power BI

---

## Data

The repository contains both the **raw dataset** and the **cleaned analytics dataset**.

- `data/BMW_sales_data_raw.csv` → Original dataset (~50,000 records)
- `data/bmw_analytics.csv` → Cleaned dataset used for analysis and dashboard creation

| Column | Description |
|---|---|
| `Model` | BMW model (e.g. 3 Series, X5, i8) |
| `Year` | Year of sale |
| `Region` | Sales region (Asia, Europe, North America, etc.) |
| `Fuel_Type` | Petrol, Diesel, or Hybrid |
| `Transmission` | Manual or Automatic |
| `Engine_Size_L` | Engine displacement in litres |
| `Mileage_KM` | Vehicle mileage in kilometres |
| `Price_USD` | Sale price in USD |
| `Sales_Volume` | Number of units sold |
| `revenue_USD` | Derived revenue (Price × Volume) |

---

## Data Source

The dataset used in this project was sourced from Kaggle and is included for educational and portfolio purposes.

---

## Dashboard

![BMW Dashboard](dashboard/bmw_dashboard.png)

The dashboard includes:

- Total Revenue KPI
- Total Units Sold KPI
- Average Price KPI
- Revenue by Model
- Revenue by Region
- Sales Trend by Year

---

## SQL Transformations & Queries

| File | Description |
|---|---|
| [`01_data_cleaning.sql`](sql_queries/01_data_cleaning.sql) | Null checks, duplicate detection, outlier identification, and creation of the cleaned analytics table |
| [`02_revenue_by_model.sql`](sql_queries/02_revenue_by_model.sql) | Total revenue, units sold, avg price, and revenue share % per model; fuel type breakdown |
| [`03_avg_price_by_region.sql`](sql_queries/03_avg_price_by_region.sql) | Average price and revenue by region; price range analysis; transmission mix by market |
| [`04_sales_trend_by_year.sql`](sql_queries/04_sales_trend_by_year.sql) | Year-over-year revenue and volume trends; YoY growth %; best-selling model per year |
| [`05_analytics_view.sql`](sql_queries/05_analytics_view.sql) | Reusable summary view using window functions — revenue partitioned by model, region, year, and fuel type |

---

## Project Goal

The objective of this project was to demonstrate a typical data analytics workflow:

1. Data preparation and transformation using SQL
2. Creating derived business metrics such as revenue
3. Analyzing model and regional performance
4. Building an interactive dashboard for business insights
