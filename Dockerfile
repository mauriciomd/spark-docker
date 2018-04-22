FROM ubuntu

MAINTAINER Mauricio Matter Donato <mdonato@inf.ufsm.br>

# Install wget
RUN apt-get update
RUN apt-get install -y wget

# Install Java JDK
RUN  wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz -O jdk-8-linux-x64.tar.gz
RUN tar -zxf jdk-8-linux-x64.tar.gz && \
    rm -rf jdk-8-linux-x64.tar.gz
ENV JAVA_HOME /jdk1.8.0_171
ENV PATH $PATH:$JAVA_HOME/bin

# Install Apache Hadoop
RUN wget http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-2.7.6/hadoop-2.7.6.tar.gz && \
    tar -zxf hadoop-2.7.6.tar.gz && \
    mv hadoop-2.7.6/ hadoop/ && \
    rm -rf hadoop-2.7.6.tar.gz
ENV HADOOP_HOME /hadoop
ENV LD_LIBRARY_PATH /hadoop/lib/native
ENV HADOOD_COMMON_LIB_NATIVE_DIR /hadoop/lib/native

# Install Apache Spark
RUN wget http://ftp.unicamp.br/pub/apache/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz && \
    tar -zxf spark-2.3.0-bin-hadoop2.7.tgz && \
    mv spark-2.3.0-bin-hadoop2.7/ spark/ && \
    rm -rf spark-2.3.0-bin-hadoop2.7.tgz
ENV SPARK_HOME /spark
ENV PATH $PATH:$SPARK_HOME/bin
EXPOSE 4040 6066 7077 8080
WORKDIR $SPARK_HOME
