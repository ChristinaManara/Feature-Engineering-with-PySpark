#!/bin/bash

# Start the SSH daemon
service ssh restart

# Setup password less ssh
sshpass -p screencast ssh-copy-id root@localhost

# Replace "localhost" in Hadoop core-site xml with actual hostname which is passed
# as NAMENODE_HOSTNAME env variable
sed -i "s#localhost#$NAMENODE_HOSTNAME#g" /opt/hadoop-3.3.4/etc/hadoop/core-site.xml

# Set HADOOP_HOME
export HADOOP_HOME=/opt/hadoop-3.3.4

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# Add bin/ directory of Hadoop to PATH
export PATH=$PATH:$HADOOP_HOME/bin

# Start Datanode
hdfs --daemon start datanode
#hdfs --deamon yarn-deamon.sh 

# Run in daemon mode, don't exit
while true; do
  sleep 100;
done