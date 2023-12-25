from pyspark.sql.functions import lit, col, when, row_number, split

# Function for read table from mysql
def read_table_mysql(spark, driver, dbname,tblName):
	dataframe = spark.read.format("jdbc") \
	    .option("driver", driver) \
	    .option("url", dbname) \
	    .option("dbtable", tblName) \
	    .option("user", "root") \
	    .option("password", "password").load()
	return dataframe


# Function Partition data
def partition_data(dataframe, executionDate):
	# Partition data by Arguments
	year = executionDate[0]
	month = executionDate[1]
	day = executionDate[2]
	
	# Create new column for partition
	dataframe = dataframe.withColumn("year", lit(year)).withColumn("month", lit(month)).withColumn("day", lit(day))
	return dataframe


# Function write to HDFS with partition data
def write_to_hdfs(dataframe, path):
	dataframe.write.partitionBy("year", "month", "day").mode("overwrite").parquet(path)

