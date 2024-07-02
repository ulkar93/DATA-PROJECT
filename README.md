# Database and Sales Forecasting project
This repository contains a comprehensive database and sales forecasting project. The project is divided into three main stages: database creation, data cleaning and transformation, and exploratory data analysis (EDA) along with sales forecasting. Each stage is handled by different scripts provided in this repository.

## Table of Contents
- Project Overview
- File Descriptions
- Database Creation
- Data Cleaning and Transformation
- Exploratory Data Analysis and Sales Forecasting
- Setup Instructions
- Usage
- Contributing
- License

## Project Overview
The goal of this project is to set up a database, clean and transform raw data, and perform exploratory data analysis and sales forecasting. The workflow is as follows:
Create and initialize the database.
Clean and transform raw data.
Perform EDA and forecast future sales.

# File Descriptions
## Database Creation
[DATABASE.sql](https://github.com/ulkar93/DATA-PROJECT/blob/main/DATABASE.sql): This script contains SQL commands to create the necessary database tables and constraints.

## Data Cleaning and Transformation
- [DATA CLEANING STEP1.sql](https://github.com/ulkar93/DATA-PROJECT/blob/main/DATA%20CLEANING%20STEP1.sql): This script is the first step in the data cleaning process.
- [DATA CLEANING STEP 2-7.sql](https://github.com/ulkar93/DATA-PROJECT/blob/main/DATA%20CLEANING%20STEP%202-7.sql): This script contains subsequent steps (2 to 7) for cleaning and transforming the data.
- [view.sql](https://github.com/ulkar93/DATA-PROJECT/blob/main/view.sql): This script creates views for easier data access and analysis.

## Exploratory Data Analysis and Sales Forecasting
[EDA&SALES FORECAST.ipynb](https://github.com/ulkar93/DATA-PROJECT/blob/main/EDA%26SALES%20FORECAST.ipynb) : This Jupyter Notebook contains Python code for performing EDA and sales forecasting using the cleaned data.

## Sales dashboard visualization
- [Sales dashboard](https://github.com/ulkar93/DATA-PROJECT/blob/main/DATA%20VISUALISATION.pbix) - This Power BI file contains data transform and cleaning steps, data model, dax and data visulization of [DATABASE.sql](https://github.com/ulkar93/DATA-PROJECT/blob/main/DATABASE.sql)
- [Sales dashboard preview file](https://github.com/ulkar93/DATA-PROJECT/blob/main/DATA%20VISUALISATION%20preview%20file.pdf) - This PDF file contains preview for dashboard without any installation software.


# Database Creation
To initialize the database, execute the DATABASE.sql script. This script will create the necessary tables and define the constraints required for the project.

# Data Cleaning and Transformation
Data cleaning and transformation are divided into multiple steps:
1. Execute DATA CLEANING STEP1.sql to perform the initial data cleaning.
2. Execute DATA CLEANING STEP 2-7.sql to continue with the cleaning and transformation processes.
3. Execute view.sql to create views that will be used in the EDA and forecasting stage.

# Exploratory Data Analysis and Sales Forecasting
The EDA&SALES FORECAST.ipynb Jupyter Notebook contains all the necessary code for conducting EDA and forecasting future sales. It includes data visualization, statistical analysis, and predictive modeling.

To run the notebook, you need to have Jupyter installed along with the required Python libraries. You can install the dependencies using the following command:
```bash
pip install -r requirements.txt
```
Then, launch the Jupyter Notebook:
EDA&SALES FORECAST.ipynb

# Usage
Follow the instructions provided in each section to execute the SQL scripts and Jupyter Notebook. Ensure that your database is correctly set up and that all dependencies are installed.

# Contributing
Contributions are welcome! Please open an issue to discuss your ideas or submit a pull request.

# License
This project is licensed under the MIT License. See the LICENSE file for more details.
