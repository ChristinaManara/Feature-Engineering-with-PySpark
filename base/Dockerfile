FROM ubuntu:latest

# Maintainer Info.
LABEL Maintainer="christinamanara2@gmail.com" 

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip wget && \
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

# Expose port 22
EXPOSE 22


