#!/bin/bash


docker exec -it $(docker ps | grep namenode | awk '{print $1}') /bin/bash -c \
   # "hadoop fs -mkdir hdfs://localhost:9000/files" \
   scp cvas_data.csv root@spark-master-host:directory/targetfile
    "hadoop fs -put cvas_data.csv hdfs://localhost:9000/files/."

    # "var=$(readlink -m cvas_data.csv)" \
    # "hadoop fs −put $var hdfs://master:9000/files/."