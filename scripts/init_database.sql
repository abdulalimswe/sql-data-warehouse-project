/*
=============================================================
Database Initialization Script: DataWarehouse
=============================================================

Purpose:
    This script initializes the 'DataWarehouse' database environment. 
    It performs the following actions:
        - Checks for the existence of a database named 'DataWarehouse'.
        - Drops the database if it already exists.
        - Recreates the 'DataWarehouse' database.
        - Creates three schemas within the database: 'bronze', 'silver', and 'gold'.

Schemas:
    - bronze:   Typically used to store raw, unprocessed data.
    - silver:   Contains cleaned and transformed data.
    - gold:     Holds aggregated, business-ready data for analytics and reporting.

WARNING:
    This script will drop the existing 'DataWarehouse' database if it exists.
    ⚠️ All data in the database will be **permanently deleted**.
    Please ensure you have proper backups before executing this script.

Author:
    [Your Name or Team Name] — [Date or Version if needed]

Environment:
    Compatible with SQL Server (or specify your DBMS if different)

=============================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
