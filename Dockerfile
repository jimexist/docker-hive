FROM sequenceiq/hadoop-docker:2.7.1

MAINTAINER Jiayu Liu <etareduce@gmail.com>

ENV HIVE_HOME=/usr/lib/hive
ENV HIVE_CONF $HIVE_HOME/conf
ENV HIVE_LIB $HIVE_HOME/lib
ENV HIVE_VERSION=2.1.1
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_COMMON_HOME=$HADOOP_HOME/share/hadoop/common
ENV HADOOP_HDFS_HOME=$HADOOP_HOME/share/hadoop/hdfs
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME/share/hadoop/mapreduce
ENV HADOOP_YARN_HOME=$HADOOP_HOME/share/hadoop/yarn

RUN mkdir -p $HIVE_HOME \
    && curl -o /tmp/apache-hive-$HIVE_VERSION-bin.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz \
    && tar -xvf /tmp/apache-hive-$HIVE_VERSION-bin.tar.gz -C $HIVE_HOME --strip-components=1 \
    && rm /tmp/apache-hive-$HIVE_VERSION-bin.tar.gz \
    && curl -o /tmp/mysql-connector-java-5.1.40.tar.gz https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz \
    && tar -xvf /tmp/mysql-connector-java-5.1.40.tar.gz -C /tmp/mysql --strip-components=1 \
    && mv /tmp/mysql/mysql-connector-java-5.1.40-bin.jar $$HIVE_LIB/ \
    && rm -r /tmp/mysql /tmp/mysql-connector-java-5.1.40.tar.gz

ENV PATH $HIVE_HOME/bin:$PATH

# add the jdbc driver for metastore
ADD hive-site.xml $HIVE_CONF/hive-site.xml
ADD entrypoint.sh $HIVE_HOME/entrypoint.sh

WORKDIR $HIVE_HOME

EXPOSE 10000 9083 9000

ENTRYPOINT "./entrypoint.sh"
