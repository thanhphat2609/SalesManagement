# Sales Management with Hadoop

## Description

This is a simple analysis project using technologies such as MySQL, HDFS, Apache Spark, Apache Hive, and Apache Superset for analyst SalesMangement database.


## Architecture 

![Architecture](https://github.com/thanhphatuit/SalesManagement/assets/84914537/c586914c-e210-4632-9ca8-566ef86dbfd5)

## Pipeline 


## ERD 

![ERD_SalesManagement](https://github.com/thanhphat2609/SalesManagement/assets/84914537/8ec11b8c-e2f3-48e7-84a0-6ec65c6b8585)

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

4. Step run:

```
spark-submit --jars ./driver/mysql-connector-j-8.1.0.jar Pipeline.py "executionDate"
```

5. Open your browser (Firefox) and go to http://localhost:9870 to interact with the HDFS, http://localhost:8080 to interact with the Superset.

6. Run and connect Apache Hive.

``` bash
./hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=INFO,console --hiveconf hive.server2.enable.doAs=false: Start the Apache Hive server.

beeline -u jdbc:hive2://127.0.0.1:10000: Access the Apache Hive command-line.
```

## File Structure

- `Ingestion.py`: File have function for Ingestion(Extract and Load) Data.
- `Transformation.py`: File have function for Transformation to Data Warehouse.
- `Pipeline.py`: File for run all function from Ingestion.py and Transformation.py.

## Video demo
- Link: .

Feel free to explore and enhance the project as needed!
