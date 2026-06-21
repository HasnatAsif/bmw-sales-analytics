-- ============================================================
-- BMW Sales Analytics | Sales Trend by Year
-- ============================================================

-- Year-over-year revenue, volume, and average price
SELECT
    Year,
    SUM(Sales_Volume)               AS total_units_sold,
    ROUND(SUM(revenue_USD), 2)      AS total_revenue_usd,
    ROUND(AVG(Price_USD), 2)        AS avg_price_usd
FROM bmw_analytics
GROUP BY Year
ORDER BY Year ASC;

-- YoY revenue growth %
SELECT
    Year,
    ROUND(SUM(revenue_USD), 2) AS total_revenue_usd,
    ROUND(
        (SUM(revenue_USD) - LAG(SUM(revenue_USD)) OVER (ORDER BY Year)) * 100.0
        / LAG(SUM(revenue_USD)) OVER (ORDER BY Year),
    2) AS yoy_growth_pct
FROM bmw_analytics
GROUP BY Year
ORDER BY Year ASC;

-- Best-selling model per year
SELECT Year, Model, total_units_sold
FROM (
    SELECT
        Year,
        Model,
        SUM(Sales_Volume) AS total_units_sold,
        RANK() OVER (PARTITION BY Year ORDER BY SUM(Sales_Volume) DESC) AS rnk
    FROM bmw_analytics
    GROUP BY Year, Model
) ranked
WHERE rnk = 1
ORDER BY Year ASC;
