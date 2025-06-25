/*
===============================================================================
Quality Checks: Gold Layer Validation
===============================================================================

Purpose:
    This script performs essential data quality checks to validate the integrity, 
    consistency, and accuracy of the data in the Gold Layer of the data warehouse.

Checks Performed:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Logical consistency across related tables and key relationships.

Usage:
    - Run this script after loading the Gold Layer to verify data readiness.
    - Investigate and resolve any discrepancies identified by the queries.
    - These checks should be integrated into the regular data validation workflow.

NOTE:
    These checks are critical before releasing data to downstream analytics, 
    dashboards, or business reporting tools.

Author:
    Md. Abdul Alim - 25 June 2025

===============================================================================
*/

-- ====================================================================
-- Check: Uniqueness of Customer Key in gold.dim_customers
-- ====================================================================
-- Description:
--     Verifies that each customer key appears only once in the dimension.
--     Ensures surrogate keys are unique (a core principle of dimension tables).
-- Expected Result:
--     No records returned (i.e., no duplicates exist)
-- ====================================================================

SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.product_key'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results 
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_sales'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  
