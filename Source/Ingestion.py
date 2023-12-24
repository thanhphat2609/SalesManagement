
# ========================================================================== STEP 1: CONFIG SPARK ==========================================================================

import sys

from pyspark import SparkContext, SparkConf, SparkFiles
from pyspark.conf import SparkConf
from pyspark.sql import SparkSession, HiveContext
from pyspark.sql.functions import lit, col, when, row_number, split
from pyspark.sql.window import Window

# Create Spark Session	
spark = SparkSession.builder.appName('Ingestion').getOrCreate()

# Receive argument
executionDate = sys.argv[1].split("/")
tblName = sys.argv[2]

# Partition data
year = executionDate[0]
month = executionDate[1]
day = executionDate[2]


# ================================================================================= STEP 2: READ DATA =================================================================================
df_mysql = spark.read.format("jdbc") \
    .option("driver", "com.mysql.jdbc.Driver") \
    .option("url", "jdbc:mysql://localhost:3306/SalesManagement") \
    .option("dbtable", tblName) \
    .option("user", "root") \
    .option("password", "password").load()

# df_sql.show(10)

#print("Execution year: ", year)
#print("Execution month: ", month)
#print("Execution day: ", day)





# ====================================================================== STEP 3: LOAD DATA(PARTITION) TO HDFS ==========================================================================





# ========================================================================== STEP 5: STOP SPARK SESSION ==========================================================================
spark.stop
