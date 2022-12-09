Fetch Rewards Take Home Assessment (Data Analyst)


This is a submission for takehome assessment of Fetch Rewards for Data Analyst Role

Dependencies:
- Python, Jupyter, SQL Server
- Python Packages Used: os, gzip, shutil, pyodbc, urllib, pandas, numpy, datetime, sqlalchemy, pymysql

Execution Sequence:
- Load the gzip files in the Data_gzip folder
- Run the python notebook named : Fetch_Rewards_ERD_Table_Creation.ipynb
- CSV files are generated and stored in Data_csv folder
- Load the CSV files from Data_csv into SQL Server 
- Check the ERD Diagram to verify the relations between tables
- Execute the queries in Business_Stakeholder folder which is inside SQL_Queries folder which answer business questions 1, 3 and 4.
- The business stakeholder queries along with the output can also be seen in Business_Stakeholder_Queries document
- Execute the queries in Data_Quality folder inside SQL_Queries to verify the Data Quality Issues
- The queries for data quality along with the output can also be seen in Data_Quality_Issues document
- Lastly, review the email to stakeholders in the file Stakeholder_Communication document
