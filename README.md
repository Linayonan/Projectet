# **Job Ads Snowflake Data Warehouse Project**

## **Overview**

This project builds a data warehouse for economy job advertisements using Snowflake, dbt (Data Build Tool), and dlt (Data Loading Tool). The pipeline fetches job ads from an external API, processes the data, and stores it in a Snowflake database for analytics and reporting. A Streamlit dashboard visualizes the acquired job listings data.

## **Components**

### **Tools Used**

* **Snowflake:** Cloud-based data warehousing service.  
* **dbt:** Tool for transforming data within your warehouse.  
* **dlt:** Tool for loading data from external sources into Snowflake.  
* **Streamlit:** Framework for building interactive dashboards.

## **How to Run the Program**

### **Prerequisites, configuration and installation**

1. **Python Setup**:

Ensure you have Python installed. Free to download from [python.org](https://www.python.org/downloads/).

Create a virtual environment:  
`python -m venv venv`  
`source venv/bin/activate  #On macOS/Linux`  
`venv\Scripts\activate  #On Windows`  
	  
Install the required packages:  
	`pip install -r requirements.tx`  
	

2. **Snowflake setup**  
   A snowflake account is required. To create and configure your snowflake account  
   please refer to snowflakes own website for account creation.  
   [https://signup.snowflake.com/](https://signup.snowflake.com/)  
      
3. **Environment Variables**:  
   Create a `.env` file in the project root. Open a text editor and saving the following lines as `.env`  
   insert your own details  
   `SNOWFLAKE_USER=<your_snowflake_username>`  
   `SNOWFLAKE_PASSWORD=<your_snowflake_password>`  
   `SNOWFLAKE_ACCOUNT=<your_snowflake_account>`  
   `SNOWFLAKE_WAREHOUSE=<your_snowflake_warehouse>`  
   `SNOWFLAKE_DATABASE=<your_snowflake_database>`  
   `SNOWFLAKE_SCHEMA=<your_snowflake_schema>`  
   `SNOWFLAKE_ROLE=<your_snowflake_role>`  
4. **dlt Configuration**:  
   Install dbt: `pip install dlt`  
   Create or edit `secrets.toml` file for dlt and add your own details

   `api_secret_key = "api_secret_key"`  
     
   `[destination.snowflake.credentials]`  
   `database = "your_database"`    
   `password = "password123"`    
   `username = "your_user"`    
   `host = "your_snowflake_host_id"`    
   `warehouse = "your_snowflake_warehouse"`    
   `role = "your_assigned_role"`

5. **dbt Configuration**:  
   Install dbt: `pip install dbt`  
   Create or edit `profiles.yml` file in your `~/.dbt/` directory (for macOS/Linux) or `%USERPROFILE%\.dbt\` directory (for Windows) and add your own details:  
   `dbt_code:`  
     `target: dev`  
     `outputs:`  
       `dev:`  
         `type: snowflake`  
         `account: <your_account>`  
         `user: <your_username>`  
         `password: <your_password>`  
         `role: <your_role>`  
         `warehouse: <your_warehouse>`  
         `database: <your_database>`  
         `schema: <your_schema>`  
   

### **Usage Instructions**

#### **Running the Data Pipeline**

To fetch job ads from the API and load them into Snowflake, run the following script:  
`python jobsearch.py`

This script will:  
	Connect to Arbetsförmedlingens API.  
	Fetch economy job listings.  
	Load the data into Snowflake.

**Running the dbt**  
run dbt with the following script:  
`dbt run`

This script will:  
Compile the models in the dbt project and execute SQL commands to create and                update tables/views in your Snowflake database based on the loaded data. In other words it transforms the data you load from dlt into what you want to have.

#### **Running the Dashboard** 	run the streamlit dashboard with the following script: 	`python run_dashboard.py`

This script will:  
	create the data vi

**Access the Dashboard**:  
	Once the dashboard script is running either click the link provided in the terminal or  
	enter it manually in your web browser.  
	  
	the link is:  [`http://localhost:8501`](http://localhost:8501)  
	

**IMPORTANT**   
Make sure the credentials in your `.env`, `secrets.toml`, and `profiles.yml` files are correct or the scripts will not work\!  
Double check the API availability.  
Make sure you have a snowflake account.

