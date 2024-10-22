#!/bin/bash

# Start the SSH daemon
service ssh restart

# Setup password less ssh
sshpass -p screencast ssh-copy-id root@localhost

export HOSTNAME=`hostname`
sed -i "s#localhost#$HOSTNAME#g" /opt/hadoop-3.3.4/etc/hadoop/core-site.xml

# Set HADOOP_HOME
export HADOOP_HOME=/opt/hadoop-3.3.4

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# Add bin/ directory of Hadoop to PATH
export PATH=$PATH:$HADOOP_HOME/bin

# Format the NameNode data directory
hdfs namenode -format -force

# Start HDFS services
start-dfs.sh
start-yarn.sh

# Wait for HDFS services to be up and running
sleep 5

# Create a tmp directory, put the data into hdfs and make it accessible to everyone
hadoop fs -mkdir -p /tmp
hadoop fs -chmod -R 777 /tmp
hadoop fs -put /opt/testing/feature-engineering/cvas_data.csv hdfs://localhost:9000/tmp/.
hadoop fs -chmod -R 777 /tmp/cvas_data.csv
hadoop fs -put /opt/testing/testing/WordCount.txt hdfs://localhost:9000/tmp/.
hadoop fs -chmod -R 777 /tmp/WordCount.txt

# Run in daemon mode, don't exit
while true; do
  sleep 100;
done

