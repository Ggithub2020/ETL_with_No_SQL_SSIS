#ETL Workflow for Phone Number Validation

Overview

This ETL workflow extracts, validates, and loads phone number data from a CSV file into SQL Server using SSIS. It ensures data integrity by separating valid and invalid records.

Steps

Extract: Load data from TestData.csv.

Transform: Validate phone numbers (format 111-222-3333).

Load: Store valid records in SQL Server; log invalid records separately.

Technologies Used

SQL Server

SSIS

Python & PowerShell (for automation)

Table Schema

CREATE TABLE CustomersStaging (
    ID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(100)
);

Execution

SSIS package automates the ETL process.

Python & PowerShell scripts handle execution tasks.

Benefits

Ensures consistent and valid phone number data.

Automates data processing with SSIS.

Provides structured logging of invalid records.

Summary

This workflow improves data quality, reduces manual errors, and automates phone number validation.