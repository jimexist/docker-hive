FROM sequenceiq/hadoop-docker:2.7.1

MAINTAINER Jiayu Liu <etareduce@gmail.com>

# choose a closer mirror
# ADD https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz /tmp/apache-hive-2.1.1-bin.tar.gz
ADD https://mirrors.ocf.berkeley.edu/apache/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz /tmp/apache-hive-2.1.1-bin.tar.gz

RUN mkdir -p /usr/local/hive && \
    tar -xvf /tmp/apache-hive-2.1.1-bin.tar.gz -C /usr/local/hive --strip-components=1 && \
    rm /tmp/apache-hive-2.1.1-bin.tar.gz

ENV HIVE_HOME /usr/local/hive
ENV HIVE_CONF $HIVE_HOME/conf
ENV HIVE_LIB $HIVE_HOME/lib
ENV PATH $HIVE_HOME/bin:$PATH
# override the core-site
ADD core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml

# add the jdbc driver for metastore
ADD mysql-connector-java-5.1.40-bin.jar $HIVE_LIB/mysql-connector-java-5.1.40-bin.jar
ADD hive-site.xml $HIVE_CONF/hive-site.xml
ADD entrypoint.sh $HIVE_HOME/entrypoint.sh

WORKDIR $HIVE_HOME

EXPOSE 10000 9083 9000

ENTRYPOINT "./entrypoint.sh"