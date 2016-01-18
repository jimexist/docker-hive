FROM sequenceiq/hadoop-docker:2.7.1

MAINTAINER Jiayu Liu <etareduce@gmail.com>

# choose a closer mirror
ADD http://mirrors.cnnic.cn/apache/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz /tmp/apache-hive-1.2.1-bin.tar.gz
RUN tar -xvf /tmp/apache-hive-1.2.1-bin.tar.gz -C /user/local/hive --strip-components=1

ENV HIVE_HOME /usr/local/hive
ENV HIVE_CONF $HOME_HOME/conf
ENV PATH $HIVE_HOME/bin:$PATH

ADD hive-site.xml $HIVE_CONF/hite-site.xml

WORKDIR $HIVE_HOME

# we are only doing this for the sake of metastore, we do
# not as of now start the HiveServer2 (https://cwiki.apache.org/confluence/display/Hive/HiveServer2+Clients)
CMD ["./bin/hive", "--service", "metastore"]
