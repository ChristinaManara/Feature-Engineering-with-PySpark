#!/bin/bash

# Execute a simple example in Spark in order to confirm its installation 
docker exec -it $(docker ps | grep feature-engineering-with-pyspark-spark-master-1 | awk '{print $1}') /bin/bash -c \
"spark-submit --class org.apache.spark.examples.JavaSparkPi --master spark://spark-master-host:7077 /opt/spark-3.3.0-bin-hadoop3/examples/jars/spark-examples_2.12-3.3.0.jar"


hadoop fs −mkdir hdfs://master:9000/files
hadoop fs −put /home/user/files/regions.csv hdfs://master:9000/files/.
# Bash Menu Script Example

# PS3='Please enter your choice: '
# options=("Option 1" "Option 2" "Option 3" "Quit")
# select opt in "${options[@]}"
# do
#     case $opt in
#         "Option 1")
#             echo "you chose choice 1"
#             ;;
#         "Option 2")
#             echo "you chose choice 2"
#             ;;
#         "Option 3")
#             echo "you chose choice $REPLY which is $opt"
#             ;;
#         "Quit")
#             break
#             ;;
#         *) echo "invalid option $REPLY";;
#     esac
# done