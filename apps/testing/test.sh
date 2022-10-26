#!/bin/bash

# Execute a simple example in Spark in order to confirm its installation 
# docker exec -it $(docker ps | grep feature-engineering-with-pyspark-spark-master-1 | awk '{print $1}') /bin/bash -c \
# "spark-submit --class org.apache.spark.examples.JavaSparkPi --master spark://spark-master-host:7077 /opt/spark-3.3.0-bin-hadoop3/examples/jars/spark-examples_2.12-3.3.0.jar"

docker exec -it $(docker ps | grep namenode | awk '{print $1}') /bin/bash -c \
"spark-submit /opt/testing/testing/testing.py"

