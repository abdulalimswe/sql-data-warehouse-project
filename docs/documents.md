# 📘 Naming Conventions

This document outlines the naming conventions used for schemas, tables, views, columns, and other database objects in the Data Warehouse. Consistent naming enhances maintainability, readability, and governance across layers.

---

## 📑 Table of Contents

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)  
   - [Bronze Rules](#bronze-rules)  
   - [Silver Rules](#silver-rules)  
   - [Gold Rules](#gold-rules)
3. [Column Naming Conventions](#column-naming-conventions)  
   - [Surrogate Keys](#surrogate-keys)  
   - [Technical Columns](#technical-columns)
4. [Stored Procedure Naming Conventions](#stored-procedure-naming-conventions)

---

## 1. 🧭 General Principles

- ✅ **Use `snake_case`**: All names must be lowercase with underscores `_` between words.
- ✅ **Language**: Use English for all schema, table, column, and procedure names.
- 🚫 **Avoid Reserved Words**: Do not use SQL reserved keywords as identifiers.

---

## 2. 📂 Table Naming Conventions

### 🔶 Bronze Rules

- Tables must retain the original source system naming structure.
- Format:  
  **`<source_system>_<entity>`**
  - `source_system`: Name of the originating system (e.g., `crm`, `erp`)
  - `entity`: Exact table/entity name from the source system

**Example:**
- `crm_customer_info` → Customer data from CRM system

---

### 🟦 Silver Rules

- Follows the same structure as Bronze.
- Retains source fidelity while applying transformations.

- Format:  
  **`<source_system>_<entity>`**

**Example:**
- `erp_product_master` → Transformed ERP product master data

---

### 🟨 Gold Rules

- Tables are renamed to reflect business meaning, following a dimensional model (Star Schema).
- Format:  
  **`<category>_<entity>`**
  - `category`: Defines role of the table (`dim`, `fact`, `report`)
  - `entity`: Business-aligned, descriptive entity name

**Examples:**
- `dim_customers` → Customer dimension table  
- `fact_sales` → Fact table containing transactional sales data

#### 📘 Glossary of Gold Layer Prefixes

| Prefix       | Description            | Example                     |
|--------------|------------------------|-----------------------------|
| `dim_`       | Dimension table        | `dim_product`, `dim_region` |
| `fact_`      | Fact table             | `fact_orders`, `fact_sales` |
| `report_`    | Reporting layer table  | `report_monthly_sales`      |

---

## 3. 🧱 Column Naming Conventions

### 🔑 Surrogate Keys

- Primary keys in dimension tables use the `_key` suffix.

- Format:  
  **`<entity>_key`**

**Example:**
- `customer_key` → Surrogate key for the `dim_customers` table  
- `product_key` → Surrogate key for the `dim_products` table

---

### ⚙️ Technical Columns

- All system-generated or metadata-related columns start with the prefix `dwh_`.

- Format:  
  **`dwh_<column_name>`**

**Example:**
- `dwh_load_date` → Date the record was loaded into the warehouse  
- `dwh_updated_by` → System user or process that last modified the record

---

## 4. ⚙️ Stored Procedure Naming Conventions

- Procedures for data loading follow the pattern:

**Format:**  
**`load_<layer>`**

- `layer`: Specifies the target layer (`bronze`, `silver`, `gold`)

**Examples:**
- `load_bronze` → Loads data from external source to bronze tables  
- `load_silver` → Transforms and loads from bronze to silver  
- `load_gold` → Aggregates and loads analytical-ready data into gold views

---
