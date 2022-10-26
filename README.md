# Feature-Engineering-with-PySpark

## Hadoop Single Node Cluster on Docker.

## Description

The objective of this assignment is to implement a distributed system that handles csv data, applies transformations and feature engineering and persists them in parquet format. The system should consist of the
following two modules:

1. A distributed file system (Hadoop cluster) where the csv dataset-file will be stored and the resulting parquet files will be persisted.
2. A spark cluster that will run on top of Hadoop and will process the csv data in order to generate new features that will be stored in parquet files.

## Getting Started

### Dependencies

* Docker has to be installed. 

### Installing

* This is a private git for personal purposes. 

### Executing program

* Download this repository with the command:
```
 git clone https://github.com/ChristinaManara/Feature-Engineering-with-PySpark.git
```

* Navigate to the downloaded repository with the command: 
```
cd pathTo/Feature-Engineering-with-PySpark
```

* Build containers with the command:
```
bash build_all.sh
```

* Deploy an HDFS-Spark cluster with the command:
```
docker-compose up -d
```
Web UI of Hadoop: http://localhost:9870

It should be like: 
![alt text](https://github.com/ChristinaManara/Feature-Engineering-with-PySpark/blob/main/images/hadoop.png)

Web UI of Spark: http://localhost:8080

It should be like: 
![alt text](https://github.com/ChristinaManara/Feature-Engineering-with-PySpark/blob/main/images/spark.png)


You can submit a Word Count or Feature Engineering job with:
* Navigate to apps folder with the command:  
```
cd apps
```
* Run the command and a menu will be shown:
 ```
bash run.sh
```

![alt text](https://github.com/ChristinaManara/Feature-Engineering-with-PySpark/blob/main/images/terminal.png)
<img src="(https://github.com/ChristinaManara/Feature-Engineering-with-PySpark/blob/main/images/terminal.png)" width="60">

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Creator:

ex. Christina Manara (christinamanara2@gmail.com)  

## Version History

* 0.1
    * Initial Release

## Acknowledgments

Inspiration, code snippets, etc.
* [FeatureEngineering](https://spark.apache.org/docs/1.4.0/ml-features.html)
* [Spark](https://spark.apache.org/releases/spark-release-3-3-0.html)
* [Hadoop](https://hadoop.apache.org/release/3.3.4.html)
