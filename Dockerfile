FROM sequenceiq/hadoop-docker:2.7.1

MAINTAINER Jiayu Liu <etareduce@gmail.com>

# choose a closer mirror
RUN wget -O /tmp/apache-hive-1.2.1-bin.tar.gz http://mirrors.cnnic.cn/apache/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz && \
    mkdir -p /usr/local/hive && \
    tar -xvf /tmp/apache-hive-1.2.1-bin.tar.gz -C /usr/local/hive --strip-components=1 && \
    rm /tmp/apache-hive-1.2.1-bin.tar.gz

ENV HIVE_HOME /usr/local/hive
ENV HIVE_CONF $HIVE_HOME/conf
ENV PATH $HIVE_HOME/bin:$PATH

ADD hive-site.xml $HIVE_CONF/hive-site.xml

WORKDIR $HIVE_HOME

# we are only doing this for the sake of metastore, we do
# not as of now start the HiveServer2 (https://cwiki.apache.org/confluence/display/Hive/HiveServer2+Clients)
CMD ["./bin/hive", "--service", "metastore"]
