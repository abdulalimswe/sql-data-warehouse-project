# 📦 Data Catalog: Gold Layer

## Overview
The **Gold Layer** is the business-level data representation, structured to support analytical and reporting use cases. It consists of **dimension tables** and **fact tables** for specific business metrics.

---

## 1. `gold.dim_customers`

**Purpose:**  
Stores customer details enriched with demographic and geographic data.

**Columns:**

| Column Name     | Data Type    | Description                                                                                   |
|-----------------|--------------|-----------------------------------------------------------------------------------------------|
| customer_key    | INT          | Surrogate key uniquely identifying each customer record in the dimension table.               |
| customer_id     | INT          | Unique numerical identifier assigned to each customer.                                        |
| customer_number | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing.         |
| first_name      | NVARCHAR(50) | The customer's first name, as recorded in the system.                                         |
| last_name       | NVARCHAR(50) | The customer's last name or family name.                                                      |
| country         | NVARCHAR(50) | The country of residence for the customer (e.g., 'Australia').                                |
| marital_status  | NVARCHAR(50) | The marital status of the customer (e.g., 'Married', 'Single').                               |
| gender          | NVARCHAR(50) | The gender of the customer (e.g., 'Male', 'Female', 'n/a').                                   |
| birthdate       | DATE         | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., 1971-10-06).                |
| create_date     | DATE         | The date when the customer record was created in the system.                                  |

---

## 2. `gold.dim_products`

**Purpose:**  
Provides information about the products and their attributes.

**Columns:**

| Column Name          | Data Type    | Description                                                                                      |
|----------------------|--------------|--------------------------------------------------------------------------------------------------|
| product_key          | INT          | Surrogate key uniquely identifying each product in the product dimension table.                  |
| product_id           | INT          | A unique identifier assigned to the product for internal tracking and referencing.               |
| product_number       | NVARCHAR(50) | Alphanumeric code representing the product, used for categorization or inventory.                |
| product_name         | NVARCHAR(50) | Descriptive name of the product, including details like type, color, and size.                   |
| category_id          | NVARCHAR(50) | Identifier for the product's category, linking to high-level classification.                     |
| category             | NVARCHAR(50) | Broad classification of the product (e.g., Bikes, Components).                                  |
| subcategory          | NVARCHAR(50) | Detailed classification of the product within its category.                                      |
| maintenance_required | NVARCHAR(50) | Indicates if the product requires maintenance (e.g., 'Yes', 'No').                               |
| cost                 | INT          | Cost or base price of the product, in whole currency units.                                      |
| product_line         | NVARCHAR(50) | Product line or series (e.g., Road, Mountain).                                                   |
| start_date           | DATE         | The date when the product became available for sale or use.                                      |

---

## 3. `gold.fact_sales`

**Purpose:**  
Stores transactional sales data for analytical purposes.

**Columns:**

| Column Name   | Data Type    | Description                                                                                  |
|---------------|--------------|----------------------------------------------------------------------------------------------|
| order_number  | NVARCHAR(50) | Unique alphanumeric identifier for each sales order (e.g., 'SO54496').                      |
| product_key   | INT          | Surrogate key linking the order to the product dimension table.                             |
| customer_key  | INT          | Surrogate key linking the order to the customer dimension table.                            |
| order_date    | DATE         | The date when the order was placed.                                                         |
| shipping_date | DATE         | The date when the order was shipped to the customer.                                        |
| due_date      | DATE         | The date when the payment for the order was due.                                            |
| sales_amount  | INT          | Total value of the sale for the line item, in whole currency units.                         |
| quantity      | INT          | Number of product units ordered in the line item.                                           |
| price         | INT          | Price per unit of the product, in whole currency units.                                     |

---
