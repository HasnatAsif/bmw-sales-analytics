-- ============================================================
-- BMW Sales Analytics | Analytics View
-- ============================================================

-- Reusable summary view with window functions
CREATE VIEW vw_bmw_summary AS
SELECT
    record_id,
    Model,
    Year,
    Region,
    Fuel_Type,
    Transmission,
    Engine_Size_L,
    Mileage_KM,
    Price_USD,
    Sales_Volume,
    revenue_USD,
    SUM(revenue_USD) OVER (PARTITION BY Model)          AS model_total_revenue,
    SUM(revenue_USD) OVER (PARTITION BY Region)         AS region_total_revenue,
    SUM(revenue_USD) OVER (PARTITION BY Year)           AS year_total_revenue,
    SUM(revenue_USD) OVER (PARTITION BY Fuel_Type)      AS fuel_type_total_revenue,
    SUM(revenue_USD) OVER ()                            AS overall_revenue,
    ROUND(
        revenue_USD * 100.0 / SUM(revenue_USD) OVER (), 4
    )                                                   AS pct_of_total,
    RANK() OVER (ORDER BY revenue_USD DESC)             AS revenue_rank
FROM bmw_analytics;

-- Sample: top 20 records by revenue with % of total
SELECT
    Model,
    Year,
    Region,
    Fuel_Type,
    revenue_USD,
    pct_of_total,
    revenue_rank
FROM vw_bmw_summary
ORDER BY revenue_rank
LIMIT 20;
