-- ============================================================
-- BMW Sales Analytics | Data Cleaning & Preparation
-- ============================================================

-- Preview raw data
SELECT * FROM bmw_sales_raw LIMIT 10;

-- Check row count and nulls across key columns
SELECT
    COUNT(*)                                                AS total_rows,
    SUM(CASE WHEN Model         IS NULL THEN 1 ELSE 0 END) AS null_model,
    SUM(CASE WHEN Year          IS NULL THEN 1 ELSE 0 END) AS null_year,
    SUM(CASE WHEN Region        IS NULL THEN 1 ELSE 0 END) AS null_region,
    SUM(CASE WHEN Fuel_Type     IS NULL THEN 1 ELSE 0 END) AS null_fuel_type,
    SUM(CASE WHEN Transmission  IS NULL THEN 1 ELSE 0 END) AS null_transmission,
    SUM(CASE WHEN Price_USD     IS NULL THEN 1 ELSE 0 END) AS null_price,
    SUM(CASE WHEN Sales_Volume  IS NULL THEN 1 ELSE 0 END) AS null_sales_volume
FROM bmw_sales_raw;

-- Check for duplicate record IDs
SELECT record_id, COUNT(*) AS dupes
FROM bmw_sales_raw
GROUP BY record_id
HAVING COUNT(*) > 1;

-- Spot outliers: suspiciously low or high prices
SELECT Model, Year, Region, Price_USD, Sales_Volume
FROM bmw_sales_raw
WHERE Price_USD <= 0 OR Sales_Volume <= 0
ORDER BY Price_USD ASC;

-- Create cleaned analytics table
CREATE TABLE bmw_analytics AS
SELECT
    record_id,
    TRIM(Model)                             AS Model,
    Year,
    TRIM(Region)                            AS Region,
    TRIM(Fuel_Type)                         AS Fuel_Type,
    TRIM(Transmission)                      AS Transmission,
    Engine_Size_L,
    Mileage_KM,
    Price_USD,
    Sales_Volume,
    ROUND(Price_USD * Sales_Volume, 2)      AS revenue_USD
FROM bmw_sales_raw
WHERE
    Model        IS NOT NULL
    AND Region   IS NOT NULL
    AND Price_USD > 0
    AND Sales_Volume > 0;

-- Confirm final row count
SELECT COUNT(*) AS clean_rows FROM bmw_analytics;
