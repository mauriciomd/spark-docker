FROM ubuntu

MAINTAINER Mauricio Matter Donato <mdonato@inf.ufsm.br>

# Install wget
RUN apt-get update
RUN apt-get install -y wget

# Install git
RUN apt-get install -y git

# Install Java JDK
RUN  apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Install Apache Maven
RUN apt-get install -y maven

# # Get HiBench Benchmark
RUN git clone https://github.com/Intel-bigdata/HiBench.git
WORKDIR /HiBench/
RUN mvn -Dspark=2.1 -Dscala=2.11 clean package


# Install Apache Hadoop
WORKDIR ~/
RUN wget http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz && \
    tar -zxf hadoop-2.7.7.tar.gz && \
    mv hadoop-2.7.7/ hadoop/ && \
    rm -rf hadoop-2.7.7.tar.gz
ENV HADOOP_HOME /hadoop
ENV LD_LIBRARY_PATH /hadoop/lib/native
ENV HADOOD_COMMON_LIB_NATIVE_DIR /hadoop/lib/native

# Install Apache Spark
RUN wget https://archive.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz && \
    tar -zxf spark-2.2.0-bin-hadoop2.7.tgz && \
    mv spark-2.2.0-bin-hadoop2.7/ spark/ && \
    rm -rf spark-2.2.0-bin-hadoop2.7.tgz
ENV SPARK_HOME /spark
ENV PATH $PATH:$SPARK_HOME/bin
EXPOSE 4040 6066 7077 8080