-- ============================================================
-- BMW Sales Analytics | Revenue by Model
-- ============================================================

-- Total revenue, units sold, and avg price per model
SELECT
    Model,
    SUM(Sales_Volume)                                               AS total_units_sold,
    ROUND(AVG(Price_USD), 2)                                        AS avg_price_usd,
    ROUND(SUM(revenue_USD), 2)                                      AS total_revenue_usd,
    ROUND(
        SUM(revenue_USD) * 100.0 / SUM(SUM(revenue_USD)) OVER (), 2
    )                                                               AS revenue_share_pct
FROM bmw_analytics
GROUP BY Model
ORDER BY total_revenue_usd DESC;

-- Top 5 models by units sold
SELECT
    Model,
    SUM(Sales_Volume) AS total_units_sold
FROM bmw_analytics
GROUP BY Model
ORDER BY total_units_sold DESC
LIMIT 5;

-- Revenue by model and fuel type breakdown
SELECT
    Model,
    Fuel_Type,
    SUM(Sales_Volume)               AS total_units_sold,
    ROUND(SUM(revenue_USD), 2)      AS total_revenue_usd
FROM bmw_analytics
GROUP BY Model, Fuel_Type
ORDER BY Model, total_revenue_usd DESC;
