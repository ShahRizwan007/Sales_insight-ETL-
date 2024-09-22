# Sales_insight-ETL(PYTHON+SQL+POWERBI)

This datase contain sales information of retail orders of a store, In this project I extract sales insight from dataset like Total Revenue,profit margin ,which country contributes most in revenue and which is contributing most in Profit margin and more useful insight.

# Approach
I am going to use ETL(Extract Transform Load) methodology for this dataset means first we are going to extract dataset ,transform it to usable format and then load data to appropiate database for finding data Insight.

-1.Extract:
I am using python for extracting dataset from kaggle for that i am used opendatasets library for downloading dataset.
After downloading dataset, I used Pandas for importing data in python.

--2.Transform:
After importing data ,next step is to clean data.
Cleaning data envolves checking column ,change some column name and thier data type if required,check for duplicates values and removed if found any,replace some unwanted value with null values,replacing null value with mean,median and mode for numerical and categorical data respectively,remove some unwanted column and add some necessary column etc.

--3.Load:
After Transforming data I loaded dataset into Mysql database using Sqlalchemy,Mysql connector and pandas libraries.
In mysql, I Found some sales insight like which are top revenue genrating product,highest selling product by region ,sales comparison by each month and year etc.

Finally i created a interactive powerbi dashboard for simple understanding of insight for stake holders.

# Key findings:
In terms of revenue buisness is performing good but in terms of profit margin situtaion is not happy.
Revenue is increase from 2022 to 2023 but profit margin decrease.
Top revenue contributing states are California,New York and washington respectively.
Corporate segment contributes most in revenue.
East region contributes most in profit and chairs sub category contributes most in profit margin.

# Tool Used:
--Python
--SQL
--Power Bi

# Tool learing
--pyhon for extracting and cleaning data
--SQL advances queries
--power bi dax

# dataset link:https://www.kaggle.com/datasets/ankitbansal06/retail-orders

# follow me on github and linkedin for more useful data analyst project

# github profile:https://github.com/ShahRizwan007/Sales_insight-ETL-python-SQl-powerBi-
# linkedin profile :www.linkedin.com/in/shahrizwan819









