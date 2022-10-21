#!/bin/bash

# Script to build all required images for running HDFS and Spark clusters
# Usage:
# <HOME>/build-images.sh [scratch]
# Options argument scratch for deleting existing images and building the images from scratch

if [ "$1" == scratch ]; then
  docker rmi -f base hdfs-namenode hdfs-datanode 
fi
docker build -t base ./base/
docker build -t hdfs-namenode ./hdfs-namenode/
docker build -t hdfs-datanode ./hdfs-datanode/