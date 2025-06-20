# 📊 Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This portfolio project demonstrates a complete end-to-end data warehousing and analytics solution — from building a modern data warehouse to delivering actionable business insights using SQL.

---

## 🏗️ Data Architecture: Medallion Layers

We adopt the **Medallion Architecture** consisting of **Bronze**, **Silver**, and **Gold** layers to organize and transform data effectively.

![Data Architecture](docs/data_architecture.png)

- **Bronze Layer**: Stores raw data ingested from CSV files into SQL Server.
- **Silver Layer**: Cleansed and standardized data prepared for analysis.
- **Gold Layer**: Final business-ready data modeled into a **Star Schema** for reporting and analytics.

---

## 📖 Project Overview

This project includes:

1. **Data Architecture Design** – Using Medallion layered structure.
2. **ETL Pipelines** – Extraction, Transformation, and Loading of ERP and CRM data.
3. **Data Modeling** – Star schema design using fact and dimension tables.
4. **Analytics & Reporting** – SQL-based insights into customer behavior, sales, and product trends.

🎯 Ideal for showcasing skills in:
- SQL Development
- Data Warehousing
- ETL Development
- Data Engineering
- Data Modeling
- Business Intelligence & Analytics

---

## 🛠️ Tools & Resources

Everything is **Free & Open Source** 🎉

| Tool/Link | Description |
|----------|-------------|
| [Datasets](datasets/) | CSV files for ERP & CRM systems |
| [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) | Lightweight RDBMS |
| [SSMS](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16) | SQL Server Management Studio |
| [Draw.io](https://www.drawio.com/) | Data modeling & architecture diagrams |
| [Project Template (Notion)](https://www.notion.com/templates/sql-data-warehouse-project) | Project planning template |
| [Project Phases & Tasks (Notion)](https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4) | Step-by-step execution guide |

---

## 🚀 Project Requirements

### 🔧 Data Engineering

- **Source Systems**: ERP & CRM datasets (CSV)
- **Data Cleansing**: Handle missing values, duplicates, standardization
- **Integration**: Merge sources into one unified model
- **Modeling**: Build star schema (Fact & Dimension tables)
- **Documentation**: Fully documented ETL flow & data catalog

### 📊 Data Analytics & Reporting

- SQL queries and insights into:
  - 🧑‍🤝‍🧑 Customer Behavior
  - 📦 Product Performance
  - 💰 Sales Trends

Refer to [`docs/requirements.md`](docs/requirements.md) for full details.

---

## 📂 Repository Structure

data-warehouse-project/
│
├── datasets/ # Raw CSV datasets (ERP & CRM)
│
├── docs/ # Diagrams & documentation
│ ├── etl.drawio
│ ├── data_architecture.drawio
│ ├── data_catalog.md
│ ├── data_flow.drawio
│ ├── data_models.drawio
│ ├── naming-conventions.md
│
├── scripts/ # SQL scripts
│ ├── bronze/ # Load raw data
│ ├── silver/ # Clean & transform data
│ ├── gold/ # Create star schema
│
├── tests/ # Data validation & quality scripts
│
├── README.md # Project overview
├── LICENSE # MIT License
├── .gitignore # Git ignore config
└── requirements.txt # Dependencies and setup requirements

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE).  

---
