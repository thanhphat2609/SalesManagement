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
sudo systemctl stop mysql.service: Stop MySQL.
sudo mysql -u root -p: Access the MySQL command-line.
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
spark-submit --jars ./Driver/mysql-connector-j-8.1.0.jar Ingestion.py "ExecutionDate" "tblName"
spark-submit Transformation.py "ExecutionDate"
```

6. Open your browser (Firefox) and go to http://localhost:9870 to interact with the HDFS.

7. Go to http://localhost:8080 to interact with the Superset.

8. Run and connect Apache Hive.

``` bash
./hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=INFO,console --hiveconf hive.server2.enable.doAs=false: Start the Apache Hive server.

beeline -u jdbc:hive2://127.0.0.1:10000: Access the Apache Hive command-line.
```

## File Structure

- `Ingestion.py`: File for Ingestion(Extract and Load) Data.
- `Transformation.py`: File for Transformation to Data Warehouse.

## Video demo
- Link: .

Feel free to explore and enhance the project as needed!
