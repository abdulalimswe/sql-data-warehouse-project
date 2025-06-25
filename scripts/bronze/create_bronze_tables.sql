/*
===============================================================================
DDL Script: Create Tables in 'bronze' Schema
===============================================================================

Purpose:
    This script defines and creates all necessary tables within the 'bronze' schema.
    If any of the target tables already exist, they will be dropped before creation.
    Use this script to reset and reinitialize the DDL structure for the 'bronze' layer.

Scope:
    - Drops existing tables (if any) in the 'bronze' schema.
    - Creates new tables with the defined structure.

Usage:
    Execute this script whenever you need to recreate or modify the base (raw data) 
    structure in the 'bronze' layer of the Data Warehouse.

Note:
    The 'bronze' schema typically stores raw, unprocessed, or lightly processed data 
    as it is ingested from source systems.

WARNING:
    Running this script will result in the loss of any existing data in the 'bronze' tables.

Author:
    Md. Abdul Alim — 25 Jun 2025

===============================================================================
*/

IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;   
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_material_status NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);
GO

IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO
CREATE TABLE bronze.crm_prd_info(
    prd_id          INT,
    prd_key         NVARCHAR(50),
    prd_nm          NVARCHAR(50),
    prd_cost        INT,
    prd_line        NVARCHAR(50),
    prd_start_dt    DATETIME,
    prd_end_dt      DATETIME
);
GO

IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO
CREATE TABLE bronze.crm_sales_details(
    sls_ord_num     NVARCHAR(50),
    sls_prd_key     NVARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    INT,
    sls_ship_dt     INT,
    sls_due_dt      INT,
    sls_sales       INT,
    sls_quantity    INT,
    sls_price       INT
);

GO
IF OBJECT_ID ('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO
CREATE TABLE bronze.erp_loc_a101 (
    cid   NVARCHAR(50),
    cntry NVARCHAR(50)
);
GO

IF OBJECT_ID ('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO
CREATE TABLE bronze.erp_cust_az12(
    cid     NVARCHAR(50),
    bdate   DATE,
    gen     NVARCHAR(50)
);
GO

IF OBJECT_ID ('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO
CREATE TABLE bronze.erp_px_cat_g1v2(
    id          NVARCHAR(50),
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50)
);
GO
