FROM ubuntu:latest

# Maintainer Info.
LABEL Maintainer="christinamanara2@gmail.com" 

# Install.
RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \
    apt-get install -y openssh-server sshpass && \
    rm -rf /var/lib/apt/lists/*

# Establish the operating directory of OpenSSH
RUN mkdir /var/run/sshd

# Set Root password
RUN echo 'root:screencast' | chpasswd

# Allow Root login
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/' /etc/ssh/ssh_config

# SSH login fix
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Install OpenJDK-8
RUN \
    apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;
    
# Fix certificate issues
RUN \
    apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Download latest Hadoop package
ADD https://archive.apache.org/dist/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz  /tmp/

# Create /opt directory
RUN mkdir -p /opt/

# Unpack hadoop into /opt/ and set HADOOP_HOME
RUN tar -xzf /tmp/hadoop-3.3.4.tar.gz -C /opt/

# Copy hadoop confs
ADD /config_hadoop /opt/hadoop-3.3.4/etc/hadoop/

# Set Hadoop sepcific environment variables
ENV HADOOP_HOME /opt/hadoop-3.3.4
ENV HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop"
ENV HADOOP_LIBEXEC_DIR="${HADOOP_HOME}/libexec"

RUN sed -i 's/export JAVA_HOME=${JAVA_HOME}/export JAVA_HOME=\/usr\/lib\/jvm\/java-8-oracle/' /opt/hadoop-3.3.4/etc/hadoop/hadoop-env.sh

RUN mkdir -p /opt/data/apps/tmp
RUN mkdir -p /opt/data/apps/dfs/name
RUN mkdir -p /opt/data/apps/dfs/data

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000

# Mapred ports
EXPOSE 19888

# Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

# Expose port 22
EXPOSE 22


