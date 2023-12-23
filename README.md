# Sales Management with Hadoop

## Description

This is a simple analysis project using technologies such as MySQL, HDFS, Apache Spark, Apache Hive, and Apache Superset.


## Architecture 



## Installation

1. Clone the repository:

```bash
git clone https://github.com/thanhphatuit/InternationalLanguageSchool.git
cd Code
```

2. Start Hadoop:

```bash
hdfs namenode -format
start-all.sh
```

3. Create directory:

```
hdfs dfs -mkdir -p /user/thanhphat/datalake
hdfs dfs -chmod g+w /user/thanhphat/datalake

hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
```

4. Step run:

```
spark-submit spark-ingest.py
spark-submit spark-etl.py
spark-submit spark-ml.py
```

5. Open your browser (Firefox) and go to http://localhost:9870 to interact with the HDFS.

## File Structure

- `spark-ingest.py`: File for Ingestion Data.
- `spark-etl.py`: File for Extract, Transform, Load to Data Warehouse.
- `spark-ml.py`: File for Machine Learning to predict stock.

## Video demo
- Ingest: https://youtu.be/cs7IKZtwrK8.
- ETL: .

Feel free to explore and enhance the project as needed!
