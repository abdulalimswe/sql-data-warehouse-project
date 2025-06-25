/*
===============================================================================
Stored Procedure: bronze.load_bronze
===============================================================================

Purpose:
    This stored procedure is responsible for loading data into the 'bronze' schema 
    from external CSV files. It facilitates raw data ingestion as part of the 
    data warehouse ETL pipeline.

Functionality:
    - Truncates existing data in the target 'bronze' tables to ensure a clean load.
    - Loads new data from corresponding CSV files using the `BULK INSERT` command.

Parameters:
    None. 
    This stored procedure does not accept any input parameters or return any output.

Usage:
    To execute the procedure and load fresh data into the bronze layer, run:
        EXEC bronze.load_bronze;

Notes:
    - Ensure that the CSV files exist at the specified file paths with proper permissions.
    - File format and column mappings must align exactly with the table schema.
    - This procedure should typically be invoked as part of a scheduled ETL job or pipeline.

WARNING:
    Running this procedure will permanently delete any existing data in the 'bronze' tables 
    before inserting new records. Make sure this is intended before execution.

Author:
	Md. Abdul Alim — 25 Jun 2025

===============================================================================
*/


-- EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '===================================';
        PRINT 'Loading Bronze Layer';
        PRINT '===================================';

        PRINT '-----------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '-----------------------------------';

        SET @start_time = GETDATE();
        PRINT '>>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;  -- delete data --

        BULK INSERT bronze.crm_cust_info
        FROM '/home/abdulalimswe/Desktop/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

        SET @start_time = GETDATE();
        PRINT '>>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;  -- delete data --

        BULK INSERT bronze.crm_prd_info
        FROM '/home/abdulalimswe/Desktop/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';


        SET @start_time = GETDATE();
        PRINT '>>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;  -- delete data --

        BULK INSERT bronze.crm_sales_details
        FROM '/home/abdulalimswe/Desktop/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

        PRINT '-----------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '-----------------------------------';
       
       
        SET @start_time = GETDATE();
        PRINT '>>> Truncating Table: bronze.erp_CUST_AZ12';
        TRUNCATE TABLE bronze.erp_CUST_AZ12;  -- delete data --

        BULK INSERT bronze.crm_CUST_AZ12
        FROM '/home/abdulalimswe/Desktop/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';


        SET @start_time = GETDATE();
        PRINT '>>> Truncating Table: bronze.erp_LOC_A101';
        TRUNCATE TABLE bronze.erp_LOC_A101;  -- delete data --

        BULK INSERT bronze.erp_LOC_A101
        FROM '/home/abdulalimswe/Desktop/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';


        SET @start_time = GETDATE();
        PRINT '>>> Truncating Table: bronze.erp_PX_CAT_G1V2';
        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;  -- delete data --

        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM '/home/abdulalimswe/Desktop/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
        PRINT '>> -------------';

		SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT ' - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='   
    END TRY
    BEGIN CATCH
        PRINT '==================================================='
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
        PRINT 'Error Message' + ERROR_MESSAGE();
        PRINT  'Error Message'+ CAST (ERROR_MESSAGE() AS NVARCHAR);
        PRINT  'Error Message'+ CAST (ERROR_STATE() AS NVARCHAR);
        PRINT '===================================================='
    END CATCH
END
