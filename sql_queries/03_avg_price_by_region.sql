-- ============================================================
-- BMW Sales Analytics | Average Price by Region
-- ============================================================

-- Average price, total revenue, and units sold per region
SELECT
    Region,
    ROUND(AVG(Price_USD), 2)        AS avg_price_usd,
    SUM(Sales_Volume)               AS total_units_sold,
    ROUND(SUM(revenue_USD), 2)      AS total_revenue_usd
FROM bmw_analytics
GROUP BY Region
ORDER BY avg_price_usd DESC;

-- Price range per region to spot market differences
SELECT
    Region,
    ROUND(MIN(Price_USD), 2)    AS min_price_usd,
    ROUND(MAX(Price_USD), 2)    AS max_price_usd,
    ROUND(AVG(Price_USD), 2)    AS avg_price_usd
FROM bmw_analytics
GROUP BY Region
ORDER BY avg_price_usd DESC;

-- Region + transmission mix (manual vs automatic by market)
SELECT
    Region,
    Transmission,
    COUNT(*)                        AS records,
    SUM(Sales_Volume)               AS total_units_sold,
    ROUND(SUM(revenue_USD), 2)      AS total_revenue_usd
FROM bmw_analytics
GROUP BY Region, Transmission
ORDER BY Region, total_units_sold DESC;
