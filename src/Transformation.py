
# Function read parquet file from HDFS
def read_parquet_file(tblname, input_path_template, executionDate,spark):
	# Partition data by Arguments
	year = executionDate[0]
	month = executionDate[1]
	day = executionDate[2]
	
	# Replace tblname with the actual table name
	input_path = input_path_template.format(tblname, year, month, day)

	dataframe = spark.read.parquet(input_path)
	
	return dataframe
	

# Function for create list of TempView
def create_multiple_temp_view(df_list_parquet):
	df_list_parquet[0].createOrReplaceTempView("customer")
	df_list_parquet[1].createOrReplaceTempView("product")
	df_list_parquet[2].createOrReplaceTempView("employee")
	df_list_parquet[3].createOrReplaceTempView("receipt")
	df_list_parquet[4].createOrReplaceTempView("receiptdetail")



# Find number of product cant sell
def number_product_cant_sell(spark):
	df_product_not_sell = spark.sql( '''SELECT productID, productName
					    FROM product 
					    WHERE productID NOT IN (
							SELECT DISTINCT productID 
							FROM receiptdetail
					    ) ''')
	return df_product_not_sell


# Find the most product sell
def the_most_product_sell(spark):
	df_most_product_sell = spark.sql( '''SELECT p.productID, p.productName, Count(rd.productID) AS NumberOfSell
					     FROM receiptdetail rd join product p on rd.productID = p.productID
					     GROUP BY p.productID, p.productName
					     ORDER BY Count(rd.productID) DESC;
					   ''')
	
	return df_most_product_sell

# Find the number customer buy
def number_customer_buy(spark):
	df_number_customer_buy = spark.sql( ''' SELECT c.cusName, Count(r.customerID) AS NumberOfBuy
					        FROM receipt r join customer c on r.customerID = c.customerID
					        GROUP BY cusName
					        ORDER BY Count(r.customerID) DESC;
					   ''')
	return df_number_customer_buy


# Find the most sell by employee
def the_most_employee_sell(spark):
	df_most_employee_sell = spark.sql( '''  SELECT e.employeeName, Count(r.employeeID) AS NumberOfSell
						FROM employee e join receipt r on e.employeeID = r.employeeID
						GROUP BY e.employeeName
						ORDER BY Count(r.employeeID) DESC;
					   ''')
	
	return df_most_employee_sell



# Function for drop list of TempView
def drop_multiple_temp_view(spark):
	spark.catalog.dropTempView("customer")
	spark.catalog.dropTempView("product")
	spark.catalog.dropTempView("employee")
	spark.catalog.dropTempView("receipt")
	spark.catalog.dropTempView("receiptdetail")



# Function create database
def create_database(database_name, spark):
	spark.sql(f"CREATE DATABASE IF NOT EXISTS {database_name};")
	spark.sql(f"USE {database_name}")


# Function create table with dataframe
def create_tabledata(dataframe, table_name):
	dataframe.write.mode('overwrite').saveAsTable(f"{table_name}")
