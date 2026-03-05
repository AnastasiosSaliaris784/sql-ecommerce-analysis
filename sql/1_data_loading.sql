-- E-commerce Sales Analysis Project
-- Step 1: Data Loading

CREATE DATABASE online_retail;
USE online_retail;

CREATE TABLE raw_online_retail (
InvoiceNo VARCHAR(20),
StockCode VARCHAR(20),
Description TEXT,
Quantity INT,
InvoiceDate TEXT,
UnitPrice DECIMAL(10,2),
CustomerID INT,
Country VARCHAR(50)
);
