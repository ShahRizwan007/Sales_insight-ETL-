
# Sales Insight - ETL (Python + SQL + Power BI)

This dataset contains sales information of retail orders from a store. In this project, I extract sales insights from the dataset, such as total revenue, profit margin, which country contributes the most to revenue, and which contributes the most to profit margin, along with other useful insights.

# Approach
I am using the ETL (Extract, Transform, Load) methodology for this dataset, which means first we will extract the dataset, transform it into a usable format, and then load the data into an appropriate database to find insights.

**1. Extract:**
I used Python for extracting the dataset from Kaggle, and for that, I used the `opendatasets` library to download the dataset.
After downloading the dataset, I used Pandas to import the data into Python.

**2. Transform:**
After importing the data, the next step is to clean it.
Cleaning the data involves checking columns, changing some column names and their data types if required, checking for duplicate values and removing them if found, replacing some unwanted values with null values, replacing null values with mean, median, and mode for numerical and categorical data respectively, removing some unwanted columns, and adding some necessary columns, etc.

**3. Load:**
After transforming the data, I loaded the dataset into a MySQL database using SQLAlchemy, MySQL Connector, and Pandas libraries.
In MySQL, I found some sales insights, such as which are the top revenue-generating products, the highest-selling products by region, sales comparisons by each month and year, etc.

Finally, I created an interactive Power BI dashboard for easy understanding of the insights by stakeholders.

# Key Findings:
- In terms of revenue, the business is performing well, but the profit margin situation is concerning.
- Revenue increased from 2022 to 2023, but the profit margin decreased.
- The top revenue-contributing states are California, New York, and Washington, respectively.
- The Corporate segment contributes the most to revenue.
- The East region contributes the most to profit, and the Chairs sub-category contributes the most to profit margin.

# Tools Used:
- Python
- SQL
- Power BI

# Tool Learning:
- Python for extracting and cleaning data
- Advanced SQL queries
- Power BI DAX


**dataset link**:https://www.kaggle.com/datasets/ankitbansal06/retail-orders
**PowerBi dashboard Link**:https://app.powerbi.com/view?r=eyJrIjoiMTNjMjE0YTUtN2M4Ni00NzU4LTg0ZTctZTNkMjIyOGMwMGFiIiwidCI6IjM3YjRlMWVmLTg4NjgtNDliZC04ZmExLTg1M2I4MTNkNTY0ZSJ9

**follow me on github and linkedin for more useful data analyst project**

**github profile**:https://github.com/ShahRizwan007/Sales_insight-ETL-python-SQl-powerBi-
**linkedin profile**:www.linkedin.com/in/shahrizwan819









