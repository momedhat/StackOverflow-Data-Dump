# Stack Overflow : Exchange Data Dump
![logo-stackoverflow](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/1ecba10a-938c-4dcb-a09b-1434f2c169de)
<br><br>

## Project Overview
Stack Overflow is a popular online community and question-and-answer (Q&A) platform that is focused on programming and technology-related topics. It was created to provide a platform for developers and other tech professionals to ask questions, share knowledge, and collaborate on problem-solving. <br><br>
The project's objective is to transform and load Stack Overflow data into a Data Warehouse (DWH) using ETL processes and scheduling. Subsequently, the data will be modeled in SQL Server Analysis Services (SSAS) for analytical insights. The final step involves creating an intuitive Power BI dashboard to visually represent the Stack Overflow data from the years 2008, 2009, and 2010, providing a comprehensive and user-friendly analytics solution.

## Data Overview
![datasource](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/a01c700d-00d4-4459-bdea-511aa875b1ba)

> link of data source schema overview: https://sedeschema.github.io/#Badges

The main target is: **Posts**, **Users**, **Votes**, and **Comments**.<br>
Our primary data sources consist of the StackOverflow2010 Databases, with destination tables on Azure Cloud named PostTypes, VoteTypes, and LinkTypes. The objective is to establish an efficient ETL pipeline for seamless data transfer.


## Main Tasks
* Extract data from two different sources: blob storage, SQL server database.
* Data Integration and Transformation:
  * Develop an SSIS package to extract data from the Operational Data Store (ODS).
  * Implement necessary transformations based on business rules and requirements.
  * Load the transformed data into the SQL Server data warehouse.
* Staging Layer:
  * Create a staging layer in the SSIS package to temporarily store the transformed data before loading it into the data warehouse.
  * This layer helps in validating and ensuring data quality before permanent storage.
* Build a Data Warehouse that for efficient data storage and retrieval and analytical purposes.
* Scheduling:
  * Configure logging and notifications within the SSIS package to receive alerts in case of any issues during execution.
  * Monitor the execution logs regularly to ensure that the SSIS package runs successfully and troubleshoot any issues promptly.
  * Adjust the schedule as needed based on changing business needs, data volume, and performance considerations.
* Backup and Azure blob storage:
  * Integrate a step in the SSIS package to take a backup of the output data.
  * Upload the backup into Azure Blob Storage for additional data redundancy and disaster recovery.
* Visualize main insights through the utilization of Power BI.


## Snapshots
![database](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/e71a2369-59ae-4004-84e5-24b0d3b90a02)

#### Incremental Load ODS Package Details
Tables in ODS Database: Two new tables are created in the ODS Database: **Config_table** and **log_table**.
* **Config_table**: Stores the largest date value for the concerned four tables.
![image](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/fdb50f56-1f18-4949-b789-70695fae64e1)

* **log_table**: Keeps track of the number of rows entered or modified in the data source.
![image](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/a5118560-4f46-4465-b8ac-c9ca5da092bc)

#### Data Warehouse 
![DWH_snapshot](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/4c063e1a-d46d-4f52-a163-ccb477cb6b99)
Creation Of A Data Warehouse With A Snowflake Schema And The Development Of An SSIS Package For Data Integration And Storage.


#### SSIS Packages

* **Initial Load:**
![Initial_load](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/c0462b86-6e65-4247-b76f-baad7534f07d)

* **Incremental Load:**
![Increamental_load](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/1e76df45-ff4c-47f5-bb92-62bce9487179)

* **Data Warehouse**
![dwh](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/64a1b1db-d759-4941-9663-95eaac416878)
![dim_tags](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/cdca7f30-72c5-49a8-80fb-c534dbf5c0e3)
![dim_comment](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/c616e695-6532-4d10-ac3f-87e8d444ba09)

#### Blob Storage Container
![image](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/5e5e50db-6c43-42d4-872a-403999c0c0d7)


#### SSAS
![image](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/2cd8f265-90db-4b30-9976-5213572e8a93)

#### Power BI Dashboard
![image](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/099c2a1a-f0d5-4c74-a34c-9c67ee9555cb)
![image](https://github.com/momedhat/StackOverflow-Data-Dump/assets/90194000/5e9fd2d6-28db-4466-a901-a76aac19de09)



