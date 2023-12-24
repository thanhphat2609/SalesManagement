# Sales Management with Hadoop

## Description

This is a simple analysis project using technologies such as MySQL, HDFS, Apache Spark, Apache Hive, and Apache Superset for analyst SalesMangement database.


## Architecture 

![Architecture](https://github.com/thanhphatuit/SalesManagement/assets/84914537/c586914c-e210-4632-9ca8-566ef86dbfd5)

## Installation

1. Clone the repository:

```
https://github.com/thanhphatuit/SalesManagement.git
cd Source
```

2. Start Hadoop:

```
hdfs namenode -format
start-all.sh
```

3. Work with MySQL:

```
sudo systemctl start mysql.service: Start MySQL.
sudo systemctl status mysql.service: Check status MySQL.
udo systemctl stop mysql.service: Stop MySQL.
sudo mysql -u root -p: Connect to MySQL.
```

4. Create directory:

```
hdfs dfs -mkdir -p /user/thanhphat/datalake/tblname
hdfs dfs -chmod g+w /user/thanhphat/datalake/tblname

hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
```

5. Step run:

```
spark-submit --jars ./Driver/mysql-connector-j-8.1.0 Ingestion.py "ExecutionDate" "tblName"
spark-submit Transformation.py "ExecutionDate"
```

6. Open your browser (Firefox) and go to http://localhost:9870 to interact with the HDFS.

## File Structure

- `Ingestion.py`: File for Ingestion Data.
- `Transformation.py`: File for Transformation to Data Warehouse.

## Video demo
- Link: .

Feel free to explore and enhance the project as needed!
