# 🛒 Walmart Sales Analysis: End-to-End SQL + Python Project 

![Project Pipeline](https://github.com/najirh/Walmart_SQL_Python/blob/main/walmart_project-piplelines.png)

> An end-to-end data analysis solution designed to extract critical business insights from Walmart sales data using **Python** and **MySQL**.

![Python](https://img.shields.io/badge/Python-3.8+-blue?style=flat-square&logo=python)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange?style=flat-square&logo=mysql)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-green?style=flat-square&logo=pandas)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

---

## <picture><source media="(prefers-color-scheme: dark)" srcset="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=18&pause=1000&color=00C9FF&width=300&lines=Project+Overview"/><img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=18&pause=1000&color=FF6B6B&width=300&lines=Project+Overview"/></picture>

<h2><span style="color:#FF6B6B">📌 Project Overview</span></h2>

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize **Python** for data processing and analysis, **SQL** for advanced querying, and structured problem-solving techniques to solve key business questions.

The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.

---

## 🔧 Project Steps

### 1. Set Up the Environment
- **Tools Used:** Visual Studio Code (VS Code), Python, MySQL
- **Goal:** Create a structured workspace within VS Code and organize project folders for smooth development and data handling.

---

### 2. Set Up Kaggle API
- **API Setup:** Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
- **Configure Kaggle:**
  - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
  - Use the command below to pull datasets directly into your project:
```bash
kaggle datasets download -d <dataset-path>
```

---

### 3. Download Walmart Sales Data
- **Data Source:** Use the Kaggle API to download the Walmart sales datasets from Kaggle.
- **Dataset Link:** [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
- **Storage:** Save the data in the `data/` folder for easy reference and access.

---

### 4. Install Required Libraries and Load Data
- **Libraries:** Install necessary Python libraries using:
```bash
pip install pandas numpy sqlalchemy mysql-connector-python
```
- **Loading Data:** Read the data into a Pandas DataFrame for initial analysis and transformations.

---

### 5. Explore the Data
- **Goal:** Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
- **Analysis:** Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

---

### 6. Data Cleaning
- **Remove Duplicates:** Identify and remove duplicate entries to avoid skewed results.
- **Handle Missing Values:** Drop rows or columns with missing values if insignificant; fill values where essential.
- **Fix Data Types:** Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
- **Currency Formatting:** Use `.replace()` to handle and format currency values for analysis.
- **Validation:** Check for any remaining inconsistencies and verify the cleaned data.

---

### 7. Feature Engineering
- **Create New Columns:** Calculate the **Total Amount** for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
- **Enhance Dataset:** Adding this calculated field will streamline further SQL analysis and aggregation tasks.

---

### 8. Load Data into MySQL
- **Set Up Connections:** Connect to MySQL using `sqlalchemy` and load the cleaned data into the database.
- **Table Creation:** Set up tables in MySQL using Python SQLAlchemy to automate table creation and data insertion.
- **Verification:** Run initial SQL queries to confirm that the data has been loaded accurately.

---

### 9. SQL Analysis: Complex Queries and Business Problem Solving
- **Business Problem-Solving:** Write and execute complex SQL queries to answer critical business questions, such as:
  - Revenue trends across branches and categories.
  - Identifying best-selling product categories.
  - Sales performance by time, city, and payment method.
  - Analyzing peak sales periods and customer buying patterns.
  - Profit margin analysis by branch and category.
- **Documentation:** Keep clear notes of each query's objective, approach, and results.

---

### 10. Project Publishing and Documentation
- **Documentation:** Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
- **Project Publishing:** Publish the completed project on GitHub, including:
  - The `README.md` file (this document).
  - Jupyter Notebooks (if applicable).
  - SQL query scripts.
  - Data files (if possible) or steps to access them.

---

## ✅ Requirements

| Requirement | Details |
|---|---|
| Python | 3.8+ |
| Database | MySQL |
| Libraries | `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python` |
| API | Kaggle API Key (for data downloading) |

---

## 🚀 Getting Started

**1. Clone the repository:**
```bash
git clone <repo-url>
```

**2. Install Python libraries:**
```bash
pip install -r requirements.txt
```

**3.** Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## 📁 Project Structure
```plaintext
|-- data/                     # Raw data and transformed data
|-- sql_queries/              # SQL scripts for analysis and queries
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- README.md                 # Project documentation
|-- requirements.txt          # List of required Python libraries
|-- main.py                   # Main script for loading, cleaning, and processing data
```

---

## 📊 Results and Insights

- **Sales Insights:** Key categories, branches with highest sales, and preferred payment methods.
- **Profitability:** Insights into the most profitable product categories and locations.
- **Customer Behavior:** Trends in ratings, payment preferences, and peak shopping hours.

---

## 🔮 Future Enhancement

- Integration with a dashboard tool (e.g., **Power BI** or **Tableau**) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---

## 📄 License

This project is licensed under the **MIT License**.

---

## 🙏 Acknowledgments

- **Data Source:** [Kaggle's Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
- **Inspiration:** Walmart's business case studies on sales and supply chain optimization.
