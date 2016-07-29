FROM sequenceiq/hadoop-docker:2.7.1

MAINTAINER Jiayu Liu <etareduce@gmail.com>

# choose a closer mirror
RUN wget -O /tmp/apache-hive-1.2.1-bin.tar.gz \
    https://mirrors.ocf.berkeley.edu/apache/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz && \
    mkdir -p /usr/local/hive && \
    tar -xvf /tmp/apache-hive-1.2.1-bin.tar.gz -C /usr/local/hive --strip-components=1 && \
    rm /tmp/apache-hive-1.2.1-bin.tar.gz

ENV HIVE_HOME /usr/local/hive
ENV HIVE_CONF $HIVE_HOME/conf
ENV PATH $HIVE_HOME/bin:$PATH

ADD hive-site.xml $HIVE_CONF/hive-site.xml
ADD entrypoint.sh $HIVE_HOME/entrypoint.sh

WORKDIR $HIVE_HOME

EXPOSE 10000 9083

ENTRYPOINT "./entrypoint.sh"
