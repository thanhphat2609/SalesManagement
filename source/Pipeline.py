# =============================================================================== STEP 1: CONFIG SPARK ===============================================================================

# Import library
import sys

from pyspark import SparkContext, SparkConf, SparkFiles
from pyspark.conf import SparkConf
from pyspark.sql import SparkSession, HiveContext
from pyspark.sql.window import Window

# Import file
from Ingestion import *
from Transformation import *


# Create Spark Session	
spark = SparkSession.builder.appName("Pipeline").config("spark.sql.warehouse.dir", "hdfs://localhost:9000/user/hive/warehouse").enableHiveSupport().getOrCreate()

# Create a SparkContext
sc = SparkContext.getOrCreate()

# Receive argument
executionDate = sys.argv[1].split("/")

# =============================================================================== STEP 2: EXTRACT DATA ===============================================================================

# Define parameter
dbname = "jdbc:mysql://localhost:3306/salesmanagement"
tblNames = ["customer", "product", "employee", "receipt", "receiptdetail"]
driver = "com.mysql.jdbc.Driver"

# Read Table in to Dataframe
df_list_mysql = [read_table_mysql(spark, driver, dbname, tblName) for tblName in tblNames]


df_customer, df_product, df_employee, df_receipt, df_receiptdetail = df_list_mysql[0], df_list_mysql[1], df_list_mysql[2], df_list_mysql[3], df_list_mysql[4]


# ================================================================ STEP 3: LOAD PARTITION DATA TO HDFS(DATALAKE) =========================================================================

# List dataframe need to process paritition
dfs = [df_customer, df_product, df_employee, df_receipt, df_receiptdetail]


# Apply partition to each dataframe
processed_dfs = list(map(lambda df: partition_data(df, executionDate), dfs))


# Return to original dataframe
# df_customer, df_product, df_employee, df_receipt, df_receiptdetail = processed_dfs[0], processed_dfs[1], processed_dfs[2], processed_dfs[3], processed_dfs[4]


# Define base path
base_path = "hdfs://localhost:9000/user/thanhphat/datalake/"

# Write dataframes to HDFS with dynamic paths
for i, tblName in enumerate(tblNames):
    path = f"{base_path}{tblName}/"
    write_to_hdfs(processed_dfs[i], path)
    
  

# ======================================================================== STEP 4: TRANSFORM DATA (DATAWAREHOUSE) ========================================================================

# Create the input path with tblname as a placeholder
input_path_template = 'hdfs://localhost:9000/user/thanhphat/datalake/{}/year={}/month={}/day={}/part-*.snappy.parquet'

# Read Table in to Dataframe
df_list_parquet = [read_parquet_file(tblName, input_path_template, executionDate, spark) for tblName in tblNames]

# Original dataframe
# df_customer, df_product, df_employee, df_receipt, df_receiptdetail = df_list_parquet[0], df_list_parquet[1], df_list_parquet[2], df_list_parquet[3], df_list_parquet[4]

# Create multiple view
create_multiple_temp_view(df_list_parquet)


# Process for Report (What company need)
  # What product can't sell
df_product_not_sell = number_product_cant_sell(spark)
  # The most product sell
df_most_product_sell = the_most_product_sell(spark)
  # Number of Customer Buy
df_number_customer_buy = number_customer_buy(spark)
  # The most sell by Employee
df_most_employee_sell = the_most_employee_sell(spark)

# Drop multiple view
drop_multiple_temp_view(spark)


# ================================================================================= LOAD TO HIVE =================================================================================


# Database
dbName_hive = "Report_SalesManagement"
create_database(dbName_hive, spark)

# List dataframe need to creat table
table_data = [
    (df_product_not_sell, "ProductCantSell"),
    (df_most_product_sell, "MostProductSell"),
    (df_number_customer_buy, "NumberBuybyCus"),
    (df_most_employee_sell, "NumberSellbyEmp")
]

# Create table
for df, tblName_Hive in table_data:
    create_tabledata(df, tblName_Hive)


# ============================================================================ STEP 5: STOP SPRAK SESSION ================================================================================
spark.stop







